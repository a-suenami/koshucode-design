# I/O List

- koshu [notation.k](#notationk)



## [notation.k](notation.k)

```
** -*- koshu -*-
**
**  DESCRIPTION
**    Clock is a measured time.
**    It indicates hours, minutes, seconds,
**    and days when more than 24 hours.
**    Clocks are in certain precision
**    as multiple of day, hour, minute, or second.
**

|-- P  /clock |0'00:00:10|   ** |DAY'HOUR:MIN:SEC|   10 seconds
|-- P  /clock |00:00:20|     ** |HOUR:MIN:SEC|       20 seconds
|-- P  /clock |00:30|        ** |HOUR:MIN|           30 minutes
|-- P  /clock |00:00|        ** |HOUR:MIN|           0 minutes
|-- P  /clock |04|           ** |HOUR|               4 hours
|-- P  /clock |5'|           ** |DAY'|               5 days
|-- P  /clock |5'12:00|      ** |DAY'HOUR:MIN|       5 days and 12 horus

|-- P  /clock |+01:15|       ** positive clock is same as sign-less clock
|-- P  /clock |-01:15|       ** negative clock

|== Q : source P /clock
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

|-- Q  /clock |00:00:10|
|-- Q  /clock |00:00:20|
|-- Q  /clock |00:30|
|-- Q  /clock |00:00|
|-- Q  /clock |04|

|-- Q  /clock |5'|
|-- Q  /clock |5'12:00|
|-- Q  /clock |01:15|
|-- Q  /clock |-01:15|

*** 9 judges

**
**  SUMMARY
**       9 judges on Q
**       9 judges in total
**
```



## command

This document is produced by the command:

```
koshu-inout.sh -r -g koshu
```
