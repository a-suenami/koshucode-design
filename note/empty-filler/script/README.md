# I/O List

- koshu [judge.k](#judgek)
- koshu [maybe.k](#maybek)



## [judge.k](judge.k)

```
** -*- koshu -*-

|-- A  /x 1  /y 10
|-- A  /x 1  /y 20
|-- A  /x 2

a : source A /x /y

|== B : a
|== C : a  --empty
```

Command `koshu judge.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    judge.k
**
**  OUTPUT
**    <stdout>
**

|-- B  /x 1  /y 10
|-- B  /x 1  /y 20
|-- B  /x 2

*** 3 judges

|-- C  /x 1  /y 10
|-- C  /x 1  /y 20
|-- C  /x 2  /y ()

*** 3 judges

**
**  SUMMARY
**       3 judges on B
**       3 judges on C
**       6 judges in total
**
```



## [maybe.k](maybe.k)

```
** -*- koshu -*-

|-- A  /x 1  /y 10
|-- A  /x 1  /y 20
|-- A  /x 2

|-- B  /y 20  /z 50
|-- B  /y 20  /z 60

a : source A /x /y
b : source B /y /z

|== C : a | meet b
|== D : a | maybe b
```

Command `koshu maybe.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    maybe.k
**
**  OUTPUT
**    <stdout>
**

|-- C  /z 60  /x 1  /y 20
|-- C  /z 50  /x 1  /y 20

*** 2 judges

|-- D  /x 1  /y 10
|-- D  /z 60  /x 1  /y 20
|-- D  /z 50  /x 1  /y 20
|-- D  /x 2

*** 4 judges

**
**  SUMMARY
**       2 judges on C
**       4 judges on D
**       6 judges in total
**
```



## command

This document is produced by the command:

```
koshu-inout.sh -r -g koshu
```
