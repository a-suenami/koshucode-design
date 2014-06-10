# I/O List

- rdf4h [E01.ttl](#e01ttl)
- rdf4h [E02.ttl](#e02ttl)
- rdf4h [E03.ttl](#e03ttl)
- rdf4h [E05.ttl](#e05ttl)
- rdf4h [E07.ttl](#e07ttl)
- rdf4h [E09.ttl](#e09ttl)
- rdf4h [E10.ttl](#e10ttl)
- rdf4h [E11.ttl](#e11ttl)
- rdf4h [E12.ttl](#e12ttl)
- rdf4h [E13.ttl](#e13ttl)
- rdf4h [E14.ttl](#e14ttl)
- rdf4h [E15.ttl](#e15ttl)
- rdf4h [E16.ttl](#e16ttl)
- rdf4h [E18.ttl](#e18ttl)
- rdf4h [E19.ttl](#e19ttl)
- rdf4h [E20.ttl](#e20ttl)
- rdf4h [E21.ttl](#e21ttl)
- rdf4h [E22-CRLF.ttl](#e22-crlfttl)
- rdf4h [E22-LF.ttl](#e22-lfttl)
- rdf4h [E23.ttl](#e23ttl)
- rdf4h [E24.ttl](#e24ttl)
- rdf4h [E25.ttl](#e25ttl)
- rdf4h [E26.ttl](#e26ttl)
- rdf4h [E27.ttl](#e27ttl)
- rdf4h [E28.ttl](#e28ttl)
- rdf4h [E29.ttl](#e29ttl)



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

Command `rdf4h E01.ttl` produces:

```
<http://example.org/#green-goblin> <http://www.perceive.net/schemas/relationship/enemyOf> <http://example.org/#spiderman> .
<http://example.org/#green-goblin> <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://xmlns.com/foaf/0.1/Person> .
<http://example.org/#green-goblin> <http://xmlns.com/foaf/0.1/name> "Green Goblin" .
<http://example.org/#spiderman> <http://www.perceive.net/schemas/relationship/enemyOf> <http://example.org/#green-goblin> .
<http://example.org/#spiderman> <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://xmlns.com/foaf/0.1/Person> .
<http://example.org/#spiderman> <http://xmlns.com/foaf/0.1/name> "Spiderman" .
<http://example.org/#spiderman> <http://xmlns.com/foaf/0.1/name> "Человек-паук"@ru .
```



## [E02.ttl](E02.ttl)

```
# Simple triples
<http://example.org/#spiderman>
  <http://www.perceive.net/schemas/relationship/enemyOf>
  <http://example.org/#green-goblin> .
```

Command `rdf4h E02.ttl` produces:

```
<http://example.org/#spiderman> <http://www.perceive.net/schemas/relationship/enemyOf> <http://example.org/#green-goblin> .
```



## [E03.ttl](E03.ttl)

```
# Predicate lists
<http://example.org/#spiderman>
  <http://www.perceive.net/schemas/relationship/enemyOf>
    <http://example.org/#green-goblin> ;
  <http://xmlns.com/foaf/0.1/name> "Spiderman" .
```

Command `rdf4h E03.ttl` produces:

```
<http://example.org/#spiderman> <http://www.perceive.net/schemas/relationship/enemyOf> <http://example.org/#green-goblin> .
<http://example.org/#spiderman> <http://xmlns.com/foaf/0.1/name> "Spiderman" .
```



## [E05.ttl](E05.ttl)

```
# Object lists
<http://example.org/#spiderman> <http://xmlns.com/foaf/0.1/name> "Spiderman", "Человек-паук"@ru .
```

Command `rdf4h E05.ttl` produces:

```
<http://example.org/#spiderman> <http://xmlns.com/foaf/0.1/name> "Spiderman" .
<http://example.org/#spiderman> <http://xmlns.com/foaf/0.1/name> "Человек-паук"@ru .
```



## [E07.ttl](E07.ttl)

```
# Prefix declarations
@prefix somePrefix: <http://www.perceive.net/schemas/relationship/> .
<http://example.org/#green-goblin> somePrefix:enemyOf <http://example.org/#spiderman> .
```

Command `rdf4h E07.ttl` produces:

```
<http://example.org/#green-goblin> <http://www.perceive.net/schemas/relationship/enemyOf> <http://example.org/#spiderman> .
```



## [E09.ttl](E09.ttl)

```
# A triple with all absolute IRIs
<http://one.example/subject1> <http://one.example/predicate1> <http://one.example/object1> .

@base <http://one.example/> .
<subject2> <predicate2> <object2> .     # relative IRIs, e.g. http://one.example/subject2

@prefix p: <http://two.example/> .
p:subject3 p:predicate3 p:object3 .     # prefixed name, e.g. http://two.example/subject3

@prefix p: <path/> .                    # prefix p: now stands for http://one.example/path/
p:subject4 p:predicate4 p:object4 .     # prefixed name, e.g. http://one.example/path/subject4

@prefix : <http://another.example/> .   # empty prefix
:subject5 :predicate5 :object5 .        # prefixed name, e.g. http://another.example/subject5

:subject6 a :subject7 .                 # same as :subject6 <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> :subject7 .

<http://伝言.example/?user=أكرم&amp;channel=R%26D> a :subject8 . # a multi-script subject IRI .
```

Command `rdf4h E09.ttl` produces:

```
<http://one.example/subject1> <http://one.example/predicate1> <http://one.example/object1> .
<http://one.example/subject2> <http://one.example/predicate2> <http://one.example/object2> .
<http://two.example/subject3> <http://two.example/predicate3> <http://two.example/object3> .
<http://one.example/path/subject4> <http://one.example/path/predicate4> <http://one.example/path/object4> .
<http://another.example/subject5> <http://another.example/predicate5> <http://another.example/object5> .
<http://another.example/subject6> <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://another.example/subject7> .
<http://伝言.example/?user=أكرم&amp;channel=R%26D> <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://another.example/subject8> .
```



## [E10.ttl](E10.ttl)

```
# String literals
@prefix foaf: <http://xmlns.com/foaf/0.1/> .
<http://example.org/#green-goblin> foaf:name "Green Goblin" .
<http://example.org/#spiderman> foaf:name "Spiderman" .
```

Command `rdf4h E10.ttl` produces:

```
<http://example.org/#green-goblin> <http://xmlns.com/foaf/0.1/name> "Green Goblin" .
<http://example.org/#spiderman> <http://xmlns.com/foaf/0.1/name> "Spiderman" .
```



## [E11.ttl](E11.ttl)

```
# Quoted literals
@prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#> .
@prefix show: <http://example.org/vocab/show/> .
@prefix xsd: <http://www.w3.org/2001/XMLSchema#> .

show:a218 rdfs:label "That Seventies Show"^^xsd:string .            # literal with XML Schema string datatype
show:a218 rdfs:label "That Seventies Show"^^<http://www.w3.org/2001/XMLSchema#string> . # same as above
show:a218 rdfs:label "That Seventies Show" .                                            # same again
show:a218 show:localName "That Seventies Show"@en .                 # literal with a language tag

# Not supported: literal delimited by single quote
# show:a218 show:localName 'Cette Série des Années Soixante-dix'@fr .

# literal with a region subtag
show:a218 show:localName "Cette Série des Années Septante"@fr-be .

# literal with embedded new lines and quotes
show:a218 show:blurb """This is a multi-line
literal with many quotes (''''')
and up to two sequential apostrophes ('').""" .
```

Command `rdf4h E11.ttl` produces:

```
<http://example.org/vocab/show/a218> <http://www.w3.org/2000/01/rdf-schema#label> "That Seventies Show"^^<http://www.w3.org/2001/XMLSchema#string> .
<http://example.org/vocab/show/a218> <http://www.w3.org/2000/01/rdf-schema#label> "That Seventies Show"^^<http://www.w3.org/2001/XMLSchema#string> .
<http://example.org/vocab/show/a218> <http://www.w3.org/2000/01/rdf-schema#label> "That Seventies Show" .
<http://example.org/vocab/show/a218> <http://example.org/vocab/show/localName> "That Seventies Show"@en .
<http://example.org/vocab/show/a218> <http://example.org/vocab/show/localName> "Cette Série des Années Septante"@fr-be .
<http://example.org/vocab/show/a218> <http://example.org/vocab/show/blurb> "This is a multi-line\r\nliteral with many quotes (''''')\r\nand up to two sequential apostrophes ('')." .
```



## [E12.ttl](E12.ttl)

```
# Numbers
@prefix : <http://example.org/elements> .                                                                              
<http://en.wikipedia.org/wiki/Helium>                                                                                  
    :atomicNumber 2 ;               # xsd:integer                                                                      
    :atomicMass 4.002602 ;          # xsd:decimal                                                                      
    :specificGravity 1.663E-4 .     # xsd:double                                                                       
```

Command `rdf4h E12.ttl` produces:

```
<http://en.wikipedia.org/wiki/Helium> <http://example.org/elementsatomicNumber> "2"^^<http://www.w3.org/2001/XMLSchema#integer> .
<http://en.wikipedia.org/wiki/Helium> <http://example.org/elementsatomicMass> "4.002602"^^<http://www.w3.org/2001/XMLSchema#decimal> .
<http://en.wikipedia.org/wiki/Helium> <http://example.org/elementsspecificGravity> "1.663e-4"^^<http://www.w3.org/2001/XMLSchema#double> .
```



## [E13.ttl](E13.ttl)

```
# Boolean
@prefix : <http://example.org/stats> .
<http://somecountry.example/census2007>
    :isLandlocked false .           # xsd:boolean
```

Command `rdf4h E13.ttl` produces:

```
<http://somecountry.example/census2007> <http://example.org/statsisLandlocked> "false"^^<http://www.w3.org/2001/XMLSchema#boolean> .
```



## [E14.ttl](E14.ttl)

```
# Blank nodes
@prefix foaf: <http://xmlns.com/foaf/0.1/> .
_:alice foaf:knows _:bob .
_:bob foaf:knows _:alice .
```

Command `rdf4h E14.ttl` produces:

```
_:alice <http://xmlns.com/foaf/0.1/knows> _:bob .
_:bob <http://xmlns.com/foaf/0.1/knows> _:alice .
```



## [E15.ttl](E15.ttl)

```
# Nesting unlabeled blank nodes
@prefix foaf: <http://xmlns.com/foaf/0.1/> .
# Someone knows someone else, who has the name "Bob".
[] foaf:knows [ foaf:name "Bob" ] .
```

Command `rdf4h E15.ttl` produces:

```
_:genid1 <http://xmlns.com/foaf/0.1/knows> _:genid2 .
_:genid2 <http://xmlns.com/foaf/0.1/name> "Bob" .
```



## [E16.ttl](E16.ttl)

```
# Nesting unlabeled blank nodes
@prefix foaf: <http://xmlns.com/foaf/0.1/> .
[ foaf:name "Alice" ] foaf:knows [
    foaf:name "Bob" ;
    foaf:knows [
        foaf:name "Eve" ] ;
    foaf:mbox <mailto:bob@example.com> ] .
```

Command `rdf4h E16.ttl` produces:

```
_:genid1 <http://xmlns.com/foaf/0.1/name> "Alice" .
_:genid1 <http://xmlns.com/foaf/0.1/knows> _:genid2 .
_:genid2 <http://xmlns.com/foaf/0.1/name> "Bob" .
_:genid2 <http://xmlns.com/foaf/0.1/knows> _:genid3 .
_:genid3 <http://xmlns.com/foaf/0.1/name> "Eve" .
_:genid2 <http://xmlns.com/foaf/0.1/mbox> <mailto:bob@example.com> .
```



## [E18.ttl](E18.ttl)

```
# Collections
@prefix : <http://example.org/foo> .
# the object of this triple is the RDF collection blank node
:subject :predicate ( :a :b :c ) .
# an empty collection value - rdf:nil
:subject :predicate2 () .
```

Command `rdf4h E18.ttl` produces:

```
<http://example.org/foosubject> <http://example.org/foopredicate> _:genid1 .
_:genid1 <http://www.w3.org/1999/02/22-rdf-syntax-ns#first> <http://example.org/fooa> .
_:genid1 <http://www.w3.org/1999/02/22-rdf-syntax-ns#rest> _:genid2 .
_:genid2 <http://www.w3.org/1999/02/22-rdf-syntax-ns#first> <http://example.org/foob> .
_:genid2 <http://www.w3.org/1999/02/22-rdf-syntax-ns#rest> _:genid3 .
_:genid3 <http://www.w3.org/1999/02/22-rdf-syntax-ns#first> <http://example.org/fooc> .
_:genid3 <http://www.w3.org/1999/02/22-rdf-syntax-ns#rest> <http://www.w3.org/1999/02/22-rdf-syntax-ns#nil> .
<http://example.org/foosubject> <http://example.org/foopredicate2> <http://www.w3.org/1999/02/22-rdf-syntax-ns#nil> .
```



## [E19.ttl](E19.ttl)

```
@prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> .
@prefix dc: <http://purl.org/dc/elements/1.1/> .
@prefix ex: <http://example.org/stuff/1.0/> .

<http://www.w3.org/TR/rdf-syntax-grammar>
  dc:title "RDF/XML Syntax Specification (Revised)" ;
  ex:editor [
    ex:fullname "Dave Beckett";
    ex:homePage <http://purl.org/net/dajobe/>
  ] .
```

Command `rdf4h E19.ttl` produces:

```
<http://www.w3.org/TR/rdf-syntax-grammar> <http://purl.org/dc/elements/1.1/title> "RDF/XML Syntax Specification (Revised)" .
<http://www.w3.org/TR/rdf-syntax-grammar> <http://example.org/stuff/1.0/editor> _:genid1 .
_:genid1 <http://example.org/stuff/1.0/fullname> "Dave Beckett" .
_:genid1 <http://example.org/stuff/1.0/homePage> <http://purl.org/net/dajobe/> .
```



## [E20.ttl](E20.ttl)

```
@prefix : <http://example.org/stuff/1.0/> .
:a :b ( "apple" "banana" ) .
```

Command `rdf4h E20.ttl` produces:

```
<http://example.org/stuff/1.0/a> <http://example.org/stuff/1.0/b> _:genid1 .
_:genid1 <http://www.w3.org/1999/02/22-rdf-syntax-ns#first> "apple" .
_:genid1 <http://www.w3.org/1999/02/22-rdf-syntax-ns#rest> _:genid2 .
_:genid2 <http://www.w3.org/1999/02/22-rdf-syntax-ns#first> "banana" .
_:genid2 <http://www.w3.org/1999/02/22-rdf-syntax-ns#rest> <http://www.w3.org/1999/02/22-rdf-syntax-ns#nil> .
```



## [E21.ttl](E21.ttl)

```
@prefix : <http://example.org/stuff/1.0/> .
@prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> .
:a :b
  [ rdf:first "apple";
    rdf:rest [ rdf:first "banana";
               rdf:rest rdf:nil ]
  ] .
```

Command `rdf4h E21.ttl` produces:

```
<http://example.org/stuff/1.0/a> <http://example.org/stuff/1.0/b> _:genid1 .
_:genid1 <http://www.w3.org/1999/02/22-rdf-syntax-ns#first> "apple" .
_:genid1 <http://www.w3.org/1999/02/22-rdf-syntax-ns#rest> _:genid2 .
_:genid2 <http://www.w3.org/1999/02/22-rdf-syntax-ns#first> "banana" .
_:genid2 <http://www.w3.org/1999/02/22-rdf-syntax-ns#rest> <http://www.w3.org/1999/02/22-rdf-syntax-ns#nil> .
```



## [E22-CRLF.ttl](E22-CRLF.ttl)

```
@prefix : <http://example.org/stuff/1.0/> .

:a :b "The first line\nThe second line\n  more" .

:a :b """The first line
The second line
  more""" .
```

Command `rdf4h E22-CRLF.ttl` produces:

```
<http://example.org/stuff/1.0/a> <http://example.org/stuff/1.0/b> "The first line\nThe second line\n  more" .
<http://example.org/stuff/1.0/a> <http://example.org/stuff/1.0/b> "The first line\r\nThe second line\r\n  more" .
```



## [E22-LF.ttl](E22-LF.ttl)

```
@prefix : <http://example.org/stuff/1.0/> .

:a :b "The first line\nThe second line\n  more" .

:a :b """The first line
The second line
  more""" .
```

Command `rdf4h E22-LF.ttl` produces:

```
<http://example.org/stuff/1.0/a> <http://example.org/stuff/1.0/b> "The first line\nThe second line\n  more" .
<http://example.org/stuff/1.0/a> <http://example.org/stuff/1.0/b> "The first line\nThe second line\n  more" .
```



## [E23.ttl](E23.ttl)

```
# Lists in subject are not supported.
@prefix : <http://example.org/stuff/1.0/> .
(1 2.0 3.0E1) :p "w" .
```

Command `rdf4h E23.ttl` exits with 1 and produces:

```
"E23.ttl" (line 3, column 1):
unexpected '('
expecting @prefix-directive, @base-directive, "[]", subject resource, subject nodeID, "[", blankline-whitespace or eof
```



## [E24.ttl](E24.ttl)

```
@prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> .
    _:b0  rdf:first  1 ;
          rdf:rest   _:b1 .
    _:b1  rdf:first  2.0 ;
          rdf:rest   _:b2 .
    _:b2  rdf:first  3.0E1 ;
          rdf:rest   rdf:nil .
    _:b0  :p         "w" . 
```

Command `rdf4h E24.ttl` produces:

```
_:b0 <http://www.w3.org/1999/02/22-rdf-syntax-ns#first> "1"^^<http://www.w3.org/2001/XMLSchema#integer> .
_:b0 <http://www.w3.org/1999/02/22-rdf-syntax-ns#rest> _:b1 .
_:b1 <http://www.w3.org/1999/02/22-rdf-syntax-ns#first> "2.0"^^<http://www.w3.org/2001/XMLSchema#decimal> .
_:b1 <http://www.w3.org/1999/02/22-rdf-syntax-ns#rest> _:b2 .
_:b2 <http://www.w3.org/1999/02/22-rdf-syntax-ns#first> "30.0"^^<http://www.w3.org/2001/XMLSchema#double> .
_:b2 <http://www.w3.org/1999/02/22-rdf-syntax-ns#rest> <http://www.w3.org/1999/02/22-rdf-syntax-ns#nil> .
_:b0 <E24.ttlp> "w" .
```



## [E25.ttl](E25.ttl)

```
# Lists in subject are not supported.
@prefix : <http://example.org/stuff/1.0/> .
(1 [:p :q] ( 2 ) ) :p2 :q2 .
```

Command `rdf4h E25.ttl` exits with 1 and produces:

```
"E25.ttl" (line 3, column 1):
unexpected '('
expecting @prefix-directive, @base-directive, "[]", subject resource, subject nodeID, "[", blankline-whitespace or eof
```



## [E26.ttl](E26.ttl)

```
@prefix : <http://example.org/stuff/1.0/> .
@prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> .
    _:b0  rdf:first  1 ;
          rdf:rest   _:b1 .
    _:b1  rdf:first  _:b2 .
    _:b2  :p         :q .
    _:b1  rdf:rest   _:b3 .
    _:b3  rdf:first  _:b4 .
    _:b4  rdf:first  2 ;
          rdf:rest   rdf:nil .
    _:b3  rdf:rest   rdf:nil .
```

Command `rdf4h E26.ttl` produces:

```
_:b0 <http://www.w3.org/1999/02/22-rdf-syntax-ns#first> "1"^^<http://www.w3.org/2001/XMLSchema#integer> .
_:b0 <http://www.w3.org/1999/02/22-rdf-syntax-ns#rest> _:b1 .
_:b1 <http://www.w3.org/1999/02/22-rdf-syntax-ns#first> _:b2 .
_:b2 <http://example.org/stuff/1.0/p> <http://example.org/stuff/1.0/q> .
_:b1 <http://www.w3.org/1999/02/22-rdf-syntax-ns#rest> _:b3 .
_:b3 <http://www.w3.org/1999/02/22-rdf-syntax-ns#first> _:b4 .
_:b4 <http://www.w3.org/1999/02/22-rdf-syntax-ns#first> "2"^^<http://www.w3.org/2001/XMLSchema#integer> .
_:b4 <http://www.w3.org/1999/02/22-rdf-syntax-ns#rest> <http://www.w3.org/1999/02/22-rdf-syntax-ns#nil> .
_:b3 <http://www.w3.org/1999/02/22-rdf-syntax-ns#rest> <http://www.w3.org/1999/02/22-rdf-syntax-ns#nil> .
```



## [E27.ttl](E27.ttl)

```
@prefix ericFoaf: <http://www.w3.org/People/Eric/ericP-foaf.rdf#> .
@prefix : <http://xmlns.com/foaf/0.1/> .
ericFoaf:ericP :givenName "Eric" ;
              :knows <http://norman.walsh.name/knows/who/dan-brickley> ,
                      [ :mbox <mailto:timbl@w3.org> ] ,
                      <http://getopenid.com/amyvdh> .
```

Command `rdf4h E27.ttl` produces:

```
<http://www.w3.org/People/Eric/ericP-foaf.rdf#ericP> <http://xmlns.com/foaf/0.1/givenName> "Eric" .
<http://www.w3.org/People/Eric/ericP-foaf.rdf#ericP> <http://xmlns.com/foaf/0.1/knows> <http://norman.walsh.name/knows/who/dan-brickley> .
<http://www.w3.org/People/Eric/ericP-foaf.rdf#ericP> <http://xmlns.com/foaf/0.1/knows> _:genid1 .
_:genid1 <http://xmlns.com/foaf/0.1/mbox> <mailto:timbl@w3.org> .
<http://www.w3.org/People/Eric/ericP-foaf.rdf#ericP> <http://xmlns.com/foaf/0.1/knows> <http://getopenid.com/amyvdh> .
```



## [E28.ttl](E28.ttl)

```
@prefix dc: <http://purl.org/dc/terms/> .
@prefix frbr: <http://purl.org/vocab/frbr/core#> .

<http://books.example.com/works/45U8QJGZSQKDH8N>
     a frbr:Work ;
     dc:creator "Wil Wheaton"@en ;
     dc:title "Just a Geek"@en ;
     frbr:realization <http://books.example.com/products/9780596007683.BOOK>,
                      <http://books.example.com/products/9780596802189.EBOOK> .

<http://books.example.com/products/9780596007683.BOOK>
     a frbr:Expression ;
     dc:type <http://books.example.com/product-types/BOOK> .

<http://books.example.com/products/9780596802189.EBOOK>
     a frbr:Expression ;
     dc:type <http://books.example.com/product-types/EBOOK> .
```

Command `rdf4h E28.ttl` produces:

```
<http://books.example.com/works/45U8QJGZSQKDH8N> <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://purl.org/vocab/frbr/core#Work> .
<http://books.example.com/works/45U8QJGZSQKDH8N> <http://purl.org/dc/terms/creator> "Wil Wheaton"@en .
<http://books.example.com/works/45U8QJGZSQKDH8N> <http://purl.org/dc/terms/title> "Just a Geek"@en .
<http://books.example.com/works/45U8QJGZSQKDH8N> <http://purl.org/vocab/frbr/core#realization> <http://books.example.com/products/9780596007683.BOOK> .
<http://books.example.com/works/45U8QJGZSQKDH8N> <http://purl.org/vocab/frbr/core#realization> <http://books.example.com/products/9780596802189.EBOOK> .
<http://books.example.com/products/9780596007683.BOOK> <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://purl.org/vocab/frbr/core#Expression> .
<http://books.example.com/products/9780596007683.BOOK> <http://purl.org/dc/terms/type> <http://books.example.com/product-types/BOOK> .
<http://books.example.com/products/9780596802189.EBOOK> <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://purl.org/vocab/frbr/core#Expression> .
<http://books.example.com/products/9780596802189.EBOOK> <http://purl.org/dc/terms/type> <http://books.example.com/product-types/EBOOK> .
```



## [E29.ttl](E29.ttl)

```
@prefix frbr: <http://purl.org/vocab/frbr/core#> .

<http://books.example.com/works/45U8QJGZSQKDH8N> a frbr:Work .
```

Command `rdf4h E29.ttl` produces:

```
<http://books.example.com/works/45U8QJGZSQKDH8N> <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://purl.org/vocab/frbr/core#Work> .
```



## command

This document is produced by the command:

```
koshu-inout.sh -o RDF4H.md -x ttl -g rdf4h
```
