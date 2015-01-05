module Example where

import qualified Data.Time  as T
import qualified Data.Fixed as F

timeFrom :: Integer -> Integer -> Integer -> T.DiffTime
timeFrom h i s = T.secondsToDiffTime $ (h * 60 + i) * 60 + s

utcFrom :: (Integer, Int, Int, Integer, Integer, Integer) -> T.UTCTime
utcFrom (y, m, d, h, i, s) =
    let day = T.fromGregorian y m d
        tim = timeFrom h i s
    in T.UTCTime day tim

localFrom :: (Integer, Int, Int, Int, Int, F.Pico) -> T.LocalTime
localFrom (y, m, d, h, i, s) =
    let day = T.fromGregorian y m d
        tim = T.TimeOfDay h i s
    in T.LocalTime day tim
