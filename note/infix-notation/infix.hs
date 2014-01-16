#!/usr/bin/env koshu-env.sh runhaskell
{-# OPTIONS_GHC -Wall #-}
-- ------------------------------------------------------------------
--
--  DESCRIPTION
--    Display result of infix-to-prefix conversion
--
--  EXAMPLE
--    ./infix.hs "/a * /b + /c"
--
-- ------------------------------------------------------------------

import qualified Koshucode.Baala.Base as B
import qualified System.Environment   as Sys
import qualified Text.PrettyPrint     as P

main :: IO ()
main = do args <- Sys.getArgs
          mapM_ display args

display :: String -> IO ()
display code =
    do putStrLn $ "** " ++ code
       case B.infixToPrefix ht $ B.tt1 code of
         Right tree -> B.putShowLn $ B.ttDoc [tree]
         Left xs    -> B.putShowLn $ P.hang ambLabel
                         2 (B.docv $ map ambContent xs)

ambLabel :: B.Doc
ambLabel = B.doc "Ambiguous (same height, different direction)"

ambContent :: (Show a) => (a, B.Token) -> B.Doc
ambContent (spec, tok) = B.doch [B.doc tok, B.doc ":", B.doc (show spec)]

text :: B.Token -> Maybe String
text (B.TWord _ 0 name) = Just name
text _ = Nothing

-- height function
ht :: B.Token -> B.InfixHeight
ht = B.infixHeight text
     [ ("="   , Left  8)
     , ("=/=" , Left  8)
     , ("<>"  , Left  8)
     , ("<"   , Left  8)
     , ("<="  , Left  8)
     , (">"   , Left  8)
     , (">="  , Left  8)

     , ("or"  , Left  7)
     , ("and" , Left  6)
     , ("not" , Left  5)

     , ("+"   , Left  4)
     , ("-"   , Left  4)
     , ("*"   , Left  1)

     , ("div" , Left  2)
     , ("quo" , Left  2)
     , ("rem" , Left  2)
     , ("mod" , Left  2)

     , ("L"   , Left  1)
     , ("R"   , Right 1)
     ]

