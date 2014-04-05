# I/O list of koshu

- [calc.k](#calck)
- [A.k](#ak)
- [output](#output)



## [calc.k](calc.k)

```
** -*- koshu -*-

p : source P /a /b
q : source Q /b /c

|== R : p | meet q

```



## [A.k](A.k)

```
** -*- koshu -*-

|-- P  /a 10  /b 40
|-- Q  /b 40  /c 80

```



## output


Command `koshu calc.k A.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    calc.k
**    A.k
**

|-- R  /c 80  /a 10  /b 40

**
**  SUMMARY
**       1 judge  on R
**       1 judge  in total
**
```



## command

This document is produced by the command:

```
koshu-markdown.sh -o A.md calc.k A.k
```
