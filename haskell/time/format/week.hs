--
--  day/w    %w %u %a %A
--  week/y   %W %U %V
--  year     %G %g
--

import qualified Data.Time as T
import Example

main :: IO ()
main =
    do format (2014, 12, 29,  8, 50, 00) "week   %f-%g %G %V %U %W : %u %w %a %A"
       format (2014, 12, 30,  8, 50, 00) "week   %f-%g %G %V %U %W : %u %w %a %A"
       format (2014, 12, 31,  8, 50, 00) "week   %f-%g %G %V %U %W : %u %w %a %A"
       format (2015,  1,  1,  8, 50, 00) "week   %f-%g %G %V %U %W : %u %w %a %A"
       format (2015,  1,  2,  8, 50, 00) "week   %f-%g %G %V %U %W : %u %w %a %A"
       format (2015,  1,  3,  8, 50, 00) "week   %f-%g %G %V %U %W : %u %w %a %A"
       format (2015,  1,  4,  8, 50, 00) "week   %f-%g %G %V %U %W : %u %w %a %A"
    where
      format t s = putStrLn $ T.formatTime T.defaultTimeLocale s $ utcFrom t
