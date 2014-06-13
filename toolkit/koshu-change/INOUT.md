# I/O List

- koshu-change [B.k -t A.k](#bk--t-ak)
- koshu-change [B.k -u C.k](#bk--u-ck)



## B.k -t A.k

```
** -*- koshu -*- 

|-- P  /x 1  /y 20
|-- P  /x 1  /y 30           ** (-)
|-- P  /x 2  /y 40

|-- Q  /y 20  /z 90          ** (-)
|-- Q  /y 40  /z 100         ** (-)
```
```
** -*- koshu -*- 

|-- P  /x 1  /y 20
|-- P  /x 2  /y 40
|-- P  /x 2  /y 50           ** (+)

|-- R  /x 1  /y 20  /z 90    ** (+)
```

Command `koshu-change B.k -t A.k` produces:

```
**
**  DATASETS
**    There are changes C when altering dataset B into A.
**
**      B (base)    : B.k
**      A (altered) : A.k
**      C (change)  : A - B
**
**  UPDATE
**    Dataset A is obtained by updating B by C.
**    Please execute: koshu-change B -u C
**

|-X P  /x 1  /y 30
|-X Q  /y 20  /z 90
|-X Q  /y 40  /z 100
|-- P  /x 2  /y 50
|-- R  /x 1  /y 20  /z 90

*** 5 judges

**
**  SUMMARY
**       2 judges on P
**       2 judges on Q
**       1 judge  on R
**       5 judges in total
**
```



## B.k -u C.k

```
** -*- koshu -*- 

|-- P  /x 1  /y 20
|-- P  /x 1  /y 30           ** (-)
|-- P  /x 2  /y 40

|-- Q  /y 20  /z 90          ** (-)
|-- Q  /y 40  /z 100         ** (-)
```
```
**
**  DATASETS
**    There are changes C when altering dataset B into A.
**
**      B (base)    : B.k
**      A (altered) : A.k
**      C (change)  : A - B
**
**  UPDATE
**    Dataset A is obtained by updating B by C.
**    Please execute: koshu-change B -u C
**

|-X P  /x 1  /y 30
|-X Q  /y 20  /z 90
|-X Q  /y 40  /z 100
|-- P  /x 2  /y 50
|-- R  /x 1  /y 20  /z 90

*** 5 judges

**
**  SUMMARY
**       2 judges on P
**       2 judges on Q
**       1 judge  on R
**       5 judges in total
**
```

Command `koshu-change B.k -u C.k` produces:

```
**
**  DATASETS
**    Updating dataset B by C, altered dataset A is obtained.
**
**      B (base)    : B.k
**      C (change)  : C.k
**      A (altered) : B + C
**

|-- P  /x 1  /y 20
|-- P  /x 2  /y 40
|-- P  /x 2  /y 50
|-- R  /x 1  /y 20  /z 90

*** 4 judges

**
**  SUMMARY
**       3 judges on P
**       1 judge  on R
**       4 judges in total
**
```



## command

This document is produced by the command:

```
koshu-inout.sh -s -f COMMAND koshu-change
```
