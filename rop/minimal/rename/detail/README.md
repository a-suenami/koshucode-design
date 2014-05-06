# I/O List

- koshu [rename-d1.k](#rename-d1k)
- koshu [rename-d2.k](#rename-d2k)



## [rename-d1.k](rename-d1.k)

```
** -*- koshu -*-
**
**  -term を指定
**

|-- P  /a 1  /b 40
|-- P  /a 1  /b 50
|-- P  /a 2  /b 60

|== Q : source P /a /b
      | rename -term /x /a
                     /y /b

```

Command `koshu rename-d1.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    rename-d1.k
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



## [rename-d2.k](rename-d2.k)

```
** -*- koshu -*-
**
**  項目名なし
**

|-- P  /a 1  /b 40
|-- P  /a 1  /b 50
|-- P  /a 2  /b 60

|== Q : source P /a /b
      | rename
```

Command `koshu rename-d2.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    rename-d2.k
**

|-- Q  /a 1  /b 40
|-- Q  /a 1  /b 50
|-- Q  /a 2  /b 60

*** 3 judges

**
**  SUMMARY
**       3 judges on Q
**       3 judges in total
**
```



## command

This document is produced by the command:

```
koshu-inout.sh -r -g koshu
```
