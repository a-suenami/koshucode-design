# I/O List

- koshu [number.k](#numberk)



## [number.k](number.k)

```
** -*- koshu -*-

|-- P  /x 1  /y 50
|-- P  /x 1  /y 40
|-- P  /x 1  /y 30
|-- P  /x 2  /y 20
|-- P  /x 3  /y 10

p : source P /y /x

|== PN -fore /n /x /y : p | number /n -from 1
|== PX -fore /n /x /y : p | number /n -from 1 -order /x /y
|== PY -fore /n /x /y : p | number /n -from 1 -order /y
```

Command `koshu number.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    number.k
**

|-- PN  /n 1  /x 3  /y 10
|-- PN  /n 2  /x 2  /y 20
|-- PN  /n 3  /x 1  /y 30
|-- PN  /n 4  /x 1  /y 40
|-- PN  /n 5  /x 1  /y 50

*** 5 judges

|-- PX  /n 1  /x 1  /y 30
|-- PX  /n 2  /x 1  /y 40
|-- PX  /n 3  /x 1  /y 50
|-- PX  /n 4  /x 2  /y 20
|-- PX  /n 5  /x 3  /y 10

*** 5 judges

|-- PY  /n 1  /x 3  /y 10
|-- PY  /n 2  /x 2  /y 20
|-- PY  /n 3  /x 1  /y 30
|-- PY  /n 4  /x 1  /y 40
|-- PY  /n 5  /x 1  /y 50

*** 5 judges

**
**  SUMMARY
**       5 judges on PN
**       5 judges on PX
**       5 judges on PY
**      15 judges in total
**
```



## command

This document is produced by the command:

```
koshu-inout.sh -r -g koshu
```
