#!/usr/bin/env runhaskell
{-# OPTIONS_GHC -Wall #-}
--
--  概要
--    命題と判断
--
--  説明
--    この小さなプログラムでは、命題を、その成否を
--    判断可能な記号列と規定し、具体的には Prop a
--    として定式化します。その命題に成否を組み合わ
--    せた全体を判断と規定し、Judge a として定式化
--    します。いくつかの命題とその評価方法を実装し、
--    それらを判断に変換した結果を出力します。
--
--  使用法
--    ./prop.hs
--

module Main where

--  命題は、項目 (String, a) のリストに、
--  命題の種類をあらわす String を組み合わせた記号とします。
data Prop a
    = Prop String [(String, a)]
      deriving (Show, Eq)

--  判断は、命題そのものと、Bool であらわした
--  命題の成否を組み合わせて表現します。
data Judge a
    = Judge Bool (Prop a)
      deriving (Show, Eq)

--  判断系は、判断関数をもつ型として定式化しておきます。
class Judgeable a where
    judge :: Prop a -> Maybe Bool

--  命題の成否を評価して判断に変換します。
judgeFrom :: (Judgeable p, Show p) => Prop p -> Judge p
judgeFrom p = case judge p of
                Just q  -> Judge q p
                Nothing -> error $ "Void proposition: " ++ show p

--  例題として、足し算とかけ算だけ、
--  その成否を評価できる判断系を用意します。
instance Judgeable Int where
    judge (Prop "+" arg) =
        do (x, y, z) <- lookup3 "x" "y" "z" arg
           return $ x + y == z
    judge (Prop "*" arg) =
        do (x, y, z) <- lookup3 "x" "y" "z" arg
           return $ x * y == z
    judge (Prop _ _) = Nothing

lookup3 :: (Eq a) => a -> a -> a -> [(a, b)] -> Maybe (b,b,b)
lookup3 a b c arg =
    do x <- lookup a arg
       y <- lookup b arg
       z <- lookup c arg
       return (x, y, z)

--  足し算の命題関数
addProp :: Int -> Int -> Int -> Prop Int
addProp x y z = Prop "+" [ ("x",x), ("y",y), ("z",z) ]

--  引き算の命題関数
subProp :: Int -> Int -> Int -> Prop Int
subProp x y z = Prop "-" [ ("x",x), ("y",y), ("z",z) ]

--  かけ算の命題関数
mulProp :: Int -> Int -> Int -> Prop Int
mulProp x y z = Prop "*" [ ("x",x), ("y",y), ("z",z) ]

--  命題
p1, p2, p3, p4, p5, p6, p7 :: Prop Int
p1 = addProp 1 2 3
p2 = addProp 1 3 4
p3 = addProp 1 3 5
p4 = mulProp 1 2 2
p5 = mulProp 1 3 3
p6 = mulProp 1 3 4
p7 = subProp 3 2 1

--  判断
j1, j2, j3, j4, j5, j6, j7 :: Judge Int
j1 = judgeFrom p1
j2 = judgeFrom p2
j3 = judgeFrom p3
j4 = judgeFrom p4
j5 = judgeFrom p5
j6 = judgeFrom p6
j7 = judgeFrom p7

--  判断の内容を出力。j7 はエラーになる。
main :: IO ()
main = print `mapM_` [ j1, j2, j3, j4, j5, j6, j7 ]

