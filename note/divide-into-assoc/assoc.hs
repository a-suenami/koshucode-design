#!/usr/bin/env runhaskell
{-# OPTIONS_GHC -Wall #-}
-- ------------------------------------------------------------------
--
--  DESCRIPTION
--    Argument as association list
--
--  USAGE
--    ./assoc.hs
--
-- ------------------------------------------------------------------

import qualified Data.List as List
import qualified Koshucode.Baala.Base as B

-- argument as assoc list
type Name      = String
type Arg       = [String]
type NamedArg  = [B.Named Arg]

-- trunk associator
type TrunkAssoc   = ([Name], Arg -> Maybe NamedArg)
type TrunkAssoc1  = String -> TrunkAssoc
type TrunkAssoc2  = String -> TrunkAssoc1

--  There are three points that may fail.
--
--    1. MALFORMED trunk
--    2. DUPLICATE branch
--    3. UNKNOWN branch
--
--  Trunk and branches are like this:
--
--    range   /x      -from 1   -to 10
--            trunk   branch    branch
--
data ArgAbort
    = ArgMalformed [Name]
    | ArgDuplicate [Name]
    | ArgUnknown   [Name]
      deriving (Show, Eq, Ord)

type ArgAbortable = Either ArgAbort

-- ----------------------  Argument associator

argAssoc :: TrunkAssoc -> [Name] -> String -> ArgAbortable NamedArg
argAssoc dc names line =
    do let arg1 = B.assocBy isName "" $ words line 
       arg2 <- applyTrunkAssoc dc arg1
       checkDuplicate arg2
       checkUnknown names (map fst arg2)
       return arg2

-- strings like "-???" are argument names
isName :: String -> Maybe String
isName k@('-' : _) = Just k
isName _           = Nothing

checkDuplicate :: NamedArg -> ArgAbortable ()
checkDuplicate arg =
    case B.assocMore $ B.assocGather arg of
      [] -> Right ()
      a  -> Left  $ ArgDuplicate (map fst a)

checkUnknown :: [Name] -> [Name] -> ArgAbortable ()
checkUnknown knowns arg
    | null unkowns = Right ()
    | otherwise    = Left $ ArgUnknown unkowns
    where unkowns = arg List.\\ ("" : knowns)



-- ----------------------  Trunk associator

applyTrunkAssoc :: TrunkAssoc -> NamedArg -> ArgAbortable NamedArg
applyTrunkAssoc (ks, dc) args =
    case maybeTrunk of
      Just a  -> Right $ a ++ args
      Nothing -> Left  $ ArgMalformed ks
    where
      maybeTrunk
          | any (`B.assocExist` args) ks = Just []
          | otherwise = case lookup "" args of
                          Nothing -> Nothing
                          Just ls -> dc ls

makeTrunkAssoc :: [String] -> (Arg -> Maybe NamedArg) -> TrunkAssoc
makeTrunkAssoc = (,)

trunkElems :: TrunkAssoc1
trunkElems k = makeTrunkAssoc [k] assoc where
    assoc xs = Just [(k, xs)]

trunkUncons :: TrunkAssoc2
trunkUncons kh kt = makeTrunkAssoc [kh, kt] assoc where
    assoc (h:t) = Just [(kh, [h]), (kt, t)]
    assoc _     = Nothing

trunkUnary :: TrunkAssoc1
trunkUnary k = makeTrunkAssoc [k] assoc where
    assoc [x] = Just [(k, [x])]
    assoc _   = Nothing

trunkBinary :: TrunkAssoc2
trunkBinary kx ky = makeTrunkAssoc [kx, ky] assoc where
    assoc [x, y] = Just [(kx, [x]), (ky, [y])]
    assoc _      = Nothing



-- ----------------------  Examples

main :: IO ()
main =
    do arg xs   "-x"         "10 20 30"

       arg xy   "-x -y -z"   "10 20 -z 30"
       arg xy   "-x -y"      "10 20 -z 30"
       arg xy   "-x -y"      "10 20 30"
       arg xy   "-x -y -z"   "-x 10 -y 20 -z 30"
       arg xy   "-x -y -z"   "-x 10 -x 20 -z 30"
       
       arg xys  "-x -y"      "10 20 30"
    where
      xs  = trunkElems  "-x"
      xy  = trunkBinary "-x" "-y"
      xys = trunkUncons "-x" "-y"

      arg (tn,tf) ns line =
          do let result = argAssoc (tn,tf) (words ns) line
                 names  = words ns
                 trunk  = unwords tn
                 branch = unwords $ names List.\\ tn
             putStrLn $ line ++ " / " ++ trunk ++ " / " ++ branch
             putStrLn $ outputText result
                   
      outputText result =
          case result of
            Right res -> "  " ++ show res
            Left (ArgMalformed ns) -> leftText "MALFORMED" ns
            Left (ArgDuplicate ns) -> leftText "DUPLICATE" ns
            Left (ArgUnknown   ns) -> leftText "UNKNOWN" ns

      leftText tag ns =
          "  ** " ++ tag ++ " " ++ unwords ns

