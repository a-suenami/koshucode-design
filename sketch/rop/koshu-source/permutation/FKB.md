# I/O List

- [foo.k](#fook)
- [koshu-source.k](#koshu-sourcek)
- [bar.k](#bark)
- [output](#output)



## [foo.k](foo.k)

```
** -*- koshu -*-
|-- P  /x 2  /y 10
|-- P  /x 2  /y 20
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



## [bar.k](bar.k)

```
** -*- koshu -*-
|-- P  /x 3  /y 30
```



## output


Command `koshu foo.k koshu-source.k bar.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    foo.k
**    koshu-source.k
**    bar.k
**
**  OUTPUT
**    <stdout>
**

|-- P  /x 2  /y 10
|-- P  /x 2  /y 20
|-- P  /x 1  /y 10
|-- P  /x 3  /y 30

*** 4 judges

|-- SOURCE  /num 3  /type "file"  /name "foo.k"
|-- SOURCE  /num 2  /type "file"  /name "koshu-source.k"
|-- SOURCE  /num 1  /type "file"  /name "bar.k"

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
koshu-inout.sh -o permutation/FKB.md koshu foo.k koshu-source.k bar.k
```
