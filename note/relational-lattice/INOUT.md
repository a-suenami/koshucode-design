# I/O List

- koshu [lattice.k](#latticek)



## [lattice.k](lattice.k)

```
** -*- koshu -*-
**
**  概要
**    関係束のふたつの演算
**
**  使用例
**    koshu lattice.k
** 

|-- A  /v 1  /w 20  /x 100            ** 判断種 A の判断
|-- A  /v 2  /w 30  /x 100            ** 項目 /v /w /x からなる
|-- A  /v 2  /w 40  /x 120            ** 判断の形式は : |-- 判断種 /項目名 項目内容 ...

|-- B  /w 30  /x 100  /y 10  /z 140   ** 判断種 B の判断
|-- B  /w 40  /x 120  /y 10  /z 150   ** 項目 /w /x /y /z からなる
|-- B  /w 50  /x 140  /y 20  /z 150   ** |-- は判断記号で判断が成立することをあらわす

a : source A /v /w /x                 ** 判断種 A の判断集合を関係として読み込み
b : source B /w /x /y /z              ** 判断種 B の判断集合を関係として読み込み

c : a | join b                        ** 結び   : 関係写像 a の出力を関係写像 join b で変換
d : a | meet b                        ** 交わり : 関係写像 a の出力を関係写像 meet b で変換

|== C : c                             ** 関係写像 c の出力を判断種 C の判断集合として書き出し
|== D : d                             ** 関係写像 d の出力を判断種 D の判断集合として書き出し
```

Command `koshu lattice.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    lattice.k
**

|-- C  /w 20  /x 100
|-- C  /w 30  /x 100
|-- C  /w 40  /x 120
|-- C  /w 50  /x 140

*** 4 judges

|-- D  /y 10  /z 140  /v 2  /w 30  /x 100
|-- D  /y 10  /z 150  /v 2  /w 40  /x 120

*** 2 judges

**
**  SUMMARY
**       4 judges on C
**       2 judges on D
**       6 judges in total
**
```



## command

This document is produced by the command:

```
koshu-inout.sh -s -g koshu
```
