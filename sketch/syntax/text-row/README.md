# I/O List

- koshu [text-row.k](#text-rowk)



## [text-row.k](text-row.k)

```
** -*- koshu -*-
**
**  DESCRIPTION
**    Examples of text row.
**    The calculator concats a row of texts into single text.
**

|-- ROW   /x "aaa"
|-- ROW   /x "aaa" "bb"
|-- ROW   /x "aaa" "bb" "c"
|-- ROW   /x "aaa" <tab> "bb"
|-- ROW   /x "aaa	bb" <q> "s"

|-- CALC  /x "aaa"
|-- CALC  /x "aaa" ++ "bb"
|-- CALC  /x "aaa" ++ "bb" ++ "c"
|-- CALC  /x "aaa" ++ <tab> ++ "bb"
|-- CALC  /x "aaa	bb" ++ <q> ++ "s"

|== ROW  : source ROW  /x | len
|== CALC : source CALC /x | len

len : add /n ( length /x )
```

Command `koshu text-row.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    text-row.k
**
**  OUTPUT
**    <stdout>
**

|-- ROW  /n 3  /x 'aaa
|-- ROW  /n 5  /x 'aaabb
|-- ROW  /n 6  /x 'aaabbc
|-- ROW  /n 6  /x "aaa" <tab> "bb"
|-- ROW  /n 8  /x "aaa" <tab> "bb's"

*** 5 judges

|-- CALC  /n 3  /x 'aaa
|-- CALC  /n 5  /x 'aaabb
|-- CALC  /n 6  /x 'aaabbc
|-- CALC  /n 6  /x "aaa" <tab> "bb"
|-- CALC  /n 8  /x "aaa" <tab> "bb's"

*** 5 judges

**
**  SUMMARY
**       5 judges on CALC
**       5 judges on ROW
**      10 judges in total
**
```



## command

This document is produced by the command:

```
koshu-inout.sh -r -g koshu
```
