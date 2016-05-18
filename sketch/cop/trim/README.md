# I/O List

- koshu [trim-space.k](#trim-spacek)
- koshu [trim-text.k](#trim-textk)



## [trim-space.k](trim-space.k)

```
** -*- koshu -*-
**
**  trim-begin     Remove spaces from beginning of text
**  trim-end       Remove spaces from end of text
**  trim-both      Remove spaces from beginning and end of text
**

|== TRIM : source TEXT /text
  | add /begin ( trim-begin /text )
        /end   ( trim-end   /text )
        /both  ( trim-both  /text )
  --table

|-- TEXT  /text "ABC"
|-- TEXT  /text " ABC "
|-- TEXT  /text "  ABC  "
|-- TEXT  /text "   ABC   "
|-- TEXT  /text <tab> "ABC" <tab>
|-- TEXT  /text <crlf> "ABC" <crlf>
```

Command `koshu trim-space.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    trim-space.k
**
**  OUTPUT
**    <stdout>
**

|-- TRIM  /begin "ABC"  /end "ABC"  /both "ABC"  /text "ABC"
|-- TRIM  /begin "ABC "  /end " ABC"  /both "ABC"  /text " ABC "
|-- TRIM  /begin "ABC  "  /end "  ABC"  /both "ABC"  /text "  ABC  "
|-- TRIM  /begin "ABC   "  /end "   ABC"  /both "ABC"  /text "   ABC   "
|-- TRIM  /begin "ABC" <tab>  /end <tab> "ABC"  /both "ABC"  /text <tab> "ABC" <tab>

|-- TRIM  /begin "ABC" <crlf>  /end <crlf> "ABC"  /both "ABC"  /text <crlf> "ABC" <crlf>

*** 6 judges

=== note

TABLE : TRIM

  /begin         /end           /both   /text
  -------------- -------------- ------- ---------------------
  "ABC"          "ABC"          "ABC"   "ABC"
  "ABC "         " ABC"         "ABC"   " ABC "
  "ABC  "        "  ABC"        "ABC"   "  ABC  "
  "ABC   "       "   ABC"       "ABC"   "   ABC   "
  "ABC" <tab>    <tab> "ABC"    "ABC"   <tab> "ABC" <tab>
  "ABC" <crlf>   <crlf> "ABC"   "ABC"   <crlf> "ABC" <crlf>

=== rel

**
**  SUMMARY
**       6 judges on TRIM
**       6 judges in total
**
```



## [trim-text.k](trim-text.k)

```
** -*- koshu -*-
**
**  trim-text-begin     Remove given chars from beginning of text
**  trim-text-end       Remove given chars from end of text
**  trim-text-both      Remove given chars from beginning and end of text
**

|== TRIM : source TEXT /text
  | add /begin ( trim-text-begin "123" /text )
        /end   ( trim-text-end   "123" /text )
        /both  ( trim-text-both  "123" /text )
  --table

|-- TEXT  /text ".1"
|-- TEXT  /text "1.1"
|-- TEXT  /text "12.21"
|-- TEXT  /text "123.321"
|-- TEXT  /text "1234.4321"
|-- TEXT  /text "12345.54321"

```

Command `koshu trim-text.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    trim-text.k
**
**  OUTPUT
**    <stdout>
**

|-- TRIM  /begin ".1"  /end "."  /both "."  /text ".1"
|-- TRIM  /begin ".1"  /end "1."  /both "."  /text "1.1"
|-- TRIM  /begin ".21"  /end "12."  /both "."  /text "12.21"
|-- TRIM  /begin ".321"  /end "123."  /both "."  /text "123.321"
|-- TRIM  /begin "4.4321"  /end "1234.4"  /both "4.4"  /text "1234.4321"

|-- TRIM  /begin "45.54321"  /end "12345.54"  /both "45.54"  /text "12345.54321"

*** 6 judges

=== note

TABLE : TRIM

  /begin       /end         /both     /text
  ------------ ------------ --------- ---------------
  ".1"         "."          "."       ".1"
  ".1"         "1."         "."       "1.1"
  ".21"        "12."        "."       "12.21"
  ".321"       "123."       "."       "123.321"
  "4.4321"     "1234.4"     "4.4"     "1234.4321"
  "45.54321"   "12345.54"   "45.54"   "12345.54321"

=== rel

**
**  SUMMARY
**       6 judges on TRIM
**       6 judges in total
**
```



## command

This document is produced by the command:

```
koshu-inout.sh -r -g koshu
```
