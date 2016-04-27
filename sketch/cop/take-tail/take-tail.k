** -*- koshu -*-
**
**  DESCRIPTION
**    Take elements from tail-side
**

|-- TEXT  /a ""
|-- TEXT  /a "a"
|-- TEXT  /a "abc"
|-- TEXT  /a "abcd"
|-- TEXT  /a "abcdefg"

|== A : source TEXT /a
  | add /b ( take-tail 0 /a )
        /c ( take-tail 3 /a )
        /d ( take-tail 6 /a )
  --table --lexical

|-- LIST  /a [ ]
|-- LIST  /a [ 1 ]
|-- LIST  /a [ 1 | 2 | 3 ]
|-- LIST  /a [ 1 | 2 | 3 | 4 | 5 ]

|== B : source LIST /a
  | add /b ( take-tail 0 /a )
        /c ( take-tail 3 /a )
        /d ( take-tail 4 /a )
  --table --lexical

