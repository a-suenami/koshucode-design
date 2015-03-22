** -*- koshu -*-
**
**  表明に --order を指定すると、項目内容を昇順に並べ替えて印字します。
**  --forward が同時に指定されていれば、項目を移動後に並べ替えます。
**

|-- P  /x 0  /y 10
|-- P  /x 1  /y 20
|-- P  /x 1  /y 10
|-- P  /x 0  /y 20

|== P1 : source P /x /y
|== P2 : source P /x /y  --order
|== P3 : source P /x /y  --forward /y --order
