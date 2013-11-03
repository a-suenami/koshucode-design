# [近くのお店][README]


ボイス・コッド正規形 (BCNF: Boyce-Codd normal form)、
別名、ヘス正規形 (Heath normal form) は、
関数従属性に関する正規形です。
関数従属性にもとづいて関係を分解することで、
BCNF が得られます。関係モデルにおける従属性には、
関数従属性と、その一般化である交わり従属性 (結合従属性) のふたつがあり、
関数従属性にもとづいて関係を完全に分解すると BCNF が得られ、
交わり従属性にもとづいて関係を完全に分解すると第 5 正規形が得られます。


## 例題

ここでは、[Wikipedia] に掲載されている「近くのお店」の例を、
甲州記法に書き直します。この例では、ある人 `/person` の家から
一番近い店 `/nearest-shop` の情報を扱います。
一番近い本屋や、一番近いパン屋などを一覧にしたもので、
この一覧から、お店の種類 `/shop-type` ごとに一番近い店が分かります。

たとえば、`/person 'Davidson` さんの家から一番近い
`/shop-type 'Optician` (めがね) 屋さんは
`/nearest-shop "Eagle Eye"` であるという情報が正しいならば、
判断種 `NEAREST-SHOP` の肯定判断として書くことにします。

    |-- NEAREST-SHOP  /person 'Davidson  /shop-type 'Optician     /nearest-shop "Eagle Eye"
    |-- NEAREST-SHOP  /person 'Davidson  /shop-type 'Hairdresser  /nearest-shop "Snippets"
    |-- NEAREST-SHOP  /person 'Wright    /shop-type 'Bookshop     /nearest-shop "Merlin Books"
    |-- NEAREST-SHOP  /person 'Fuller    /shop-type 'Bakery       /nearest-shop "Doughy's"
    |-- NEAREST-SHOP  /person 'Fuller    /shop-type 'Hairdresser  /nearest-shop "Sweeney Todd's"
    |-- NEAREST-SHOP  /person 'Fuller    /shop-type 'Optician     /nearest-shop "Eagle Eye"

これらの判断には、ふたつの関数従属性があります。

 - 人とお店の種類が決まれば、一番近いお店がひとつ決まるので、
   `/person` `shop-type` → `/nearest-shop` という関数従属性が成り立ちます。

 - お店は、ただひとつの種類に分類されるという仮定をおくと、
   `/nearest-shop` → `/shop-type` という関数従属性が成り立ちます。

この例のような `/A` `/B` → `/C` と `/C` → `/B` というパターンの従属性は、
BCNF に変換可能な [第 3 正規形][3NF] の典型的な例として知られており、
項目 `/A` `/B` `/C` からなる関係 R1 を項目 `/A` `/C` からなる関係 R2 と
項目 `/C` `/B` からなる関係 R3 に分解することで、冗長性を少なくできます。
もともとの `/A` `/B` → `/C` という関数従属性は、
ふたつの関係 R2 と R3 にまたがる制約条件として成立することになります。


## 分解

判断種 `NEAREST-SHOP` を [ボイス・コッド正規形][BCNF] に分解すると、
店の種類をあらわす判断 `SHOP-TYPE` `/shop` `/shop-type`

    |-- SHOP-TYPE  /shop "Eagle Eye"       /shop-type 'Optician
    |-- SHOP-TYPE  /shop 'Snippets         /shop-type 'Hairdresser
    |-- SHOP-TYPE  /shop "Merlin Books"    /shop-type 'Bookshop
    |-- SHOP-TYPE  /shop "Doughy's"        /shop-type 'Bakery
    |-- SHOP-TYPE  /shop "Sweeney Todd's"  /shop-type 'Hairdresser

と、一番近くの店をあらわす判断 `SHOP-NEAR-PERSON` `/person` `/nearest-shop`
に分けられます。

    |-- SHOP-NEAR-PERSON  /person 'Davidson  /nearest-shop "Eagle Eye"
    |-- SHOP-NEAR-PERSON  /person 'Davidson  /nearest-shop "Snippets"
    |-- SHOP-NEAR-PERSON  /person 'Wright    /nearest-shop "Merlin Books"
    |-- SHOP-NEAR-PERSON  /person 'Fuller    /nearest-shop "Doughy's"
    |-- SHOP-NEAR-PERSON  /person 'Fuller    /nearest-shop "Sweeney Todd's"
    |-- SHOP-NEAR-PERSON  /person 'Fuller    /nearest-shop "Eagle Eye"

もとの判断 `NEAREST-SHOP` を復元するには、
判断 `SHOP-TYPE` の項目 `/shop` の名前を `/nearest-shop` に変更して、
上のふたつのデータの交わりを計算します。
具体的には、つぎの計算式の `nearest-shop` を
肯定判断として書き出しすと `NEAREST-SHOP` と同じ情報が得られます。

    shop-type        : source SHOP-TYPE /shop /shop-type
    shop-near-person : source SHOP-NEAR-PERSON /person /nearest-shop
    nearest-shop     : shop-type | rename /nearest-shop /shop | meet shop-near-person

関係 `nearest-shop` では、関数従属性 `/person` `/shop-type`
→ `/nearest-shop` が成立する必要があります。
これは、関係 `shop-type` と関係 `shop-near-person` というふたつの関係
にまたがる制約条件になります。



[Wikipedia]: http://en.wikipedia.org/wiki/Boyce-Codd_normal_form
[README]: README.md
[3NF]: 3NF.md
[BCNF]: BCNF.md

