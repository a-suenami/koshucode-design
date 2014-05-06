#!/usr/bin/env runhaskell
{-# OPTIONS_GHC -Wall #-}
--
--  略号への変換 - 素朴な実装
--
--  B.xxx のような略号があり、
--  これが foo.bar.xxx という
--  正式記号に対応しているとき、
--  B を略号の頭部、foo.bar を正式記号の頭部、
--  xxx を本体とよぶことがあります。
--
--  [ ("B", "foo.bar."), ... ]
--  のような頭部リストを使い、
--  正式記号から略号への変換を行います。
--

import qualified Data.List   as List
import qualified Data.Monoid as Monoid

main :: IO ()
main = interact $ unlines . map (short hs) . words where
    hs = [ ("A", "foo.")     -- foo.xxx は A.xxx
         , ("B", "foo.bar.") -- foo.bar.xxx は A.bar.xxx ではなく B.xxx
         , ("C", "foo.bar.") -- foo.bar.xxx は C.xxx ではなく B.xxx
         , ("D", "foo")      -- fooxxx は D.xxx
         , ("a", "aaaaaaaaaa.bbbbbbbbbb.cccccccccc.aaaaaaaaaa.")
         , ("b", "aaaaaaaaaa.bbbbbbbbbb.cccccccccc.bbbbbbbbbb.")
         , ("c", "aaaaaaaaaa.bbbbbbbbbb.cccccccccc.cccccccccc.")
         , ("d", "aaaaaaaaaa.bbbbbbbbbb.cccccccccc.dddddddddd.")
         , ("e", "aaaaaaaaaa.bbbbbbbbbb.cccccccccc.eeeeeeeeee.")
         , ("f", "aaaaaaaaaa.bbbbbbbbbb.cccccccccc.ffffffffff.")
         , ("g", "aaaaaaaaaa.bbbbbbbbbb.cccccccccc.gggggggggg.")
         , ("h", "aaaaaaaaaa.bbbbbbbbbb.dddddddddd.hhhhhhhhhh.")
         , ("i", "aaaaaaaaaa.bbbbbbbbbb.dddddddddd.iiiiiiiiii.")
         , ("j", "aaaaaaaaaa.bbbbbbbbbb.dddddddddd.jjjjjjjjjj.")
         , ("k", "aaaaaaaaaa.bbbbbbbbbb.dddddddddd.kkkkkkkkkk.")
         , ("l", "aaaaaaaaaa.bbbbbbbbbb.dddddddddd.llllllllll.")
         , ("m", "aaaaaaaaaa.bbbbbbbbbb.dddddddddd.mmmmmmmmmm.")
         , ("n", "aaaaaaaaaa.bbbbbbbbbb.dddddddddd.nnnnnnnnnn.")
         , ("o", "aaaaaaaaaa.bbbbbbbbbb.eeeeeeeeee.oooooooooo.")
         , ("p", "aaaaaaaaaa.bbbbbbbbbb.eeeeeeeeee.pppppppppp.")
         , ("q", "aaaaaaaaaa.bbbbbbbbbb.eeeeeeeeee.qqqqqqqqqq.")
         , ("r", "aaaaaaaaaa.bbbbbbbbbb.eeeeeeeeee.rrrrrrrrrr.")
         , ("s", "aaaaaaaaaa.bbbbbbbbbb.eeeeeeeeee.ssssssssss.")
         , ("t", "aaaaaaaaaa.bbbbbbbbbb.eeeeeeeeee.tttttttttt.")
         , ("u", "aaaaaaaaaa.bbbbbbbbbb.eeeeeeeeee.uuuuuuuuuu.")
         , ("v", "aaaaaaaaaa.bbbbbbbbbb.ffffffffff.vvvvvvvvvv.")
         , ("w", "aaaaaaaaaa.bbbbbbbbbb.ffffffffff.wwwwwwwwww.")
         , ("x", "aaaaaaaaaa.bbbbbbbbbb.ffffffffff.xxxxxxxxxx.")
         , ("y", "aaaaaaaaaa.bbbbbbbbbb.ffffffffff.yyyyyyyyyy.")
         , ("z", "aaaaaaaaaa.bbbbbbbbbb.ffffffffff.zzzzzzzzzz.") ]

-- ----------------------

--  short は正式記号を略号に変換します。
--  変換できないときは、引用符をつけて返します。

short :: [(String, String)] -> String -> String
short = find . sortHeads where
    find [] sign = "'" ++ sign
    find ((sh, long) : heads) sign =
        case List.stripPrefix long sign of
          Nothing   -> find heads sign
          Just body -> sh ++ "." ++ body

--  該当する頭部のなかで、もっとも長く、辞書順で若い頭部を選ぶため、
--  sortHeads は、頭部リストを、つぎの順に並べ替えます。
--
--  1. 正式記号の頭部が長い。
--  2. 正式記号の頭部が辞書式で前方にある。
--  3. 略号の頭部が辞書式で前方にある。

sortHeads :: (Ord a) => [ ([a], [a]) ] -> [ ([a], [a]) ]
sortHeads = List.sortBy ord where
    ord (short1, long1) (short2, long2) =
        lengthDesc long1 long2
          `Monoid.mappend` compare long1 long2
          `Monoid.mappend` compare short1 short2

lengthAsc :: [a] -> [b] -> Ordering
lengthAsc x y = length x `compare` length y

lengthDesc :: [a] -> [b] -> Ordering
lengthDesc x y = lengthAsc y x


