#!/usr/bin/env runhaskell
{-# OPTIONS_GHC -Wall #-}
-- ------------------------------------------------------------
--
--  DESCRIPTION
--    Show internal representations of judges.
--    
--  USAGE
--    echo "|-- P /a 123 /b 'bee" | ./judge.hs
--
-- ------------------------------------------------------------

import qualified Koshucode.Baala.Base    as B
import qualified Koshucode.Baala.Core    as C
import qualified Koshucode.Baala.Vanilla as V

main :: IO ()
main = do code <- getContents
          case C.readJudges code :: B.AbortOr [B.Judge V.VContent] of
            Right js -> B.putLines $ map show js
            Left a   -> B.abort a

