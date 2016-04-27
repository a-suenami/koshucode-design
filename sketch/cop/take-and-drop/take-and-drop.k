** -*- koshu -*-
**
**    take 3
**    =======
**    A  B  C  D  E  F  G
**    - - - -  ==========    ( - - - means dropped )
**             drop 3
**
**    drop-tail 3
**    ==========  - - - -
**    A  B  C  D  E  F  G
**                =======
**                take-tail 3
**
**    drop-take 3 2
**    - - - -  ====
**    A  B  C  D  E  F  G
**          ====  - - - -
**          drop-take-tail 3 2
**

|-- P  /text "ABCDEFG"
|-- P  /text "ABCD"
|-- P  /text "ABC"
|-- P  /text "AB"
|-- P  /text "A"
|-- P  /text ""

|== Q : source P /text
  | add /take            ( take 3 /text )
        /drop            ( drop 3 /text )
        /take-tail       ( take-tail 3 /text )
        /drop-tail       ( drop-tail 3 /text )
        /drop-take       ( drop-take 3 2 /text )
        /drop-take-tail  ( drop-take-tail 3 2 /text )
  --table --forward /text

