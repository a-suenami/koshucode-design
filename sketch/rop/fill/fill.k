** -*- koshu -*-
**
**  概要
**    fill は指定された項目の内容が () のときに、-with の内容で置き換えます。
**

|-- P  /a 1  /b 10  /c 50
|-- P  /a 1  /b 10
|-- P  /a 1         /c 50
|-- P  /a 1
|-- P        /b 10
|-- P               /c 50
|-- P

|== Q : source P /a /b /c | fill /b /c -with 0
  --table --forward /a /b /c
