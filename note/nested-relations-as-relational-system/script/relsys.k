** -*- koshu -*-
**
**  DESCRIPTION
**    Nested relations as embedded relational system
**
**  USAGE
**    koshu relsys.k
**

|-- P  /a 10  /b 40
|-- P  /a 10  /b 50
|-- P  /a 20  /b 60

|-- Q  /b 40  /c 80
|-- Q  /b 40  /c 90
|-- Q  /b 50  /c 80
|-- Q  /b 60  /c 90

|== R : r
|== S : s
|== T : s | up /nr

p : source P /a /b
q : source Q /b /c
r : p | meet q
      | add /d ( /a + /c )
      | cut /b

s : rel /np p
  | rel /nq q
  | rel /nr nr -with /np /nq

nr : np | meet nq
        | add /d ( /a + /c )
        | cut /b

