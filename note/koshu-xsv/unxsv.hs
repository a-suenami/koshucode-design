#!/usr/bin/env runhaskell
-- ------------------------------------------------------------------
--
--  DESCRIPTION
--    Prototype for XSV-to-Koshu converter.
--    XSV means CSV, TSV or BSV.
--
--    CSV  comma-seperated values  A,B,C
--    TSV  tab-seperated values    A[->]B[->]C
--    BSV  bar-seperated values    A|B|C
--
--  USAGE
--    koshu-env.sh ./unxsv.hs < POPULATION.csv
--
--  FORMAT
--    @Caption,name,[lang]
--    @Creator,name,[lang]
--    @Date,date (ISO-8610)
--    @Language,lang (ISO639-1)
--    
--    @@Title,[lang]
--    name,name,name,...
--    @@Datatype
--    type,type,type,...
--    @@Unit,[lang]
--    [unit],[unit],[unit],...
--    @@Baseval
--    [val],[val],[val],...
--    
--    value,value,value,...
--    value,value,value,...
--    ...
--
-- ------------------------------------------------------------------

{-# OPTIONS_GHC -Wall #-}
{-# LANGUAGE TupleSections #-}

module Main
( main,
  XsvData (..),
  XsvHead (..),
) where

import qualified Text.ParserCombinators.Parsec as P
import qualified Koshucode.Baala.Base    as B
import qualified Koshucode.Baala.Core    as C
import qualified Koshucode.Baala.Vanilla as R



-- ----------------------  Main

type JudgeV = B.Judge R.VContent

main :: IO ()
main =
  do input <- getContents
     case xsvData input of
       Right xsv -> printXsv xsv
       Left  err -> error $ show err

printXsv :: XsvData -> IO ()
printXsv xsv =
    do putStrLn B.emacsModeComment
       putStrLn $ unlines $ B.texts doc
       _ <- B.putJudges 0 $ judgeXsv "XSV" xsv
       return ()
    where
      doc = B.CommentDoc
            [ B.CommentSec "DESCRIPTION" ["Data converted from XSV"]]



-- ----------------------  Datatype

data XsvData = XsvData XsvHead [B.Ab [String]]
                deriving (Show, Eq, Ord)

data XsvHead = XsvHead
    { xsvSeperator  :: Char
    , xsvCaption    :: String
    , xsvCreator    :: String
    , xsvDate       :: String
    , xsvLanguage   :: String
    , xsvTitle      :: [String]
    , xsvUnit       :: [String]
    , xsvBaseval    :: [String]
    , xsvDatatype   :: [String]
    } deriving (Show, Eq, Ord)

type XsvHeadRaw = (String, ([String], [String]))

makeXsvHead :: Char -> [XsvHeadRaw] -> XsvHead
makeXsvHead sep hs =
    XsvHead { xsvSeperator  = sep
            , xsvCaption    = single "@Caption"
            , xsvCreator    = single "@Creator"
            , xsvDate       = single "@Date"
            , xsvLanguage   = single "@Language"
            , xsvTitle      = map makeTermName $ double "@@Title"
            , xsvUnit       = double "@@Unit"
            , xsvBaseval    = double "@@Baseval"
            , xsvDatatype   = double "@@Datatype" }

    where
      single :: String -> String
      single name =
          case lookup name hs of
            Just ((a : _), _) -> a
            Just ([], _)      -> ""
            Nothing           -> ""

      double :: String -> [String]
      double name =
          case lookup name hs of
            Just (_, xs) -> xs
            Nothing      -> []



-- ----------------------  XSV Parser (Data)

xsvData :: String -> B.Ab XsvData
xsvData input =
    do let (hs, bs) = xsvSplit $ B.linesCrlf input
       h <- xsvHead hs
       Right $ XsvData h $ xsvBody (xsvSeperator h) bs

xsvSplit :: [String] -> ([String], [String])
xsvSplit = loop [] where
    loop ys (x1 : xs2@(x2 : xs))
        | isSingle x1 = loop (x1 : ys) xs2
        | isDouble x1 = loop (x2 : x1 : ys) xs
        | isEmpty  x1 = loop ys xs2
    loop ys xs        = (reverse ys, xs)

isSingle :: String -> Bool
isSingle ('@' : c : _) = c /= '@'
isSingle _             = False

isDouble :: String -> Bool
isDouble ('@' : cs) = isSingle cs
isDouble _          = False

isEmpty :: String -> Bool
isEmpty = null . B.trimLeft



-- ----------------------  XSV Parser (Head)

xsvHead :: [String] -> B.Ab XsvHead
xsvHead xs =
    do (sep, raws) <- xsvHeadRaws xs
       Right $ makeXsvHead sep raws

xsvHeadRaws :: [String] -> B.Ab (Char, [XsvHeadRaw])
xsvHeadRaws = single Nothing [] where
    single _ _ [] = xsvError "@@Title not found"
    single sep raws fxs@(first : xs)
        | isSingle first = case P.parse parseHead "" first of
                             Right (sep2, r) -> single (sep % sep2) (r : raws) xs
                             Left _  -> unkError
        | isDouble first = Right (s, raws ++ double p fxs)
        | isEmpty  first = single sep raws xs
        | otherwise      = unkError
        where s = maybe ',' id sep
              p = P.parse (parseLine s) ""

    double p (first : sxs@(second : xs))
        | isEmpty  first = double p sxs
        | isDouble first =
            case (p first, p second) of
              (Right (name : first2), Right second2)
                  -> (name, (first2, second2)) : double p xs
              (_, _) -> unkError
    double _ [] = []
    double _ _ = unkError

    (%) :: Maybe Char -> Maybe Char -> Maybe Char
    (Just sep) % _  = Just sep
    _ % (Just sep)  = Just sep
    _ % _           = Nothing

    unkError = xsvError "Unknown header line"

parseHead :: P.Parser (Maybe Char, XsvHeadRaw)
parseHead =
    do _     <- P.char '@'
       name  <- P.many1 P.alphaNum
       sep   <- P.optionMaybe $ P.oneOf ",|\t"
       first <- parseLineMaybe sep
       return (sep, ('@' : name, (first, [])))



-- ----------------------  XSV Parser (Body)

xsvBody :: Char -> [String] -> [B.Ab [String]]
xsvBody sep = filter (/= Right [""]) . map body where
    body line = case P.parse (parseLine sep) "" line of
                  Right cells -> Right cells
                  Left _      -> xsvError "Format error"

parseLineMaybe :: Maybe Char -> P.Parser [String]
parseLineMaybe (Just sep) = parseLine sep
parseLineMaybe Nothing    = parseLine ','

parseLine :: Char -> P.Parser [String]
parseLine sep = parseCell sep `P.sepBy` P.char sep

parseCell :: Char -> P.Parser String
parseCell sep =
    do _ <- spaces
       c <- parseQuotedCell P.<|> parseUnquotedCell sep
       _ <- spaces
       return $ B.trimRight c
    where
      spaces = P.many $ P.char ' '

parseUnquotedCell :: Char -> P.Parser String
parseUnquotedCell sep = P.many $ P.noneOf [sep]

parseQuotedCell :: P.Parser String
parseQuotedCell = 
    do _ <- P.char q
       c <- P.many $ P.noneOf [q] P.<|> P.try qq
       _ <- P.char q P.<?> "quotation not ended"
       return c
    where
      q  = '"'
      qq = P.string [q, q] >> return q



-- ----------------------  XSV to Judge

judgeXsv :: String -> XsvData -> [JudgeV]
judgeXsv prefix (XsvData h b) = doc h : js where
    p pat = prefix ++ "-" ++ pat
    js = (map term $ zip (intFrom 1) utitle)
         ++ (judges (p "DATATYPE") "/datatype" C.putText datatype)
         ++ (judges (p "UNIT")     "/unit"     C.putText unit)
         ++ (judges (p "BASEVAL")  "/baseval"  dec       baseval)
         ++ map body b

    title    = xsvTitle h
    utitle   = map unslashTermName title
    types    = xsvDatatype h
    typefs   = map contentOf types ++ repeat (contentOf "string")
    datatype = zip utitle types
    unit     = cutEmpties $ zip utitle $ xsvUnit h
    baseval  = cutEmpties $ zip utitle $ xsvBaseval h

    cutEmpties :: B.Map [(a, String)]
    cutEmpties = filter ((/= "") . snd)

    doc :: XsvHead -> JudgeV
    doc XsvHead { xsvCaption = c, xsvCreator = r, xsvDate = d, xsvLanguage = l } =
        B.affirm (p "DOC") [ ("/caption"  , C.putText c)
                           , ("/creator"  , C.putText r)
                           , ("/date"     , C.putText d)
                           , ("/language" , C.putText l) ]

    term :: (Int, String) -> JudgeV
    term (pos, name) =
        B.affirm (p "TERM") [ ("/pos"  , C.putDecFromInt pos)
                            , ("/term" , C.putText name) ]

    body :: B.Ab [String] -> JudgeV
    body (Right cs) = B.affirm prefix $ zip title $ zipWith ($) typefs cs
    body (Left _)   = xsvError "judge"

judges :: (C.CText c) => B.JudgePattern -> B.Termname -> (a -> c) -> [B.Named a] -> [B.Judge c]
judges pat term put xs = map jud $ map cs xs where
    jud = B.Judge True pat
    cs (name, cont) = [ ("/term", C.putText name)
                      , (term, put cont) ]

contentOf :: String -> String -> R.VContent
contentOf ('x':'s':'d':':':name) = contentOf name
contentOf "integer" = dec
contentOf "double"  = dec
contentOf _         = C.putText

dec :: (C.CDec c) => String -> c
dec s = case B.litDecimal s of
          Right d -> C.putDec d
          Left _  -> xsvError "Decimal"



-- ----------------------  Utility

xsvError :: String -> a
xsvError msg = error msg

intFrom :: Int -> [Int]
intFrom n = [n..]

makeTermName :: B.Map String
makeTermName name = '/' : map normalize name where
    normalize c | B.isSimpleChar c = c
                | otherwise        = '-'

unslashTermName :: B.Map String
unslashTermName ('/' : s) = s
unslashTermName s = s

