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
