# I/O List

- runhaskell -Wall [frac.hs](#frachs)
- runhaskell -Wall [local-time.hs](#local-timehs)
- runhaskell -Wall [time-zone.hs](#time-zonehs)
- runhaskell -Wall [time.hs](#timehs)
- runhaskell -Wall [zoned-time.hs](#zoned-timehs)



## [frac.hs](frac.hs)

```
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
```

Command `runhaskell -Wall frac.hs` produces:

```
00:00:01
06:00:00
12:00:00
23:59:00
23:59:50
23:59:59
23:59:60
23:59:61
229 % 540
25 % 48
```



## [local-time.hs](local-time.hs)

```
import qualified Data.Time as T
import Example.Utility

main :: IO ()
main =
    do print lt
       print $ T.utcToLocalTime T.utc ut
       print $ T.utcToLocalTime   jst ut
       print $ T.localTimeToUTC T.utc lt
       print $ T.localTimeToUTC   jst lt
    where
      ut = utcFrom   (2014, 10, 12, 8, 50, 00)
      lt = localFrom (2014, 10, 12, 8, 50, 00)

jst :: T.TimeZone
jst = T.hoursToTimeZone 9
```

Command `runhaskell -Wall local-time.hs` produces:

```
2014-10-12 08:50:00
2014-10-12 08:50:00
2014-10-12 17:50:00
2014-10-12 08:50:00 UTC
2014-10-11 23:50:00 UTC
```



## [time-zone.hs](time-zone.hs)

```
import qualified Data.Time as T

main :: IO ()
main =
    do z <- T.getCurrentTimeZone
       zone z
       zone T.utc
       zone $ T.hoursToTimeZone 9
       print $ map T.hoursToTimeZone [-3..3]
       print $ map T.minutesToTimeZone $ map (* 10) [-3..3]
    where
      zone z = print ( z
                     , T.timeZoneOffsetString z
                     , T.timeZoneMinutes z
                     , T.timeZoneSummerOnly z
                     , T.timeZoneName z)
```

Command `runhaskell -Wall time-zone.hs` produces:

```
(JST,"+0900",540,False,"JST")
(UTC,"+0000",0,False,"UTC")
(+0900,"+0900",540,False,"")
[-0300,-0200,-0100,+0000,+0100,+0200,+0300]
[-0030,-0020,-0010,+0000,+0010,+0020,+0030]
```



## [time.hs](time.hs)

```
import qualified Data.Time as T
import Example.Utility

main :: IO ()
main =
    do time T.midnight
       time T.midday
       time $ T.TimeOfDay 12 30 00
       time $ T.timeToTimeOfDay $ timeFrom 12 30 00
       print $ T.timeOfDayToTime T.midday
    where
      time t = print ( t
                     , T.todHour t
                     , T.todMin t
                     , T.todSec t )
```

Command `runhaskell -Wall time.hs` produces:

```
(00:00:00,0,0,0.000000000000)
(12:00:00,12,0,0.000000000000)
(12:30:00,12,30,0.000000000000)
(12:30:00,12,30,0.000000000000)
43200s
```



## [zoned-time.hs](zoned-time.hs)

```
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
```

Command `runhaskell -Wall zoned-time.hs` produces:

```
2014-10-12 08:50:00 UTC
2014-10-12 17:50:00 JST
2014-10-12 08:50:00 UTC
2014-10-12 17:50:00 JST
```



## command

This document is produced by the command:

```
koshu-inout.sh -r -g -x hs runhaskell -Wall
```
