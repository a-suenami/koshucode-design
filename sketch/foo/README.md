# I/O List

- koshu [foo.k](#fook)



## [foo.k](foo.k)

```
** -*- koshu -*-
**
**  DESCRIPTION
**    An example of relational lattice
**
**  USAGE
**    koshu foo.k
**

**  INPUT

|-- FOO  /x 1  /y 10
|-- FOO  /x 1  /y 20
|-- FOO  /x 2  /y 20
|-- FOO  /x 2  /y 30

|-- BAR  /y 20  /z 110
|-- BAR  /y 20  /z 120
|-- BAR  /y 30  /z 130
|-- BAR  /y 40  /z 140

**  CALCULATION and OUTPUT

p : source FOO /x /y   ** Read FOO as a relation among /x and /y
q : source BAR /y /z   ** Read BAR as a relation among /y and /z

|== BAR : p | meet q   ** Same as natural join in SQL
|== QUX : p | join q   ** Same as union in SQL, but generalized
```

Command `koshu foo.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    foo.k
**

|-- BAR  /z 120  /x 1  /y 20
|-- BAR  /z 110  /x 1  /y 20
|-- BAR  /z 120  /x 2  /y 20
|-- BAR  /z 110  /x 2  /y 20
|-- BAR  /z 130  /x 2  /y 30

*** 5 judges

|-- QUX  /y 10
|-- QUX  /y 20
|-- QUX  /y 30
|-- QUX  /y 40

*** 4 judges

**
**  SUMMARY
**       5 judges on BAR
**       4 judges on QUX
**       9 judges in total
**
```



## command

This document is produced by the command:

```
koshu-inout.sh -r -g koshu
```
