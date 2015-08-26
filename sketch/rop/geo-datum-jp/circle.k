** -*- koshu -*-
**
**  半径 10,000 メートルの円
**

|-- ORIGIN  /x 0  /y 0

|-- CIRCLE  /n  0   /x   10000  /y       0
|-- CIRCLE  /n  1   /x    9239  /y    3827
|-- CIRCLE  /n  2   /x    7071  /y    7071
|-- CIRCLE  /n  3   /x    3827  /y    9239
|-- CIRCLE  /n  4   /x       0  /y   10000
|-- CIRCLE  /n  5   /x -  3827  /y    9239
|-- CIRCLE  /n  6   /x -  7071  /y    7071
|-- CIRCLE  /n  7   /x -  9239  /y    3827
|-- CIRCLE  /n  8   /x - 10000  /y       0
|-- CIRCLE  /n  9   /x -  9239  /y -  3827
|-- CIRCLE  /n 10   /x -  7071  /y -  7071
|-- CIRCLE  /n 11   /x -  3827  /y -  9239
|-- CIRCLE  /n 12   /x       0  /y - 10000
|-- CIRCLE  /n 13   /x    3827  /y -  9239
|-- CIRCLE  /n 14   /x    7071  /y -  7071
|-- CIRCLE  /n 15   /x    9239  /y -  3827

origin : source ORIGIN /n /x /y
circle : source CIRCLE /n /x /y

|== MAP : circle | join origin
  | range /coord -from 1 -to 19
  | geo-datum-jp /coord /x /y -to /lat /long
  | add /name ( if /n = () -> "System " ++ to-text /coord
                            : to-text /n )
  | forward /n /name /x /y
  | hier /coord -to /point
  --order --table --backward /point

