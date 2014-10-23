--
--  zone     %Z %z
--  am/pm           %P %p
--  hour     %H %k  %I %l | %T | %R
--  minute   %M           |    |
--  second   %S %q %Q     |
--

import qualified Data.Time as T
import Example

main :: IO ()
main =
    do format (2014, 12,  2,  8, 50, 00) "zone   %Z %z"
       format (2014, 12,  2,  8, 50, 00) "time   %R %T %H:%M:%S"
       format (2014, 12,  2,  8, 50, 00) "time   %I:%M:%S %P %p"
       format (2014, 12,  2, 18, 50, 00) "time   %I:%M:%S %P %p"
       format (2014, 12,  2, 18, 50, 15) "time   %I:%M:%S.%q"
       format (2014, 12,  2,  8, 50, 00) "UNIX   %s"
       format (1970,  1,  1,  0, 00, 00) "UNIX   %s"
    where
      format t s = putStrLn $ T.formatTime T.defaultTimeLocale s $ utcFrom t
