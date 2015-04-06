# I/O List

- koshu [date-part.k](#date-partk)
- koshu [diff.k](#diffk)
- koshu [notation.k](#notationk)



## [date-part.k](date-part.k)

```
** -*- koshu -*-
**
**  DESCRIPTION
**    Date-part of time can be written in three formats.
**
**    - YYYY-MM-DD    monthly format
**    - YYYY-#WW-D    weekly format
**    - YYYY-##DDD    yearly format
**

|== P
  : range-day /monthly -from 2014-12-15 -to 2015-1-15
  | add /weekly ( weekly /monthly )
        /yearly ( yearly /monthly )
  --forward /monthly /weekly /yearly
```

Command `koshu date-part.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    date-part.k
**
**  OUTPUT
**    <stdout>
**

|-- P  /monthly 2014-12-15  /weekly 2014-#51-1  /yearly 2014-##349
|-- P  /monthly 2014-12-16  /weekly 2014-#51-2  /yearly 2014-##350
|-- P  /monthly 2014-12-17  /weekly 2014-#51-3  /yearly 2014-##351
|-- P  /monthly 2014-12-18  /weekly 2014-#51-4  /yearly 2014-##352
|-- P  /monthly 2014-12-19  /weekly 2014-#51-5  /yearly 2014-##353

|-- P  /monthly 2014-12-20  /weekly 2014-#51-6  /yearly 2014-##354
|-- P  /monthly 2014-12-21  /weekly 2014-#51-7  /yearly 2014-##355
|-- P  /monthly 2014-12-22  /weekly 2014-#52-1  /yearly 2014-##356
|-- P  /monthly 2014-12-23  /weekly 2014-#52-2  /yearly 2014-##357
|-- P  /monthly 2014-12-24  /weekly 2014-#52-3  /yearly 2014-##358

|-- P  /monthly 2014-12-25  /weekly 2014-#52-4  /yearly 2014-##359
|-- P  /monthly 2014-12-26  /weekly 2014-#52-5  /yearly 2014-##360
|-- P  /monthly 2014-12-27  /weekly 2014-#52-6  /yearly 2014-##361
|-- P  /monthly 2014-12-28  /weekly 2014-#52-7  /yearly 2014-##362
|-- P  /monthly 2014-12-29  /weekly 2015-#1-1  /yearly 2014-##363

|-- P  /monthly 2014-12-30  /weekly 2015-#1-2  /yearly 2014-##364
|-- P  /monthly 2014-12-31  /weekly 2015-#1-3  /yearly 2014-##365
|-- P  /monthly 2015-01-01  /weekly 2015-#1-4  /yearly 2015-##1
|-- P  /monthly 2015-01-02  /weekly 2015-#1-5  /yearly 2015-##2
|-- P  /monthly 2015-01-03  /weekly 2015-#1-6  /yearly 2015-##3

|-- P  /monthly 2015-01-04  /weekly 2015-#1-7  /yearly 2015-##4
|-- P  /monthly 2015-01-05  /weekly 2015-#2-1  /yearly 2015-##5
|-- P  /monthly 2015-01-06  /weekly 2015-#2-2  /yearly 2015-##6
|-- P  /monthly 2015-01-07  /weekly 2015-#2-3  /yearly 2015-##7
|-- P  /monthly 2015-01-08  /weekly 2015-#2-4  /yearly 2015-##8
*** 25

|-- P  /monthly 2015-01-09  /weekly 2015-#2-5  /yearly 2015-##9
|-- P  /monthly 2015-01-10  /weekly 2015-#2-6  /yearly 2015-##10
|-- P  /monthly 2015-01-11  /weekly 2015-#2-7  /yearly 2015-##11
|-- P  /monthly 2015-01-12  /weekly 2015-#3-1  /yearly 2015-##12
|-- P  /monthly 2015-01-13  /weekly 2015-#3-2  /yearly 2015-##13

|-- P  /monthly 2015-01-14  /weekly 2015-#3-3  /yearly 2015-##14
|-- P  /monthly 2015-01-15  /weekly 2015-#3-4  /yearly 2015-##15

*** 32 judges

**
**  SUMMARY
**      32 judges on P
**      32 judges in total
**
```



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

|== POS : xy | add /z ( /y - /x )  --forward /x /y
|== NEG : xy | add /z ( /x - /y )  --forward /x /y
```

Command `koshu diff.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    diff.k
**
**  OUTPUT
**    <stdout>
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

|-- P  /time 2014-07                     ** YEAR-MONTH
|-- P  /time 2014-07-20                  ** YEAR-MONTH-DAY
|-- P  /time 2014-07-20 12               ** YEAR-MONTH-DAY HH
|-- P  /time 2014-07-20 12:45            ** YEAR-MONTH-DAY HH:MM
|-- P  /time 2014-07-20 12:45:30         ** YEAR-MONTH-DAY HH:MM:DD
|-- P  /time 2014-07-20 12:45 +09:00     ** YEAR-MONTH-DAY HH:MM ZONE
|-- P  /time 2014-07-20 03:45:30 +00:00  ** YEAR-MONTH-DAY HH:MM:DD ZONE

|-- P  /time 2014-#30                    ** YEAR-#WEEK
|-- P  /time 2014-#30-1                  ** YEAR-#WEEK-DAY
|-- P  /time 2014-#30-1 12:45            ** YEAR-#WEEK-DAY HH:MM

|-- P  /time 2014-##203                  ** YEAR-##DAY
|-- P  /time 2014-##203 12:45            ** YEAR-##DAY HH:MM

|== Q
  : source P /time
  | add /type ( type /time )
  --table --forward /time
```

Command `koshu notation.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    notation.k
**
**  OUTPUT
**    <stdout>
**

|-- Q  /time 2014-07  /type [- time month -]
|-- Q  /time 2014-07-20  /type [- time day -]
|-- Q  /time 2014-07-20 12  /type [- time hour -]
|-- Q  /time 2014-07-20 12:45  /type [- time min -]
|-- Q  /time 2014-07-20 12:45:30  /type [- time sec -]

|-- Q  /time 2014-07-20 12:45 +09:00  /type [- time min zone -]
|-- Q  /time 2014-07-20 03:45:30 UTC  /type [- time sec zone -]
|-- Q  /time 2014-#30  /type [- time week -]
|-- Q  /time 2014-#30-1  /type [- time day -]
|-- Q  /time 2014-#30-1 12:45  /type [- time min -]

|-- Q  /time 2014-##203  /type [- time day -]
|-- Q  /time 2014-##203 12:45  /type [- time min -]

*** 12 judges

=== note

TABLE : Q

  /time                     /type
  ------------------------- ---------------------
  2014-07                   [- time month -]
  2014-07-20                [- time day -]
  2014-07-20 12             [- time hour -]
  2014-07-20 12:45          [- time min -]
  2014-07-20 12:45:30       [- time sec -]
  2014-07-20 12:45 +09:00   [- time min zone -]
  2014-07-20 03:45:30 UTC   [- time sec zone -]
  2014-#30                  [- time week -]
  2014-#30-1                [- time day -]
  2014-#30-1 12:45          [- time min -]
  2014-##203                [- time day -]
  2014-##203 12:45          [- time min -]

=== rel

**
**  SUMMARY
**      12 judges on Q
**      12 judges in total
**
```



## command

This document is produced by the command:

```
koshu-inout.sh -r -g koshu
```
