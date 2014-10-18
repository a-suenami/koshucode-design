# I/O List

- [foo.k](#fook)
- [bar.k](#bark)
- [koshu-resource.k](#koshu-resourcek)
- [output](#output)



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



## output


Command `koshu foo.k bar.k koshu-resource.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    foo.k
**    bar.k
**    koshu-resource.k
**

|-- P  /x 2  /y 10
|-- P  /x 2  /y 20
|-- P  /x 3  /y 30
|-- P  /x 1  /y 10

*** 4 judges

|-- RES  /num 1  /type 'file  /name 'foo.k
|-- RES  /num 2  /type 'file  /name 'bar.k
|-- RES  /num 3  /type 'file  /name 'koshu-resource.k

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
koshu-inout.sh -o permutation/FBK.md koshu foo.k bar.k koshu-resource.k
```
