** -*- koshu -*-
**
**  move /P ... -to /N ... は、項目名を変更します。
**  入力関係の項目 /P を /N に置き換えた関係を出力します。
**
**  move /P ... -to /N ... は、rename /N /P ... と同じ効果をもちます。
**  項目数が多いときは rename を使い、少ないときは move を使うことをおすすめします。
**

|== Q : p | move /a /b -to /x /y
|== R : p | rename /x /a
                   /y /b

p : source P /a /b /c

|-- P  /a 1  /b 10  /c 100
|-- P  /a 1  /b 10  /c 150
|-- P  /a 2  /b 20  /c 200
