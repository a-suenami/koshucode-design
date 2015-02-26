# I/O List

- [DATA.k](#datak)
- koshu DATA.k [maybe.k](#maybek)
- koshu DATA.k [maybe-liner.k](#maybe-linerk)
- koshu DATA.k [copy-maybe.k](#copy-maybek)
- koshu DATA.k [once.k](#oncek)
- koshu DATA.k [both.k](#bothk)



## [DATA.k](DATA.k)

```
** -*- koshu -*-
**
**  DESCRIPTION
**    Implement "both" using basic operators.
**
**  USAGE
**    koshu DATA.k ...
**

p : source P /a /b

|-- P  /a 10  /b 40
|-- P  /a 10  /b 50
|-- P  /a 20  /b 50

q : source Q /b /c

|-- Q  /b 50  /c 80
|-- Q  /b 60  /c 90
```



## maybe.k

```
-*- koshu -*-

pq : p | maybe q
qp : q | maybe p

|== MAYBE : pq | join qp
```

Command `koshu DATA.k maybe.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    DATA.k
**    maybe.k
**

|-- MAYBE  /a 10  /b 40
|-- MAYBE  /a 10  /b 50  /c 80
|-- MAYBE  /a 20  /b 50  /c 80
|-- MAYBE  /b 60  /c 90

*** 4 judges

**
**  SUMMARY
**       4 judges on MAYBE
**       4 judges in total
**
```



## maybe-liner.k

```
-*- koshu -*-
|== MAYBE-LINER : ( p | maybe q ) | join ( q | maybe p )
```

Command `koshu DATA.k maybe-liner.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    DATA.k
**    maybe-liner.k
**

|-- MAYBE-LINER  /a 10  /b 40
|-- MAYBE-LINER  /a 10  /b 50  /c 80
|-- MAYBE-LINER  /a 20  /b 50  /c 80
|-- MAYBE-LINER  /b 60  /c 90

*** 4 judges

**
**  SUMMARY
**       4 judges on MAYBE-LINER
**       4 judges in total
**
```



## copy-maybe.k

```
-*- koshu -*-
|== COPY-MAYBE : p | copy i ( maybe q | join ( q | maybe ^i ))
```

Command `koshu DATA.k copy-maybe.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    DATA.k
**    copy-maybe.k
**

|-- COPY-MAYBE  /a 10  /b 40
|-- COPY-MAYBE  /a 10  /b 50  /c 80
|-- COPY-MAYBE  /a 20  /b 50  /c 80
|-- COPY-MAYBE  /b 60  /c 90

*** 4 judges

**
**  SUMMARY
**       4 judges on COPY-MAYBE
**       4 judges in total
**
```



## once.k

```
-*- koshu -*-
|== ONCE : p | copy i ( q | copy j ( ^i | maybe ^j | join ( ^j | maybe ^i )))
```

Command `koshu DATA.k once.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    DATA.k
**    once.k
**

|-- ONCE  /a 10  /b 40
|-- ONCE  /a 10  /b 50  /c 80
|-- ONCE  /a 20  /b 50  /c 80
|-- ONCE  /b 60  /c 90

*** 4 judges

**
**  SUMMARY
**       4 judges on ONCE
**       4 judges in total
**
```



## both.k

```
-*- koshu -*-
|== BOTH : p | both q
```

Command `koshu DATA.k both.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    DATA.k
**    both.k
**

|-- BOTH  /a 10  /b 40
|-- BOTH  /a 10  /b 50  /c 80
|-- BOTH  /a 20  /b 50  /c 80
|-- BOTH  /b 60  /c 90

*** 4 judges

**
**  SUMMARY
**       4 judges on BOTH
**       4 judges in total
**
```



## command

This document is produced by the command:

```
koshu-inout.sh -r -f CALC koshu DATA.k
```
