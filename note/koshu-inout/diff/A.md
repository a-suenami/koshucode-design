# I/O List

- [abc](#abc)
- [output](#output)



## [abc](abc)

```
aaa
ccc
dd
eee
fff
ggg
```



## output


Command `od -ta abc` produces:

```
0000000    a   a   a  nl   b   b   b  nl   c   c   c  nl   d   d   d  nl
0000020    e   e   e  nl   f   f   f  nl   g   g   g  nl                
0000034
```



## command

This document is produced by the command:

```
koshu-inout.sh -o A.md od -ta abc
```
