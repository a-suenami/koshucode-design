** -*- koshu -*-
**
**  概要
**    導出関係写像の使用例
**
**  使用法
**    koshu derive.k
**

|--  P  /a 1  /b 30
|--  P  /a 1  /b 40
|--  P  /a 2  /b 50

**
**  導出写像なし
**

|== Q : source P /a /b | add /c ( /a + /b )

**
**  スロットなし
**

|== R : p | a

p : source P /a /b
a : add /c ( /a + /b )

**
**  名前スロット
**

|== S : p | b -n 100
|== T : p | b -n 100 + 100

b : add /c ( /a + /b + @n )

**
**  位置スロット
**

|== U : p | c 100
|== V : p | c ( 100 + 100 )

c : add /c ( /a + /b + @'1 )
