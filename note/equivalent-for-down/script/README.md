# I/O list of koshu

- [copy.k](#copyk)
- [output](#output)



## [copy.k](copy.k)

```
** -*- koshu -*-
**
**  DESCRIPTION
**    Implement "down" by "copy-dee-slice" combination.
**
**  USAGE
**    koshu copy.k
**

|-- P  /a 10  /b 40
|-- P  /a 10  /b 50
|-- P  /a 20  /b 60

p : source P /a /b

|== DOWN-1 : p | down /r
|== DOWN-2 : slice /r p
|== DOWN-3 : p | copy r ( slice /r r )
|== DOWN-4 : p | copy r ( dee | slice /r r )
```



## output


Command `koshu copy.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    copy.k
**

|-- DOWN-1  /r {| /a : /b | 10 : 40 | 10 : 50 | 20 : 60 |}

|-- DOWN-2  /r {| /a : /b | 10 : 40 | 10 : 50 | 20 : 60 |}

|-- DOWN-3  /r {| /a : /b | 10 : 40 | 10 : 50 | 20 : 60 |}  /a 10  /b 40
|-- DOWN-3  /r {| /a : /b | 10 : 40 | 10 : 50 | 20 : 60 |}  /a 10  /b 50
|-- DOWN-3  /r {| /a : /b | 10 : 40 | 10 : 50 | 20 : 60 |}  /a 20  /b 60

|-- DOWN-4  /r {| /a : /b | 10 : 40 | 10 : 50 | 20 : 60 |}

**
**  SUMMARY
**       1 judge  on DOWN-1
**       1 judge  on DOWN-2
**       3 judges on DOWN-3
**       1 judge  on DOWN-4
**       6 judges in total
**
```



## command

This document is produced by the command:

```
koshu-inout.sh -r copy.k
```
