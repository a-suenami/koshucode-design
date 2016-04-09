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

