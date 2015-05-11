# I/O List

- koshu [backward.k](#backwardk)
- koshu [option.k](#optionk)



## [backward.k](backward.k)

```
** -*- koshu -*-
**
**  'backward' operator moves terms to the rear.
**  It is not a real relational operator,
**  because term positions of relations are not significant.
**

|-- P  /a 1  /b 10  /c 100
|-- P  /a 2  /b 20  /c 200

p : source P /a /b /c

|== A : p | backward /a
|== B : p | backward /b
|== C : p | backward /c

|== AB : p | backward /a /b
|== AC : p | backward /a /c
|== BA : p | backward /b /a
|== BC : p | backward /b /c
|== CA : p | backward /c /a
|== CB : p | backward /c /b

|== ABC : p | backward /a /b /c
|== ACB : p | backward /a /c /b
|== BAC : p | backward /b /a /c
|== BCA : p | backward /b /c /a
|== CAB : p | backward /c /a /b
|== CBA : p | backward /c /b /a
```

Command `koshu backward.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    backward.k
**
**  OUTPUT
**    <stdout>
**

|-- A  /b 10  /c 100  /a 1
|-- A  /b 20  /c 200  /a 2

*** 2 judges

|-- B  /a 1  /c 100  /b 10
|-- B  /a 2  /c 200  /b 20

*** 2 judges

|-- C  /a 1  /b 10  /c 100
|-- C  /a 2  /b 20  /c 200

*** 2 judges

|-- AB  /c 100  /a 1  /b 10
|-- AB  /c 200  /a 2  /b 20

*** 2 judges

|-- AC  /b 10  /a 1  /c 100
|-- AC  /b 20  /a 2  /c 200

*** 2 judges

|-- BA  /c 100  /b 10  /a 1
|-- BA  /c 200  /b 20  /a 2

*** 2 judges

|-- BC  /a 1  /b 10  /c 100
|-- BC  /a 2  /b 20  /c 200

*** 2 judges

|-- CA  /b 10  /c 100  /a 1
|-- CA  /b 20  /c 200  /a 2

*** 2 judges

|-- CB  /a 1  /c 100  /b 10
|-- CB  /a 2  /c 200  /b 20

*** 2 judges

|-- ABC  /a 1  /b 10  /c 100
|-- ABC  /a 2  /b 20  /c 200

*** 2 judges

|-- ACB  /a 1  /c 100  /b 10
|-- ACB  /a 2  /c 200  /b 20

*** 2 judges

|-- BAC  /b 10  /a 1  /c 100
|-- BAC  /b 20  /a 2  /c 200

*** 2 judges

|-- BCA  /b 10  /c 100  /a 1
|-- BCA  /b 20  /c 200  /a 2

*** 2 judges

|-- CAB  /c 100  /a 1  /b 10
|-- CAB  /c 200  /a 2  /b 20

*** 2 judges

|-- CBA  /c 100  /b 10  /a 1
|-- CBA  /c 200  /b 20  /a 2

*** 2 judges

**
**  SUMMARY
**       2 judges on A
**       2 judges on AB
**       2 judges on ABC
**       2 judges on AC
**       2 judges on ACB
**       2 judges on B
**       2 judges on BA
**       2 judges on BAC
**       2 judges on BC
**       2 judges on BCA
**       2 judges on C
**       2 judges on CA
**       2 judges on CAB
**       2 judges on CB
**       2 judges on CBA
**      30 judges in total
**
```



## [option.k](option.k)

```
** -*- koshu -*-
**
**  '--backward' option moves terms to the rear.
**

|-- P  /a 1  /b 10  /c 100
|-- P  /a 2  /b 20  /c 200

p : source P /a /b /c

|== A : p  --backward /a
|== B : p  --backward /b
|== C : p  --backward /c

|== AB : p  --backward /a /b
|== AC : p  --backward /a /c
|== BA : p  --backward /b /a
|== BC : p  --backward /b /c
|== CA : p  --backward /c /a
|== CB : p  --backward /c /b

|== ABC : p  --backward /a /b /c
|== ACB : p  --backward /a /c /b
|== BAC : p  --backward /b /a /c
|== BCA : p  --backward /b /c /a
|== CAB : p  --backward /c /a /b
|== CBA : p  --backward /c /b /a
```

Command `koshu option.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    option.k
**
**  OUTPUT
**    <stdout>
**

|-- A  /b 10  /c 100  /a 1
|-- A  /b 20  /c 200  /a 2

*** 2 judges

|-- B  /a 1  /c 100  /b 10
|-- B  /a 2  /c 200  /b 20

*** 2 judges

|-- C  /a 1  /b 10  /c 100
|-- C  /a 2  /b 20  /c 200

*** 2 judges

|-- AB  /c 100  /a 1  /b 10
|-- AB  /c 200  /a 2  /b 20

*** 2 judges

|-- AC  /b 10  /a 1  /c 100
|-- AC  /b 20  /a 2  /c 200

*** 2 judges

|-- BA  /c 100  /b 10  /a 1
|-- BA  /c 200  /b 20  /a 2

*** 2 judges

|-- BC  /a 1  /b 10  /c 100
|-- BC  /a 2  /b 20  /c 200

*** 2 judges

|-- CA  /b 10  /c 100  /a 1
|-- CA  /b 20  /c 200  /a 2

*** 2 judges

|-- CB  /a 1  /c 100  /b 10
|-- CB  /a 2  /c 200  /b 20

*** 2 judges

|-- ABC  /a 1  /b 10  /c 100
|-- ABC  /a 2  /b 20  /c 200

*** 2 judges

|-- ACB  /a 1  /c 100  /b 10
|-- ACB  /a 2  /c 200  /b 20

*** 2 judges

|-- BAC  /b 10  /a 1  /c 100
|-- BAC  /b 20  /a 2  /c 200

*** 2 judges

|-- BCA  /b 10  /c 100  /a 1
|-- BCA  /b 20  /c 200  /a 2

*** 2 judges

|-- CAB  /c 100  /a 1  /b 10
|-- CAB  /c 200  /a 2  /b 20

*** 2 judges

|-- CBA  /c 100  /b 10  /a 1
|-- CBA  /c 200  /b 20  /a 2

*** 2 judges

**
**  SUMMARY
**       2 judges on A
**       2 judges on AB
**       2 judges on ABC
**       2 judges on AC
**       2 judges on ACB
**       2 judges on B
**       2 judges on BA
**       2 judges on BAC
**       2 judges on BC
**       2 judges on BCA
**       2 judges on C
**       2 judges on CA
**       2 judges on CAB
**       2 judges on CB
**       2 judges on CBA
**      30 judges in total
**
```



## command

This document is produced by the command:

```
koshu-inout.sh -r -g koshu
```
