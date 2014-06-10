** -*- koshu -*-
**
**  概要
**    甲州記法を使って、RDF のトリプル・データを
**    Turtle と N-Triples のように出力します。
**
**  使用法
**    koshu DATA.k turtle.k
**

short
  rdf  "http://www.w3.org/1999/02/22-rdf-syntax-ns#"
  foaf "http://xmlns.com/foaf/0.1/"

|-- RDF  /s "http://biglynx.co.uk/people/dave-smith"  /p rdf.type   /o foaf.Person
|-- RDF  /s "http://biglynx.co.uk/people/dave-smith"  /p foaf.name  /o "Dave Smith"
