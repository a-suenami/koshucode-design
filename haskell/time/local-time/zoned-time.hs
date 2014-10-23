--
--  Structure of zoned time
--
--    /zoned-time      ZonedTime
--      /time            LocalTime
--        /mjd             Day
--        /clock           TimeOfDay
--          /hour            Int
--          /minute          Int
--          /second          Pico
--      /time-zone       TimeZone
--        /minute          Int
--        /summer          Bool
--        /name            String
--

import qualified Data.Time as T
import Example.Utility

main :: IO ()
main =
    do zone <- T.getCurrentTimeZone
       let zt = T.utcToZonedTime zone ut
       print ut
       print zt
       print $ T.zonedTimeToUTC zt

       zt2 <- T.utcToLocalZonedTime ut
       print zt2
    where
      ut = utcFrom (2014, 10, 12, 8, 50, 00)
