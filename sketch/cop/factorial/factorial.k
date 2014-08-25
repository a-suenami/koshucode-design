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
|== D -fore /n :
  n | add /fact ( fact /n )
      -where fact n = ( if : n <= 0 -> 1
                           : n * fact ( n - 1 ))

**  Y combinator
|== Y -fore /n :
  n | add /fact ( g /n )
      -where
       : y f    = yy f ( yy f )
       : yy f x = f ( x x )
       : g      = y f
       : @@fact

**  Z combinator
|== Z -fore /n :
  n | add /fact ( g /n )
      -where
       : z f = (| x | f (| y | x x y |) |)
               (| x | f (| y | x x y |) |)
       : g = z f
       : @@fact

**  Y combinator defined by SK combinators
|== SK -fore /n :
  n | add /fact ( g /n )
      -where
       : y = s s k ( s ( k ( s s ( s ( s s k )))) k )
       : g = y f
       : @@sk
       : @@fact

**  Hakslel-style fixed point combinator
**  http://hackage.haskell.org/packages/archive/base/latest/doc/html/Data-Function.html#v:fix
|== FIX -fore /n :
  n | add /fact ( g /n )
      -where
       : fix f = f ( fix f )
       : g     = fix f
       : @@fact
