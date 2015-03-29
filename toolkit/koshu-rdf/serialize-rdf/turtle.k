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

|== TURTLE : source RDF /s /p /o | nest /p /o -to /po
  --table --forward /s
