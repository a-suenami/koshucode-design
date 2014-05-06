# I/O List

- koshu [rename-a1.k](#rename-a1k)
- koshu [rename-a2.k](#rename-a2k)



## [rename-a1.k](rename-a1.k)

```
** -*- koshu -*-
**
**  存在しない項目名
**

|== Q : source P /a /b
      | rename /x /c
```

Command `koshu rename-a1.k` exits with 2 and produces:

```
** -*- koshu -*-
**
**  INPUT
**    rename-a1.k
**

**
**  ABORTED  Unknown term name
**  -------- ------------------------ -------------
**  Detail   Unknown
**             /c
**           Relation
**             /a
**             /b
**  Source   7 8 rename-a1.k
**           > rename /x /c           .. specialize
**           6 0 rename-a1.k
**           > |== Q : source P /a /b .. assert
**  Command  koshu
**           rename-a1.k
**
**  Exit with status 2
**
```



## [rename-a2.k](rename-a2.k)

```
** -*- koshu -*-
**
**  すでに存在する項目名
**

|== Q : source P /a /b
      | rename /b /a
```

Command `koshu rename-a2.k` exits with 2 and produces:

```
** -*- koshu -*-
**
**  INPUT
**    rename-a2.k
**

**
**  ABORTED  Require new term names
**  -------- ------------------------ -------------
**  Detail   Known
**             /b
**           Relation
**             /a
**             /b
**  Source   7 8 rename-a2.k
**           > rename /b /a           .. specialize
**           6 0 rename-a2.k
**           > |== Q : source P /a /b .. assert
**  Command  koshu
**           rename-a2.k
**
**  Exit with status 2
**
```



## command

This document is produced by the command:

```
koshu-inout.sh -r -g koshu
```
