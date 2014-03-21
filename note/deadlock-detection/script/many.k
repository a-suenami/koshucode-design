** -*- koshu -*-
**
**  A -> B -> D -> A [ -> C -> D -> A ]
**  A -> C -> D -> A
**

|-- WAIT  /before 'A  /after 'B
|-- WAIT  /before 'A  /after 'C
|-- WAIT  /before 'B  /after 'D
|-- WAIT  /before 'C  /after 'D
|-- WAIT  /before 'D  /after 'E

|-- WAIT  /before 'D  /after 'A
