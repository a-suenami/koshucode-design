--
--  century  %C
--  year     %Y %y    | %F %D
--  month    %m %B %b |
--  day/m    %d %e    |
--  day/y    %j
--  day/w    %w %u %a %A
--

import qualified Data.Time as T
import Example.Utility

main :: IO ()
main =
    do format (2014, 12, 30,  8, 50, 00) "year   %Y %C-%y"
       format (2014, 12, 30,  8, 50, 00) "month  %m %b %B"
       format (2015,  1,  1,  8, 50, 00) "month  %m %b %B"
       format (2014, 12,  2,  8, 50, 00) "day    %d %e %j"
       format (2014, 12,  2,  8, 50, 00) "date   %F %D"
    where
      format t s = putStrLn $ T.formatTime T.defaultTimeLocale s $ utcFrom t
