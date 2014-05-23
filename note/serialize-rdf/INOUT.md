# I/O List

- [DATA.k](#datak)
- koshu DATA.k [n-triples.k](#n-triplesk)
- koshu DATA.k [rdf.k](#rdfk)
- koshu DATA.k [turtle.k](#turtlek)



## [DATA.k](DATA.k)

```
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
```



## [n-triples.k](n-triples.k)

```
** -*- koshu -*-
**
**  N-Triples に似た方法での出力
**
**    短縮設定をつけずに、主語・述語・目的語をそのまま出力します。
**

|== N-TRIPLES : source RDF /s /p /o
```

Command `koshu DATA.k n-triples.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    DATA.k
**    n-triples.k
**

|-- N-TRIPLES  /s "http://biglynx.co.uk/people/dave-smith"  /p "http://www.w3.org/1999/02/22-rdf-syntax-ns#type"  /o "http://xmlns.com/foaf/0.1/Person"
|-- N-TRIPLES  /s "http://biglynx.co.uk/people/dave-smith"  /p "http://xmlns.com/foaf/0.1/name"  /o "Dave Smith"

*** 2 judges

**
**  SUMMARY
**       2 judges on N-TRIPLES
**       2 judges in total
**
```



## [rdf.k](rdf.k)

```
** -*- koshu -*-
**
**  概要
**    甲州記法を使って、RDF のトリプル・データを
**    Turtle と N-Triples のように出力します。
**
**  使用法
**    koshu rdf.k
**

short
  rdf  "http://www.w3.org/1999/02/22-rdf-syntax-ns#"
  foaf "http://xmlns.com/foaf/0.1/"

|== RDF : source RDF /s /p /o
```

Command `koshu DATA.k rdf.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    DATA.k
**    rdf.k
**

short
  rdf  "http://www.w3.org/1999/02/22-rdf-syntax-ns#"
  foaf "http://xmlns.com/foaf/0.1/"

|-- RDF  /s "http://biglynx.co.uk/people/dave-smith"  /p rdf.type  /o foaf.Person
|-- RDF  /s "http://biglynx.co.uk/people/dave-smith"  /p foaf.name  /o "Dave Smith"

*** 2 judges

**
**  SUMMARY
**       2 judges on RDF
**       2 judges in total
**
```



## [turtle.k](turtle.k)

```
** -*- koshu -*-
**
**  Turtle に似た方法での出力
**
**    主語単位に、述語と目的語をグループ化します。
**

short
  rdf     "http://www.w3.org/1999/02/22-rdf-syntax-ns#"
  foaf    "http://xmlns.com/foaf/0.1/"
  biglynx "http://biglynx.co.uk/"

|== TURTLE -with-table -fore /s :
  source RDF /s /p /o | nest /p /o -to /po
```

Command `koshu DATA.k turtle.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    DATA.k
**    turtle.k
**

short
  rdf     "http://www.w3.org/1999/02/22-rdf-syntax-ns#"
  foaf    "http://xmlns.com/foaf/0.1/"
  biglynx "http://biglynx.co.uk/"

|-- TURTLE  /s biglynx."people/dave-smith"  /po {| /p : /o | foaf.name : "Dave Smith" | rdf.type : foaf.Person |}

*** 1 judge 

**  TABLE : TURTLE
**
**    /s                            /po
**    ----------------------------- --------------------------
**    biglynx."people/dave-smith"   /p          /o
**                                  ----------- --------------
**                                  foaf.name   "Dave Smith"
**                                  rdf.type    foaf.Person
**                                  

**
**  SUMMARY
**       1 judge  on TURTLE
**       1 judge  in total
**
```



## command

This document is produced by the command:

```
koshu-inout.sh -s -g koshu DATA.k
```
