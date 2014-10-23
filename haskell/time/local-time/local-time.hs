import qualified Data.Time as T
import Example

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
