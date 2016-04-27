# I/O List

- koshu [take.k](#takek)



## [take.k](take.k)

```
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

```

Command `koshu take.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    take.k
**
**  OUTPUT
**    <stdout>
**

|-- A  /a ""  /b ""  /c ""  /d ""
|-- A  /a "a"  /b ""  /c "a"  /d "a"
|-- A  /a "abc"  /b ""  /c "abc"  /d "abc"
|-- A  /a "abcd"  /b ""  /c "abc"  /d "abcd"
|-- A  /a "abcdefg"  /b ""  /c "abc"  /d "abcdef"

*** 5 judges

=== note

TABLE : A

  /a          /b   /c      /d
  ----------- ---- ------- ----------
  ""          ""   ""      ""
  "a"         ""   "a"     "a"
  "abc"       ""   "abc"   "abc"
  "abcd"      ""   "abc"   "abcd"
  "abcdefg"   ""   "abc"   "abcdef"

=== rel

|-- B  /a [ ]  /b [ ]  /c [ ]  /d [ ]
|-- B  /a [ 1 ]  /b [ ]  /c [ 1 ]  /d [ 1 ]
|-- B  /a [ 1 | 2 | 3 ]  /b [ ]  /c [ 1 | 2 | 3 ]  /d [ 1 | 2 | 3 ]
|-- B  /a [ 1 | 2 | 3 | 4 | 5 ]  /b [ ]  /c [ 1 | 2 | 3 ]  /d [ 1 | 2 | 3 | 4 ]

*** 4 judges

=== note

TABLE : B

  /a                      /b    /c              /d
  ----------------------- ----- --------------- -------------------
  [ ]                     [ ]   [ ]             [ ]
  [ 1 ]                   [ ]   [ 1 ]           [ 1 ]
  [ 1 | 2 | 3 ]           [ ]   [ 1 | 2 | 3 ]   [ 1 | 2 | 3 ]
  [ 1 | 2 | 3 | 4 | 5 ]   [ ]   [ 1 | 2 | 3 ]   [ 1 | 2 | 3 | 4 ]

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
