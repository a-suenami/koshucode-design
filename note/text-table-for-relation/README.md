# 表形式での関係の表示



関係を表形式で出力する方法を取り上げます。
甲州計算機は、Koshu in, Koshu out、つまり、
甲州記法で書かれたデータが入力され、
甲州記法で書かれたデータが出力されるので、
表形式のデータを、直接、出力できません。
そのため、判断集合の出力に `-with-table` を与えることで、
表が注釈として出力されます。

```
|== P -with-table : p
```

例題として、Colby さんの [A Recursive Algebra for Nested Relations]
に記載れているサンプル・データを甲州記法に変換した [DATA.k] を使います。
このデータを [stock.k] と [client.k] で変換します。
変換結果は [INOUT.md] にまとめられています。


STOCK-EXCHANGE
------------------------------------------------------------------

関係写像演算子 `nest` は指定された項目からなる入れ子の関係をつくります。
たとえば、入力関係が項目 `/a` `/b` `/c` をもっているとき、
`nest /b /c -to /r` とすると、出力される関係は項目 `/a` `/r` をもち、
`/r` の内容は、項目 `/b` `/c` をもつ関係になっています。
以下の表に対応するような関係をつくるには、
`nest /exchanges -to /exchanges-traded` とします。

```
/company /current-price /exchanges-traded /last-dividend
-------- -------------- ----------------- --------------
'XEROX   52.25          /exchanges        0.44
                        -------------
                        "NEW YORK"

'IBM     97.50          /exchanges        1.25
                        -------------
                        'TOKYO
                        "HONG KONG"
                        'LONDON
                        "NEW YORK"
```

`|==` に `-with-table` オプションを与えて判断集合を出力すると、
このような表形式がいっしょに出力されます。

```
|== STOCK-EXCHANGE -with-table -fore /company /current-price
  : stock
  | meet exchange
  | nest /exchanges -to /exchanges-traded

stock    : source STOCK /company /current-price /last-dividend
exchange : source EXCHANGE /company /exchanges
```


CLIENT-ADDRESS
------------------------------------------------------------------

つぎは、2 階層の入れ子の関係をつくってみましょう。
1 階層の入れ子は `nest` でつくれるので、
`nest` でされた入れ子関係のなかで、さらに `nest`します。
そのためには `for` のなかで 2 回目の `nest` を実行します。
関係写像 `for /P R` は、入れ子の関係 `/P` に対して、
関係写像 `R` を適用し、その結果で `/P` を置き換えます。

```
|== CLIENT-ADDRESS -with-table -fore /name /address
  : client
  | meet address
  | nest /company /purchase-price /date /no -to /investments
  | for /investments ( nest /purchase-price /date /no -to /shares )

client  : source CLIENT  /name /company /purchase-price /date /no
address : source ADDRESS /name /address
```

項目 `/investments` のなかに `/shares` があり、
`/shares` のなかに `/purchase-price` `/date` `/no`
がある関係に変換され、
つぎのような表が出力されます。

```
/name          /address                /investments
-------------- ----------------------- -------------------------------------------
"John Smith"   "311 Eash 2nd. St..."   /shares                            /company
                                       ---------------------------------- --------
                                       /purchase-price /date        /no   'IBM
                                       --------------- ------------ -----
                                       89.75           "06/20/83"   200
                                       96.50           "11/10/84"   100

                                       /purchase-price /date        /no   'XEROX
                                       --------------- ------------ -----
                                       64.50           "02/10/83"   100
                                       92.50           "08/10/87"   500

"Jill Brody"   "41 North Main St..."   /shares                            /company
                                       ---------------------------------- --------
                                       /purchase-price /date        /no   'SEARS
                                       --------------- ------------ -----
                                       35.75           "12/25/87"   100

                                       /purchase-price /date        /no   'FORD
                                       --------------- ------------ -----
                                       35.50           "02/10/83"   200

                                       /purchase-price /date        /no   'EXXON
                                       --------------- ------------ -----
                                       35.00           "01/30/81"   100
                                       64.50           "01/30/82"   100
                                       59.50           "02/10/83"   200
```


セルの整列
------------------------------------------------------------------

このようなテキスト形式の表は、どのように整列されるのでしょうか。
まず、一般的な関係 `Rel c` を、項目を文字列に変換した
`Rel (Mono String)` に変換します。
つぎに、表を構成するセルを整列させるため、関係のすべての項目を巡回して、
項目パスごとの最大の幅をもとめます。以下の表に対応する情報を計算し、
各セルに空白をパディングした上で、`TextTable` モジュールの機能を使い、
表として組み上げます。

| 項目パス                             | 最大の幅 |
|--------------------------------------|---------:|
| /name                                | 12       |
| /address                             | 21       |
| /investments /shares /purchase-price | 13       |
| /investments /shares /date           | 10       |
| /investments /shares /no             | 3        |
| /company                             | 6        |

現在の実装では、複数行からなるセルを扱えません。
これを改善するために、項目を必要に応じて複数行に変換する関数
`c -> [String]` を実装し、`Rel (Mono [String])`
を使用するように変更できます。
このノートの例では、`/address` が長すぎるので
`"311 Eash 2nd. St..."` のように省略していますが、
内容を複数行に組み直すことができれば、省略する必要がありません。

このノートは、甲州計算機のバージョン 0.51 に対応します。



[INOUT.md]: INOUT.md
[DATA.k]:   DATA.k
[client.k]: client.k
[stock.k]:  stock.k
[A Recursive Algebra for Nested Relations]: http://www.google.co.jp/search?q=a-recursive-algebra-for-nested-relations

