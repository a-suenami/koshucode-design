** -*- koshu -*-
**
**  B -> D -> E -> B
**

|-- WAIT  /before 'A  /after 'B
|-- WAIT  /before 'A  /after 'C
|-- WAIT  /before 'B  /after 'D
|-- WAIT  /before 'C  /after 'D
|-- WAIT  /before 'D  /after 'E

|-- WAIT  /before 'E  /after 'B
