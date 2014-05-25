# I/O List

- koshu [short.k](#shortk)



## [short.k](short.k)

```
** -*- koshu -*-

short
  a abcdef
  b abcde

|-- A  /text a.g
|-- A  /text b.f
|-- A  /text b.fg

|== B : source A /text
  | add /n ( length /text )
        /q ( /text = 'abcdefg )

```

Command `koshu short.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    short.k
**

short
  a "abcdef"
  b "abcde"

|-- B  /n 7  /q <1>  /text a.g
|-- B  /n 6  /q <0>  /text a.

*** 2 judges

**
**  SUMMARY
**       2 judges on B
**       2 judges in total
**
```



## command

This document is produced by the command:

```
koshu-inout.sh -s -g koshu
```
