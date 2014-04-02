** -*- koshu -*-
**
**  概要
**    rel を使って、group を実装する。
**
**  使用例
**    koshu slice.k
**

|-- P  /a 10  /b 40
|-- P  /a 10  /b 50

|-- Q  /b 40  /c 70
|-- Q  /b 40  /c 80
|-- Q  /b 50  /c 90

p : source P /a /b
q : source Q /b /c

|== GROUP -fore /a /b :
    p | group /g q

|== REL -fore /a /b : 
    p | rel /r ( meet q | pick-term q )

|== SLICE -fore /a /b : 
    p | rel /r id
