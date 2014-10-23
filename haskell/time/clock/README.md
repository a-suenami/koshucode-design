# I/O List

- runhaskell -Wall -i.. [diff-time.hs](#diff-timehs)
- runhaskell -Wall -i.. [diff-utc.hs](#diff-utchs)
- runhaskell -Wall -i.. [utc.hs](#utchs)



## [diff-time.hs](diff-time.hs)

```
import qualified Data.Time as T

main :: IO ()
main =
    do print $ T.secondsToDiffTime 0
       print $ T.secondsToDiffTime 1000
       print $ T.picosecondsToDiffTime 1000
       print $ T.picosecondsToDiffTime $ 1000 * 1000 * 1000
```

Command `runhaskell -Wall -i.. diff-time.hs` produces:

```
0s
1000s
0.000000001s
0.001s
```



## [diff-utc.hs](diff-utc.hs)

```
import qualified Data.Time as T
import Example

main :: IO ()
main =
    do diff (2014, 10, 12, 00, 00, 00) (2014, 10, 12, 00, 00, 00)
       diff (2014, 10, 12, 00, 00, 00) (2014, 10, 12, 00, 00, 01)
       diff (2014, 10, 12, 00, 00, 00) (2014, 10, 12, 00, 01, 00)
       diff (2014, 10, 12, 00, 00, 00) (2014, 10, 12, 01, 00, 00)
       diff (2014, 10, 12, 08, 00, 00) (2014, 10, 12, 09, 00, 00)
       diff (2014, 10, 12, 00, 00, 00) (2014, 10, 12, 12, 00, 00)
       diff (2014, 10, 12, 00, 00, 00) (2014, 10, 12, 24, 00, 00)
       diff (2014, 10, 12, 00, 00, 00) (2014, 10, 13, 00, 00, 00)
       diff (2014, 10, 12, 00, 00, 00) (2014, 11, 12, 00, 00, 00)
       diff (2014, 10, 12, 00, 00, 00) (2015, 10, 12, 00, 00, 00)
    where
      diff d1 d2 = let u1 = utcFrom d1
                       u2 = utcFrom d2
                   in print (u1, u2, T.diffUTCTime u2 u1)
```

Command `runhaskell -Wall -i.. diff-utc.hs` produces:

```
(2014-10-12 00:00:00 UTC,2014-10-12 00:00:00 UTC,0s)
(2014-10-12 00:00:00 UTC,2014-10-12 00:00:01 UTC,1s)
(2014-10-12 00:00:00 UTC,2014-10-12 00:01:00 UTC,60s)
(2014-10-12 00:00:00 UTC,2014-10-12 01:00:00 UTC,3600s)
(2014-10-12 08:00:00 UTC,2014-10-12 09:00:00 UTC,3600s)
(2014-10-12 00:00:00 UTC,2014-10-12 12:00:00 UTC,43200s)
(2014-10-12 00:00:00 UTC,2014-10-12 23:59:60 UTC,86400s)
(2014-10-12 00:00:00 UTC,2014-10-13 00:00:00 UTC,86400s)
(2014-10-12 00:00:00 UTC,2014-11-12 00:00:00 UTC,2678400s)
(2014-10-12 00:00:00 UTC,2015-10-12 00:00:00 UTC,31536000s)
```



## [utc.hs](utc.hs)

```
import qualified Data.Time as T
import Example

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
```

Command `runhaskell -Wall -i.. utc.hs` produces:

```
(2014-10-12 00:00:00 UTC,(2014,10,12,0,0,0))
(2014-10-12 08:50:00 UTC,(2014,10,12,8,50,0))
(2014-10-12 09:00:00 UTC,(2014,10,12,8,59,60))
(2014-10-12 23:59:59 UTC,(2014,10,12,23,59,59))
(2014-10-12 23:59:60 UTC,(2014,10,12,23,59,60))
(2014-10-12 23:59:60 UTC,(2014,10,12,23,60,0))
(2014-10-12 23:59:60 UTC,(2014,10,12,24,0,0))
```



## command

This document is produced by the command:

```
koshu-inout.sh -r -g -x hs runhaskell -Wall -i..
```
