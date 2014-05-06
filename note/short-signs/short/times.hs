#!/usr/bin/env runhaskell
{-# OPTIONS_GHC -Wall #-}
--
--  DESCRIPTION
--    Duplicate text on standart input
--
--  EXAMPLE
--    date | ./times.hs 10
--

import qualified System.Environment as Env

main :: IO ()
main =
    do [n] <- Env.getArgs
       let i = read n :: Int
       interact $ unlines . dup i . lines

dup :: Int -> [a] -> [a]
dup i = concat . replicate i

