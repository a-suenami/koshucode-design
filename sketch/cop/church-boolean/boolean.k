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
