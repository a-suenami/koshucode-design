import qualified Data.Time as T
import Example.Utility

main :: IO ()
main =
    do utc (2014, 10, 12, 00, 00, 00)
       utc (2014, 10, 12, 08, 50, 00)
       utc (2014, 10, 12, 08, 59, 60)
       utc (2014, 10, 12, 23, 59, 59)
       utc (2014, 10, 12, 23, 59, 60)
       utc (2014, 10, 12, 23, 60, 00)
       utc (2014, 10, 12, 24, 00, 00)
    where
      utc d = print (utcFrom d, d)
