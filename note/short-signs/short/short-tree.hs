#!/usr/bin/env runhaskell
{-# OPTIONS_GHC -Wall #-}
--
--  略号への変換 - 木構造を使った実装
--

import qualified Data.List as List

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

data Tree = Tree (Maybe String) [(Char, Tree)]
      deriving (Show, Eq, Ord)

-- tree は頭部リストを分岐構造に変換します。
--
-- tree []
-- tree [("a", "foo")]
-- tree [("a", "foo"), ("b", "fox")]

tree :: [(String, String)] -> Tree
tree heads = 
    case List.sort empty of
      []           -> Tree Nothing  subTrees
      ((h, _) : _) -> Tree (Just h) subTrees
    where
      (empty, nonEmpty) = divide (null . snd) heads
      first (sh, l:ong) = (l, (sh, ong))
      first _           = error "first"
      subTrees = mapToSnd tree $ group $ map first nonEmpty

divide :: (a -> Bool) -> [a] -> ([a], [a])
divide p xs = (filter p xs, filter q xs) where q = not . p

mapToSnd :: (b -> c) -> [(a, b)] -> [(a, c)]
mapToSnd f = map g where g (a, b) = (a, f b)

-- group [("f", 0), ("f", 1), ("g", 2), ("f", 3)]

group :: (Ord a, Ord b) => [(a, b)] -> [(a, [b])]
group = g . List.sort where
    g [] = []
    g ((a, b) : xs) =
        case g xs of
          [] -> [(a, [b])]
          (a2, b2) : xs2
              | a == a2   -> (a, b : b2) : xs2
              | otherwise -> (a, [b]) : (a2, b2) : xs2

short :: [(String, String)] -> String -> String
short heads word = find (tree heads) word Nothing where
    find (Tree hd trees) xxs prev =
        let prev2 = updatePrev prev hd xxs
        in case xxs of
             ""   -> select prev2
             x:xs -> case lookup x trees of
                       Nothing    -> select prev2
                       Just tree2 -> find tree2 xs prev2

    updatePrev prev hd body =
        case hd of
          Nothing -> prev
          Just h  -> Just (h, body) -- h.body

    select (Nothing)        = "'" ++ word
    select (Just (h, body)) = h ++ "." ++ body

