{-# OPTIONS_GHC -Wall #-}
--
--  Examples of 'shortenGroup'
--
--    $ echo "abc (xyz) def [xyz] gh" | runhaskell replace-group.hs
--    abc () def [] gh
--
--    $ echo "abc (x (y) [z]) def" | runhaskell replace-group.hs
--    abc () def
--
--    $ echo "abc (x (y [z]) def" | runhaskell replace-group.hs
--    abc (x (y [z]) def
--
--    $ echo "abc (x (y z]) def" | runhaskell replace-group.hs
--    abc () def
--
--  Example of 'deleteTag'
--
--    $ echo "-abc <t>xyz</t> def" | runhaskell replace-group.hs
--    abc xyz def
--

module Main where

main :: IO ()
main = interact (unlines . map f . lines) where
    f ('-' : s)  = replaceGroup deleteTag s
    f s          = replaceGroup shortenGroup s

data Group a = Group
    { groupOpen     :: a -> Bool
    , groupClose    :: a -> Bool
    , groupReplace  :: a -> a -> [a]
    }

type TextGroup = Group Char

replaceGroup :: TextGroup -> String -> String
replaceGroup g = outer where

    open   = groupOpen g
    close  = groupClose g
    rep    = groupReplace g

    outer :: String -> String
    outer [] = []
    outer xxs@(x : xs)
        | open x      = case inner xs of
                          Nothing       -> xxs
                          Just (y, xs') -> rep x y ++ outer xs'
        | otherwise   = x : outer xs

    inner :: String -> Maybe (Char, String)
    inner [] = Nothing
    inner (x : xs)
        | open x      = case inner xs of
                          Nothing       -> Nothing
                          Just (_, xs') -> inner xs'
        | close x     = Just (x, xs)
        | otherwise   = inner xs

deleteTag :: TextGroup
deleteTag = Group open close replace where
    open         = (== '<')
    close        = (== '>')
    replace _ _  = ""

shortenGroup :: TextGroup
shortenGroup = Group open close replace where
    open o       = o `elem` "([{<"
    close c      = c `elem` ">}])"
    replace o c  = [o, c]

