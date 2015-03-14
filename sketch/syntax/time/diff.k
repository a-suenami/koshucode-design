** -*- koshu -*-
**
**  DESCRIPTION
**    Difference between two times.
**    Resulting differences are represented as clock.
**
**               |D'HH:MM:SS| clock /z = /y - /x
**    -----------+----------+----------------------> time
**          time /x         time /y
**          
**

|-- X  /x 2014-10-01 00:30

|-- Y  /y 2014-10-01 00:30
|-- Y  /y 2014-10-01 00:31
|-- Y  /y 2014-10-01 01:00
|-- Y  /y 2014-10-01 12:00
|-- Y  /y 2014-10-01 23:59
|-- Y  /y 2014-10-02 00:00
|-- Y  /y 2014-10-02 00:29
|-- Y  /y 2014-10-02 00:30
|-- Y  /y 2014-10-02 06:00
|-- Y  /y 2014-10-31 00:00
|-- Y  /y 2015-01-01 00:00
|-- Y  /y 3000-01-01 00:00

x  : source X /x
y  : source Y /y
xy : x | meet y

|== POS : xy | add /z ( /y - /x )  --fore /x /y
|== NEG : xy | add /z ( /x - /y )  --fore /x /y
