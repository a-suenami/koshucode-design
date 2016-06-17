# I/O List

- koshu [replace.k](#replacek)



## [replace.k](replace.k)

```
** -*- koshu -*-
**
**  DESCRIPTION
**    Replace subtexts
**

|-- TEXT  /text "abracadabra"

|-- FROM-TO  /from "br"  /to "BR"
|-- FROM-TO  /from "ab"  /to "AB"
|-- FROM-TO  /from "ra"  /to "RA"
|-- FROM-TO  /from ""    /to "BR"
|-- FROM-TO  /from "br"  /to ""
|-- FROM-TO  /from "a"   /to "a"

|== REPLACE : source TEXT /text
  | meet ( source FROM-TO /from /to )
  | add /all   ( replace-all   /from /to /text )
        /first ( replace-first /from /to /text )
        /last  ( replace-last  /from /to /text )
        /begin ( replace-begin /from /to /text )
        /end   ( replace-end   /from /to /text )
  | forward /from /to /text

```

Command `koshu replace.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    replace.k
**
**  OUTPUT
**    <stdout>
**

|-- REPLACE  /from "br"  /to "BR"  /text "abracadabra"  /all "aBRacadaBRa"  /first "aBRacadabra"  /last "abracadaBRa"
    /begin "abracadabra"  /end "abracadabra"
|-- REPLACE  /from "ab"  /to "AB"  /text "abracadabra"  /all "ABracadABra"  /first "ABracadabra"  /last "abracadABra"
    /begin "ABracadabra"  /end "abracadabra"
|-- REPLACE  /from "ra"  /to "RA"  /text "abracadabra"  /all "abRAcadabRA"  /first "abRAcadabra"  /last "abracadabRA"
    /begin "abracadabra"  /end "abracadabRA"
|-- REPLACE  /from ""  /to "BR"  /text "abracadabra"  /all "abracadabra"  /first "abracadabra"  /last "abracadabra"
    /begin "abracadabra"  /end "abracadabra"
|-- REPLACE  /from "br"  /to ""  /text "abracadabra"  /all "aacadaa"  /first "aacadabra"  /last "abracadaa"  /begin
    "abracadabra"  /end "abracadabra"

|-- REPLACE  /from "a"  /to "a"  /text "abracadabra"  /all "abracadabra"  /first "abracadabra"  /last "abracadabra"
    /begin "abracadabra"  /end "abracadabra"

*** 6 judges

**
**  SUMMARY
**       6 judges on REPLACE
**       6 judges in total
**
```



## command

This document is produced by the command:

```
koshu-inout.sh -r -g koshu
```
