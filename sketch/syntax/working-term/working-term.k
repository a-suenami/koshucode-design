** -*- koshu -*-
**
**  DESCRIPTION
**    Names of working terms are beginning with equal sign,
**    e.g., /=g or simply /=. Koshu calculator rename working
**    terms by adding its resource number.
**

|-- P  /x 1  /y 10
|-- P  /x 1  /y 20
|-- P  /x 2  /y 30

p : source P /x /y

|== Q : p | add /=z ( /x + /y )
  --forward /x /y

|== R : r
  --forward /x

r : p | nest /y -to /=
      | add /ys ( /=/y )

|== S : r | wipe
  --forward /x
