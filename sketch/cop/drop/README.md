# I/O List

- koshu [drop.k](#dropk)



## [drop.k](drop.k)

```
** -*- koshu -*-
**
**  DESCRIPTION
**    Drop elements
**

|-- TEXT  /a ""
|-- TEXT  /a "a"
|-- TEXT  /a "abc"
|-- TEXT  /a "abcd"
|-- TEXT  /a "abcdefg"

|== A : source TEXT /a
  | add /b ( drop 0 /a )
        /c ( drop 3 /a )
        /d ( drop 6 /a )
  --table --lexical

|-- LIST  /a [ ]
|-- LIST  /a [ 1 ]
|-- LIST  /a [ 1 | 2 | 3 ]
|-- LIST  /a [ 1 | 2 | 3 | 4 | 5 ]

|== B : source LIST /a
  | add /b ( drop 0 /a )
        /c ( drop 3 /a )
        /d ( drop 4 /a )
  --table --lexical

```

Command `koshu drop.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    drop.k
**
**  OUTPUT
**    <stdout>
**

|-- A  /a ""  /b ""  /c ""  /d ""
|-- A  /a "a"  /b "a"  /c ""  /d ""
|-- A  /a "abc"  /b "abc"  /c ""  /d ""
|-- A  /a "abcd"  /b "abcd"  /c "d"  /d ""
|-- A  /a "abcdefg"  /b "abcdefg"  /c "defg"  /d "g"

*** 5 judges

=== note

TABLE : A

  /a          /b          /c       /d
  ----------- ----------- -------- -----
  ""          ""          ""       ""
  "a"         "a"         ""       ""
  "abc"       "abc"       ""       ""
  "abcd"      "abcd"      "d"      ""
  "abcdefg"   "abcdefg"   "defg"   "g"

=== rel

|-- B  /a [ ]  /b [ ]  /c [ ]  /d [ ]
|-- B  /a [ 1 ]  /b [ 1 ]  /c [ ]  /d [ ]
|-- B  /a [ 1 | 2 | 3 ]  /b [ 1 | 2 | 3 ]  /c [ ]  /d [ ]
|-- B  /a [ 1 | 2 | 3 | 4 | 5 ]  /b [ 1 | 2 | 3 | 4 | 5 ]  /c [ 4 | 5 ]  /d [ 5 ]

*** 4 judges

=== note

TABLE : B

  /a                      /b                      /c          /d
  ----------------------- ----------------------- ----------- -------
  [ ]                     [ ]                     [ ]         [ ]
  [ 1 ]                   [ 1 ]                   [ ]         [ ]
  [ 1 | 2 | 3 ]           [ 1 | 2 | 3 ]           [ ]         [ ]
  [ 1 | 2 | 3 | 4 | 5 ]   [ 1 | 2 | 3 | 4 | 5 ]   [ 4 | 5 ]   [ 5 ]

=== rel

**
**  SUMMARY
**       5 judges on A
**       4 judges on B
**       9 judges in total
**
```



## command

This document is produced by the command:

```
koshu-inout.sh -r -g koshu
```
