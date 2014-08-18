** -*- koshu -*-
**
**  DESCRIPTION
**    An example of relational lattice
**
**  USAGE
**    koshu foo.k
**

**  INPUT

|-- FOO  /x 1  /y 10
|-- FOO  /x 1  /y 20
|-- FOO  /x 2  /y 20
|-- FOO  /x 2  /y 30

|-- BAR  /y 20  /z 110
|-- BAR  /y 20  /z 120
|-- BAR  /y 30  /z 130
|-- BAR  /y 40  /z 140

**  CALCULATION and OUTPUT

p : source FOO /x /y   ** Read FOO as a relation among /x and /y
q : source BAR /y /z   ** Read BAR as a relation among /y and /z

|== BAR : p | meet q   ** Same as natural join in SQL
|== QUX : p | join q   ** Same as union in SQL, but generalized
