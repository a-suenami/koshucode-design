# I/O List

- koshu [fill.k](#fillk)



## [fill.k](fill.k)

```
** -*- koshu -*-
**
**  概要
**    fill は指定された項目の内容が () のときに、-with の内容で置き換えます。
**

|-- P  /a 1  /b 10  /c 50
|-- P  /a 1  /b 10
|-- P  /a 1         /c 50
|-- P  /a 1
|-- P        /b 10
|-- P               /c 50
|-- P

|== Q : source P /a /b /c | fill /b /c -with 0
  --table --forward /a /b /c
```

Command `koshu fill.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    fill.k
**
**  OUTPUT
**    <stdout>
**

|-- Q  /a 1  /b 10  /c 50
|-- Q  /a 1  /b 10  /c 0
|-- Q  /a 1  /b 0  /c 50
|-- Q  /a 1  /b 0  /c 0
|-- Q  /b 10  /c 0

|-- Q  /b 0  /c 50
|-- Q  /b 0  /c 0

*** 7 judges

=== note

TABLE : Q

  /a   /b   /c
  ---- ---- ----
  1    10   50
  1    10   0
  1    0    50
  1    0    0
  ()   10   0
  ()   0    50
  ()   0    0

=== rel

**
**  SUMMARY
**       7 judges on Q
**       7 judges in total
**
```



## command

This document is produced by the command:

```
koshu-inout.sh -r -g koshu
```
