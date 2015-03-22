# I/O List

- koshu [backward.k](#backwardk)
- koshu [empty.k](#emptyk)
- koshu [forward.k](#forwardk)
- koshu [order.k](#orderk)
- koshu [table.k](#tablek)



## [backward.k](backward.k)

```
** -*- koshu -*-
**
**  表明に --backward を指定すると、印字される項目の順番を変更できます。
**  --backward /y /x ならば、/y が先頭、/x が 2 番目になります。
**  一般的には、指定された項目を、その順番で、先頭に移動させます。
**

|-- P  /x 0  /y 10  /z 50
|-- P  /x 1  /y 20  /z 50

|== P1 : source P /x /y /z
|== P2 : source P /x /y /z  --backward /y /x
|== P3 : source P /z /x /y  --backward /y
```

Command `koshu backward.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    backward.k
**

|-- P1  /x 0  /y 10  /z 50
|-- P1  /x 1  /y 20  /z 50

*** 2 judges

|-- P2  /z 50  /y 10  /x 0
|-- P2  /z 50  /y 20  /x 1

*** 2 judges

|-- P3  /z 50  /x 0  /y 10
|-- P3  /z 50  /x 1  /y 20

*** 2 judges

**
**  SUMMARY
**       2 judges on P1
**       2 judges on P2
**       2 judges on P3
**       6 judges in total
**
```



## [empty.k](empty.k)

```
** -*- koshu -*-
**
**  表明に --empty を指定すると、/y () のように空番を印字します。
**  指定しないと、項目 /y 自体が印字されません。
**

|-- P  /x 0  /y 10
|-- P  /x 1
|-- P  /x 2  /y ()

|== P1 : source P /x /y 
|== P2 : source P /x /y  --empty
```

Command `koshu empty.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    empty.k
**

|-- P1  /x 0  /y 10
|-- P1  /x 1
|-- P1  /x 2

*** 3 judges

|-- P2  /x 0  /y 10
|-- P2  /x 1  /y ()
|-- P2  /x 2  /y ()

*** 3 judges

**
**  SUMMARY
**       3 judges on P1
**       3 judges on P2
**       6 judges in total
**
```



## [forward.k](forward.k)

```
** -*- koshu -*-
**
**  表明に --forward を指定すると、印字される項目の順番を変更できます。
**  --forward /y /x ならば、/y が先頭、/x が 2 番目になります。
**  一般的には、指定された項目を、その順番で、先頭に移動させます。
**

|-- P  /x 0  /y 10  /z 50
|-- P  /x 1  /y 20  /z 50

|== P1 : source P /x /y /z
|== P2 : source P /x /y /z  --forward /y /x
|== P3 : source P /z /x /y  --forward /y
```

Command `koshu forward.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    forward.k
**

|-- P1  /x 0  /y 10  /z 50
|-- P1  /x 1  /y 20  /z 50

*** 2 judges

|-- P2  /y 10  /x 0  /z 50
|-- P2  /y 20  /x 1  /z 50

*** 2 judges

|-- P3  /y 10  /z 50  /x 0
|-- P3  /y 20  /z 50  /x 1

*** 2 judges

**
**  SUMMARY
**       2 judges on P1
**       2 judges on P2
**       2 judges on P3
**       6 judges in total
**
```



## [order.k](order.k)

```
** -*- koshu -*-
**
**  表明に --order を指定すると、項目内容を昇順に並べ替えて印字します。
**  --forward が同時に指定されていれば、項目を移動後に並べ替えます。
**

|-- P  /x 0  /y 10
|-- P  /x 1  /y 20
|-- P  /x 1  /y 10
|-- P  /x 0  /y 20

|== P1 : source P /x /y
|== P2 : source P /x /y  --order
|== P3 : source P /x /y  --forward /y --order
```

Command `koshu order.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    order.k
**

|-- P1  /x 0  /y 10
|-- P1  /x 1  /y 20
|-- P1  /x 1  /y 10
|-- P1  /x 0  /y 20

*** 4 judges

|-- P2  /x 0  /y 10
|-- P2  /x 0  /y 20
|-- P2  /x 1  /y 10
|-- P2  /x 1  /y 20

*** 4 judges

|-- P3  /y 10  /x 0
|-- P3  /y 10  /x 1
|-- P3  /y 20  /x 0
|-- P3  /y 20  /x 1

*** 4 judges

**
**  SUMMARY
**       4 judges on P1
**       4 judges on P2
**       4 judges on P3
**      12 judges in total
**
```



## [table.k](table.k)

```
** -*- koshu -*-
**
**  表明に --table を指定すると、判断形式に加えて、表形式でも印字します。
**

|-- P  /x 0  /y 10  /z 50
|-- P  /x 1  /y 20  /z 50
|-- P  /x 2  /y 20  /z 60

|== P1 : source P /x /y /z  --table
```

Command `koshu table.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    table.k
**

|-- P1  /x 0  /y 10  /z 50
|-- P1  /x 1  /y 20  /z 50
|-- P1  /x 2  /y 20  /z 60

*** 3 judges

**  TABLE : P1
**
**    /x  /y   /z
**    --- ---- ----
**    0   10   50
**    1   20   50
**    2   20   60

**
**  SUMMARY
**       3 judges on P1
**       3 judges in total
**
```



## command

This document is produced by the command:

```
koshu-inout.sh -r -g koshu
```
