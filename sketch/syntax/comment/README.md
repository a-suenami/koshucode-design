# I/O List

- koshu [comment.k](#commentk)



## [comment.k](comment.k)

```
#!/usr/bin/env koshu
** -*- koshu -*-
**
**  DESCRIPTION
**    Comment examples
**
**    - Ignore line using '**' or '***'.
**    - Ignore entire clause using '****'.
**    - #! also begins line comment.
**
**  USAGE
**    koshu comment.k
**    ./comment.k
**

****  DATA

|-- P  /x 10
|-- P  /x 20
|-- P  /x 30

****|== P :
  source P /x

  **  Quadruple asterisk ignores entire clause

****  OUTPUT

|== Q : q
|== R : r

q : p | add /y ( /x * 2 )  ** Single asterisks are text tokens.
r : p | add /y ( /x + 2 )  ** Double asterisk begins line comment.
p : source P /x            *** Triple asterisk also begins line comment.

**
****
*******
```

Command `koshu comment.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    comment.k
**

|-- Q  /y 20  /x 10
|-- Q  /y 40  /x 20
|-- Q  /y 60  /x 30

*** 3 judges

|-- R  /y 12  /x 10
|-- R  /y 22  /x 20
|-- R  /y 32  /x 30

*** 3 judges

**
**  SUMMARY
**       3 judges on Q
**       3 judges on R
**       6 judges in total
**
```



## command

This document is produced by the command:

```
koshu-inout.sh -r -g koshu
```
