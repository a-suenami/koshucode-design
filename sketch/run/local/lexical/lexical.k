-*- koshu -*-
**
**  概要
**    重関係参照が文面上の構造で決定される例
**

|-- A  /x 0  /y 15
|-- A  /x 1  /y 20

a  : source A /x /y
a2 : a | nest /y -to /g
a3 : a | nest /x -to /g
