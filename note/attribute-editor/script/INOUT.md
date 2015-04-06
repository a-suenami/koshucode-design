# I/O List

- [DATA.k](#datak)
- koshu DATA.k [add.k](#addk)
- koshu DATA.k [fill.k](#fillk)
- koshu DATA.k [opt.k](#optk)
- koshu DATA.k [slot.k](#slotk)



## [DATA.k](DATA.k)

```
** -*- koshu -*-
**
**  概要
**    属性編集の使用例
**
**  実行方法
**    koshu DATA.k fill.k
**
**  属性編集
**    N : R --attr E   関係写像 R に名前 N をつけ E で属性を編集する
**    fill E ...       無標属性に E ... を補う
**    opt -N E         有標属性 -N がないとき E を補う
**    add -N E         有標属性 -N を、内容を E として追加
**

|-- P  /a 1  /b 20  /c 100
|-- P  /a 1  /b 30  /c 120
|-- P  /a 2  /b 30  /c 150

p : source P /a /b /c
```



## [add.k](add.k)

```
** -*- koshu -*-
**
**  有標属性の追加
**

op : keep /a = @a and /b = @b
  --attr add -a 1
       | add -b 30

|== OP-1 : p | op
```

Command `koshu DATA.k add.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    DATA.k
**    add.k
**
**  OUTPUT
**    <stdout>
**

|-- OP-1  /a 1  /b 30  /c 120

*** 1 judge 

**
**  SUMMARY
**       1 judge  on OP-1
**       1 judge  in total
**
```



## [fill.k](fill.k)

```
** -*- koshu -*-
**
**  省略可能な無標属性
**

pos : keep /a = @'1 and /b = @'2
  --attr fill 1 30

|== POS-1 : p | pos 1 20
|== POS-2 : p | pos 2
|== POS-3 : p | pos
```

Command `koshu DATA.k fill.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    DATA.k
**    fill.k
**
**  OUTPUT
**    <stdout>
**

|-- POS-1  /a 1  /b 20  /c 100

*** 1 judge 

|-- POS-2  /a 2  /b 30  /c 150

*** 1 judge 

|-- POS-3  /a 1  /b 30  /c 120

*** 1 judge 

**
**  SUMMARY
**       1 judge  on POS-1
**       1 judge  on POS-2
**       1 judge  on POS-3
**       3 judges in total
**
```



## [opt.k](opt.k)

```
** -*- koshu -*-
**
**  省略可能な有標属性
**

key : keep /a = @a and /b = @b
  --attr opt -a 1
       | opt -b 30

|== KEY-1 : p | key -a 1 -b 30
|== KEY-2 : p | key -a 1
|== KEY-3 : p | key
```

Command `koshu DATA.k opt.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    DATA.k
**    opt.k
**
**  OUTPUT
**    <stdout>
**

|-- KEY-1  /a 1  /b 30  /c 120

*** 1 judge 

|-- KEY-2  /a 1  /b 30  /c 120

*** 1 judge 

|-- KEY-3  /a 1  /b 30  /c 120

*** 1 judge 

**
**  SUMMARY
**       1 judge  on KEY-1
**       1 judge  on KEY-2
**       1 judge  on KEY-3
**       3 judges in total
**
```



## [slot.k](slot.k)

```
** -*- koshu -*-
**
**  無標属性の使用
**

ab : keep /a = @'1 and /b = @'2

|== AB-1 : p | keep /a = 1 and /b = 30
|== AB-2 : p | ab 1 30
```

Command `koshu DATA.k slot.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    DATA.k
**    slot.k
**
**  OUTPUT
**    <stdout>
**

|-- AB-1  /a 1  /b 30  /c 120

*** 1 judge 

|-- AB-2  /a 1  /b 30  /c 120

*** 1 judge 

**
**  SUMMARY
**       1 judge  on AB-1
**       1 judge  on AB-2
**       2 judges in total
**
```



## command

This document is produced by the command:

```
koshu-inout.sh -s -g koshu DATA.k
```
