# I/O List

- koshu [count.k](#countk)



## [count.k](count.k)

```
** -*- koshu -*-
**
**  DESCRIPTION
**    Show counting output judgements
**
**  USAGE
**    koshu count.k
**

a : range /a -from 1 -to 3
b : range /b -from 1 -to 5
c : range /c -from 1 -to 9

|== C-9   : a
|== C-15  : a | meet b
|== C-25  : b | rename /a /b | meet b
|== C-135 : a | meet b | meet c
|== C-0   : dum
|== C-1   : dee

```

Command `koshu count.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    count.k
**
**  OUTPUT
**    <stdout>
**

|-- C-9  /a 1
|-- C-9  /a 2
|-- C-9  /a 3

*** 3 judges

|-- C-15  /b 5  /a 1
|-- C-15  /b 4  /a 1
|-- C-15  /b 3  /a 1
|-- C-15  /b 2  /a 1
|-- C-15  /b 1  /a 1

|-- C-15  /b 5  /a 2
|-- C-15  /b 4  /a 2
|-- C-15  /b 3  /a 2
|-- C-15  /b 2  /a 2
|-- C-15  /b 1  /a 2

|-- C-15  /b 5  /a 3
|-- C-15  /b 4  /a 3
|-- C-15  /b 3  /a 3
|-- C-15  /b 2  /a 3
|-- C-15  /b 1  /a 3

*** 15 judges

|-- C-25  /b 5  /a 1
|-- C-25  /b 4  /a 1
|-- C-25  /b 3  /a 1
|-- C-25  /b 2  /a 1
|-- C-25  /b 1  /a 1

|-- C-25  /b 5  /a 2
|-- C-25  /b 4  /a 2
|-- C-25  /b 3  /a 2
|-- C-25  /b 2  /a 2
|-- C-25  /b 1  /a 2

|-- C-25  /b 5  /a 3
|-- C-25  /b 4  /a 3
|-- C-25  /b 3  /a 3
|-- C-25  /b 2  /a 3
|-- C-25  /b 1  /a 3

|-- C-25  /b 5  /a 4
|-- C-25  /b 4  /a 4
|-- C-25  /b 3  /a 4
|-- C-25  /b 2  /a 4
|-- C-25  /b 1  /a 4

|-- C-25  /b 5  /a 5
|-- C-25  /b 4  /a 5
|-- C-25  /b 3  /a 5
|-- C-25  /b 2  /a 5
|-- C-25  /b 1  /a 5

*** 25 judges

|-- C-135  /c 9  /b 5  /a 1
|-- C-135  /c 8  /b 5  /a 1
|-- C-135  /c 7  /b 5  /a 1
|-- C-135  /c 6  /b 5  /a 1
|-- C-135  /c 5  /b 5  /a 1

|-- C-135  /c 4  /b 5  /a 1
|-- C-135  /c 3  /b 5  /a 1
|-- C-135  /c 2  /b 5  /a 1
|-- C-135  /c 1  /b 5  /a 1
|-- C-135  /c 9  /b 4  /a 1

|-- C-135  /c 8  /b 4  /a 1
|-- C-135  /c 7  /b 4  /a 1
|-- C-135  /c 6  /b 4  /a 1
|-- C-135  /c 5  /b 4  /a 1
|-- C-135  /c 4  /b 4  /a 1

|-- C-135  /c 3  /b 4  /a 1
|-- C-135  /c 2  /b 4  /a 1
|-- C-135  /c 1  /b 4  /a 1
|-- C-135  /c 9  /b 3  /a 1
|-- C-135  /c 8  /b 3  /a 1

|-- C-135  /c 7  /b 3  /a 1
|-- C-135  /c 6  /b 3  /a 1
|-- C-135  /c 5  /b 3  /a 1
|-- C-135  /c 4  /b 3  /a 1
|-- C-135  /c 3  /b 3  /a 1
*** 25

|-- C-135  /c 2  /b 3  /a 1
|-- C-135  /c 1  /b 3  /a 1
|-- C-135  /c 9  /b 2  /a 1
|-- C-135  /c 8  /b 2  /a 1
|-- C-135  /c 7  /b 2  /a 1

|-- C-135  /c 6  /b 2  /a 1
|-- C-135  /c 5  /b 2  /a 1
|-- C-135  /c 4  /b 2  /a 1
|-- C-135  /c 3  /b 2  /a 1
|-- C-135  /c 2  /b 2  /a 1

|-- C-135  /c 1  /b 2  /a 1
|-- C-135  /c 9  /b 1  /a 1
|-- C-135  /c 8  /b 1  /a 1
|-- C-135  /c 7  /b 1  /a 1
|-- C-135  /c 6  /b 1  /a 1

|-- C-135  /c 5  /b 1  /a 1
|-- C-135  /c 4  /b 1  /a 1
|-- C-135  /c 3  /b 1  /a 1
|-- C-135  /c 2  /b 1  /a 1
|-- C-135  /c 1  /b 1  /a 1

|-- C-135  /c 9  /b 5  /a 2
|-- C-135  /c 8  /b 5  /a 2
|-- C-135  /c 7  /b 5  /a 2
|-- C-135  /c 6  /b 5  /a 2
|-- C-135  /c 5  /b 5  /a 2
*** 50

|-- C-135  /c 4  /b 5  /a 2
|-- C-135  /c 3  /b 5  /a 2
|-- C-135  /c 2  /b 5  /a 2
|-- C-135  /c 1  /b 5  /a 2
|-- C-135  /c 9  /b 4  /a 2

|-- C-135  /c 8  /b 4  /a 2
|-- C-135  /c 7  /b 4  /a 2
|-- C-135  /c 6  /b 4  /a 2
|-- C-135  /c 5  /b 4  /a 2
|-- C-135  /c 4  /b 4  /a 2

|-- C-135  /c 3  /b 4  /a 2
|-- C-135  /c 2  /b 4  /a 2
|-- C-135  /c 1  /b 4  /a 2
|-- C-135  /c 9  /b 3  /a 2
|-- C-135  /c 8  /b 3  /a 2

|-- C-135  /c 7  /b 3  /a 2
|-- C-135  /c 6  /b 3  /a 2
|-- C-135  /c 5  /b 3  /a 2
|-- C-135  /c 4  /b 3  /a 2
|-- C-135  /c 3  /b 3  /a 2

|-- C-135  /c 2  /b 3  /a 2
|-- C-135  /c 1  /b 3  /a 2
|-- C-135  /c 9  /b 2  /a 2
|-- C-135  /c 8  /b 2  /a 2
|-- C-135  /c 7  /b 2  /a 2
*** 75

|-- C-135  /c 6  /b 2  /a 2
|-- C-135  /c 5  /b 2  /a 2
|-- C-135  /c 4  /b 2  /a 2
|-- C-135  /c 3  /b 2  /a 2
|-- C-135  /c 2  /b 2  /a 2

|-- C-135  /c 1  /b 2  /a 2
|-- C-135  /c 9  /b 1  /a 2
|-- C-135  /c 8  /b 1  /a 2
|-- C-135  /c 7  /b 1  /a 2
|-- C-135  /c 6  /b 1  /a 2

|-- C-135  /c 5  /b 1  /a 2
|-- C-135  /c 4  /b 1  /a 2
|-- C-135  /c 3  /b 1  /a 2
|-- C-135  /c 2  /b 1  /a 2
|-- C-135  /c 1  /b 1  /a 2

|-- C-135  /c 9  /b 5  /a 3
|-- C-135  /c 8  /b 5  /a 3
|-- C-135  /c 7  /b 5  /a 3
|-- C-135  /c 6  /b 5  /a 3
|-- C-135  /c 5  /b 5  /a 3

|-- C-135  /c 4  /b 5  /a 3
|-- C-135  /c 3  /b 5  /a 3
|-- C-135  /c 2  /b 5  /a 3
|-- C-135  /c 1  /b 5  /a 3
|-- C-135  /c 9  /b 4  /a 3
*** 100

|-- C-135  /c 8  /b 4  /a 3
|-- C-135  /c 7  /b 4  /a 3
|-- C-135  /c 6  /b 4  /a 3
|-- C-135  /c 5  /b 4  /a 3
|-- C-135  /c 4  /b 4  /a 3

|-- C-135  /c 3  /b 4  /a 3
|-- C-135  /c 2  /b 4  /a 3
|-- C-135  /c 1  /b 4  /a 3
|-- C-135  /c 9  /b 3  /a 3
|-- C-135  /c 8  /b 3  /a 3

|-- C-135  /c 7  /b 3  /a 3
|-- C-135  /c 6  /b 3  /a 3
|-- C-135  /c 5  /b 3  /a 3
|-- C-135  /c 4  /b 3  /a 3
|-- C-135  /c 3  /b 3  /a 3

|-- C-135  /c 2  /b 3  /a 3
|-- C-135  /c 1  /b 3  /a 3
|-- C-135  /c 9  /b 2  /a 3
|-- C-135  /c 8  /b 2  /a 3
|-- C-135  /c 7  /b 2  /a 3

|-- C-135  /c 6  /b 2  /a 3
|-- C-135  /c 5  /b 2  /a 3
|-- C-135  /c 4  /b 2  /a 3
|-- C-135  /c 3  /b 2  /a 3
|-- C-135  /c 2  /b 2  /a 3
*** 125

|-- C-135  /c 1  /b 2  /a 3
|-- C-135  /c 9  /b 1  /a 3
|-- C-135  /c 8  /b 1  /a 3
|-- C-135  /c 7  /b 1  /a 3
|-- C-135  /c 6  /b 1  /a 3

|-- C-135  /c 5  /b 1  /a 3
|-- C-135  /c 4  /b 1  /a 3
|-- C-135  /c 3  /b 1  /a 3
|-- C-135  /c 2  /b 1  /a 3
|-- C-135  /c 1  /b 1  /a 3

*** 135 judges

*** no judges

|-- C-1

*** 1 judge 

**
**  SUMMARY
**       1 judge  on C-1
**     135 judges on C-135
**      15 judges on C-15
**      25 judges on C-25
**       3 judges on C-9
**     179 judges in total
**
```



## command

This document is produced by the command:

```
koshu-inout.sh -s -g koshu
```
