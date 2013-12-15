#!/usr/bin/env runhaskell
--
--  DESCRIPTION
--    Print text in table form
--    
--  USAGE
--    ./table.hs < sample.txt
--

{-# OPTIONS_GHC -Wall #-}

import qualified Data.List.Split as S
import qualified TextTable as T

main :: IO ()
main = interact $ unlines . map table . filter (not . null) . lines

sep :: String
sep = " | "

table :: String -> String
table src
    | all (== length head2) $ map length rows = unlines tab
    | otherwise = error $ "unmatch columns : " ++ src
    where
      tab  = T.renderTable sep $ T.alignTable $ T.textTable pos rows
      pos  = T.textPos head2
      rows = map words body
      head2 = filter (/= ' ') head1
      (head1 : body) = S.splitOn "|" src

