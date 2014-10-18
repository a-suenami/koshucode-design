# I/O List

- [koshu-resource.k](#koshu-resourcek)
- [foo.k](#fook)
- [bar.k](#bark)
- [output](#output)



## [koshu-resource.k](koshu-resource.k)

```
** -*- koshu -*-
**
**  The relmap operator "koshu-resource" returns
**  resource informations, i.e., its number, type, and name.
**

|-- P  /x 1  /y 10

p : source P /x /y

|== P : p
|== RES : koshu-resource /num -type /type -name /name
```



## [foo.k](foo.k)

```
** -*- koshu -*-
|-- P  /x 2  /y 10
|-- P  /x 2  /y 20
```



## [bar.k](bar.k)

```
** -*- koshu -*-
|-- P  /x 3  /y 30
```



## output


Command `koshu koshu-resource.k foo.k bar.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    koshu-resource.k
**    foo.k
**    bar.k
**

|-- P  /x 1  /y 10
|-- P  /x 2  /y 10
|-- P  /x 2  /y 20
|-- P  /x 3  /y 30

*** 4 judges

|-- RES  /num 1  /type 'file  /name 'koshu-resource.k
|-- RES  /num 2  /type 'file  /name 'foo.k
|-- RES  /num 3  /type 'file  /name 'bar.k

*** 3 judges

**
**  SUMMARY
**       4 judges on P
**       3 judges on RES
**       7 judges in total
**
```



## command

This document is produced by the command:

```
koshu-inout.sh -o permutation/KFB.md koshu koshu-resource.k foo.k bar.k
```
