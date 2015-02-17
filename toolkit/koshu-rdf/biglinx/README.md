# I/O List

- koshu-rdf [biglynx.nt](#biglynxnt)
- koshu-rdf [biglynx.ttl](#biglynxttl)



## biglynx.nt

```
<http://biglynx.co.uk/people/dave-smith>
  <http://www.w3.org/1999/02/22-rdf-syntax-ns#type>
  <http://xmlns.com/foaf/0.1/Person> .
<http://biglynx.co.uk/people/dave-smith>
  <http://xmlns.com/foaf/0.1/name>
  "Dave Smith" .
```

Command `koshu-rdf biglynx.nt` produces:

```
** -*- koshu -*-

|-- RDF  /s "http://biglynx.co.uk/people/dave-smith"  /p "http://xmlns.com/foaf/0.1/name"  /o "Dave Smith"
|-- RDF  /s "http://biglynx.co.uk/people/dave-smith"  /p "http://www.w3.org/1999/02/22-rdf-syntax-ns#type"  /o "http://xmlns.com/foaf/0.1/Person"
```



## biglynx.ttl

```
@prefix rdf:  <http://www.w3.org/1999/02/22-rdf-syntax-ns#> . 
@prefix foaf: <http://xmlns.com/foaf/0.1/> .

<http://biglynx.co.uk/people/dave-smith>
  rdf:type  foaf:Person ;
  foaf:name "Dave Smith" .
```

Command `koshu-rdf biglynx.ttl` produces:

```
** -*- koshu -*-

short
  foaf "http://xmlns.com/foaf/0.1/"
  rdf "http://www.w3.org/1999/02/22-rdf-syntax-ns#"

|-- RDF  /s "http://biglynx.co.uk/people/dave-smith"  /p foaf.name  /o "Dave Smith"
|-- RDF  /s "http://biglynx.co.uk/people/dave-smith"  /p rdf.type  /o foaf.Person
```



## command

This document is produced by the command:

```
koshu-inout.sh -r -f FILE koshu-rdf
```
