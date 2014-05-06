# I/O List

- koshu [source-e1.k](#source-e1k)
- koshu [source-e2.k](#source-e2k)
- koshu [source-e3.k](#source-e3k)
- koshu [source-e4.k](#source-e4k)



## [source-e1.k](source-e1.k)

```
** -*- koshu -*-
**
**  判断種と項目リスト
**

|-- P  /x 1  /y 40
|-- P  /x 1  /y 50
|-- P  /x 2  /y 60

|== Q : source P /x /y
```

Command `koshu source-e1.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    source-e1.k
**

|-- Q  /x 1  /y 40
|-- Q  /x 1  /y 50
|-- Q  /x 2  /y 60

*** 3 judges

**
**  SUMMARY
**       3 judges on Q
**       3 judges in total
**
```



## [source-e2.k](source-e2.k)

```
** -*- koshu -*-
**
**  整っていない判断
**

|-- P  /x 1  /y 40
|-- P  /x 1  /y 50  /z 100
|-- P  /x 2

|== Q : source P /x /y
```

Command `koshu source-e2.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    source-e2.k
**

|-- Q  /x 1  /y 40
|-- Q  /x 1  /y 50
|-- Q  /x 2  /y ()

*** 3 judges

**
**  SUMMARY
**       3 judges on Q
**       3 judges in total
**
```



## [source-e3.k](source-e3.k)

```
** -*- koshu -*-
**
**  一部の項目
**

|-- P  /x 1  /y 40
|-- P  /x 1  /y 50
|-- P  /x 2  /y 60

|== Q : source P /x
```

Command `koshu source-e3.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    source-e3.k
**

|-- Q  /x 1
|-- Q  /x 2

*** 2 judges

**
**  SUMMARY
**       2 judges on Q
**       2 judges in total
**
```



## [source-e4.k](source-e4.k)

```
** -*- koshu -*-
**
**  項目なし
**

|-- P  /x 1  /y 40
|-- P  /x 1  /y 50
|-- P  /x 2  /y 60

|== Q : source P
|== R : source P2
```

Command `koshu source-e4.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    source-e4.k
**

|-- Q

*** 1 judge 

*** no judges

**
**  SUMMARY
**       1 judge  on Q
**       1 judge  in total
**
```



## command

This document is produced by the command:

```
koshu-inout.sh -r -g koshu
```
