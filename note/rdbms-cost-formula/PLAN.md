# コスト計算の具体例

このノートは、簡単な表を使って、コスト計算の事例を説明します。
このファイルと同じディレクトリにある
[TABLE.sql] を実行して表を作成し、
[DATA.sql] を実行してデータを登録してください。
3 つの項目 `a` `b` `c` からなる表 `PLUS` で、
`a` + `b` = `c` となるようにデータを登録します。
`a` と `b` を、それぞれ、1 から 250 までとして、
合計で 250 × 250 = 62,500 行のデータを登録します。



おもな統計量
------------------------------------------------------------------

[VIEW.sql] を実行して、ビュー `TABLE_INDEX_STATS` を定義してください。
このビューを使うと、表と索引の以下の統計項目をまとめて確認できます。

| 分類 | 項目              | 値     |
|------|-------------------|-------:|
| 表   | num_rows          | 62,500 |
| 表   | data_blocks       |    244 |
| 索引 | blevel            |      1 |
| 索引 | leaf_blocks       |    135 |
| 索引 | clustering_factor |    139 |

表 `PLUS` の内容として 62,500 行が 244 ブロックに格納されいます。
その表の索引 `PLUS_PK` の深さは 1、つまり、リーフ・ブロックの上に、
ルート・ブロックが 1 つある構成で、リーフ・ブロックは 135 ブロックからなります。
リーフ・ブロックを小さい方から大きい方へ向かってすべて読んで、
順番に表のデータ・ブロックを読み出すときの
ブロックの切り替わる回数を数えると、
延べで 139 のデータ・ブロックを読み出します。

索引の順序とデータの登録の順序をバラバラにすると、
clustering_factor が上昇します。
そのようなデータを登録するには
[DATA.sql] の `good_clustering_factor` を
`true` から `false` に書き換えて実行します。



単体コスト
------------------------------------------------------------------

SQL とその実行計画を並べて、表と索引を読むときのコストを具体的に確認します。



### TABLE ACCESS storage full

``` sql
select * from PLUS
```

| # | Operation                   | Name | Rows   | Bytes   | Cost | %CPU |
|---|-----------------------------|------|-------:|--------:|-----:|-----:|
| 0 | SELECT STATEMENT            |      | 62,500 | 750,000 |   62 |    9 |
| 1 | _ TABLE ACCESS storage full | PLUS | 62,500 | 750,000 |   62 |    9 |

条件をつけずに表の全行を読み出します。
data_blocks = 244 ブロックをコスト 62 で読むので、
単位コストあたり 244 / 62 ≈ 3.9 ブロック読むと推定されています。
多数の連続したブロックを読み出す 
table access storage full や index fast full scan は、
UNIX の [readv] システムコールのような [ベクトル I/O] を使うことで、
索引経由で 1 ブロックずつ読むときよりも性能がよくなります。



### INDEX unique scan

``` sql
select * from PLUS where a = 8 and b = 10
```

| # | Operation                     | Name    | Rows | Bytes | Cost | %CPU |
|---|-------------------------------|---------|-----:|------:|-----:|-----:|
| 0 | SELECT STATEMENT              |         |    1 |    12 |    2 |    0 |
| 1 | _ TABLE ACCESS by index rowid | PLUS    |    1 |    12 |    2 |    0 |
| 2 | _ _ INDEX unique scan         | PLUS_PK |    1 |       |    1 |    0 |

索引経由で表のデータ・ブロックを 1 ブロック読み出します。
blevel = 1 のコストで索引から rowid を読み出し、
その rowid にもとづいて、データを 1 ブロック読むので、総コストは 2 になります。
コスト計算結果をより現実的なものとすため、(1) 索引のルート・ブロック、
(2) 索引のリーフ・ブロック、(3) 表のデータ・ブロックのうち、
索引のルート・ブロックのコストを無視しているようです。



### INDEX range scan

``` sql
select * from PLUS where a between 8 and 10
```

| # | Operation                     | Name    | Rows  | Bytes  | Cost | %CPU |
|---|-------------------------------|---------|------:|-------:|-----:|-----:|
| 0 | SELECT STATEMENT              |         | 1,002 | 12,024 |    7 |    0 |
| 1 | _ TABLE ACCESS by index rowid | PLUS    | 1,002 | 12,024 |    7 |    0 |
| 2 | _ _ INDEX range scan          | PLUS_PK | 1,002 |        |    4 |    0 |

条件 `a between 8 and 10` での検索結果は、
実際には 750 行ですが、1,002 行と推定されています。
選択率が ff = 1,002 / 62,500 ≈ 0.0160 なので、
リーフ・ブロックの推定読み込み数は、
ff x leaf_blocks = 0.0160 × 135 ≈ 2.2 を切り上げて 3 ブロック。
これと索引の blevel = 1 を足して、合計 4 ブロック。
データ・ブロックの推定読み込み数も、ff × clustering_factor =
0.0160 × 139 ≈ 2.2 を切り上げて 3 ブロック。
合計コストは 4 + 3 = 7 となります。

データを登録するスクリプト [DATA.sql] で
`good_clustering_factor` を `false` にしてデータを登録すると、
leaf_blocks = 241、clustering_factor = 34,750 になります。
ff = 807 / 62,500 ≈ 0.0129 として、データ・ブロックの推定数を計算すると、
ff × clustering_factor = 0.0129 × 34,750 = 448 ブロックとなります。
このコストは table access storage full の何倍もあるので、
ヒントを指定しなければ、索引を使う実行計画は選ばれません。

``` sql
select /*+ index (PLUS) */ * from PLUS where a between 8 and 10
```

| # | Operation                     | Name    | Rows  | Bytes  | Cost | %CPU |
|---|-------------------------------|---------|------:|-------:|-----:|-----:|
| 0 | SELECT STATEMENT              |         |   807 |  9,684 |  455 |    1 |
| 1 | _ TABLE ACCESS by index rowid | PLUS    |   807 |  9,684 |  455 |    1 |
| 2 | _ _ INDEX range scan          | PLUS_PK |   807 |        |    5 |    0 |



結合コスト
------------------------------------------------------------------

表 `PLUS` を自分自身に対して結合する例で、
コスト計算の具体例を確認します。
例題とする問い合わせでは、

 - `a` + `b` = `c`

である項目 `a` `b` `c` に対して、

 - `d` = 2 `c`
 - `e` = `b` + `d`

となる項目 `d` と `e` を追加します。
`e` = `b` + `d` は `PLUS` ( `a` `b` `c` ) を
`PLUS` (`b` `d` `e`) に名称変更することで計算します。

``` sql
with

ABCD as (
 select
  a, b, c,
  c * 2 as d
 from PLUS
),

BDE as (
 select
  a as b,
  b as d,
  c as e
 from PLUS
)

 select
  a, b, c, d, e
 from ABCD
 natural join BDE
 where
  a = 8 and b = 10       -- A. NESTED LOOP : unique / unique
  -- a = 8 and b <= 10   -- B. NESTED LOOP : range / unique
  -- a = 8 and b <= 150  -- C. HASH JOIN : range / full
```

最後のコメントされている各行を、それぞれ、有効にすることで、
3 種類の実行計画を確認します。



### A. NESTED LOOP : unique / unique

``` sql
... where a = 8 and b = 10
```

| # | Operation                       | Name    | Rows  | Bytes | Cost | %CPU |
|---|---------------------------------|---------|------:|------:|-----:|-----:|
| 0 | SELECT STATEMENT                |         |     1 |    24 |    3 |    0 |
| 1 | _ NESTED LOOPS                  |         |     1 |    24 |    3 |    0 |
| 2 | _ _ TABLE ACCESS by index rowid | PLUS    |     1 |    12 |    2 |    0 |
| 3 | _ _ _ INDEX unique scan         | PLUS_PK |     1 |       |    1 |    0 |
| 4 | _ _ TABLE ACCESS by index rowid | PLUS    |   250 | 3,000 |    1 |    0 |
| 5 | _ _ _ INDEX unique scan         | PLUS_PK |     1 |       |    0 |    0 |

結合アルゴリズムとして nested-loop join が選択され、
駆動表も被駆動表も、ともに、索引経由で 1 行だけ読むという計画です。

駆動表は、基本コストの index unique scan と同じく、コスト 2 で読み出すのに対して、
被駆動表の索引部分のコストが 0 になっています。
これは、キャッシュ分を考慮し、推定コストが上擦るのを避けるためと考えられます。
その結果、駆動表の読み出しコスト + 駆動表の行数 × 被駆動表の読み出しコスト
= 2 + 1 × 1 = 3 が合計コストになります。



### B. NESTED LOOP : range / unique

``` sql
... where a = 8 and b <= 10
```

| # | Operation                         | Name    | Rows  | Bytes | Cost  | %CPU |
|---|-----------------------------------|---------|------:|------:|------:|-----:|
| 0 | SELECT STATEMENT                  |         |     1 |    24 |    13 |    0 |
| 1 | _ NESTED LOOPS                    |         |       |       |       |      |
| 2 | _ _ NESTED LOOPS                  |         |     1 |    24 |    13 |    0 |
| 3 | _ _ _ TABLE ACCESS by index rowid | PLUS    |    10 |   120 |     3 |    0 |
| 4 | _ _ _ _ INDEX range scan          | PLUS_PK |    10 |       |     2 |    0 |
| 5 | _ _ _ INDEX unique scan           | PLUS_PK |     1 |       |     0 |    0 |
| 6 | _ _ TABLE ACCESS by index rowid   | PLUS    |     1 |    12 |     1 |    0 |

結合アルゴリズムとして nested-loop join が選択され、
駆動表は複数行、被駆動表は 1 行読むという計画です。

指定の条件での推定行数は 10 行のため、
選択率は ff = 10 / 62,500 ≈ 0.0001 になります。
ff × leaf_blocks = 0.0001 × 135 = 0.01 のため、
索引のリーフ・ブロックは 1 ブロック、
ff × data_blocks = 0.0001 × 139 = 0.01 のため、
表のデータ・ブロックも 1 ブロック、
駆動表のコストは blevel + 1 + 1 = 3 になります。

駆動表 10 行の各行に対して、被駆動表を 1 行読み出して結合するため、
駆動表の読み出しコスト + 駆動表の行数 × 被駆動表の読み出しコスト
= 3 + 10 × 1 = 13 が合計コストになります。



### C. HASH JOIN : range / full

``` sql
... where a = 8 and b <= 150
```

| # | Operation                       | Name    | Rows   | Bytes   | Cost  | %CPU |
|---|---------------------------------|---------|-------:|--------:|------:|-----:|
| 0 | SELECT STATEMENT                |         |    165 |   3,960 |    68 |   12 |
| 1 | _ HASH JOIN                     |         |    165 |   3,960 |    68 |   12 |
| 2 | _ _ TABLE ACCESS by index rowid | PLUS    |    164 |   1,968 |     3 |    0 |
| 3 | _ _ _ INDEX range scan          | PLUS_PK |    164 |         |     2 |    0 |
| 4 | _ _ TABLE ACCESS storage full   | PLUS    | 37,609 | 451,308 |    63 |   10 |

結合アルゴリズムとして、hash join が選択され、
構築表は索引経由で複数行、探索表は全行読むという計画です。

条件 `a = 8 and b <= 150` による選択率は、
推定行数が 164 行なので、ff = 164 / 62,500 ≈ 0.0026 と計算されます。
そのとき、ff × leaf_blocks = 0.0026 × 135 = 0.35 となり、
索引のリーフ・ブロックは、推定で、1 ブロックに収まることになります。
ff × clustering_factor = 0.0026 × 139 = 0.36 なので、
索引経由のコストは blevel + ff × leaf_blocks + ff × clustering_factor
= 1 + 1 + 1 = 3 になります。

これを構築表としてハッシュ表をつくり、
`PLUS` を full で読みながら、ハッシュ表を検索し、結合結果を計算します。
`PLUS` を full で読むコストが 63 を推定されているので、
構築表と探索表の読み込みにかかるコストは 3 + 63 = 66 で、
68 - 66 = 2 は、hash join での CPU コストと考えられます。

もし nested-loop join を選択すると、
駆動表の読み出しコスト + 駆動表の行数 × 被駆動表の読み出しコスト
= 3 + 165 × 1 = 168 が合計コスト hash join のおよそ 2.5 倍になります。
オンライン・トランザクション処理 (OLTP) では、
駆動表の行数が画面に表示される程度に少ないという場合が典型的です。
そのようなとき、nested-loop join が選択されますが、
駆動表の行数が増えていくにしたがって、hash join との差が縮まり、
ある行数を境にして逆転することになります。
しかしながら、被駆動表の読み出しはキャッシュ・ヒット率が高い場合もあり、
正確に予測することは難しいといえます。



[TABLE.sql]: sql/TABLE.sql
[DATA.sql]:  sql/DATA.sql
[VIEW.sql]:  sql/VIEW.sql
[readv]: http://pubs.opengroup.org/onlinepubs/009695399/functions/readv.html
[ベクトル I/O]: http://en.wikipedia.org/wiki/Vectored_I/O

