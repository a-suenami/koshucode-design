--
--    Fraction
--    0 / 86400               43200 / 86400           86400 / 86400
--    0                       1 / 2                   1
--    |                       |                       |
--    |-----------|-----------|-----------|-----------|-----------
--    |           |           |           |           |
--    00:00:00    06:00:00    12:00:00    18:00:00    24:00:00
--    Time of day
--

import qualified Data.Time as T
import Data.Ratio

main :: IO ()
main =
    do fromFrac (1 % 86400)
       fromFrac (1 % 4)
       fromFrac (1 % 2)
       fromFrac (86340 % 86400)
       fromFrac (86390 % 86400)
       fromFrac (86399 % 86400)
       fromFrac 1
       fromFrac (86401 % 86400)

       toFrac $ T.TimeOfDay 10 10 40
       toFrac $ T.TimeOfDay 12 30 00
    where
      fromFrac = print . T.dayFractionToTimeOfDay
      toFrac   = print . T.timeOfDayToDayFraction
