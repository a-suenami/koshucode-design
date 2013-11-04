# [近くのお店][top] / 第 3 正規形


近くのお店をあらわす判断 `NEAREST-SHOP` は、
ボイス・コッド正規形ではない第 3 正規形のデータです。
このデータは少しだけ冗長ですが、制約条件をきちんと定式化すれば、
異常なデータが入り込むことはありません。

    |-- NEAREST-SHOP  /person 'Davidson  /shop-type 'Optician     /nearest-shop "Eagle Eye"
    |-- NEAREST-SHOP  /person 'Davidson  /shop-type 'Hairdresser  /nearest-shop "Snippets"
    |-- NEAREST-SHOP  /person 'Wright    /shop-type 'Bookshop     /nearest-shop "Merlin Books"
    |-- NEAREST-SHOP  /person 'Fuller    /shop-type 'Bakery       /nearest-shop "Doughy's"
    |-- NEAREST-SHOP  /person 'Fuller    /shop-type 'Hairdresser  /nearest-shop "Sweeney Todd's"
    |-- NEAREST-SHOP  /person 'Fuller    /shop-type 'Optician     /nearest-shop "Eagle Eye"



## データの定義: NEAREST-SHOP

近くのお店をあらわすデータを、その判断 (判断種と項目)、
データ解釈、制約条件に分けて記述すると、つぎのようになります。


#### 判断

`NEAREST-SHOP` --
`/person` `/shop-type` `/nearest-shop`

#### データ解釈

`/person` さんの家から一番近い `/shop-type` の種類のお店は
`/nearest-shop` である。

#### 制約条件

人とお店の種類が決まれば、一番近いお店がひとつ決まるので、
`/person` `shop-type` → `/nearest-shop` という関数従属性が成り立ちます。

お店は、ただひとつの種類に分類されるという仮定をおくと、
`/nearest-shop` → `/shop-type` という関数従属性が成り立ちます。



## 計算例

判断集合 `NEAREST-SHOP` を読み込み、
それをボイス・コッド正規形に変換するという計算を考えましょう。

まず、`NEAREST-SHOP` は、`/person` `/shop-type` `/nearest-shop` の
3 項目をもっていますが、関数従属性 `/nearest-shop` → `/shop-type` を使うと、
`/person` `/nearest-shop` だけあれば十分であることがわかります。
この 2 項目だけをもつ判断を `SHOP-NEAR-PERSON` とします。

つぎに、`/nearest-shop` から `/shop-type` をもとめるための情報を、
「お店 `/shop` の種類は `/shop-type` である」
という判断 `SHOP-TYPE` で表現します。
ここで、項目名 `/nearest-shop` を `/shop` に変えています。

判断集合 `NEAREST-SHOP` を読み出し、
それを判断 `SHOP-NEAR-PERSON` と `SHOP-TYPE`
へと変換する計算は、つぎのように書けます。

    nearest-shop     : source NEAREST-SHOP /person /shop-type /nearest-shop
    shop-near-person : nearest-shop | pick /person /nearest-shop
    shop-type        : nearest-shop | pick /nearest-shop /shop-type 
                                    | rename /shop /nearest-shop

    |== SHOP-NEAR-PERSON : shop-near-person
    |== SHOP-TYPE        : shop-type 

この計算を行う前に、関係従属性を正しく満たしているかどうか確認するために、
関数従属性 `/person` `/shop-type` → `/nearest-shop` と、
`/shop` → `/shop-type` を検査します。

    |=V FD-OF-NEAREST-SHOP : nearest-shop | duplicate /person /shop-type
    |=V FD-OF-SHOP-TYPE    : shop-type    | duplicate /shop

この計算式を含むファイル [`3nf-output.k`][3nf-output] と
判断集合を含むファイル [`3NF-DATA.k`][3NF-DATA] を与えて甲州計算機を実行します。

    koshu 3nf-output.k 3NF-DATA.k

その結果、お店の種類をあらわす判断集合

    |-- SHOP-TYPE  /shop "Eagle Eye"  /shop-type 'Optician
    |-- SHOP-TYPE  /shop 'Snippets  /shop-type 'Hairdresser
    |-- SHOP-TYPE  /shop "Merlin Books"  /shop-type 'Bookshop
    |-- SHOP-TYPE  /shop "Doughy" #q "s"  /shop-type 'Bakery
    |-- SHOP-TYPE  /shop "Sweeney Todd" #q "s"  /shop-type 'Hairdresser

と、人と近くのお店だけを抜き出した判断集合が得られます。

    |-- SHOP-NEAR-PERSON  /person 'Davidson  /nearest-shop "Eagle Eye"
    |-- SHOP-NEAR-PERSON  /person 'Davidson  /nearest-shop 'Snippets
    |-- SHOP-NEAR-PERSON  /person 'Wright  /nearest-shop "Merlin Books"
    |-- SHOP-NEAR-PERSON  /person 'Fuller  /nearest-shop "Doughy" #q "s"
    |-- SHOP-NEAR-PERSON  /person 'Fuller  /nearest-shop "Sweeney Todd" #q "s"
    |-- SHOP-NEAR-PERSON  /person 'Fuller  /nearest-shop "Eagle Eye"



## 制約に違反するデータ

「近くのお店」のデータが間違いを含み、制約条件をみたさないときに、
どのようになるかをみてみます。ここでは、`/nearest-shop "Doughy's"` `(Bakery)`
がパン屋さんではなく、美容院 `(Hairdresser)` にもなっているとします。
コンピュータにとっては、このお店がパン屋か美容院かは知らないですが、
ひとつのお店が、同時に、パン屋でもあり美容院でもあることはない
という約束になっているので、このデータが間違いであることがわかります。

    |-- NEAREST-SHOP  /person 'Davidson  /shop-type 'Optician     /nearest-shop "Eagle Eye"
    |-- NEAREST-SHOP  /person 'Davidson  /shop-type 'Hairdresser  /nearest-shop "Snippets"
    |-- NEAREST-SHOP  /person 'Wright    /shop-type 'Bookshop     /nearest-shop "Merlin Books"
    |-- NEAREST-SHOP  /person 'Fuller    /shop-type 'Bakery       /nearest-shop "Doughy's"
    |-- NEAREST-SHOP  /person 'Fuller    /shop-type 'Hairdresser  /nearest-shop "Doughy's"    ** 間違い
    |-- NEAREST-SHOP  /person 'Fuller    /shop-type 'Optician     /nearest-shop "Eagle Eye"

[`3NF-DATA.k`][3NF-DATA] の代わりに
[`3NF-VIOLATED.k`][3NF-VIOLATED] を与えて甲州計算機を実行します。

    koshu 3nf-output.k 3NF-VIOLATED.k

制約条件

    |=V FD-OF-SHOP-TYPE : shop-type | duplicate /shop

に違反する、つまり、この関係が空関係ではないため、
`/nearest-shop "Doughy's"` という店に、`/shop-type` として
`'Hairdresser` と `'Bakery` の両方が割り当てられているというデータが出力され、
制約違反をあらわすステータス 1 で終了します。

    |-- FD-OF-SHOP-TYPE  /nearest-shop "Doughy" #q "s"  /shop-type 'Hairdresser
    |-- FD-OF-SHOP-TYPE  /nearest-shop "Doughy" #q "s"  /shop-type 'Bakery



[top]:           ..
[3NF-DATA]:      3NF-DATA.k
[3NF-VIOLATED]:  3NF-VIOLATED.k
[3nf-output]:    3nf-output.k

