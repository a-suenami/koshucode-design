# I/O List

- koshu [rename-e1.k](#rename-e1k)



## [rename-e1.k](rename-e1.k)

```
** -*- koshu -*-
**
**  /a を /x に、/b を /y に
**

|-- P  /a 1  /b 40
|-- P  /a 1  /b 50
|-- P  /a 2  /b 60

|== Q : source P /a /b
      | rename /x /a
               /y /b

```

Command `koshu rename-e1.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    rename-e1.k
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



## command

This document is produced by the command:

```
koshu-inout.sh -r -g koshu
```
