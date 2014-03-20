# Koshu I/O Listing

## abort-assert.k

Input

```
** -*- koshu -*-

|== A -unknown : id

```
Output

```
** -*- koshu -*-
**
**  INPUT
**    abort-assert.k
**

**
**  ABORTED  Unknown word
**  -------- --------------------- ---------
**  Detail   -unknown
**  Source   3 0 abort-assert.k
**           > |== A -unknown : id .. assert
**  Command  koshu
**           abort-assert.k
**
**  Exit with status 2
**
```

## abort-calc.k

Input

```
** -*- koshu -*-

|== A : add /x ( #true and
                 ( #false or 0 ))

```
Output

```
** -*- koshu -*-
**
**  INPUT
**    abort-calc.k
**

**
**  ABORTED  Type unmatch
**  -------- ---------------------------- ---------
**  Detail   decimal
**  Source   4 17 abort-calc.k
**           > ( #false or 0 ))           .. calc
**           3 15 abort-calc.k
**           > ( #true and                .. calc
**           3 8 abort-calc.k
**           > add /x ( #true and         .. run
**           3 0 abort-calc.k
**           > |== A : add /x ( #true and .. assert
**  Command  koshu
**           abort-calc.k
**
**  Exit with status 2
**
```

## abort-clause.k

Input

```
** -*- koshu -*-

| A : add /x 0

```
Output

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

## abort-lexmap.k

Input

```
** -*- koshu -*-

|== A : meet (a | meet)

```
Output

```
** -*- koshu -*-
**
**  INPUT
**    abort-lexmap.k
**

**
**  ABORTED  Unexpected operand
**  -------- ------------------- ---------
**  Detail   Require one operand
**  Source   3 18 abort-lexmap.k
**           > meet)             .. lexmap
**           3 14 abort-lexmap.k
**           > a | meet)         .. lexmap
**           3 13 abort-lexmap.k
**           > (a | meet)        .. lexmap
**           3 8 abort-lexmap.k
**           > meet (a | meet)   .. lexmap
**  Command  koshu
**           abort-lexmap.k
**
**  Exit with status 2
**
```

## abort-operand.k

Input

```
** -*- koshu -*-

|== A : source /x /y

```
Output

```
** -*- koshu -*-
**
**  INPUT
**    abort-operand.k
**

**
**  ABORTED  Unexpected operand
**  -------- ---------------------- ----------
**  Detail   Require one word
**  Source   3 15 abort-operand.k
**           > /x /y                .. operand
**           3 8 abort-operand.k
**           > source /x /y         .. relmap
**           3 0 abort-operand.k
**           > |== A : source /x /y .. clause
**  Command  koshu
**           abort-operand.k
**
**  Exit with status 2
**
```

## abort-position.k

Input

```
** -*- koshu -*-

|== A : add /x ( /y )

```
Output

```
** -*- koshu -*-
**
**  INPUT
**    abort-position.k
**

**
**  ABORTED  No term in relation
**  -------- ----------------------- -----------
**  Detail   /y
**  Source   3 17 abort-position.k
**           > /y )                  .. position
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

## abort-relmap.k

Input

```
** -*- koshu -*-

|== A : source R /x /y
      | check-term -has /x -but /z

```
Output

```
** -*- koshu -*-
**
**  INPUT
**    abort-relmap.k
**

**
**  ABORTED  Unexpected operand
**  -------- ---------------------------------- ---------
**  Detail   require one of -just / -has / -but
**  Source   4 8 abort-relmap.k
**           > check-term -has /x -but /z       .. relmap
**           3 0 abort-relmap.k
**           > |== A : source R /x /y           .. clause
**  Command  koshu
**           abort-relmap.k
**
**  Exit with status 2
**
```

## abort-run.k

Input

```
** -*- koshu -*-

|== A : hold 1

```
Output

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
**           > hold 1         .. run
**           3 0 abort-run.k
**           > |== A : hold 1 .. assert
**  Command  koshu
**           abort-run.k
**
**  Exit with status 2
**
```

## abort-specialize.k

Input

```
** -*- koshu -*-

|== A : source R /x /y
      | rename /x /a /y /b

```
Output

```
** -*- koshu -*-
**
**  INPUT
**    abort-specialize.k
**

**
**  ABORTED  Require new term names
**  -------- ------------------------ -------------
**  Detail   /x
**           /y
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

## abort-syntax.k

Input

```
** -*- koshu -*-

|== A : add /x 0
      | add /y ( if /x = 0 ->
                 ( if 1 -> 2 -> 3 ))

```
Output

```
** -*- koshu -*-
**
**  INPUT
**    abort-syntax.k
**

**
**  ABORTED  Unexpected operand
**  -------- ----------------------- ---------
**  Detail   Expect E -> E
**  Source   5 22 abort-syntax.k
**           > 1 -> 2 -> 3 ))        .. if
**           5 17 abort-syntax.k
**           > ( if 1 -> 2 -> 3 ))   .. syntax
**           4 15 abort-syntax.k
**           > ( if /x = 0 ->        .. syntax
**           4 8 abort-syntax.k
**           > add /y ( if /x = 0 -> .. relmap
**           3 0 abort-syntax.k
**           > |== A : add /x 0      .. clause
**  Command  koshu
**           abort-syntax.k
**
**  Exit with status 2
**
```
