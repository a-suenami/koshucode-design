import qualified Data.Time as T

main :: IO ()
main =
    do leap 2014
       leap 2015
       leap 2016
       leap 2017
    where
      leap y = print (y, T.isLeapYear y)
