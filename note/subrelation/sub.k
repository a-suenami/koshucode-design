** -*- koshu -*-
**
**  概要
**    部分関係の例題
**
**  説明
**    ある関係 S が他の関係 R よりも詳細化されているとき、
**    S は R の部分関係であるといいます。
**    ここでの詳細化とは、言及内容が増えていることを意味し、
**    具体的には、項目が同じか増えており、かつ、
**    組が同じか減っていることとして、あらわれます。
**    R と R のように自分自身も部分関係です。
**
**  使用例
**    koshu sub.k
**

|-- A  /x 'X1
|-- A  /x 'X3

|-- B  /x 'X2
|-- B  /x 'X3    ** sub of A
|-- B  /x 'X4

|-- C  /x 'X2  /y 'Y1
|-- C  /x 'X3  /y 'Y1    ** sub of A
|-- C  /x 'X3  /y 'Y2    ** sub of A
|-- C  /x 'X4  /y 'Y1

a : source A /x
b : source B /x
c : source C /x /y
cy : source C /y

|== B-SUB-A     : b | sub a
|== B-NOT-SUB-A : b | none (sub a)
|== C-SUB-A     : c | sub a
|== CY-SUB-A    : cy | sub a
|== CY-SOME-A   : cy | some a

