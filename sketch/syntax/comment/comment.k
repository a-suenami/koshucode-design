#!/usr/bin/env koshu
** -*- koshu -*-
**
**  DESCRIPTION
**    Comment examples
**
**    - Line comments begin with ** or ***.
**    - Clause comments begin with **** at the first column.
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

****  COMMENTARY CLAUSE

  Sequence of four or more asterisks
  begins clause-style comment.

  This line is in comment.
  This line is also in comment.
  ** This comment line is in commentary clause.

*******  SEVEN ASTERISKS

  Also begins commentary clause.
  Commentary clauses are used for heading of code block,
  or for ignoring existing clauses like

****|== P :
  source P /x

****  OUTPUT

|== Q : q
|== R : r

q : p | add /y ( /x * 2 )  ** Single asterisks are text tokens.
r : p | add /y ( /x + 2 )  ** Double asterisk begins line comment.
p : source P /x            *** Triple asterisk also begins line comment.
