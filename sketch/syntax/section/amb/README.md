# I/O List

- koshu [amb-inside.k](#amb-insidek)
- koshu [amb-outside.k](#amb-outsidek)
- koshu [unused-inside.k](#unused-insidek)
- koshu [unused-outside.k](#unused-outsidek)



## [amb-inside.k](amb-inside.k)

```
** -*- koshu -*-
**
**  参照した関係写像演算子が、自区に複数定義されているときは、
**  あいまいになるため、処理が中断されます。
**

|-- P  /x 0  /y 2
|-- P  /x 1  /y 3

|== P : p

p = source P /x
p = source P /x /y
```

Command `koshu amb-inside.k` exits with 2 and produces:

```
**
**  ABORTED  Ambiguous relmaps
**  -------- ----------------- ---------
**  Detail   p (2)
**  Source   10 8 amb-inside.k
**           > p               .. lexmap
**           10 0 amb-inside.k
**           > |== P : p       .. assert
**  Command  koshu
**           amb-inside.k
**
**  Exit with status 2
**
```



## [amb-outside.k](amb-outside.k)

```
** -*- koshu -*-
**
**  参照した関係写像演算子が、自区になく、
**  他区に複数定義されているときは、
**  あいまいになるため、処理が中断されます。
**

|-- P  /x 0  /y 2
|-- P  /x 1  /y 3

|== P : p

===

p = source P /x

===

p = source P /y

===

p = source P /x /y
```

Command `koshu amb-outside.k` exits with 2 and produces:

```
**
**  ABORTED  Ambiguous relmaps
**  -------- ------------------ ---------
**  Detail   p (3)
**  Source   11 8 amb-outside.k
**           > p                .. lexmap
**           11 0 amb-outside.k
**           > |== P : p        .. assert
**  Command  koshu
**           amb-outside.k
**
**  Exit with status 2
**
```



## [unused-inside.k](unused-inside.k)

```
** -*- koshu -*-
**
**  どこからも参照されない関係写像演算子が定義されていても、
**  問題ありません。ただし、この仕様は変更されるかもしれません。
**

|== P : p

p = source P /x /y
q = source Q /y
q = source Q /z

|-- P  /x 0  /y 2
|-- P  /x 1  /y 3
```

Command `koshu unused-inside.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    unused-inside.k
**
**  OUTPUT
**    <stdout>
**

|-- P  /x 0  /y 2
|-- P  /x 1  /y 3

*** 2 judges

**
**  SUMMARY
**       2 judges on P
**       2 judges in total
**
```



## [unused-outside.k](unused-outside.k)

```
** -*- koshu -*-
**
**  どこからも参照されない関係写像演算子が定義されていても、
**  問題ありません。ただし、この仕様は変更されるかもしれません。
**

|== P : p

p = source P /x /y

===

|-- P  /x 0  /y 2
|-- P  /x 1  /y 3

p = source P /x
p = source P /y
```

Command `koshu unused-outside.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    unused-outside.k
**
**  OUTPUT
**    <stdout>
**

|-- P  /x 0  /y 2
|-- P  /x 1  /y 3

*** 2 judges

**
**  SUMMARY
**       2 judges on P
**       2 judges in total
**
```



## command

This document is produced by the command:

```
koshu-inout.sh -r -g koshu
```
