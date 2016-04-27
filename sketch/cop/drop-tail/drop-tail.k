** -*- koshu -*-
**
**  DESCRIPTION
**    Drop elements from tail-side
**

|-- TEXT  /a ""
|-- TEXT  /a "a"
|-- TEXT  /a "abc"
|-- TEXT  /a "abcd"
|-- TEXT  /a "abcdefg"

|== A : source TEXT /a
  | add /b ( drop-tail 0 /a )
        /c ( drop-tail 3 /a )
        /d ( drop-tail 6 /a )
  --table --lexical

|-- LIST  /a [ ]
|-- LIST  /a [ 1 ]
|-- LIST  /a [ 1 | 2 | 3 ]
|-- LIST  /a [ 1 | 2 | 3 | 4 | 5 ]

|== B : source LIST /a
  | add /b ( drop-tail 0 /a )
        /c ( drop-tail 3 /a )
        /d ( drop-tail 4 /a )
  --table --lexical

