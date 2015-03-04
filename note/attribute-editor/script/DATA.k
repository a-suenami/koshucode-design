** -*- koshu -*-
**
**  概要
**    属性編集の使用例
**
**  実行方法
**    koshu DATA.k fill.k
**
**  属性編集
**    N : R --attr E   関係写像 R に名前 N をつけ E で属性を編集する
**    fill E ...       無標属性に E ... を補う
**    opt -N E         有標属性 -N がないとき E を補う
**    add -N E         有標属性 -N を、内容を E として追加
**

|-- P  /a 1  /b 20  /c 100
|-- P  /a 1  /b 30  /c 120
|-- P  /a 2  /b 30  /c 150

p : source P /a /b /c
