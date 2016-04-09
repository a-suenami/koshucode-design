# I/O List

- [bcnf-output.k](#bcnf-outputk)
- koshu bcnf-output.k [BCNF-DATA.k](#bcnf-datak)
- koshu bcnf-output.k [BCNF-DATA.k BCNF-VIOLATED.k](#bcnf-datak-bcnf-violatedk)



## [bcnf-output.k](bcnf-output.k)

```
** -*- koshu -*-
**
**  概要
**    ボイス・コッド正規形の「近くのお店」のデータを読み込み、
**    制約条件を検査した上で、第 3 正規形に変換します。
**

|=V FD-OF-NEAREST-SHOP :
  nearest-shop | duplicate /person /shop-type
  --forward /person /shop-type
|=V FD-OF-SHOP-TYPE :
  shop-type | duplicate /shop

shop-type        : source SHOP-TYPE /shop /shop-type
shop-near-person : source SHOP-NEAR-PERSON /person /nearest-shop
nearest-shop     : shop-type
                 | rename /nearest-shop /shop
                 | meet shop-near-person

|== NEAREST-SHOP : nearest-shop  --forward /person /shop-type

```



## BCNF-DATA.k

```
** -*- koshu -*-
**
**  概要
**    ボイス・コッド正規形の例題
**
**  使用例
**    koshu bcnf-output.k BCNF-DATA.k
**
**  参考
**    この例題は Wikipedia から引用したものです。
**    http://en.wikipedia.org/wiki/Boyce-Codd_normal_form
**


** ------------------------------------------------------------------
**  判断種
**    SHOP-TYPE
**
**  データ解釈
**    店 /shop の種類は /shop-type である。
**
**  制約
**    つぎの関数従属性が成立します。
**    /shop -> /shop-type
**

|-- SHOP-TYPE  /shop "Eagle Eye"       /shop-type 'Optician
|-- SHOP-TYPE  /shop "Snippets"        /shop-type 'Hairdresser
|-- SHOP-TYPE  /shop "Merlin Books"    /shop-type 'Bookshop
|-- SHOP-TYPE  /shop "Doughy's"        /shop-type 'Bakery
|-- SHOP-TYPE  /shop "Sweeney Todd's"  /shop-type 'Hairdresser


** ------------------------------------------------------------------
**  判断種
**    SHOP-NEAR-PERSON
**
**  データ解釈
**    /person の家から一番近い店は、店の種類ごとに、
**    /nearest-shop である。
**
**  制約
**    SHOP-TYPE の /shop を /nearest-shop と変更して
**    組み合わせたとき、つぎの関数従属性が成立します。
**    /person /shop-type -> /nearest-shop
**

|-- SHOP-NEAR-PERSON  /person 'Davidson  /nearest-shop "Eagle Eye"
|-- SHOP-NEAR-PERSON  /person 'Davidson  /nearest-shop "Snippets"
|-- SHOP-NEAR-PERSON  /person 'Wright    /nearest-shop "Merlin Books"
|-- SHOP-NEAR-PERSON  /person 'Fuller    /nearest-shop "Doughy's"
|-- SHOP-NEAR-PERSON  /person 'Fuller    /nearest-shop "Sweeney Todd's"
|-- SHOP-NEAR-PERSON  /person 'Fuller    /nearest-shop "Eagle Eye"

```

Command `koshu bcnf-output.k BCNF-DATA.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    bcnf-output.k
**    BCNF-DATA.k
**
**  OUTPUT
**    <stdout>
**

|-- NEAREST-SHOP  /person 'Fuller  /shop-type 'Optician  /nearest-shop "Eagle Eye"
|-- NEAREST-SHOP  /person 'Davidson  /shop-type 'Optician  /nearest-shop "Eagle Eye"
|-- NEAREST-SHOP  /person 'Davidson  /shop-type 'Hairdresser  /nearest-shop "Snippets"
|-- NEAREST-SHOP  /person 'Wright  /shop-type 'Bookshop  /nearest-shop "Merlin Books"
|-- NEAREST-SHOP  /person 'Fuller  /shop-type 'Bakery  /nearest-shop "Doughy's"

|-- NEAREST-SHOP  /person 'Fuller  /shop-type 'Hairdresser  /nearest-shop "Sweeney Todd's"

*** 6 judges

**
**  SUMMARY
**      no judges on FD-OF-NEAREST-SHOP
**      no judges on FD-OF-SHOP-TYPE
**       6 judges on NEAREST-SHOP
**       6 judges in total
**
```



## BCNF-DATA.k BCNF-VIOLATED.k

```
** -*- koshu -*-
**
**  概要
**    ボイス・コッド正規形の例題
**
**  使用例
**    koshu bcnf-output.k BCNF-DATA.k
**
**  参考
**    この例題は Wikipedia から引用したものです。
**    http://en.wikipedia.org/wiki/Boyce-Codd_normal_form
**


** ------------------------------------------------------------------
**  判断種
**    SHOP-TYPE
**
**  データ解釈
**    店 /shop の種類は /shop-type である。
**
**  制約
**    つぎの関数従属性が成立します。
**    /shop -> /shop-type
**

|-- SHOP-TYPE  /shop "Eagle Eye"       /shop-type 'Optician
|-- SHOP-TYPE  /shop "Snippets"        /shop-type 'Hairdresser
|-- SHOP-TYPE  /shop "Merlin Books"    /shop-type 'Bookshop
|-- SHOP-TYPE  /shop "Doughy's"        /shop-type 'Bakery
|-- SHOP-TYPE  /shop "Sweeney Todd's"  /shop-type 'Hairdresser


** ------------------------------------------------------------------
**  判断種
**    SHOP-NEAR-PERSON
**
**  データ解釈
**    /person の家から一番近い店は、店の種類ごとに、
**    /nearest-shop である。
**
**  制約
**    SHOP-TYPE の /shop を /nearest-shop と変更して
**    組み合わせたとき、つぎの関数従属性が成立します。
**    /person /shop-type -> /nearest-shop
**

|-- SHOP-NEAR-PERSON  /person 'Davidson  /nearest-shop "Eagle Eye"
|-- SHOP-NEAR-PERSON  /person 'Davidson  /nearest-shop "Snippets"
|-- SHOP-NEAR-PERSON  /person 'Wright    /nearest-shop "Merlin Books"
|-- SHOP-NEAR-PERSON  /person 'Fuller    /nearest-shop "Doughy's"
|-- SHOP-NEAR-PERSON  /person 'Fuller    /nearest-shop "Sweeney Todd's"
|-- SHOP-NEAR-PERSON  /person 'Fuller    /nearest-shop "Eagle Eye"

```
```
** -*- koshu -*-
**
**  概要
**    ボイス・コッド正規形で制約違反になる例題
**
**  使用例
**    koshu bcnf-output.k BCNF-DATA.k BCNF-VIOLATED.k
**

**  /person 'Davidson さんの近くの店の情報として、
**  /shop-type 'Hairdressor (美容院) がふたつ出てくることで
**  制約 FD-OF-NEAREST-SHOP に違反します。

|-- SHOP-NEAR-PERSON  /person 'Davidson  /nearest-shop "Sweeney Todd's"

```

Command `koshu bcnf-output.k BCNF-DATA.k BCNF-VIOLATED.k` exits with 1 and produces:

```
** -*- koshu -*-
**
**  INPUT
**    bcnf-output.k
**    BCNF-DATA.k
**    BCNF-VIOLATED.k
**
**  OUTPUT
**    <stdout>
**

|-V FD-OF-NEAREST-SHOP  /person 'Davidson  /shop-type 'Hairdresser  /nearest-shop "Sweeney Todd's"
|-V FD-OF-NEAREST-SHOP  /person 'Davidson  /shop-type 'Hairdresser  /nearest-shop "Snippets"

*** 2 judges

**
**  SUMMARY (VIOLATED)
**       2 judges on FD-OF-NEAREST-SHOP
**      no judges on FD-OF-SHOP-TYPE
**      no judges on NEAREST-SHOP
**       2 judges in total
**
```



## command

This document is produced by the command:

```
koshu-inout.sh -s -f args koshu bcnf-output.k
```
