# I/O List

- koshu [boolean.k](#booleank)



## [boolean.k](boolean.k)

```
** -*- koshu -*-
**
**  USAGE
**    koshu boolean.k
**

@@boolean
    decode x      =  x ( "true" ) ( "false" )
  : true   a b    =  a
  : false  a b    =  b
  : conj   p q    =  p q p
  : disj   p q    =  p p q
  : not    p a b  =  p b a

|== BOOLEAN :
    add /a ( decode true )
        /b ( decode false )
      -where @@boolean

|== NOT :
    add /a ( decode ( not true ))
        /b ( decode ( not false ))
      -where @@boolean

|== CONJ :
    add /a ( decode ( conj true true ))
        /b ( decode ( conj true false ))
        /c ( decode ( conj false true ))
        /d ( decode ( conj false false ))
      -where @@boolean

|== DISJ :
    add /a ( decode ( disj true true ))
        /b ( decode ( disj true false ))
        /c ( decode ( disj false true ))
        /d ( decode ( disj false false ))
      -where @@boolean

|== TAUT-CONT :
    add /a ( decode ( tautology  true  ))
        /b ( decode ( tautology  false ))
        /c ( decode ( contradict true  ))
        /d ( decode ( contradict false ))
      -where @@boolean
         : tautology  x = disj x ( not x )
         : contradict x = conj x ( not x )

|== HALF-ADDER :
    add /sum   ( decode ( sum   true false ))
        /carry ( decode ( carry true false ))
      -where @@boolean
         : sum   a b = conj a ( not ( carry a b ))
         : carry a b = conj a b
```

Command `koshu boolean.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    boolean.k
**

|-- BOOLEAN  /a 'true  /b 'false

*** 1 judge 

|-- NOT  /a 'false  /b 'true

*** 1 judge 

|-- CONJ  /a 'true  /b 'false  /c 'false  /d 'false

*** 1 judge 

|-- DISJ  /a 'true  /b 'true  /c 'true  /d 'false

*** 1 judge 

|-- TAUT-CONT  /a 'true  /b 'true  /c 'false  /d 'false

*** 1 judge 

|-- HALF-ADDER  /sum 'true  /carry 'false

*** 1 judge 

**
**  SUMMARY
**       1 judge  on BOOLEAN
**       1 judge  on CONJ
**       1 judge  on DISJ
**       1 judge  on HALF-ADDER
**       1 judge  on NOT
**       1 judge  on TAUT-CONT
**       6 judges in total
**
```



## command

This document is produced by the command:

```
koshu-inout.sh -r -g koshu
```
