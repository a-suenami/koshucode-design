# N-Triples と Turtle に似た出力形式


[RDF] (Resource Description Framework) のシリアライズ形式はいつくかあります。
ここでは、[Turtle] と [N-Triples] に着目し、
これらと似た形式で、甲州データを書き出してみましょう。

このノートの使用例は [Linded Data] (Web をグルーバルなデータ空間にする仕組み)
の 2.4.2「RDF のシリアル化形式」の例を借りたもので、
甲州計算機の実行例は [入出力リスト][INOUT.md] に一覧されています。


N-Triples と Turtle
------------------------------------------------------------------

[N-Triples] は、ひとつひとつの RDF トリプル単体ですべての情報をもつように、
接頭辞などの追加の情報が必要ない形で書きます。
この形式は主語・述語・目的語を、そのまま並べただけであり、
RDF トリプルの基本形とみなせるでしょう。

つぎの例には、2 つのトリプルが N-Triples で書かれています。

```
<http://biglynx.co.uk/people/dave-smith>
  <http://www.w3.org/1999/02/22-rdf-syntax-ns#type>
  <http://xmlns.com/foaf/0.1/Person> .
<http://biglynx.co.uk/people/dave-smith>
  <http://xmlns.com/foaf/0.1/name>
  "Dave Smith" .
```

これに対して、[Turtle] は、トリプルを短く書けるように、
同一の主語に対して、述語と目的語を併記できるようにし、
さらに、長い URI に接頭辞をつけて短く書けるようにしたものです。
上の 2 つのトリプルは、Turtle で、つぎのように書けます。

```
@prefix rdf:  <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
@prefix foaf: <http://xmlns.com/foaf/0.1/>

<http://biglynx.co.uk/people/dave-smith>
  rdf:type  foaf:Person ;
  foaf:name "Dave Smith" .
```


甲州記法
------------------------------------------------------------------

一般的には、RDF は 2 項関係のみを扱い、
関係モデルは任意の n 項関係を扱います。
そのため、関係データを RDF のトリプル・データに変換すると、
余分な構成要素が追加されたり、もとの意味が間接的にしか表現できなかったりします。
その逆の RDF を関係データに変換するには、
主語 `/s` と目的語 `/o` の 2 項関係を、
その関係名 `/p` と合わせた 3 項関係 `/s` `/p` `/o` に
`RDF` のような判断種をつけて出力できます。

上の 2 つのトリプルは、甲州記法を使うと、
つぎのような判断集合として書き出せます。
(リソースとリテラルの区別はありませんが・・・)

```
short
  rdf  "http://www.w3.org/1999/02/22-rdf-syntax-ns#"
  foaf "http://xmlns.com/foaf/0.1/"

|-- RDF  /s "http://biglynx.co.uk/people/dave-smith"  /p rdf.type   /o foaf.Person
|-- RDF  /s "http://biglynx.co.uk/people/dave-smith"  /p foaf.name  /o "Dave Smith"
```


N-Triples に似た形式
------------------------------------------------------------------

N-Triples に似た形式で出力するには、
短縮設定のない形で、`/s` `/p` `/o` の判断を出力します。

```
|== N-TRIPLES : source RDF /s /p /o
```

```
|-- N-TRIPLES  /s "http://biglynx.co.uk/people/dave-smith"
               /p "http://www.w3.org/1999/02/22-rdf-syntax-ns#type"
               /o "http://xmlns.com/foaf/0.1/Person"
|-- N-TRIPLES  /s "http://biglynx.co.uk/people/dave-smith"
               /p "http://xmlns.com/foaf/0.1/name"
               /o "Dave Smith"
```

Turtle に似た形式
------------------------------------------------------------------

Turtle に似た形式で出力するには、
短縮設定をつけて、主語 `/s` 単位に、
述語 `/p` と目的語 `/o` を入れ子にします。
Big Lynx の URI にも接頭辞をつけてみましょう。

```
short
  rdf     "http://www.w3.org/1999/02/22-rdf-syntax-ns#"
  foaf    "http://xmlns.com/foaf/0.1/"
  biglynx "http://biglynx.co.uk/"

|== TURTLE -with-table -fore /s :
  source RDF /s /p /o | nest /p /o -to /po
```

```
short
  rdf     "http://www.w3.org/1999/02/22-rdf-syntax-ns#"
  foaf    "http://xmlns.com/foaf/0.1/"
  biglynx "http://biglynx.co.uk/"

|-- TURTLE  /s biglynx."people/dave-smith"
            /po {| /p        : /o
                 | foaf.name : "Dave Smith"
                 | rdf.type  : foaf.Person |}
```

これは、つぎのような表としてもあらわせます。

```
/s                            /po
----------------------------- --------------------------
biglynx."people/dave-smith"   /p          /o
                              ----------- --------------
                              foaf.name   "Dave Smith"
                              rdf.type    foaf.Person
```


[RDF]:         http://ja.wikipedia.org/wiki/Resource_Description_Framework
[Turtle]:      http://www.w3.org/TR/turtle/
[N-Triples]:   http://www.w3.org/TR/n-triples/
[INOUT.md]:    INOUT.md
[Linded Data]: http://www.kindaikagaku.co.jp/information/kd0427.htm

