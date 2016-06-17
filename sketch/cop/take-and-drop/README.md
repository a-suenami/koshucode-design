# I/O List

- koshu [take-and-drop.k](#take-and-dropk)



## [take-and-drop.k](take-and-drop.k)

```
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

```

Command `koshu take-and-drop.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    take-and-drop.k
**
**  OUTPUT
**    <stdout>
**

|-- Q  /text "ABCDEFG"  /take "ABC"  /drop "DEFG"  /take-tail "EFG"  /drop-tail "ABCD"  /drop-take "DE"  /drop-take-tail
    "CD"
|-- Q  /text "ABCD"  /take "ABC"  /drop "D"  /take-tail "BCD"  /drop-tail "A"  /drop-take "D"  /drop-take-tail "A"
|-- Q  /text "ABC"  /take "ABC"  /drop ""  /take-tail "ABC"  /drop-tail ""  /drop-take ""  /drop-take-tail ""
|-- Q  /text "AB"  /take "AB"  /drop ""  /take-tail "AB"  /drop-tail ""  /drop-take ""  /drop-take-tail ""
|-- Q  /text "A"  /take "A"  /drop ""  /take-tail "A"  /drop-tail ""  /drop-take ""  /drop-take-tail ""

|-- Q  /text ""  /take ""  /drop ""  /take-tail ""  /drop-tail ""  /drop-take ""  /drop-take-tail ""

*** 6 judges

=== note

TABLE : Q

  /text       /take   /drop    /take-tail /drop-tail /drop-take /drop-take-tail
  ----------- ------- -------- ---------- ---------- ---------- ---------------
  "ABCDEFG"   "ABC"   "DEFG"   "EFG"      "ABCD"     "DE"       "CD"
  "ABCD"      "ABC"   "D"      "BCD"      "A"        "D"        "A"
  "ABC"       "ABC"   ""       "ABC"      ""         ""         ""
  "AB"        "AB"    ""       "AB"       ""         ""         ""
  "A"         "A"     ""       "A"        ""         ""         ""
  ""          ""      ""       ""         ""         ""         ""

=== rel

**
**  SUMMARY
**       6 judges on Q
**       6 judges in total
**
```



## command

This document is produced by the command:

```
koshu-inout.sh -r -g koshu
```
