import qualified Data.Time as T
import Example

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
