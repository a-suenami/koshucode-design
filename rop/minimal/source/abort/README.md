# I/O List

- koshu [source-a1.k](#source-a1k)
- koshu [source-a2.k](#source-a2k)
- koshu [source-a3.k](#source-a3k)
- koshu [source-a4.k](#source-a4k)



## [source-a1.k](source-a1.k)

```
** -*- koshu -*-
**
**  判断種がない
**

|== Q : source /x /y
```

Command `koshu source-a1.k` exits with 2 and produces:

```
** -*- koshu -*-
**
**  INPUT
**    source-a1.k
**

**
**  ABORTED  Unexpected attribute
**  -------- ---------------------- ---------
**  Detail   Require one word
**  Source   6 15 source-a1.k
**           > /x /y                .. attr
**           6 8 source-a1.k
**           > source /x /y         .. relmap
**           6 0 source-a1.k
**           > |== Q : source /x /y .. assert
**  Command  koshu
**           source-a1.k
**
**  Exit with status 2
**
```



## [source-a2.k](source-a2.k)

```
** -*- koshu -*-
**
**  判断種がふたつ
**

|== Q : source P P /x /y
```

Command `koshu source-a2.k` exits with 2 and produces:

```
** -*- koshu -*-
**
**  INPUT
**    source-a2.k
**

**
**  ABORTED  Require term name
**  -------- -------------------------- ---------
**  Source   6 17 source-a2.k
**           > P /x /y                  .. attr
**           6 8 source-a2.k
**           > source P P /x /y         .. relmap
**           6 0 source-a2.k
**           > |== Q : source P P /x /y .. assert
**  Command  koshu
**           source-a2.k
**
**  Exit with status 2
**
```



## [source-a3.k](source-a3.k)

```
** -*- koshu -*-
**
**  階層項目
**

|== Q : source P /x /y/z
```

Command `koshu source-a3.k` exits with 2 and produces:

```
** -*- koshu -*-
**
**  INPUT
**    source-a3.k
**

**
**  ABORTED  Require term name
**  -------- -------------------------- ---------
**  Source   6 17 source-a3.k
**           > /x /y/z                  .. attr
**           6 8 source-a3.k
**           > source P /x /y/z         .. relmap
**           6 0 source-a3.k
**           > |== Q : source P /x /y/z .. assert
**  Command  koshu
**           source-a3.k
**
**  Exit with status 2
**
```



## [source-a4.k](source-a4.k)

```
** -*- koshu -*-
**
**  項目名以外の要素
**

|== Q : source P /x 0 /y 1
```

Command `koshu source-a4.k` exits with 2 and produces:

```
** -*- koshu -*-
**
**  INPUT
**    source-a4.k
**

**
**  ABORTED  Require term name
**  -------- ---------------------------- ---------
**  Source   6 17 source-a4.k
**           > /x 0 /y 1                  .. attr
**           6 8 source-a4.k
**           > source P /x 0 /y 1         .. relmap
**           6 0 source-a4.k
**           > |== Q : source P /x 0 /y 1 .. assert
**  Command  koshu
**           source-a4.k
**
**  Exit with status 2
**
```



## command

This document is produced by the command:

```
koshu-inout.sh -r -g koshu
```
