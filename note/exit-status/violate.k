** -*- koshu -*-
**
**  USAGE
**    koshu violate.k
**

|-- A  /x 10  /y 20
|-- A  /x 10  /y 30
|-- A  /x 30  /y 40

a : source A /x /y

|=V A-KEY : a | duplicate /x
|== A     : a

