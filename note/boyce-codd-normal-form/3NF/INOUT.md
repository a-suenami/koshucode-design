# I/O List

- [3nf-output.k](#3nf-outputk)
- koshu 3nf-output.k [3NF-DATA.k](#3nf-datak)
- koshu 3nf-output.k [3NF-VIOLATED.k](#3nf-violatedk)



## [3nf-output.k](3nf-output.k)

```
** -*- koshu -*-
**
**  概要
**    第 3 正規形の「近くのお店」データをボイス・コッド正規形に変換します。
**    「近くのお店」のデータを読み込み、その制約条件を検査し、
**    問題がなければ、ボイス・コッド正規形に分解して出力します。
**

|=V FD-OF-NEAREST-SHOP : nearest-shop | duplicate /person /shop-type
|=V FD-OF-SHOP-TYPE    : shop-type    | duplicate /shop

nearest-shop     : source NEAREST-SHOP /person /shop-type /nearest-shop
shop-near-person : nearest-shop | pick /person /nearest-shop
shop-type        : nearest-shop | pick /nearest-shop /shop-type 
                                | rename /shop /nearest-shop

|== SHOP-NEAR-PERSON -fore /person : shop-near-person
|== SHOP-TYPE : shop-type 

```



## [3NF-DATA.k](3NF-DATA.k)

```
** -*- koshu -*-
**
**  概要
**    ボイス・コッド正規形へ分解可能な例題
**
**  使用例
**    koshu 3nf-output.k 3NF-DATA.k
**
**  参考
**    この例題は Wikipedia から引用したものです。
**    http://en.wikipedia.org/wiki/Boyce-Codd_normal_form
**


** ----------------------------------------------------------------------
**  判断種
**    NEAREST-SHOP
**
**  データ解釈
**    /person さんの家から一番近い /shop-type の種類のお店は
**    /nearest-shop である。
**
**  制約
**    つぎのふたつの関数従属性が成立します。
**    /person /shop-type -> /nearest-shop
**    /nearest-shop -> /shop-type
**

|-- NEAREST-SHOP  /person 'Davidson  /shop-type 'Optician     /nearest-shop "Eagle Eye"
|-- NEAREST-SHOP  /person 'Davidson  /shop-type 'Hairdresser  /nearest-shop "Snippets"
|-- NEAREST-SHOP  /person 'Wright    /shop-type 'Bookshop     /nearest-shop "Merlin Books"
|-- NEAREST-SHOP  /person 'Fuller    /shop-type 'Bakery       /nearest-shop "Doughy's"
|-- NEAREST-SHOP  /person 'Fuller    /shop-type 'Hairdresser  /nearest-shop "Sweeney Todd's"
|-- NEAREST-SHOP  /person 'Fuller    /shop-type 'Optician     /nearest-shop "Eagle Eye"

```

Command `koshu 3nf-output.k 3NF-DATA.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    3nf-output.k
**    3NF-DATA.k
**

|-- SHOP-NEAR-PERSON  /person 'Davidson  /nearest-shop "Eagle Eye"
|-- SHOP-NEAR-PERSON  /person 'Davidson  /nearest-shop 'Snippets
|-- SHOP-NEAR-PERSON  /person 'Wright  /nearest-shop "Merlin Books"
|-- SHOP-NEAR-PERSON  /person 'Fuller  /nearest-shop "Doughy's"
|-- SHOP-NEAR-PERSON  /person 'Fuller  /nearest-shop "Sweeney Todd's"

|-- SHOP-NEAR-PERSON  /person 'Fuller  /nearest-shop "Eagle Eye"

*** 6 judges

|-- SHOP-TYPE  /shop "Eagle Eye"  /shop-type 'Optician
|-- SHOP-TYPE  /shop 'Snippets  /shop-type 'Hairdresser
|-- SHOP-TYPE  /shop "Merlin Books"  /shop-type 'Bookshop
|-- SHOP-TYPE  /shop "Doughy's"  /shop-type 'Bakery
|-- SHOP-TYPE  /shop "Sweeney Todd's"  /shop-type 'Hairdresser

*** 5 judges

**
**  SUMMARY
**       6 judges on SHOP-NEAR-PERSON
**       5 judges on SHOP-TYPE
**      11 judges in total
**
```



## [3NF-VIOLATED.k](3NF-VIOLATED.k)

```
** -*- koshu -*-
**
**  概要
**    「近くのお店」で不備のあるデータ。
**    関数従属性 /nearest-shop -> /shop-type をみたさない組があります。
**    おそらく、上のデータをコピーしたままになっているのでしょう。
**
**  使用例
**    koshu 3nf-output.k 3NF-VIOLATED.k
**

|-- NEAREST-SHOP  /person 'Davidson  /shop-type 'Optician     /nearest-shop "Eagle Eye"
|-- NEAREST-SHOP  /person 'Davidson  /shop-type 'Hairdresser  /nearest-shop "Snippets"
|-- NEAREST-SHOP  /person 'Wright    /shop-type 'Bookshop     /nearest-shop "Merlin Books"
|-- NEAREST-SHOP  /person 'Fuller    /shop-type 'Bakery       /nearest-shop "Doughy's"
|-- NEAREST-SHOP  /person 'Fuller    /shop-type 'Hairdresser  /nearest-shop "Doughy's"    ** 間違い
|-- NEAREST-SHOP  /person 'Fuller    /shop-type 'Optician     /nearest-shop "Eagle Eye"

```

Command `koshu 3nf-output.k 3NF-VIOLATED.k` exits with 1 and produces:

```
** -*- koshu -*-
**
**  INPUT
**    3nf-output.k
**    3NF-VIOLATED.k
**

|-V FD-OF-SHOP-TYPE  /shop "Doughy's"  /shop-type 'Hairdresser
|-V FD-OF-SHOP-TYPE  /shop "Doughy's"  /shop-type 'Bakery

*** 2 judges

**
**  SUMMARY (VIOLATED)
**       2 judges on FD-OF-SHOP-TYPE
**       2 judges in total
**
```



## command

This document is produced by the command:

```
koshu-inout.sh -s -g koshu 3nf-output.k
```
