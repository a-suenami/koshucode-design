# 判断集合の差分


このノートでは、ふたつの判断集合の差分を計算する方法を考えましょう。
判断集合 B と A があるとき、B にのみ含まれる判断を取り去り、
A にのみ含まれる判断を追加すると、B から A を作成できます。
この B と A の差分を C とすると、図式的には、つぎのようにイメージできます。

    C = A - B
    
逆に、B と C があれば、B を C で変更することで、A が得られます。


B: 事前判断集合
------------------------------------------------------------------

事前判断集合 B として、つぎのような人工的なデータをとりあげます。
関係モデルにおけるデータセットは判断集合であり、
これを非常に小さなデータベースと考えても構いません。

```
|-- P  /x 1  /y 20
|-- P  /x 1  /y 30           ** (-)
|-- P  /x 2  /y 40

|-- Q  /y 20  /z 90          ** (-)
|-- Q  /y 40  /z 100         ** (-)
```

A: 事後判断集合
------------------------------------------------------------------

B を A に変更するとします。B の注釈として `(-)` をつけた判断を否定し、
A の `(+)` をつけた判断を肯定すると、B から A をつくれます。

```
|-- P  /x 1  /y 20
|-- P  /x 2  /y 40
|-- P  /x 2  /y 50           ** (+)

|-- R  /x 1  /y 20  /z 90    ** (+)
```

C: 差分判断集合
------------------------------------------------------------------

判断集合の変更は、間違った判断を除去することと、
新たに分かった判断を追加することを組み合わせて表現されます。
間違った判断の除去は否定判断 `|-X` であらわし、
新しい判断の追加は肯定判断 `|--` であらわします。

B を A に変更するときの差分を計算するには、
`koshu-change` コマンドに、まず、B を与えて、
つぎに `-t` (to) オプションをつきで A を与えます。
実際の使用例は [入出力リスト][INOUT.md] にあります。

```sh
$ koshu-change B.k -t A.k > C.k
```

```
|-X P  /x 1  /y 30
|-- P  /x 2  /y 50

|-X Q  /y 20  /z 90
|-X Q  /y 40  /z 100

|-- R  /x 1  /y 20  /z 90
```

差分 C が得られると、今後は、逆に、`koshu-change B.k -u C.k` のように
`-u` (update) オプションを使うことで A を計算できます。


[INOUT.md]:  INOUT.md

