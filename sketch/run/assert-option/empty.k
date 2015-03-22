** -*- koshu -*-
**
**  表明に --empty を指定すると、/y () のように空番を印字します。
**  指定しないと、項目 /y 自体が印字されません。
**

|-- P  /x 0  /y 10
|-- P  /x 1
|-- P  /x 2  /y ()

|== P1 : source P /x /y 
|== P2 : source P /x /y  --empty
