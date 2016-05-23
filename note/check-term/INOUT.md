# I/O List

- koshu [attr-multi.k](#attr-multik)
- koshu [attr-none.k](#attr-nonek)
- koshu [but-abort.k](#but-abortk)
- koshu [but-normal.k](#but-normalk)
- koshu [has-abort.k](#has-abortk)
- koshu [has-normal.k](#has-normalk)
- koshu [just-abort.k](#just-abortk)
- koshu [just-normal.k](#just-normalk)



## [attr-multi.k](attr-multi.k)

```
** -*- koshu -*-
|-- A  /x 10  /y 20
|== B : source A /x /y | check-term -has /x -but /z
```

Command `koshu attr-multi.k` exits with 2 and produces:

```
**
**  ABORTED  Unmatch any patterns
**  -------- -------------------------------------------------- ---------
**  Detail   Unknown -but -has
**           Unknown -but
**           Unknown -has
**  Source   3 25 attr-multi.k
**           > check-term -has /x -but /z                       .. lexmap
**           3 8 attr-multi.k
**           > source A /x /y | check-term -has /x -but /z      .. lexmap
**           3 0 attr-multi.k
**           > |== B : source A /x /y | check-term -has /x -... .. assert
**  Command  koshu
**           attr-multi.k
**
**  Exit with status 2
**
```



## [attr-none.k](attr-none.k)

```
** -*- koshu -*-
|-- A  /x 10  /y 20
|== B : source A /x /y | check-term
```

Command `koshu attr-none.k` exits with 2 and produces:

```
**
**  ABORTED  Unmatch any patterns
**  -------- ------------------------------------- ---------
**  Detail   Missing -just
**           Missing -has
**           Missing -but
**  Source   3 25 attr-none.k
**           > check-term                          .. lexmap
**           3 8 attr-none.k
**           > source A /x /y | check-term         .. lexmap
**           3 0 attr-none.k
**           > |== B : source A /x /y | check-term .. assert
**  Command  koshu
**           attr-none.k
**
**  Exit with status 2
**
```



## [but-abort.k](but-abort.k)

```
** -*- koshu -*-
|-- A  /x 10  /y 20
|== B : source A /x /y | check-term -but /x
```

Command `koshu but-abort.k` exits with 2 and produces:

```
**
**  ABORTED  check-term failed
**  -------- --------------------------------------------- -------------
**  Detail   But
**             /x
**           Input relation
**             rel /x any
**                 /y any
**  Source   3 25 but-abort.k
**           > check-term -but /x                          .. specialize
**           3 0 but-abort.k
**           > |== B : source A /x /y | check-term -but /x .. assert
**  Command  koshu
**           but-abort.k
**
**  Exit with status 2
**
```



## [but-normal.k](but-normal.k)

```
** -*- koshu -*-
|-- A  /x 10  /y 20
|== B : source A /x /y | check-term -but /z
```

Command `koshu but-normal.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    but-normal.k
**
**  OUTPUT
**    <stdout>
**

|-- B  /x 10  /y 20

*** 1 judge 

**
**  SUMMARY
**       1 judge  on B
**       1 judge  in total
**
```



## [has-abort.k](has-abort.k)

```
** -*- koshu -*-
|-- A  /x 10  /y 20
|== B : source A /x /y | check-term -has /z
```

Command `koshu has-abort.k` exits with 2 and produces:

```
**
**  ABORTED  check-term failed
**  -------- --------------------------------------------- -------------
**  Detail   Has
**             /z
**           Input relation
**             rel /x any
**                 /y any
**  Source   3 25 has-abort.k
**           > check-term -has /z                          .. specialize
**           3 0 has-abort.k
**           > |== B : source A /x /y | check-term -has /z .. assert
**  Command  koshu
**           has-abort.k
**
**  Exit with status 2
**
```



## [has-normal.k](has-normal.k)

```
** -*- koshu -*-
|-- A  /x 10  /y 20
|== B : source A /x /y | check-term -has /x
```

Command `koshu has-normal.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    has-normal.k
**
**  OUTPUT
**    <stdout>
**

|-- B  /x 10  /y 20

*** 1 judge 

**
**  SUMMARY
**       1 judge  on B
**       1 judge  in total
**
```



## [just-abort.k](just-abort.k)

```
** -*- koshu -*-
|-- A  /x 10  /y 20
|== B : source A /x /y | check-term -just /x
```

Command `koshu just-abort.k` exits with 2 and produces:

```
**
**  ABORTED  check-term failed
**  -------- ---------------------------------------------- -------------
**  Detail   Just
**             /x
**           Input relation
**             rel /x any
**                 /y any
**  Source   3 25 just-abort.k
**           > check-term -just /x                          .. specialize
**           3 0 just-abort.k
**           > |== B : source A /x /y | check-term -just /x .. assert
**  Command  koshu
**           just-abort.k
**
**  Exit with status 2
**
```



## [just-normal.k](just-normal.k)

```
** -*- koshu -*-
|-- A  /x 10  /y 20
|== B : source A /x /y | check-term -just /x /y
```

Command `koshu just-normal.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    just-normal.k
**
**  OUTPUT
**    <stdout>
**

|-- B  /x 10  /y 20

*** 1 judge 

**
**  SUMMARY
**       1 judge  on B
**       1 judge  in total
**
```



## command

This document is produced by the command:

```
koshu-inout.sh -s -g koshu
```
