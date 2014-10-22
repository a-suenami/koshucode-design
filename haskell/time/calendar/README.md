# I/O List

- runhaskell -Wall [add.hs](#addhs)
- runhaskell -Wall [day.hs](#dayhs)
- runhaskell -Wall [leap.hs](#leaphs)
- runhaskell -Wall [month.hs](#monthhs)



## [add.hs](add.hs)

```
import qualified Data.Time as T

main :: IO ()
main =
    do add 1 (2014, 1, 1)
       add 1 (2014, 1, 2)
       add 1 (2014, 1, 28)
       add 1 (2014, 1, 29)
       add 1 (2014, 1, 30)
       add 1 (2014, 1, 31)
    where
      add n (y, m, d) =
          let t = T.fromGregorian y m d
          in print (t, T.addGregorianMonthsClip n t
                     , T.addGregorianMonthsRollOver n t)
```

Command `runhaskell -Wall add.hs` produces:

```
(2014-01-01,2014-02-01,2014-02-01)
(2014-01-02,2014-02-02,2014-02-02)
(2014-01-28,2014-02-28,2014-02-28)
(2014-01-29,2014-02-28,2014-03-01)
(2014-01-30,2014-02-28,2014-03-02)
(2014-01-31,2014-02-28,2014-03-03)
```



## [day.hs](day.hs)

```
import qualified Data.Time as T

main :: IO ()
main =
    do day (-4713) 11 25
       day (-4712) 1 1
       day 0 12 31
       day 1 1 1
       day 1858 11 16
       day 1858 11 17
       day 2014 10 1
       day 2014 12 31
       day 2014 12 32
       day 2014 13 31
       day 2015 0 0
       day 2015 0 1
       day 2015 1 0
       day 2015 1 1
    where
      day y m d = let t = T.fromGregorian y m d
                  in print (T.toModifiedJulianDay t, t)

```

Command `runhaskell -Wall day.hs` produces:

```
(-2400000,-4713-11-25)
(-2399963,-4712-01-01)
(-678576,0000-12-31)
(-678575,0001-01-01)
(-1,1858-11-16)
(0,1858-11-17)
(56931,2014-10-01)
(57022,2014-12-31)
(57022,2014-12-31)
(57022,2014-12-31)
(57023,2015-01-01)
(57023,2015-01-01)
(57023,2015-01-01)
(57023,2015-01-01)
```



## [leap.hs](leap.hs)

```
import qualified Data.Time as T

main :: IO ()
main =
    do leap 2014
       leap 2015
       leap 2016
       leap 2017
    where
      leap y = print (y, T.isLeapYear y)
```

Command `runhaskell -Wall leap.hs` produces:

```
(2014,False)
(2015,False)
(2016,True)
(2017,False)
```



## [month.hs](month.hs)

```
import qualified Data.Time as T

main :: IO ()
main =
    do year 2014
       year 2015
       year 2016
       year 2017
    where
      year y = print (y, map (T.gregorianMonthLength y) [1..12])
```

Command `runhaskell -Wall month.hs` produces:

```
(2014,[31,28,31,30,31,30,31,31,30,31,30,31])
(2015,[31,28,31,30,31,30,31,31,30,31,30,31])
(2016,[31,29,31,30,31,30,31,31,30,31,30,31])
(2017,[31,28,31,30,31,30,31,31,30,31,30,31])
```



## command

This document is produced by the command:

```
koshu-inout.sh -r -g -x hs runhaskell -Wall
```
