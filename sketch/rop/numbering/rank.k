** -*- koshu -*-

|-- P  /x 1  /y 0
|-- P  /x 1  /y 1
|-- P  /x 2  /y 0
|-- P  /x 3  /y 1
|-- P  /x 3  /y 0
|-- P  /x 4  /y 0
|-- P  /x 5  /y 0

p : source P /y /x

|== GAP-RANK   : p | rank /n -order /x -from 1         --forward /n /x
|== DENSE-RANK : p | rank /n -order /x -from 1 -dense  --forward /n /x
