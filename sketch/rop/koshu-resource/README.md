# I/O List

- [./stdin.sh](#stdinsh)
- [output](#output)



## [./stdin.sh](./stdin.sh)

```
#!/bin/sh
cat foo.k bar.k | koshu -i koshu-resource.k
```



## output


Command `./stdin.sh` produces:

```
** -*- koshu -*-
**
**  INPUT
**    <stdin>
**    koshu-resource.k
**

|-- P  /x 2  /y 10
|-- P  /x 2  /y 20
|-- P  /x 3  /y 30
|-- P  /x 1  /y 10

*** 4 judges

|-- RES  /num 1  /type 'stdin  /name '<stdin>
|-- RES  /num 2  /type 'file  /name 'koshu-resource.k

*** 2 judges

**
**  SUMMARY
**       4 judges on P
**       2 judges on RES
**       6 judges in total
**
```



## command

This document is produced by the command:

```
koshu-inout.sh -r ./stdin.sh
```