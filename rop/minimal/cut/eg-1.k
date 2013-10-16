** -*- koshu -*-
**
**  DESCRIPTION
**    An example for "cut" operator
**

|-- A  /x 'X1  /y 'Y1
|-- A  /x 'X1  /y 'Y2
|-- A  /x 'X2  /y 'Y3

a : source A /x /y

|== B : a | cut /y
|== C : a | cut /x /y
|== D : a | cut

