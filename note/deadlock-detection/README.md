# デッドロックの検出

このノートでは、関係合成の使用例として、
デッドロックを検出する計算を、甲州記法で書いてみましょう。
この内容は、甲州計算機のバージョン 0.49 に対応します。



待機関係
------------------------------------------------------------------

[デッドロック] はふたつ以上の処理単位が、
相互に待ち合っているときに、処理が進まなくなる現象です。
A さんは B さんが来たら B さんに仕事を頼もうと思っていて、
B さんは A さんが来たら A さんから仕事をもらおうと思っていて、
お互いに会う機会がなければ、仕事が進まなくなるような状況に似ています。
処理単位 A がある資源を開放したら、処理単位 B がその資源を使用するという
処理単位間の待機関係をあらわす [Wait-For グラフ] を
項目 `/before` と `/after` からなる判断 `WAIT` で表現します。

```
|-- WAIT  /before 'A  /after 'B
```

[関係合成] (relational composition) は、
関係の交わりから共有項目を除いた関係です。
たとえば、A のあとで B が実行され、B のあとで C が実行されるとします。

```
|-- WAIT  /before 'A  /after 'B
|-- WAIT  /before 'B  /after 'C
```

この一部の項目名を `/medium` (中間) として
`/before 'A` `/medium 'B` と
`/medium 'B` `/after 'C` の交わり
`/before 'A` `/medium 'B` `/after 'C`
から共有項目を除いた `/before 'A` `/after 'C` は、
A が C を間接的に待機しているという関係をあらわします。



入力
------------------------------------------------------------------

つぎのような待機関係を例にとります。
この待機関係をつないでいくと、B → D → E → B という待機の循環があり、
これらの処理単位の間でデッドロックが生じています。

```
|-- WAIT  /before 'A  /after 'B
|-- WAIT  /before 'A  /after 'C
|-- WAIT  /before 'B  /after 'D
|-- WAIT  /before 'C  /after 'D
|-- WAIT  /before 'D  /after 'E
|-- WAIT  /before 'E  /after 'B
```



出力
------------------------------------------------------------------

これらの待機関係を [`one.k`][one.k] というファイルに保存し、
デッドロックが生じている処理単位を
[`deadlock.k`][deadlock.k] で計算することにしましょう。

```sh
$ koshu deadlock.k one.k
```

このコマンドによって、つぎの判断集合が出力されます。

```
|-- NODE-SET  /node-set { 'B : 'E : 'D }

|-- NODE  /node 'B
|-- NODE  /node 'E
|-- NODE  /node 'D
```

判断 `NODE-SET` は処理単位 B、D、E の間で
デッドロックが生じていることをあらわし、
判断 `NODE` は、それを処理単位にバラしたものです。

これらの出力を得るために、つぎの計算式を使います。

```
|== NODE-SET : nodes
|== NODE : nodes | member /node /node-set | pick /node
```

`nodes` は 項目 `/node-set` をもっているので、
`/node` は `/node-set` の `member` であるという関係で、
集合の要素をバラすと `NODE` が得られます。



計算
------------------------------------------------------------------

関係 `nodes` はどのように計算されるのでしょうか。

まず、入力データの判断 `WAIT` を読み込み、
`wait` (`/before` `/after`) と
`wait-ma` (`/medium` `/after`) というふたつの関係にしておきます。

```
wait    : source WAIT /before /after
wait-ma : wait | rename /medium /before    ** /medium /after
```

つぎに、`wait` の [推移閉包] を計算します。
`/before` `/after` を `/before` `/medium` に項目名変更した上で、
`wait-ma` と `compose` (関係合成) し
`/before` `/after` からなる関係を計算します。
これを `fix-join` で繰り返し計算することで、
間接的な待機関係にあるすべての連鎖をもとめます。

`fix-join A` は `fix (join A)` と同じ意味で、
`fix B` は関係写像 `B` による不動点をもとめます。

```
closure : wait
  | add /node-set {}
  | push-before
  | fix-join ( rename /medium /after
             | push-medium
             | compose wait-ma )
  | push-after
```

推移閉包 `closure` を計算すると同時に、
処理単位を集合 `/node-set` に蓄積します。

 - `fix-join` する前は `/before` を集合に追加し、
 - `fix-join` の過程で `/medium` を集合に追加し、
 - `fix-join` の後で `/after` を集合に追加します。

```
push-before : subst /node-set ( push /before /node-set )
push-medium : subst /node-set ( push /medium /node-set )
push-after  : subst /node-set ( push /after  /node-set )
```

最後に、推移閉包 `closure` から `/before` と `/after` が等しい、
つまり、B → D → E → B のように循環する組を残し、
その `/node-set` だけを選びます。

```
nodes : closure
  | keep /before = /after
  | pick /node-set
```



[deadlock.k]: script/deadlock.k
[one.k]: script/one.k

[Wait-For グラフ]: http://en.wikipedia.org/wiki/Wait-for_graph
[デッドロック]: http://ja.wikipedia.org/wiki/デッドロック
[推移閉包]: http://ja.wikipedia.org/wiki/推移閉包
[関係合成]: http://ja.wikipedia.org/wiki/関係の合成
