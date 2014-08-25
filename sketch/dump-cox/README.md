# I/O List

- koshu [dump-cox.k](#dump-coxk)



## [dump-cox.k](dump-cox.k)

```
** -*- koshu -*-

|== DUMP : dump-cox
           ( (| x | g ( /y * x ) |) f ( /x + 1 ))
```

Command `koshu dump-cox.k` exits with 2 and produces:

```
** -*- koshu -*-
**
**  INPUT
**    dump-cox.k
**

**
**  ABORTED  Dump content expression
**  -------- ---------------------------------- ---------
**  Detail   >> (| x | >> global g
**                        - >> global * (infix)
**                             - /y
**                             - local x/1 |)
**              - global f
**              - >> global + (infix)
**                   - /x
**                   - lit 1
**  Source   3 11 dump-cox.k
**           > dump-cox                         .. relmap
**           3 0 dump-cox.k
**           > |== DUMP : dump-cox              .. assert
**  Command  koshu
**           dump-cox.k
**
**  Exit with status 2
**
```



## command

This document is produced by the command:

```
koshu-inout.sh -r -g koshu
```
