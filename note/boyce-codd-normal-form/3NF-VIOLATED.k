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

