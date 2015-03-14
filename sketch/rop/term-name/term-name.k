** -*- koshu -*-
**
**  The relmap operator "term-name" makes a unary relation
**  that contains all term names of the input relation.
**  Term names like /x, /y, ... are beginning with slash.
**  Term names as content like '/x, '/y, ... are quoted.
**

|-- P  /x 1  /y 10  /z 50
|-- P  /x 1  /y 20

p : source P /x /y /z

|== P    : p  --table
|== TERM : p | term-name /term  --table
