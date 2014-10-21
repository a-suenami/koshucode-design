# I/O List

- koshu [working-term.k](#working-termk)



## [working-term.k](working-term.k)

```
** -*- koshu -*-
**
**  DESCRIPTION
**    Names of working terms are beginning with equal sign,
**    e.g., /=g or simply /=. Koshu calculator rename working
**    terms by adding its resource number.
**

|-- P  /x 1  /y 10
|-- P  /x 1  /y 20
|-- P  /x 2  /y 30

p : source P /x /y

|== Q -fore /x /y
    : p | add /=z ( /x + /y )

|== R -fore /x : r

r : p | nest /y -to /=
      | add /ys ( /=/y )

|== S -fore /x : r | wipe
```

Command `koshu working-term.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    working-term.k
**

|-- Q  /x 1  /y 10  /1=z 11
|-- Q  /x 1  /y 20  /1=z 21
|-- Q  /x 2  /y 30  /1=z 32

*** 3 judges

|-- R  /x 1  /ys [ 20 : 10 ]  /1= {| /y | 20 | 10 |}
|-- R  /x 2  /ys [ 30 ]  /1= {| /y | 30 |}

*** 2 judges

|-- S  /x 1  /ys [ 20 : 10 ]
|-- S  /x 2  /ys [ 30 ]

*** 2 judges

**
**  SUMMARY
**       3 judges on Q
**       2 judges on R
**       2 judges on S
**       7 judges in total
**
```



## command

This document is produced by the command:

```
koshu-inout.sh -r -g koshu
```
