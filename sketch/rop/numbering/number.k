** -*- koshu -*-

|-- P  /x 1  /y 50
|-- P  /x 1  /y 40
|-- P  /x 1  /y 30
|-- P  /x 2  /y 20
|-- P  /x 3  /y 10

p : source P /y /x

|== PN : p | number /n -from 1                --forward /n /x /y
|== PX : p | number /n -from 1 -order /x /y   --forward /n /x /y
|== PY : p | number /n -from 1 -order /y      --forward /n /x /y
