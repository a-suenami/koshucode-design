# I/O List

- [bar.k](#bark)
- [koshu-source.k](#koshu-sourcek)
- [foo.k](#fook)
- [output](#output)



## [bar.k](bar.k)

```
** -*- koshu -*-
|-- P  /x 3  /y 30
```



## [koshu-source.k](koshu-source.k)

```
** -*- koshu -*-
**
**  The relmap operator "koshu-source" returns
**  source informations, i.e., its number, type, and name.
**

|-- P  /x 1  /y 10

p = source P /x /y

|== P : p
|== SOURCE : koshu-source /num -type /type -name /name
```



## [foo.k](foo.k)

```
** -*- koshu -*-
|-- P  /x 2  /y 10
|-- P  /x 2  /y 20
```



## output


Command `koshu bar.k koshu-source.k foo.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    bar.k
**    koshu-source.k
**    foo.k
**
**  OUTPUT
**    <stdout>
**

|-- P  /x 3  /y 30
|-- P  /x 1  /y 10
|-- P  /x 2  /y 10
|-- P  /x 2  /y 20

*** 4 judges

|-- SOURCE  /num 3  /type 'file  /name 'bar.k
|-- SOURCE  /num 2  /type 'file  /name 'koshu-source.k
|-- SOURCE  /num 1  /type 'file  /name 'foo.k

*** 3 judges

**
**  SUMMARY
**       4 judges on P
**       3 judges on SOURCE
**       7 judges in total
**
```



## command

This document is produced by the command:

```
koshu-inout.sh -o permutation/BKF.md koshu bar.k koshu-source.k foo.k
```
