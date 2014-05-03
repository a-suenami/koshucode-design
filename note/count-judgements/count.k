** -*- koshu -*-
**
**  DESCRIPTION
**    Show counting output judgements
**
**  USAGE
**    koshu count.k
**

a : range /a -from 1 -to 3
b : range /b -from 1 -to 5
c : range /c -from 1 -to 9

|== C-9   : a
|== C-15  : a | meet b
|== C-25  : b | rename /a /b | meet b
|== C-135 : a | meet b | meet c
|== C-0   : dum
|== C-1   : dee

