# I/O List

- koshu [derive.k](#derivek)



## [derive.k](derive.k)

```
** -*- koshu -*-
**
**  概要
**    導出関係写像の使用例
**
**  使用法
**    koshu derive.k
**

|--  P  /a 1  /b 30
|--  P  /a 1  /b 40
|--  P  /a 2  /b 50

**
**  導出写像なし
**

|== Q : source P /a /b | add /c ( /a + /b )

**
**  スロットなし
**

|== R : p | a

p : source P /a /b
a : add /c ( /a + /b )

**
**  名前スロット
**

|== S : p | b -n 100
|== T : p | b -n 100 + 100

b : add /c ( /a + /b + @n )

**
**  位置スロット
**

|== U : p | c 100
|== V : p | c ( 100 + 100 )

c : add /c ( /a + /b + @'1 )
```

Command `koshu derive.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    derive.k
**

|-- Q  /c 31  /a 1  /b 30
|-- Q  /c 41  /a 1  /b 40
|-- Q  /c 52  /a 2  /b 50

*** 3 judges

|-- R  /c 31  /a 1  /b 30
|-- R  /c 41  /a 1  /b 40
|-- R  /c 52  /a 2  /b 50

*** 3 judges

|-- S  /c 131  /a 1  /b 30
|-- S  /c 141  /a 1  /b 40
|-- S  /c 152  /a 2  /b 50

*** 3 judges

|-- T  /c 231  /a 1  /b 30
|-- T  /c 241  /a 1  /b 40
|-- T  /c 252  /a 2  /b 50

*** 3 judges

|-- U  /c 131  /a 1  /b 30
|-- U  /c 141  /a 1  /b 40
|-- U  /c 152  /a 2  /b 50

*** 3 judges

|-- V  /c 231  /a 1  /b 30
|-- V  /c 241  /a 1  /b 40
|-- V  /c 252  /a 2  /b 50

*** 3 judges

**
**  SUMMARY
**       3 judges on Q
**       3 judges on R
**       3 judges on S
**       3 judges on T
**       3 judges on U
**       3 judges on V
**      18 judges in total
**
```



## command

This document is produced by the command:

```
koshu-inout.sh -s -g koshu
```
