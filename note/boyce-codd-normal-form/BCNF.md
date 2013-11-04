# [近くのお店][top] / ボイス・コッド正規形


「近くのお店」をあらわすボイス・コッド正規形のデータは、
分解された個々の関係そのものではなく、交わりによって合成した関係に対して、
関数従属性 `/person` `/shop-type` → `/nearest-shop` が定義されます。
このノートでは、その使用例をみてみます。


## データの定義: SHOP-TYPE

#### 判断

`SHOP-TYPE` --
`/shop` `/shop-type`

#### データ解釈

お店 `/shop` の種類は `/shop-type` である。

#### 制約条件

お店は、ただひとつの種類に分類されるという仮定をおくと、
`/shop` → `/shop-type` という関数従属性が成り立ちます。

#### 具体例

    |-- SHOP-TYPE  /shop "Eagle Eye"       /shop-type 'Optician
    |-- SHOP-TYPE  /shop 'Snippets         /shop-type 'Hairdresser
    |-- SHOP-TYPE  /shop "Merlin Books"    /shop-type 'Bookshop
    |-- SHOP-TYPE  /shop "Doughy's"        /shop-type 'Bakery
    |-- SHOP-TYPE  /shop "Sweeney Todd's"  /shop-type 'Hairdresser



## データの定義: SHOP-NEAR-PERSON

#### 判断

`SHOP-NEAR-PERSON` --
`/person` `/nearest-shop`

#### データ解釈

`/person` の家から一番近い店は、店の種類ごとに、
`/nearest-shop` である。

#### 制約条件

`SHOP-TYPE` の項目 `/shop` を `/nearest-shop` と名称変更して
組み合わせたとき、`/person` `/shop-type` → `/nearest-shop`
という関数従属性が成立します。

#### 具体例

    |-- SHOP-NEAR-PERSON  /person 'Davidson  /nearest-shop "Eagle Eye"
    |-- SHOP-NEAR-PERSON  /person 'Davidson  /nearest-shop "Snippets"
    |-- SHOP-NEAR-PERSON  /person 'Wright    /nearest-shop "Merlin Books"
    |-- SHOP-NEAR-PERSON  /person 'Fuller    /nearest-shop "Doughy's"
    |-- SHOP-NEAR-PERSON  /person 'Fuller    /nearest-shop "Sweeney Todd's"
    |-- SHOP-NEAR-PERSON  /person 'Fuller    /nearest-shop "Eagle Eye"



## 計算例

判断集合 `SHOP-TYPE` と `SHOP-NEAR-PERSON`を読み込み、
その交わりを求める計算を考えましょう。
交わりは、つぎのデータ解釈をもちます。

 - `/person` さんの家から一番近い `/shop-type` の種類のお店は
   `/nearest-shop` である。

判断 `SHOP-TYPE` の項目 `/shop` を `/nearest-shop` に変更して、
`SHOP-NEAR-PERSON` との交わりを計算し、
その結果を判断 `NEAREST-SHOP` として書き出します。
これは、つぎのような計算式によって、書きあらわせます。

    shop-type        : source SHOP-TYPE /shop /shop-type
    shop-near-person : source SHOP-NEAR-PERSON /person /nearest-shop
    nearest-shop     : shop-type
                     | rename /nearest-shop /shop
                     | meet shop-near-person
    
    |== NEAREST-SHOP : nearest-shop

この計算を行う前に、関係従属性を正しく満たしているかどうか確認するため、
関数従属性 `/person` `/shop-type` → `/nearest-shop` と、
`/shop` → `/shop-type` を検査します。

    |=V FD-OF-NEAREST-SHOP : nearest-shop | duplicate /person /shop-type
    |=V FD-OF-SHOP-TYPE    : shop-type    | duplicate /shop
      
入力データが [第 3 正規形][3NF] のときにも同様の検査をしており、
第 3 正規形とボイス・コッド正規形のどちらで表現しても、
同じ情報の異なる表現であるといえます。
ただし、冗長さが異なることに注意しなければなりません。

現実の設計では、おそらく、`SHOP-TYPE` を店舗情報として独立して扱い、
`NEAREST-SHOP` を入力データとして受け取ったら、それが
`SHOP-TYPE` と整合性があるか検査するという形になるでしょう。
`NEAREST-SHOP` をデータベースに保存するときは
`SHOP-NEAR-PERSON` の形式に変換した上で保存します。
    
これらの計算式を含むファイル [`bcnf-output.k`][bcnf-output] と
判断集合を含むファイル [`BCNF-DATA.k`][BCNF-DATA] を与えて甲州計算機を実行します。

    koshu bcnf-output.k BCNF-DATA.k

その結果、近くのお店をあらわす判断集合が出力されます。

    |-- NEAREST-SHOP  /person 'Fuller  /shop-type 'Optician  /nearest-shop "Eagle Eye"
    |-- NEAREST-SHOP  /person 'Davidson  /shop-type 'Optician  /nearest-shop "Eagle Eye"
    |-- NEAREST-SHOP  /person 'Davidson  /shop-type 'Hairdresser  /nearest-shop 'Snippets
    |-- NEAREST-SHOP  /person 'Wright  /shop-type 'Bookshop  /nearest-shop "Merlin Books"
    |-- NEAREST-SHOP  /person 'Fuller  /shop-type 'Bakery  /nearest-shop "Doughy" #q "s"
    |-- NEAREST-SHOP  /person 'Fuller  /shop-type 'Hairdresser  /nearest-shop "Sweeney Todd" #q "s"




## 制約に違反するデータ

「近くのお店」のデータが間違いを含んでいるとき、どのようになるかをみてみます。
ここでは、`/person 'Davidson` さんの近くの `/shop-type 'Hairdresser` (美容院)
として、ふたつのお店が割り当てられているという状況をつくります。
これを行うために、つぎの判断を追加します。

    |-- SHOP-NEAR-PERSON  /person 'Davidson  /nearest-shop "Sweeney Todd's"

この判断をファイル [`BCNF-VIOLATED.k`][BCNF-VIOLATED] に保存し、
[`BCNF-DATA.k`][BCNF-DATA] といっしょにして甲州計算機を実行します。

    koshu bcnf-output.k BCNF-DATA.k BCNF-VIOLATED.k

このデータセットは制約条件

    |=V FD-OF-NEAREST-SHOP : nearest-shop | duplicate /person /shop-type

に違反するため、違反したデータが報告され、
甲州計算機はステータス 1 で終了します。

    |-- FD-OF-NEAREST-SHOP  /person 'Davidson  /shop-type 'Hairdresser  /nearest-shop "Sweeney Todd" #q "s"
    |-- FD-OF-NEAREST-SHOP  /person 'Davidson  /shop-type 'Hairdresser  /nearest-shop 'Snippets



[top]:            .
[3NF]:            3NF.md
[BCNF]:           BCNF.md
[BCNF-DATA]:      BCNF-DATA.k
[BCNF-VIOLATED]:  BCNF-VIOLATED.k
[bcnf-output]:    bcnf-output.k

