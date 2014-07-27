** -*- koshu -*-

|-- A  /x 1  /y 10
|-- A  /x 1  /y 20
|-- A  /x 2

|-- B  /y 20  /z 50
|-- B  /y 20  /z 60

a : source A /x /y
b : source B /y /z

|== C : a | meet b
|== D : a | maybe b
