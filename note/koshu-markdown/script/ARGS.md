# I/O list of koshu

- [calc.k](#calck)
- koshu calc.k [A.k](#Ak)
- koshu calc.k [B.k](#Bk)
- koshu calc.k [C.k](#Ck)
- koshu calc.k [B.k C.k](#BkCk)



## A.k

```
** -*- koshu -*-

|-- P  /a 10  /b 40
|-- Q  /b 40  /c 80

```

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



## B.k

```
** -*- koshu -*-

|-- P  /a 10  /b 40
|-- P  /a 10  /b 50
|-- P  /a 20  /b 50

|-- Q  /b 40  /c 80
|-- Q  /b 50  /c 80
|-- Q  /b 60  /c 80

```

Command `koshu calc.k B.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    calc.k
**    B.k
**

|-- R  /c 80  /a 10  /b 40
|-- R  /c 80  /a 10  /b 50
|-- R  /c 80  /a 20  /b 50

**
**  SUMMARY
**       3 judges on R
**       3 judges in total
**
```



## C.k

```
** -*- koshu -*-

|-- P  /a 30  /b 40
|-- P  /a 30  /b 50
|-- P  /a 40  /b 50

```

Command `koshu calc.k C.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    calc.k
**    C.k
**

**
**  SUMMARY
**      no judges in total
**
```



## B.k C.k

```
** -*- koshu -*-

|-- P  /a 10  /b 40
|-- P  /a 10  /b 50
|-- P  /a 20  /b 50

|-- Q  /b 40  /c 80
|-- Q  /b 50  /c 80
|-- Q  /b 60  /c 80

```
```
** -*- koshu -*-

|-- P  /a 30  /b 40
|-- P  /a 30  /b 50
|-- P  /a 40  /b 50

```

Command `koshu calc.k B.k C.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    calc.k
**    B.k
**    C.k
**

|-- R  /c 80  /a 10  /b 40
|-- R  /c 80  /a 10  /b 50
|-- R  /c 80  /a 20  /b 50
|-- R  /c 80  /a 30  /b 40
|-- R  /c 80  /a 30  /b 50

|-- R  /c 80  /a 40  /b 50

**
**  SUMMARY
**       6 judges on R
**       6 judges in total
**
```



## command

This document is produced by the command:

```
koshu-markdown.sh -f ARGS calc.k
```
