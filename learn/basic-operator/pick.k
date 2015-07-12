** -*- koshu -*-
**
**  pick /P ... は、入力関係の項目 /P ... だけを残します。
**
**  入力関係が項目 /P ... /Q ... をもっているとき、
**  pick /P ... は、cut /Q ... と同じ効果をもちます。
**

|== Q : p | pick /a
|== R : p | pick /b /c
|== S : p | pick

p : source P /a /b /c

|-- P  /a 1  /b 10  /c 100
|-- P  /a 1  /b 10  /c 150
|-- P  /a 2  /b 20  /c 200
