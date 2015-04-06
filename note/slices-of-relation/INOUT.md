# I/O List

- koshu [slice.k](#slicek)



## [slice.k](slice.k)

```
** -*- koshu -*-
**
**  概要
**    slice を使って、group を実装する。
**
**  使用例
**    koshu slice.k
**

|-- P  /a 10  /b 40
|-- P  /a 10  /b 50

|-- Q  /b 40  /c 70
|-- Q  /b 40  /c 80
|-- Q  /b 50  /c 90

p : source P /a /b
q : source Q /b /c

|== GROUP : p | group /g q
  --forward /a /b

|== GROUP2 : p | slice /r ( meet q | pick-term q )
  --forward /a /b

|== SLICE : p | slice /r id
  --forward /a /b
```

Command `koshu slice.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    slice.k
**
**  OUTPUT
**    <stdout>
**

|-- GROUP  /a 10  /b 40  /g {| /b : /c | 40 : 80 | 40 : 70 |}
|-- GROUP  /a 10  /b 50  /g {| /b : /c | 50 : 90 |}

*** 2 judges

|-- GROUP2  /a 10  /b 40  /r {| /b : /c | 40 : 80 | 40 : 70 |}
|-- GROUP2  /a 10  /b 50  /r {| /b : /c | 50 : 90 |}

*** 2 judges

|-- SLICE  /a 10  /b 40  /r {| /a : /b | 10 : 40 |}
|-- SLICE  /a 10  /b 50  /r {| /a : /b | 10 : 50 |}

*** 2 judges

**
**  SUMMARY
**       2 judges on GROUP
**       2 judges on GROUP2
**       2 judges on SLICE
**       6 judges in total
**
```



## command

This document is produced by the command:

```
koshu-inout.sh -s -g koshu
```
