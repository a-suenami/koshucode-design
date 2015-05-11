# I/O List

- koshu [forward.k](#forwardk)
- koshu [option.k](#optionk)



## [forward.k](forward.k)

```
** -*- koshu -*-
**
**  'forward' operator moves terms to the front.
**  It is not a real relational operator,
**  because term positions of relations are not significant.
**

|-- P  /a 1  /b 10  /c 100
|-- P  /a 2  /b 20  /c 200

p : source P /a /b /c

|== A : p | forward /a
|== B : p | forward /b
|== C : p | forward /c

|== AB : p | forward /a /b
|== AC : p | forward /a /c
|== BA : p | forward /b /a
|== BC : p | forward /b /c
|== CA : p | forward /c /a
|== CB : p | forward /c /b

|== ABC : p | forward /a /b /c
|== ACB : p | forward /a /c /b
|== BAC : p | forward /b /a /c
|== BCA : p | forward /b /c /a
|== CAB : p | forward /c /a /b
|== CBA : p | forward /c /b /a
```

Command `koshu forward.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    forward.k
**
**  OUTPUT
**    <stdout>
**

|-- A  /a 1  /b 10  /c 100
|-- A  /a 2  /b 20  /c 200

*** 2 judges

|-- B  /b 10  /a 1  /c 100
|-- B  /b 20  /a 2  /c 200

*** 2 judges

|-- C  /c 100  /a 1  /b 10
|-- C  /c 200  /a 2  /b 20

*** 2 judges

|-- AB  /a 1  /b 10  /c 100
|-- AB  /a 2  /b 20  /c 200

*** 2 judges

|-- AC  /a 1  /c 100  /b 10
|-- AC  /a 2  /c 200  /b 20

*** 2 judges

|-- BA  /b 10  /a 1  /c 100
|-- BA  /b 20  /a 2  /c 200

*** 2 judges

|-- BC  /b 10  /c 100  /a 1
|-- BC  /b 20  /c 200  /a 2

*** 2 judges

|-- CA  /c 100  /a 1  /b 10
|-- CA  /c 200  /a 2  /b 20

*** 2 judges

|-- CB  /c 100  /b 10  /a 1
|-- CB  /c 200  /b 20  /a 2

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
**  '--forward' option moves terms to the front.
**

|-- P  /a 1  /b 10  /c 100
|-- P  /a 2  /b 20  /c 200

p : source P /a /b /c

|== A : p  --forward /a
|== B : p  --forward /b
|== C : p  --forward /c

|== AB : p  --forward /a /b
|== AC : p  --forward /a /c
|== BA : p  --forward /b /a
|== BC : p  --forward /b /c
|== CA : p  --forward /c /a
|== CB : p  --forward /c /b

|== ABC : p  --forward /a /b /c
|== ACB : p  --forward /a /c /b
|== BAC : p  --forward /b /a /c
|== BCA : p  --forward /b /c /a
|== CAB : p  --forward /c /a /b
|== CBA : p  --forward /c /b /a
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

|-- A  /a 1  /b 10  /c 100
|-- A  /a 2  /b 20  /c 200

*** 2 judges

|-- B  /b 10  /a 1  /c 100
|-- B  /b 20  /a 2  /c 200

*** 2 judges

|-- C  /c 100  /a 1  /b 10
|-- C  /c 200  /a 2  /b 20

*** 2 judges

|-- AB  /a 1  /b 10  /c 100
|-- AB  /a 2  /b 20  /c 200

*** 2 judges

|-- AC  /a 1  /c 100  /b 10
|-- AC  /a 2  /c 200  /b 20

*** 2 judges

|-- BA  /b 10  /a 1  /c 100
|-- BA  /b 20  /a 2  /c 200

*** 2 judges

|-- BC  /b 10  /c 100  /a 1
|-- BC  /b 20  /c 200  /a 2

*** 2 judges

|-- CA  /c 100  /a 1  /b 10
|-- CA  /c 200  /a 2  /b 20

*** 2 judges

|-- CB  /c 100  /b 10  /a 1
|-- CB  /c 200  /b 20  /a 2

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
