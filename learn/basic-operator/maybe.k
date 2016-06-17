** -*- koshu -*-
**
**  p | maybe q は、関係写像 p が出力した関係と、
**  関係写像 q が出力した関係の交わりを計算します。
**  ただし、q に組が成立していないときは、
**  meet のような除外するのではなく、空 () を補います。
**

|== R : p | maybe q
  --table --backward /c

p : source P /a /b
q : source Q /b /c

|-- P  /a 1  /b 10
|-- P  /a 2  /b 20
|-- P  /a 3  /b 30

|-- Q  /b 20  /c 200
|-- Q  /b 20  /c 210
|-- Q  /b 20  /c 220
|-- Q  /b 30  /c 300
|-- Q  /b 40  /c 400
