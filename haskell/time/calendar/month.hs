import qualified Data.Time as T

main :: IO ()
main =
    do year 2014
       year 2015
       year 2016
       year 2017
    where
      year y = print (y, map (T.gregorianMonthLength y) [1..12])
