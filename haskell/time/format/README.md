# I/O List

- runhaskell -Wall -i.. [date.hs](#datehs)
- runhaskell -Wall -i.. [time.hs](#timehs)
- runhaskell -Wall -i.. [week.hs](#weekhs)



## [date.hs](date.hs)

```
--
--  century  %C
--  year     %Y %y    | %F %D
--  month    %m %B %b |
--  day/m    %d %e    |
--  day/y    %j
--  day/w    %w %u %a %A
--

import qualified Data.Time as T
import Example

main :: IO ()
main =
    do format (2014, 12, 30,  8, 50, 00) "year   %Y %C-%y"
       format (2014, 12, 30,  8, 50, 00) "month  %m %b %B"
       format (2015,  1,  1,  8, 50, 00) "month  %m %b %B"
       format (2014, 12,  2,  8, 50, 00) "day    %d %e %j"
       format (2014, 12,  2,  8, 50, 00) "date   %F %D"
    where
      format t s = putStrLn $ T.formatTime T.defaultTimeLocale s $ utcFrom t
```

Command `runhaskell -Wall -i.. date.hs` produces:

```
year   2014 20-14
month  12 Dec December
month  01 Jan January
day    02  2 336
date   2014-12-02 12/02/14
```



## [time.hs](time.hs)

```
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
```

Command `runhaskell -Wall -i.. time.hs` produces:

```
zone   UTC +0000
time   08:50 08:50:00 08:50:00
time   08:50:00 am AM
time   06:50:00 pm PM
time   06:50:15.000000000000
UNIX   1417510200
UNIX   0
```



## [week.hs](week.hs)

```
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
```

Command `runhaskell -Wall -i.. week.hs` produces:

```
week   20-15 2015 01 52 52 : 1 1 Mon Monday
week   20-15 2015 01 52 52 : 2 2 Tue Tuesday
week   20-15 2015 01 52 52 : 3 3 Wed Wednesday
week   20-15 2015 01 00 00 : 4 4 Thu Thursday
week   20-15 2015 01 00 00 : 5 5 Fri Friday
week   20-15 2015 01 00 00 : 6 6 Sat Saturday
week   20-15 2015 01 01 00 : 7 0 Sun Sunday
```



## command

This document is produced by the command:

```
koshu-inout.sh -r -g -x hs runhaskell -Wall -i..
```
