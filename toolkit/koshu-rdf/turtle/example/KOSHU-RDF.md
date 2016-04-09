# I/O List

- [E01.ttl](#e01ttl)
- [output](#output)



## [E01.ttl](E01.ttl)

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



## output


Command `koshu-rdf E01.ttl` produces:

```
** -*- koshu -*-

short
  foaf "http://xmlns.com/foaf/0.1/"
  rdf "http://www.w3.org/1999/02/22-rdf-syntax-ns#"
  rdfs "http://www.w3.org/2000/01/rdf-schema#"
  rel "http://www.perceive.net/schemas/relationship/"

|-- RDF  /s "http://example.org/#spiderman"  /p foaf.name  /o "Spiderman"
|-- RDF  /s "http://example.org/#spiderman"  /p foaf.name  /o "Человек-паук"
|-- RDF  /s "http://example.org/#spiderman"  /p rel.enemyOf  /o "http://example.org/#green-goblin"
|-- RDF  /s "http://example.org/#spiderman"  /p rdf.type  /o foaf.Person
|-- RDF  /s "http://example.org/#green-goblin"  /p foaf.name  /o "Green Goblin"
|-- RDF  /s "http://example.org/#green-goblin"  /p rel.enemyOf  /o "http://example.org/#spiderman"
|-- RDF  /s "http://example.org/#green-goblin"  /p rdf.type  /o foaf.Person
```



## command

This document is produced by the command:

```
koshu-inout.sh -o KOSHU-RDF.md koshu-rdf E01.ttl
```
