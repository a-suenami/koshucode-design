# Turtle


[Turtle] は RDF グラフをあらわすための構文のひとつです。
Haskell には rdf4h ([Hackage][rdf4h@Hackage] | [GitHub][rdf4h@GitHub])
という RDF を扱うためのライブラリがあり、
Turtle で書かれたデータを読み書きできます。
rdf4h はライブラリであるとともに、同名のコマンド `rdf4h` も付属します。
ここでは、その `rdf4h` コマンドを使って、
W3C の [Turtle] の規格書に掲載されている例を題材にして、
Turtle から N-Triples への変換を実行してみます。

rdf4h のバージョンは 1.2.5 です。
実行結果は [入出力リスト][RDF4H] にあります。

`rdf4h -h` でそのヘルプを参照すると、
入出力フォーマットの指定方法がつぎのように説明されています。
`-i` `-o` を指定しないときは、Turtle を読んで、
N-Triples で書くという動作になります。
N-Triples は RDF の基礎になる形式なので、
Turtle で記述された構造をもつ RDF グラフを、
より単純な N-Triples に変換するという動作になります。

```
-i FORMAT  --input=FORMAT    Set input format/parser to one of:
                               turtle     Turtle (default)
                               ntriples   N-Triples

-o FORMAT  --output=FORMAT   Set output format/serializer to one of:
                               ntriples   N-Triples (default)
                               turtle     Turtle
```

Turtle の規格書の最初の例の場合、Turtle で書かれた

```
@base <http://example.org/> .
@prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> .
@prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#> .
@prefix foaf: <http://xmlns.com/foaf/0.1/> .
@prefix rel: <http://www.perceive.net/schemas/relationship/> .

<#green-goblin>
    rel:enemyOf <#spiderman> ;
    a foaf:Person ;    # in the context of the Marvel universe
    foaf:name "Green Goblin" .

<#spiderman>
    rel:enemyOf <#green-goblin> ;
    a foaf:Person ;
    foaf:name "Spiderman", "Человек-паук"@ru .
```

という RDF グラフが、つぎのような N-Triples で書かれた
RDF グラフに変換されます。

```
<http://example.org/#green-goblin> <http://www.perceive.net/schemas/relationship/enemyOf> <http://example.org/#spiderman> .
<http://example.org/#green-goblin> <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://xmlns.com/foaf/0.1/Person> .
<http://example.org/#green-goblin> <http://xmlns.com/foaf/0.1/name> "Green Goblin" .
<http://example.org/#spiderman> <http://www.perceive.net/schemas/relationship/enemyOf> <http://example.org/#green-goblin> .
<http://example.org/#spiderman> <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://xmlns.com/foaf/0.1/Person> .
<http://example.org/#spiderman> <http://xmlns.com/foaf/0.1/name> "Spiderman" .
<http://example.org/#spiderman> <http://xmlns.com/foaf/0.1/name> "Человек-паук"@ru .
```


[Turtle]:         http://www.w3.org/TR/turtle/
[rdf4h@Hackage]:  https://hackage.haskell.org/package/rdf4h
[rdf4h@GitHub]:   https://github.com/robstewart57/rdf4h4h
[RDF4H]:          example/RDF4H.md
[KOSHU-RDF]:      example/KOSHU-RDF.md

