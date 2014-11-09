# I/O List

- koshu [diff.k](#diffk)
- koshu [notation.k](#notationk)



## [diff.k](diff.k)

```
** -*- koshu -*-
**
**  DESCRIPTION
**    Difference between two times.
**    Resulting differences are represented as clock.
**
**               |D'HH:MM:SS| clock /z = /y - /x
**    -----------+----------+----------------------> time
**          time /x         time /y
**          
**

|-- X  /x 2014-10-01 00:30

|-- Y  /y 2014-10-01 00:30
|-- Y  /y 2014-10-01 00:31
|-- Y  /y 2014-10-01 01:00
|-- Y  /y 2014-10-01 12:00
|-- Y  /y 2014-10-01 23:59
|-- Y  /y 2014-10-02 00:00
|-- Y  /y 2014-10-02 00:29
|-- Y  /y 2014-10-02 00:30
|-- Y  /y 2014-10-02 06:00
|-- Y  /y 2014-10-31 00:00
|-- Y  /y 2015-01-01 00:00
|-- Y  /y 3000-01-01 00:00

x  : source X /x
y  : source Y /y
xy : x | meet y

|== POS -fore /x /y : xy | add /z ( /y - /x )
|== NEG -fore /x /y : xy | add /z ( /x - /y )
```

Command `koshu diff.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    diff.k
**

|-- POS  /x 2014-10-01 00:30  /y 2014-10-01 00:30  /z |00:00|
|-- POS  /x 2014-10-01 00:30  /y 2014-10-01 00:31  /z |00:01|
|-- POS  /x 2014-10-01 00:30  /y 2014-10-01 01:00  /z |00:30|
|-- POS  /x 2014-10-01 00:30  /y 2014-10-01 12:00  /z |11:30|
|-- POS  /x 2014-10-01 00:30  /y 2014-10-01 23:59  /z |23:29|

|-- POS  /x 2014-10-01 00:30  /y 2014-10-02 00:00  /z |23:30|
|-- POS  /x 2014-10-01 00:30  /y 2014-10-02 00:29  /z |23:59|
|-- POS  /x 2014-10-01 00:30  /y 2014-10-02 00:30  /z |1'00:00|
|-- POS  /x 2014-10-01 00:30  /y 2014-10-02 06:00  /z |1'05:30|
|-- POS  /x 2014-10-01 00:30  /y 2014-10-31 00:00  /z |29'23:30|

|-- POS  /x 2014-10-01 00:30  /y 2015-01-01 00:00  /z |91'23:30|
|-- POS  /x 2014-10-01 00:30  /y 3000-01-01 00:00  /z |359855'23:30|

*** 12 judges

|-- NEG  /x 2014-10-01 00:30  /y 2014-10-01 00:30  /z |00:00|
|-- NEG  /x 2014-10-01 00:30  /y 2014-10-01 00:31  /z |-00:01|
|-- NEG  /x 2014-10-01 00:30  /y 2014-10-01 01:00  /z |-00:30|
|-- NEG  /x 2014-10-01 00:30  /y 2014-10-01 12:00  /z |-11:30|
|-- NEG  /x 2014-10-01 00:30  /y 2014-10-01 23:59  /z |-23:29|

|-- NEG  /x 2014-10-01 00:30  /y 2014-10-02 00:00  /z |-23:30|
|-- NEG  /x 2014-10-01 00:30  /y 2014-10-02 00:29  /z |-23:59|
|-- NEG  /x 2014-10-01 00:30  /y 2014-10-02 00:30  /z |-1'00:00|
|-- NEG  /x 2014-10-01 00:30  /y 2014-10-02 06:00  /z |-1'05:30|
|-- NEG  /x 2014-10-01 00:30  /y 2014-10-31 00:00  /z |-29'23:30|

|-- NEG  /x 2014-10-01 00:30  /y 2015-01-01 00:00  /z |-91'23:30|
|-- NEG  /x 2014-10-01 00:30  /y 3000-01-01 00:00  /z |-359855'23:30|

*** 12 judges

**
**  SUMMARY
**      12 judges on NEG
**      12 judges on POS
**      24 judges in total
**
```



## [notation.k](notation.k)

```
** -*- koshu -*-
**
**  DESCRIPTION
**    Time is a scale for judging before-or-after between events.
**    The time scale is measured with some precisions.
**
**    ------------|------------------------|-------> time with precision of a day
**                :                        :
**       2014-07-20               2014-07-21
**
**    --------|----------|----------|----------|---> time with precision of an hour
**                       :          :
**           2014-07-20 12          2014-07-20 13
**
**    --|----|----|----|----|----|----|----|----|--> time with precision of a minute
**                          :    :
**           2014-07-20 12:45    2014-07-20 12:46
**
**    -|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-> time with precision of a second
**                             : :
**           2014-07-20 12:45:30 :
**             2014-07-20 12:45:31
**

|-- P  /time 2014-07                ** YEAR-MONTH
|-- P  /time 2014-07-20             ** YEAR-MONTH-DAY
|-- P  /time 2014-07-20 12          ** YEAR-MONTH-DAY HH
|-- P  /time 2014-07-20 12:45       ** YEAR-MONTH-DAY HH:MM
|-- P  /time 2014-07-20 12:45:30    ** YEAR-MONTH-DAY HH:MM:DD

|== Q -table -fore /time
    : source P /time
    | add /type ( type /time )
```

Command `koshu notation.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    notation.k
**

|-- Q  /time 2014-07  /type [- time month -]
|-- Q  /time 2014-07-20  /type [- time day -]
|-- Q  /time 2014-07-20 12  /type [- time hour -]
|-- Q  /time 2014-07-20 12:45  /type [- time min -]
|-- Q  /time 2014-07-20 12:45:30  /type [- time sec -]

*** 5 judges

**  TABLE : Q
**
**    /time                 /type
**    --------------------- ------------------
**    2014-07               [- time month -]
**    2014-07-20            [- time day -]
**    2014-07-20 12         [- time hour -]
**    2014-07-20 12:45      [- time min -]
**    2014-07-20 12:45:30   [- time sec -]

**
**  SUMMARY
**       5 judges on Q
**       5 judges in total
**
```



## command

This document is produced by the command:

```
koshu-inout.sh -r -g koshu
```
