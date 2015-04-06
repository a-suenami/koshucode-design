# I/O List

- koshu [join-up.k](#join-upk)



## [join-up.k](join-up.k)

```
** -*- koshu -*-
**
**  概要
**    join-up /P ... は重関係 /P ... の結びをつくり、
**    その結びを出力関係とします。
**

|-- P  /a 1  /b 10
|-- P  /a 1  /b 12
|-- P  /a 2  /b 14

|-- Q  /b 10  /c 40
|-- Q  /b 10  /c 45
|-- Q  /b 12  /c 50

|-- R  /a 1  /c 50
|-- R  /a 1  /c 55

p : source P /a /b
q : source Q /b /c
r : source R /a /c

s : p | group /g q
      | group /h r

|== S : s  --table --forward /a /b /g /h

|== T : s | join-up
|== U : s | join-up /g
|== V : s | join-up /g /h
```

Command `koshu join-up.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    join-up.k
**
**  OUTPUT
**    <stdout>
**

|-- S  /a 1  /b 10  /g {| /b : /c | 10 : 45 | 10 : 40 |}  /h {| /a : /c | 1 : 55 | 1 : 50 |}
|-- S  /a 1  /b 12  /g {| /b : /c | 12 : 50 |}  /h {| /a : /c | 1 : 55 | 1 : 50 |}
|-- S  /a 2  /b 14  /g {| /b : /c |}  /h {| /a : /c |}

*** 3 judges

=== note

TABLE : S

  /a  /b   /g        /h
  --- ---- --------- --------
  1   10   /b   /c   /a  /c
           ---- ---- --- ----
           10   45   1   55
           10   40   1   50
                     
  1   12   /b   /c   /a  /c
           ---- ---- --- ----
           12   50   1   55
                     1   50
                     
  2   14   /b /c     /a /c
           -- --     -- --
                     

=== rel

*** no judges

|-- U  /b 10  /c 45
|-- U  /b 10  /c 40
|-- U  /b 12  /c 50

*** 3 judges

|-- V  /c 45
|-- V  /c 40
|-- V  /c 55
|-- V  /c 50

*** 4 judges

**
**  SUMMARY
**       3 judges on S
**       3 judges on U
**       4 judges on V
**      10 judges in total
**
```



## command

This document is produced by the command:

```
koshu-inout.sh -r -g koshu
```
