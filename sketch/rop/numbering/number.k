** -*- koshu -*-

|-- P  /x 1  /y 50
|-- P  /x 1  /y 40
|-- P  /x 1  /y 30
|-- P  /x 2  /y 20
|-- P  /x 3  /y 10

p : source P /y /x

|== PN -fore /n /x /y : p | number /n -from 1
|== PX -fore /n /x /y : p | number /n -from 1 -order /x /y
|== PY -fore /n /x /y : p | number /n -from 1 -order /y
