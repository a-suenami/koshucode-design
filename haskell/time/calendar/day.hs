import qualified Data.Time as T

main :: IO ()
main =
    do day (-4713) 11 25
       day (-4712) 1 1
       day 0 12 31
       day 1 1 1
       day 1858 11 16
       day 1858 11 17
       day 2014 10 1
       day 2014 12 31
       day 2014 12 32
       day 2014 13 31
       day 2015 0 0
       day 2015 0 1
       day 2015 1 0
       day 2015 1 1
    where
      day y m d = let t = T.fromGregorian y m d
                  in print (T.toModifiedJulianDay t, t)

