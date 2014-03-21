** -*- koshu -*-
**
**  判断
**    WAIT
**
**  解釈
**    処理単位 /after は処理単位 /before の終了を待っている。
**

|-- WAIT  /before 'A  /after 'B
|-- WAIT  /before 'A  /after 'C
|-- WAIT  /before 'B  /after 'D
|-- WAIT  /before 'C  /after 'D
|-- WAIT  /before 'D  /after 'E
