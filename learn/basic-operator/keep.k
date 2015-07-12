** -*- koshu -*-
**
**  keep E は、式 E が成立する組のみを残します。
**  式 E に含まれる入力関係の項目名が、
**  各組の項目内容を置き換えられた上で計算されます。
**
**  keep E は omit not E と同じ意味になります。
**

|== Q : p | keep /c = 100 or /c = 200
|== R : p | omit not ( /c = 100 or /c = 200 )

p : source P /a /b /c

|-- P  /a 1  /b 10  /c 100
|-- P  /a 1  /b 10  /c 150
|-- P  /a 2  /b 20  /c 200
