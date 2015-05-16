** -*- koshu -*-
**
**  概要
**    slice を使って、group を実装する。
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

|== GROUP : p | group q -to /g
  --forward /a /b

|== GROUP2 : p | slice /r ( meet q | pick-term q )
  --forward /a /b

|== SLICE : p | slice /r id
  --forward /a /b
