** -*- koshu -*-
**
**  DESCRIPTION
**    Take elements
**

|-- TEXT  /a ""
|-- TEXT  /a "a"
|-- TEXT  /a "abc"
|-- TEXT  /a "abcd"
|-- TEXT  /a "abcdefg"

|== A : source TEXT /a
  | add /b ( take 0 /a )
        /c ( take 3 /a )
        /d ( take 6 /a )
  --table --lexical

|-- LIST  /a [ ]
|-- LIST  /a [ 1 ]
|-- LIST  /a [ 1 | 2 | 3 ]
|-- LIST  /a [ 1 | 2 | 3 | 4 | 5 ]

|== B : source LIST /a
  | add /b ( take 0 /a )
        /c ( take 3 /a )
        /d ( take 4 /a )
  --table --lexical

