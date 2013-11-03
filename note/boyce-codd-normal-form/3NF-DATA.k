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

