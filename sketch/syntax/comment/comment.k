#!/usr/bin/env koshu
** -*- koshu -*-
**
**  DESCRIPTION
**    Comment examples
**
**    - Ignore line using '**' or '***'.
**    - Ignore entire clause using '****'.
**    - #! also begins line comment.
**
**  USAGE
**    koshu comment.k
**    ./comment.k
**

****  DATA

|-- P  /x 10
|-- P  /x 20
|-- P  /x 30

****|== P :
  source P /x

  **  Quadruple asterisk ignores entire clause

****  OUTPUT

|== Q : q
|== R : r

q : p | add /y ( /x * 2 )  ** Single asterisks are text tokens.
r : p | add /y ( /x + 2 )  ** Double asterisk begins line comment.
p : source P /x            *** Triple asterisk also begins line comment.

**
****
*******
