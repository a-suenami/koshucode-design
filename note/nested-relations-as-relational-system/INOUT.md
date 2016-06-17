# I/O List

- [DATA.k](#datak)
- koshu DATA.k [flat.k](#flatk)
- koshu DATA.k [nested.k](#nestedk)



## [DATA.k](DATA.k)

```
** -*- koshu -*-

|-- P  /a 10  /b 40
|-- P  /a 10  /b 50
|-- P  /a 20  /b 60

|-- Q  /b 40  /c 80
|-- Q  /b 40  /c 90
|-- Q  /b 50  /c 80
|-- Q  /b 60  /c 90

p : source P /a /b
q : source Q /b /c
```



## [flat.k](flat.k)

```
** -*- koshu -*-

|== R : r

r : p | meet q
      | add /d ( /a + /c )
      | cut /b
```

Command `koshu DATA.k flat.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    DATA.k
**    flat.k
**
**  OUTPUT
**    <stdout>
**

|-- R  /d 100  /c 90  /a 10
|-- R  /d 90  /c 80  /a 10
|-- R  /d 110  /c 90  /a 20

*** 3 judges

**
**  SUMMARY
**       3 judges on R
**       3 judges in total
**
```



## [nested.k](nested.k)

```
** -*- koshu -*-
**
**  DESCRIPTION
**    Nested relations as embedded relational system
**

|== S : s  --table
|== T : s | up /nr

r : p | meet q
      | add /d ( /a + /c )
      | cut /b

s : slice /np p
  | slice /nq q
  | slice /nr ( nr -np ^/np -nq ^/nq )

nr : @np | meet @nq
         | add /d ( /a + /c )
         | cut /b
```

Command `koshu DATA.k nested.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    DATA.k
**    nested.k
**
**  OUTPUT
**    <stdout>
**

|-- S  /nr {= /d /c /a [ 100 | 90 | 10 ] [ 90 | 80 | 10 ] [ 110 | 90 | 20 ] =}  /nq {= /b /c [ 40 | 80 ] [ 40 | 90 ] [
    50 | 80 ] [ 60 | 90 ] =}  /np {= /a /b [ 10 | 40 ] [ 10 | 50 ] [ 20 | 60 ] =}

*** 1 judge 

=== note

TABLE : S

  /nr             /nq       /np
  --------------- --------- ---------
  /d    /c   /a   /b   /c   /a   /b
  ----- ---- ---- ---- ---- ---- ----
  100   90   10   40   80   10   40
  90    80   10   40   90   10   50
  110   90   20   50   80   20   60
                  60   90   
                            

=== rel

|-- T  /d 100  /c 90  /a 10
|-- T  /d 90  /c 80  /a 10
|-- T  /d 110  /c 90  /a 20

*** 3 judges

**
**  SUMMARY
**       1 judge  on S
**       3 judges on T
**       4 judges in total
**
```



## command

This document is produced by the command:

```
koshu-inout.sh -s -g koshu DATA.k
```
