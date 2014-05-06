# I/O List

- koshu [source-d1.k](#source-d1k)



## [source-d1.k](source-d1.k)

```
** -*- koshu -*-
**
**  オペランド名
**

|-- P  /x 1  /y 40
|-- P  /x 1  /y 50
|-- P  /x 2  /y 60

|== Q : source -pattern P -term /x /y

```

Command `koshu source-d1.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    source-d1.k
**

|-- Q  /x 1  /y 40
|-- Q  /x 1  /y 50
|-- Q  /x 2  /y 60

*** 3 judges

**
**  SUMMARY
**       3 judges on Q
**       3 judges in total
**
```



## command

This document is produced by the command:

```
koshu-inout.sh -r -g koshu
```
