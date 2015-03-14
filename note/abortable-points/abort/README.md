# I/O List

- koshu [abort-assert.k](#abort-assertk)
- koshu [abort-attr.k](#abort-attrk)
- koshu [abort-calc.k](#abort-calck)
- koshu [abort-clause.k](#abort-clausek)
- koshu [abort-lexmap.k](#abort-lexmapk)
- koshu [abort-position.k](#abort-positionk)
- koshu [abort-relmap.k](#abort-relmapk)
- koshu [abort-run.k](#abort-runk)
- koshu [abort-specialize.k](#abort-specializek)
- koshu [abort-syntax.k](#abort-syntaxk)



## [abort-assert.k](abort-assert.k)

```
** -*- koshu -*-

|== A : id --unknown

```

Command `koshu abort-assert.k` exits with 2 and produces:

```
** -*- koshu -*-
**
**  INPUT
**    abort-assert.k
**

**
**  ABORTED  Unknown option
**  -------- ---------------------- ---------
**  Detail   Unknown parameter name
**           unknown
**  Source   3 0 abort-assert.k
**           > |== A : id --unknown .. assert
**  Command  koshu
**           abort-assert.k
**
**  Exit with status 2
**
```



## [abort-attr.k](abort-attr.k)

```
** -*- koshu -*-

|== A : source /x /y

```

Command `koshu abort-attr.k` exits with 2 and produces:

```
** -*- koshu -*-
**
**  INPUT
**    abort-attr.k
**

**
**  ABORTED  Unexpected attribute
**  -------- ---------------------- ---------
**  Detail   Require one word
**  Source   3 15 abort-attr.k
**           > /x /y                .. attr
**           3 8 abort-attr.k
**           > source /x /y         .. relmap
**           3 0 abort-attr.k
**           > |== A : source /x /y .. assert
**  Command  koshu
**           abort-attr.k
**
**  Exit with status 2
**
```



## [abort-calc.k](abort-calc.k)

```
** -*- koshu -*-

|== A : add /x ( <1> and
               ( <0> or 0 ))

```

Command `koshu abort-calc.k` exits with 2 and produces:

```
** -*- koshu -*-
**
**  INPUT
**    abort-calc.k
**

**
**  ABORTED  Type unmatch
**  -------- -------------------------- ---------
**  Detail   decimal
**  Source   3 8 abort-calc.k
**           > add /x ( <1> and         .. run
**           3 0 abort-calc.k
**           > |== A : add /x ( <1> and .. assert
**  Command  koshu
**           abort-calc.k
**
**  Exit with status 2
**
```



## [abort-clause.k](abort-clause.k)

```
** -*- koshu -*-

| A : add /x 0

```

Command `koshu abort-clause.k` exits with 2 and produces:

```
** -*- koshu -*-
**
**  INPUT
**    abort-clause.k
**

**
**  ABORTED  Unknown clause
**  -------- ------------------ ---------
**  Source   3 0 abort-clause.k
**           > | A : add /x 0   .. clause
**  Command  koshu
**           abort-clause.k
**
**  Exit with status 2
**
```



## [abort-lexmap.k](abort-lexmap.k)

```
** -*- koshu -*-

|== A : meet meet

```

Command `koshu abort-lexmap.k` exits with 2 and produces:

```
** -*- koshu -*-
**
**  INPUT
**    abort-lexmap.k
**

**
**  ABORTED  Unexpected attribute
**  -------- --------------------- ---------
**  Detail   Require one attribute
**  Source   3 13 abort-lexmap.k
**           > meet                .. lexmap
**           3 8 abort-lexmap.k
**           > meet meet           .. lexmap
**           3 0 abort-lexmap.k
**           > |== A : meet meet   .. assert
**  Command  koshu
**           abort-lexmap.k
**
**  Exit with status 2
**
```



## [abort-position.k](abort-position.k)

```
** -*- koshu -*-

|== A : add /x ( /y )

```

Command `koshu abort-position.k` exits with 2 and produces:

```
** -*- koshu -*-
**
**  INPUT
**    abort-position.k
**

**
**  ABORTED  Unknown term name
**  -------- ----------------------- ---------------
**  Detail   Unknown
**             //y
**           Input relation
**             rel
**  Source   3 17 abort-position.k
**           > /y )                  .. cox-position
**           3 8 abort-position.k
**           > add /x ( /y )         .. run
**           3 0 abort-position.k
**           > |== A : add /x ( /y ) .. assert
**  Command  koshu
**           abort-position.k
**
**  Exit with status 2
**
```



## [abort-relmap.k](abort-relmap.k)

```
** -*- koshu -*-

|== A : source R /x /y
      | check-term -has /x -but /z

```

Command `koshu abort-relmap.k` exits with 2 and produces:

```
** -*- koshu -*-
**
**  INPUT
**    abort-relmap.k
**

**
**  ABORTED  Unexpected attribute
**  -------- ---------------------------------- ---------
**  Detail   require one of -just / -has / -but
**  Source   4 8 abort-relmap.k
**           > check-term -has /x -but /z       .. relmap
**           3 0 abort-relmap.k
**           > |== A : source R /x /y           .. assert
**  Command  koshu
**           abort-relmap.k
**
**  Exit with status 2
**
```



## [abort-run.k](abort-run.k)

```
** -*- koshu -*-

|== A : keep 1

```

Command `koshu abort-run.k` exits with 2 and produces:

```
** -*- koshu -*-
**
**  INPUT
**    abort-run.k
**

**
**  ABORTED  Require Boolean
**  -------- ---------------- ---------
**  Source   3 8 abort-run.k
**           > keep 1         .. run
**           3 0 abort-run.k
**           > |== A : keep 1 .. assert
**  Command  koshu
**           abort-run.k
**
**  Exit with status 2
**
```



## [abort-specialize.k](abort-specialize.k)

```
** -*- koshu -*-

|== A : source R /x /y
      | rename /x /a /y /b

```

Command `koshu abort-specialize.k` exits with 2 and produces:

```
** -*- koshu -*-
**
**  INPUT
**    abort-specialize.k
**

**
**  ABORTED  Unknown term name
**  -------- ------------------------ -------------
**  Detail   Unknown
**             /a
**             /b
**           Input relation
**             rel /x any
**                 /y any
**  Source   4 8 abort-specialize.k
**           > rename /x /a /y /b     .. specialize
**           3 0 abort-specialize.k
**           > |== A : source R /x /y .. assert
**  Command  koshu
**           abort-specialize.k
**
**  Exit with status 2
**
```



## [abort-syntax.k](abort-syntax.k)

```
** -*- koshu -*-

|== A : add /x 0
      | add /y ( if /x = 0 ->
                 ( if 1 -> 2 -> 3 ))

```

Command `koshu abort-syntax.k` exits with 2 and produces:

```
** -*- koshu -*-
**
**  INPUT
**    abort-syntax.k
**

**
**  ABORTED  Unexpected attribute
**  -------- ----------------------- -------------
**  Detail   Expect E -> E
**  Source   5 22 abort-syntax.k
**           > 1 -> 2 -> 3 ))        .. if
**           5 17 abort-syntax.k
**           > ( if 1 -> 2 -> 3 ))   .. cox-syntax
**           4 15 abort-syntax.k
**           > ( if /x = 0 ->        .. cox-syntax
**           4 8 abort-syntax.k
**           > add /y ( if /x = 0 -> .. relmap
**           3 0 abort-syntax.k
**           > |== A : add /x 0      .. assert
**  Command  koshu
**           abort-syntax.k
**
**  Exit with status 2
**
```



## command

This document is produced by the command:

```
koshu-inout.sh -r -g koshu
```
