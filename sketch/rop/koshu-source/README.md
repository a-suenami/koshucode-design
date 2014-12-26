# I/O List

- [./stdin.sh](#stdinsh)
- [output](#output)



## [./stdin.sh](./stdin.sh)

```
#!/bin/sh
cat foo.k bar.k | koshu -i koshu-source.k
```



## output


Command `./stdin.sh` produces:

```
** -*- koshu -*-
**
**  INPUT
**    <stdin>
**    koshu-source.k
**

|-- P  /x 2  /y 10
|-- P  /x 2  /y 20
|-- P  /x 3  /y 30
|-- P  /x 1  /y 10

*** 4 judges

|-- SOURCE  /num 1  /type 'stdin  /name '<stdin>
|-- SOURCE  /num 2  /type 'file  /name 'koshu-source.k

*** 2 judges

**
**  SUMMARY
**       4 judges on P
**       2 judges on SOURCE
**       6 judges in total
**
```



## command

This document is produced by the command:

```
koshu-inout.sh -r ./stdin.sh
```
