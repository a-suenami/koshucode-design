# ASCII コード


甲州記法で ASCII コード表をつくる方法を試してみましょう。
このノートは使用例は、甲州計算機 0.60 で作成したもので、
[入出力リスト][INOUT.md] に一覧されています。

0 から 127 までの数値を生成して、それぞれに対して `char` 関数を
適用するという方法で、ASCII コードの一覧をつくります。
この計算を行う演算子 `ascii-table` を定義しておきます。
(現段階では、出力時に項目の順番を変更する方法が実装されていないので、
実際には、最後に `pick` もついています)

```
ascii-table :
  range @code -from 0 -to 127      ** 0 から 127 まで生成し
    | add @char ( char @code )     ** 関数 char を適用する
    | pick @code @char
```

この演算子を使って、文字コード `/n` と文字 `/c` からなる関係をつくります。
この関係を、人間が読みやすくするために `chunk` で分割して、表形式で表示します。

計算式と出力結果:

```
|== TABLE -order -table
  : ascii-table -code /n -char /c
  | chunk /0 /1 /2 /3 /4 /5 /6 /7 -order /n
```

```
/0           /1           /2          /3         /4         /5         /6          /7
------------ ------------ ----------- ---------- ---------- ---------- ----------- --------------
/n   /c      /n   /c      /n   /c     /n   /c    /n   /c    /n   /c    /n    /c    /n    /c
---- ------- ---- ------- ---- ------ ---- ----- ---- ----- ---- ----- ----- ----- ----- --------
0    <c0>    16   <c16>   32   " "    48   '0    64   "@"   80   'P    96    "`"   112   'p
1    <c1>    17   <c17>   33   '!     49   '1    65   'A    81   'Q    97    'a    113   'q
2    <c2>    18   <c18>   34   <qq>   50   '2    66   'B    82   'R    98    'b    114   'r
3    <c3>    19   <c19>   35   "#"    51   '3    67   'C    83   'S    99    'c    115
...
```

つぎの例は、文字をそのグループごとに分類した表をつくります。
関数 `char-group-1` は文字 (1 文字) のグループを返します。

計算式と出力結果:

```
|== GROUP -fore /g -order -table
  : ascii-table -code /n -char /c
  | add /g ( char-group-1 /c )
  | nest /n /c -to /nc
  | for /nc ( chunk /0 /1 /2 /3 -order /n )
```

```
/g           /nc
------------ -----------------------------------------------------
'letter      /0          /1           /2            /3
             ----------- ------------ ------------- --------------
             /n   /c     /n   /c      /n    /c      /n    /c
             ---- ------ ---- ------- ----- ------- ----- --------
             65   'A     78   'N      97    'a      110   'n
             66   'B     79   'O      98    'b      111   'o
             67   'C     80   'P      99    'c      112   'p
             ...

'number      /0          /1           /2            /3
             ----------- ------------ ------------- --------------
             /n   /c     /n   /c      /n    /c      /n    /c
             ---- ------ ---- ------- ----- ------- ----- --------
             48   '0     51   '3      54    '6      57    '9
             49   '1     52   '4      55    '7
             50   '2     53   '5      56    '8
```

[INOUT.md]:  INOUT.md
