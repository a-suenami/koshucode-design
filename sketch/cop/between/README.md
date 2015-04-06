# I/O List

- koshu [between.k](#betweenk)



## [between.k](between.k)

```
** -*- koshu -*-
**
**  DESCRIPTION
**    Consider B and C with the following rewriting rules.
**
**    /n is F      ->  F /n
**    between L H  ->  (| x | x >= L and x <= H |)
**    all F G      ->  (| x | F x and G x |)
**    >= L         ->  (| x | x >= L |)
**    <= H         ->  (| x | x <= H |)
**

n : range /n -from 0 -to 10

|== A : n | keep /n >= 5 and /n <= 8
|== B : n | keep /n is between 5 8
|== C : n | keep /n is all ( >= 5 )( <= 8 )
```

Command `koshu between.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    between.k
**
**  OUTPUT
**    <stdout>
**

|-- A  /n 5
|-- A  /n 6
|-- A  /n 7
|-- A  /n 8

*** 4 judges

|-- B  /n 5
|-- B  /n 6
|-- B  /n 7
|-- B  /n 8

*** 4 judges

|-- C  /n 5
|-- C  /n 6
|-- C  /n 7
|-- C  /n 8

*** 4 judges

**
**  SUMMARY
**       4 judges on A
**       4 judges on B
**       4 judges on C
**      12 judges in total
**
```



## command

This document is produced by the command:

```
koshu-inout.sh -r -g koshu
```
