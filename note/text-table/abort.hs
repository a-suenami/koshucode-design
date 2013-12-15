#!/usr/bin/env runhaskell
--
--  DESCRIPTION
--    Abort message in Koshucode
--    
--  USAGE
--    ./abort.hs
--

{-# OPTIONS_GHC -Wall #-}

import qualified TextTable as T

main :: IO ()
main = putStr report

report :: String
report = comment $ ["", "処理を中断しました", ""] ++ tab ++ [""]
    where
      r       = T.textRuleCell '-'
      w       = T.textCell T.Front
      b       = T.textBlockCell T.Front
      rr      = [r, r]
      wb x ys = [w $ x ++ "  ", b ys]
      tab     = T.renderTable " " $ T.alignTable $
                [ rr
                , wb "分類" ["ANALYSIS ERROR / 解析エラー"]
                , wb "理由" ["TermNotFound / 項目がありません"]
                , wb "詳細理由" ["項目 /y がありません"]
                , wb "関係写像" ["(12) foo.k", "pick /x /y"]
                , wb "節" ["(17) foo.k", "|== A : a"]]

comment :: [String] -> String
comment = unlines . map ("**  " ++)

