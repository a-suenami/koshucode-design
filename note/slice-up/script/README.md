# I/O List

- [DATA.k](#datak)
- koshu DATA.k [nest.k](#nestk)
- koshu DATA.k [slice.k](#slicek)
- koshu DATA.k [unnest.k](#unnestk)



## [DATA.k](DATA.k)

```
** -*- koshu -*-

p : source P /a /b /c

|-- P  /a 10  /b 40  /c 80
|-- P  /a 10  /b 50  /c 90
|-- P  /a 20  /b 60  /c 70
```



## [nest.k](nest.k)

```
** -*- koshu -*-

|== Q1 -table : p | nest /b /c -to /g
|== Q2 -table : p | my-nest /b /c -to /g

my-nest : copy r ( cut @'all | slice @to ( meet r | pick @'all ))
```

Command `koshu DATA.k nest.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    DATA.k
**    nest.k
**

|-- Q1  /g {| /b : /c | 50 : 90 | 40 : 80 |}  /a 10
|-- Q1  /g {| /b : /c | 60 : 70 |}  /a 20

*** 2 judges

**  TABLE : Q1
**
**    /g        /a
**    --------- ----
**    /b   /c   10
**    ---- ---- 
**    50   90   
**    40   80   
**              
**    /b   /c   20
**    ---- ---- 
**    60   70   
**              

|-- Q2  /g {| /b : /c | 50 : 90 | 40 : 80 |}  /a 10
|-- Q2  /g {| /b : /c | 60 : 70 |}  /a 20

*** 2 judges

**  TABLE : Q2
**
**    /g        /a
**    --------- ----
**    /b   /c   10
**    ---- ---- 
**    50   90   
**    40   80   
**              
**    /b   /c   20
**    ---- ---- 
**    60   70   
**              

**
**  SUMMARY
**       2 judges on Q1
**       2 judges on Q2
**       4 judges in total
**
```



## [slice.k](slice.k)

```
** -*- koshu -*-

s : p | slice /r

|== SLICE-1 -table : s
|== SLICE-2 : s | up /r
```

Command `koshu DATA.k slice.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    DATA.k
**    slice.k
**

|-- SLICE-1  /r {| /a : /b : /c | 10 : 40 : 80 |}  /a 10  /b 40  /c 80
|-- SLICE-1  /r {| /a : /b : /c | 10 : 50 : 90 |}  /a 10  /b 50  /c 90
|-- SLICE-1  /r {| /a : /b : /c | 20 : 60 : 70 |}  /a 20  /b 60  /c 70

*** 3 judges

**  TABLE : SLICE-1
**
**    /r             /a   /b   /c
**    -------------- ---- ---- ----
**    /a   /b   /c   10   40   80
**    ---- ---- ----           
**    10   40   80             
**                             
**    /a   /b   /c   10   50   90
**    ---- ---- ----           
**    10   50   90             
**                             
**    /a   /b   /c   20   60   70
**    ---- ---- ----           
**    20   60   70             
**                             

|-- SLICE-2  /a 10  /b 40  /c 80
|-- SLICE-2  /a 10  /b 50  /c 90
|-- SLICE-2  /a 20  /b 60  /c 70

*** 3 judges

**
**  SUMMARY
**       3 judges on SLICE-1
**       3 judges on SLICE-2
**       6 judges in total
**
```



## [unnest.k](unnest.k)

```
** -*- koshu -*-

n : p | nest /b /c -to /g

|== R0 -table : n
|== R1 : n | unnest /g
|== R2 : n | slice /r ( cut /g | meet ^/g ) | up /r
|== R3 : n | my-unnest /g

my-unnest : slice-up ( cut @'1 | meet ^/g )   ** ^@'1
```

Command `koshu DATA.k unnest.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    DATA.k
**    unnest.k
**

|-- R0  /g {| /b : /c | 50 : 90 | 40 : 80 |}  /a 10
|-- R0  /g {| /b : /c | 60 : 70 |}  /a 20

*** 2 judges

**  TABLE : R0
**
**    /g        /a
**    --------- ----
**    /b   /c   10
**    ---- ---- 
**    50   90   
**    40   80   
**              
**    /b   /c   20
**    ---- ---- 
**    60   70   
**              

|-- R1  /b 50  /c 90  /a 10
|-- R1  /b 40  /c 80  /a 10
|-- R1  /b 60  /c 70  /a 20

*** 3 judges

|-- R2  /b 50  /c 90  /a 10
|-- R2  /b 40  /c 80  /a 10
|-- R2  /b 60  /c 70  /a 20

*** 3 judges

|-- R3  /b 50  /c 90  /a 10
|-- R3  /b 40  /c 80  /a 10
|-- R3  /b 60  /c 70  /a 20

*** 3 judges

**
**  SUMMARY
**       2 judges on R0
**       3 judges on R1
**       3 judges on R2
**       3 judges on R3
**      11 judges in total
**
```



## command

This document is produced by the command:

```
koshu-inout.sh -r -g koshu DATA.k
```
