** -*- koshu -*-
**
**  表明に --backward を指定すると、印字される項目の順番を変更できます。
**  --backward /y /x ならば、/y が先頭、/x が 2 番目になります。
**  一般的には、指定された項目を、その順番で、先頭に移動させます。
**

|-- P  /x 0  /y 10  /z 50
|-- P  /x 1  /y 20  /z 50

|== P1 : source P /x /y /z
|== P2 : source P /x /y /z  --backward /y /x
|== P3 : source P /z /x /y  --backward /y
