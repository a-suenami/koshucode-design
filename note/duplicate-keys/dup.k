** -*- koshu -*-
**
**  DESCRIPTION
**    Show duplicate keys
**
**  USAGE
**    koshu dup.k
**

|-- A  /x 'X1  /y 'Y1  /text "aaa"
|-- A  /x 'X1  /y 'Y2  /text "bbb"

|-- A  /x 'X2  /y 'Y1  /text "ccc"   ** duplicate key
|-- A  /x 'X2  /y 'Y1  /text "ddd"   ** duplicate key

|-- A  /x 'X3  /y 'Y3  /text "eee"

|-- A  /x 'X4  /y 'Y4  /text "fff"   ** duplicate judge
|-- A  /x 'X4  /y 'Y4  /text "fff"   ** duplicate judge

a   : source A /x /y /text
dup : a | duplicate /x /y
key : dup | pick /x /y

|== DUP : dup
|== KEY : key

