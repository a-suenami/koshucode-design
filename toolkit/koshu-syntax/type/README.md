# I/O List

- koshu-syntax -b [name.k](#namek)
- koshu-syntax -b [paren.k](#parenk)
- koshu-syntax -b [text.k](#textk)



## [name.k](name.k)

```
** -*- koshu -*-

term
  /a /a/b
  /a/b/c

slot
  @a @@a
```

Command `koshu-syntax -b name.k` produces:

```
**
**  DESCRIPTION
**    Clauses and tokens
**
**  INPUT
**    name.k
**
**  JUDGES
**    |-- CLAUSE  /clause -> /clause-type
**    |-- LINE    /line -> /clause
**    |-- TOKEN   /line /column -> /token-type [/token-subtype] /cont
**
**    <<< There is a clause numbered /clause on /line .
**        Type of the clause is /clause-type .
**        There is a token of content /cont at /line and /column .
**        Type of the token is /token-type .
**        Some tokens are classified into /token-subtype . >>>
**

*** term
***   /a /a/b
***   /a/b/c

|-- CLAUSE  /clause 1  /clause-type 'unknown
|-- LINE  /line 3  /clause 1
|-- LINE  /line 4  /clause 1
|-- LINE  /line 5  /clause 1

|-- TOKEN  /line 3  /column 0  /token-type 'text  /token-subtype 'raw  /cont 'term

|-- TOKEN  /line 4  /column 2  /token-type 'term  /cont "/a"
|-- TOKEN  /line 4  /column 5  /token-type 'term  /cont "/a/b"

|-- TOKEN  /line 5  /column 2  /token-type 'term  /cont "/a/b/c"

*** slot
***   @a @@a

|-- CLAUSE  /clause 2  /clause-type 'unknown
|-- LINE  /line 7  /clause 2
|-- LINE  /line 8  /clause 2

|-- TOKEN  /line 7  /column 0  /token-type 'text  /token-subtype 'raw  /cont 'slot

|-- TOKEN  /line 8  /column 2  /token-type 'slot  /token-subtype 'named  /cont 'a
|-- TOKEN  /line 8  /column 5  /token-type 'slot  /token-subtype 'global  /cont 'a

```



## [paren.k](paren.k)

```
** -*- koshu -*-

one-letter
  ()
  []
  {}

two-letters
  << >>
  (| |)
  {| |}

knob
  (- -)
  [- -]
```

Command `koshu-syntax -b paren.k` produces:

```
**
**  DESCRIPTION
**    Clauses and tokens
**
**  INPUT
**    paren.k
**
**  JUDGES
**    |-- CLAUSE  /clause -> /clause-type
**    |-- LINE    /line -> /clause
**    |-- TOKEN   /line /column -> /token-type [/token-subtype] /cont
**
**    <<< There is a clause numbered /clause on /line .
**        Type of the clause is /clause-type .
**        There is a token of content /cont at /line and /column .
**        Type of the token is /token-type .
**        Some tokens are classified into /token-subtype . >>>
**

*** one-letter
***   ()
***   []
***   {}

|-- CLAUSE  /clause 1  /clause-type 'unknown
|-- LINE  /line 3  /clause 1
|-- LINE  /line 4  /clause 1
|-- LINE  /line 5  /clause 1
|-- LINE  /line 6  /clause 1

|-- TOKEN  /line 3  /column 0  /token-type 'text  /token-subtype 'raw  /cont 'one-letter

|-- TOKEN  /line 4  /column 2  /token-type 'open  /cont "("
|-- TOKEN  /line 4  /column 3  /token-type 'close  /cont ")"

|-- TOKEN  /line 5  /column 2  /token-type 'open  /cont "["
|-- TOKEN  /line 5  /column 3  /token-type 'close  /cont "]"

|-- TOKEN  /line 6  /column 2  /token-type 'open  /cont "{"
|-- TOKEN  /line 6  /column 3  /token-type 'close  /cont "}"

*** two-letters
***   << >>
***   (| |)
***   {| |}

|-- CLAUSE  /clause 2  /clause-type 'unknown
|-- LINE  /line 8  /clause 2
|-- LINE  /line 9  /clause 2
|-- LINE  /line 10  /clause 2
|-- LINE  /line 11  /clause 2

|-- TOKEN  /line 8  /column 0  /token-type 'text  /token-subtype 'raw  /cont 'two-letters

|-- TOKEN  /line 9  /column 2  /token-type 'open  /cont '<<
|-- TOKEN  /line 9  /column 5  /token-type 'close  /cont '>>

|-- TOKEN  /line 10  /column 2  /token-type 'open  /cont "(|"
|-- TOKEN  /line 10  /column 5  /token-type 'close  /cont "|)"

|-- TOKEN  /line 11  /column 2  /token-type 'open  /cont "{|"
|-- TOKEN  /line 11  /column 5  /token-type 'close  /cont "|}"

*** knob
***   (- -)
***   [- -]

|-- CLAUSE  /clause 3  /clause-type 'unknown
|-- LINE  /line 13  /clause 3
|-- LINE  /line 14  /clause 3
|-- LINE  /line 15  /clause 3

|-- TOKEN  /line 13  /column 0  /token-type 'text  /token-subtype 'raw  /cont 'knob

|-- TOKEN  /line 14  /column 2  /token-type 'open  /cont "(-"
|-- TOKEN  /line 14  /column 5  /token-type 'close  /cont "-)"

|-- TOKEN  /line 15  /column 2  /token-type 'open  /cont "[-"
|-- TOKEN  /line 15  /column 5  /token-type 'close  /cont "-]"

```



## [text.k](text.k)

```
** -*- koshu -*-

text
  a 'a "a"
  "aaa bbb"
  34 100.25
  |06:30| 2014-10-25
  = : |

short
  a.xxx
```

Command `koshu-syntax -b text.k` produces:

```
**
**  DESCRIPTION
**    Clauses and tokens
**
**  INPUT
**    text.k
**
**  JUDGES
**    |-- CLAUSE  /clause -> /clause-type
**    |-- LINE    /line -> /clause
**    |-- TOKEN   /line /column -> /token-type [/token-subtype] /cont
**
**    <<< There is a clause numbered /clause on /line .
**        Type of the clause is /clause-type .
**        There is a token of content /cont at /line and /column .
**        Type of the token is /token-type .
**        Some tokens are classified into /token-subtype . >>>
**

*** text
***   a 'a "a"
***   "aaa bbb"
***   34 100.25
***   |06:30| 2014-10-25
***   = : |

|-- CLAUSE  /clause 1  /clause-type 'unknown
|-- LINE  /line 3  /clause 1
|-- LINE  /line 4  /clause 1
|-- LINE  /line 5  /clause 1
|-- LINE  /line 6  /clause 1
|-- LINE  /line 7  /clause 1
|-- LINE  /line 8  /clause 1

|-- TOKEN  /line 3  /column 0  /token-type 'text  /token-subtype 'raw  /cont 'text

|-- TOKEN  /line 4  /column 2  /token-type 'text  /token-subtype 'raw  /cont 'a
|-- TOKEN  /line 4  /column 4  /token-type 'text  /token-subtype 'q  /cont 'a
|-- TOKEN  /line 4  /column 7  /token-type 'text  /token-subtype 'qq  /cont 'a

|-- TOKEN  /line 5  /column 2  /token-type 'text  /token-subtype 'qq  /cont "aaa bbb"

|-- TOKEN  /line 6  /column 2  /token-type 'text  /token-subtype 'raw  /cont '34
|-- TOKEN  /line 6  /column 5  /token-type 'text  /token-subtype 'raw  /cont '100.25

|-- TOKEN  /line 7  /column 2  /token-type 'text  /token-subtype 'bar  /cont "|06:30|"
|-- TOKEN  /line 7  /column 10  /token-type 'text  /token-subtype 'raw  /cont '2014-10-25

|-- TOKEN  /line 8  /column 2  /token-type 'text  /token-subtype 'raw  /cont '=
|-- TOKEN  /line 8  /column 4  /token-type 'text  /token-subtype 'raw  /cont ":"
|-- TOKEN  /line 8  /column 6  /token-type 'text  /token-subtype 'raw  /cont "|"

*** short
***   a.xxx

|-- CLAUSE  /clause 2  /clause-type 'unknown
|-- LINE  /line 10  /clause 2
|-- LINE  /line 11  /clause 2

|-- TOKEN  /line 10  /column 0  /token-type 'text  /token-subtype 'raw  /cont 'short

|-- TOKEN  /line 11  /column 2  /token-type 'short  /cont 'a.xxx

```



## command

This document is produced by the command:

```
koshu-inout.sh -r -g koshu-syntax -b
```
