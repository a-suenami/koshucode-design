# I/O List

- koshu [factorial.k](#factorialk)



## [factorial.k](factorial.k)

```
** -*- koshu -*-
**
**  DESCRIPTION
**    Calculate factorial for some integers.
**
**  USAGE
**    koshu factorial.k
**

@@fact
  f fact n = ( if : n <= 0 -> 1
                  : n * fact ( n - 1 ))

@@sk
  : s x y z = x z ( y z )
  : k x y   = x

n : range /n -from 0 -to 8

**  Direct recursion
|== D :
  n | add /fact ( fact /n )
      -where fact n = ( if : n <= 0 -> 1
                           : n * fact ( n - 1 ))
  --forward /n

**  Y combinator
|== Y :
  n | add /fact ( g /n )
      -where
       : y f    = yy f ( yy f )
       : yy f x = f ( x x )
       : g      = y f
       : @@fact
  --forward /n

**  Z combinator
|== Z :
  n | add /fact ( g /n )
      -where
       : z f = (| x | f (| y | x x y |) |)
               (| x | f (| y | x x y |) |)
       : g = z f
       : @@fact
  --forward /n

**  Y combinator defined by SK combinators
|== SK :
  n | add /fact ( g /n )
      -where
       : y = s s k ( s ( k ( s s ( s ( s s k )))) k )
       : g = y f
       : @@sk
       : @@fact
  --forward /n

**  Hakslel-style fixed point combinator
**  http://hackage.haskell.org/packages/archive/base/latest/doc/html/Data-Function.html#v:fix
|== FIX :
  n | add /fact ( g /n )
      -where
       : fix f = f ( fix f )
       : g     = fix f
       : @@fact
  --forward /n
```

Command `koshu factorial.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    factorial.k
**

|-- D  /n 0  /fact 1
|-- D  /n 1  /fact 1
|-- D  /n 2  /fact 2
|-- D  /n 3  /fact 6
|-- D  /n 4  /fact 24

|-- D  /n 5  /fact 120
|-- D  /n 6  /fact 720
|-- D  /n 7  /fact 5 040
|-- D  /n 8  /fact 40 320

*** 9 judges

|-- Y  /n 0  /fact 1
|-- Y  /n 1  /fact 1
|-- Y  /n 2  /fact 2
|-- Y  /n 3  /fact 6
|-- Y  /n 4  /fact 24

|-- Y  /n 5  /fact 120
|-- Y  /n 6  /fact 720
|-- Y  /n 7  /fact 5 040
|-- Y  /n 8  /fact 40 320

*** 9 judges

|-- Z  /n 0  /fact 1
|-- Z  /n 1  /fact 1
|-- Z  /n 2  /fact 2
|-- Z  /n 3  /fact 6
|-- Z  /n 4  /fact 24

|-- Z  /n 5  /fact 120
|-- Z  /n 6  /fact 720
|-- Z  /n 7  /fact 5 040
|-- Z  /n 8  /fact 40 320

*** 9 judges

|-- SK  /n 0  /fact 1
|-- SK  /n 1  /fact 1
|-- SK  /n 2  /fact 2
|-- SK  /n 3  /fact 6
|-- SK  /n 4  /fact 24

|-- SK  /n 5  /fact 120
|-- SK  /n 6  /fact 720
|-- SK  /n 7  /fact 5 040
|-- SK  /n 8  /fact 40 320

*** 9 judges

|-- FIX  /n 0  /fact 1
|-- FIX  /n 1  /fact 1
|-- FIX  /n 2  /fact 2
|-- FIX  /n 3  /fact 6
|-- FIX  /n 4  /fact 24

|-- FIX  /n 5  /fact 120
|-- FIX  /n 6  /fact 720
|-- FIX  /n 7  /fact 5 040
|-- FIX  /n 8  /fact 40 320

*** 9 judges

**
**  SUMMARY
**       9 judges on D
**       9 judges on FIX
**       9 judges on SK
**       9 judges on Y
**       9 judges on Z
**      45 judges in total
**
```



## command

This document is produced by the command:

```
koshu-inout.sh -r -g koshu
```
