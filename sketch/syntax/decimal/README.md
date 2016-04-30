# I/O List

- koshu [decimal.k](#decimalk)



## [decimal.k](decimal.k)

```
** -*- koshu -*-

**  Positive
|-- P  /n 0
|-- P  /n 1
|-- P  /n 2

**  Negative
|-- N  /n -0
|-- N  /n -1
|-- N  /n -2

**  Large
|-- L  /n 123456
|-- L  /n 1234567
|-- L  /n 12345678
|-- L  /n 123 456 789
|-- L  /n 1 2 3 4 5 6 7 8 9 0

**  Decimal
|-- D  /n 0.0
|-- D  /n 123.45
|-- D  /n 12 345.6
|-- D  /n 12 345.600

**  Calculated
|-- C  /n 3 + 4
|-- C  /n 5 * ( 2 + 3 )

|== P : source P /n
|== N : source N /n
|== L : source L /n
|== D : source D /n
|== C : source C /n
```

Command `koshu decimal.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    decimal.k
**
**  OUTPUT
**    <stdout>
**

|-- P  /n 0
|-- P  /n 1
|-- P  /n 2

*** 3 judges

|-- N  /n 0
|-- N  /n -1
|-- N  /n -2

*** 3 judges

|-- L  /n 123 456
|-- L  /n 1 234 567
|-- L  /n 12 345 678
|-- L  /n 123 456 789
|-- L  /n 1 234 567 890

*** 5 judges

|-- D  /n 0.0
|-- D  /n 123.45
|-- D  /n 12 345.6

*** 3 judges

|-- C  /n 7
|-- C  /n 25

*** 2 judges

**
**  SUMMARY
**       2 judges on C
**       3 judges on D
**       5 judges on L
**       3 judges on N
**       3 judges on P
**      16 judges in total
**
```



## command

This document is produced by the command:

```
koshu-inout.sh -r -g koshu
```
