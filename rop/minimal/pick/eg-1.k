** -*- koshu -*-
**
**  DESCRIPTION
**    An example for "pick" operator
**

|-- A  /x 'X1  /y 'Y1
|-- A  /x 'X1  /y 'Y2
|-- A  /x 'X2  /y 'Y3

a : source A /x /y

|== B : a | pick /x
|== C : a | pick /y
|== D : a | pick
