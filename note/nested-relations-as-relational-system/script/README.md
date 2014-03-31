# Koshu I/O Listing

- koshu [relsys.k](#relsysk)



## [relsys.k](relsys.k)

```
** -*- koshu -*-
**
**  DESCRIPTION
**    Nested relations as embedded relational system
**
**  USAGE
**    koshu relsys.k
**

|-- P  /a 10  /b 40
|-- P  /a 10  /b 50
|-- P  /a 20  /b 60

|-- Q  /b 40  /c 80
|-- Q  /b 40  /c 90
|-- Q  /b 50  /c 80
|-- Q  /b 60  /c 90

|== R : r
|== S : s
|== T : s | up /nr

p : source P /a /b
q : source Q /b /c
r : p | meet q
      | add /d ( /a + /c )
      | cut /b

s : rel /np p
  | rel /nq q
  | rel /nr nr -with /np /nq

nr : np | meet nq
        | add /d ( /a + /c )
        | cut /b

```
Command `koshu relsys.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    relsys.k
**

|-- R  /d 100  /c 90  /a 10
|-- R  /d 90  /c 80  /a 10
|-- R  /d 110  /c 90  /a 20
|-- S  /nr {| /d : /c : /a | 100 : 90 : 10 | 90 : 80 : 10 | 110 : 90 : 20 |}  /nq {| /b : /c | 40 : 80 | 40 : 90 | 50 : 80 | 60 : 90 |}  /np {| /a : /b | 10 : 40 | 10 : 50 | 20 : 60 |}
|-- T  /d 100  /c 90  /a 10

|-- T  /d 90  /c 80  /a 10
|-- T  /d 110  /c 90  /a 20

**
**  SUMMARY
**       3 judges on R
**       1 judge  on S
**       3 judges on T
**       7 judges in total
**
```
