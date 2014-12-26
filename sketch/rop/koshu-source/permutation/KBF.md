# I/O List

- [koshu-source.k](#koshu-sourcek)
- [bar.k](#bark)
- [foo.k](#fook)
- [output](#output)



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



## [bar.k](bar.k)

```
** -*- koshu -*-
|-- P  /x 3  /y 30
```



## [foo.k](foo.k)

```
** -*- koshu -*-
|-- P  /x 2  /y 10
|-- P  /x 2  /y 20
```



## output


Command `koshu koshu-source.k bar.k foo.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    koshu-source.k
**    bar.k
**    foo.k
**

|-- P  /x 1  /y 10
|-- P  /x 3  /y 30
|-- P  /x 2  /y 10
|-- P  /x 2  /y 20

*** 4 judges

|-- SOURCE  /num 1  /type 'file  /name 'koshu-source.k
|-- SOURCE  /num 2  /type 'file  /name 'bar.k
|-- SOURCE  /num 3  /type 'file  /name 'foo.k

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
koshu-inout.sh -o permutation/KBF.md koshu koshu-source.k bar.k foo.k
```
