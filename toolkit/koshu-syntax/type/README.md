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
**    |-- CLAUSE /clause /clause-type
**    |-- LINE   /clause /line
**    |-- TOKEN  /line /column /token-type /cont
**
**    <<< There is a clause numbered /clause on /line .
**        Type of the clause is /clause-type .
**        There is a token of content /cont at /line and /column .
**        Type of the token is /token-type . >>>
**

**  term
**    /a /a/b
**    /a/b/c

|-- CLAUSE  /clause 1  /clause-type 'unknown
|-- LINE  /clause 1  /line 3
|-- LINE  /clause 1  /line 4
|-- LINE  /clause 1  /line 5

|-- TOKEN  /line 3  /column 0  /token-type 'text  /cont 'term

|-- TOKEN  /line 4  /column 2  /token-type 'term  /cont "/a"
|-- TOKEN  /line 4  /column 5  /token-type 'term  /cont "/a/b"

|-- TOKEN  /line 5  /column 2  /token-type 'term  /cont "/a/b/c"

**  slot
**    @a @@a

|-- CLAUSE  /clause 2  /clause-type 'unknown
|-- LINE  /clause 2  /line 7
|-- LINE  /clause 2  /line 8

|-- TOKEN  /line 7  /column 0  /token-type 'text  /cont 'slot

|-- TOKEN  /line 8  /column 2  /token-type 'slot  /cont 'a
|-- TOKEN  /line 8  /column 5  /token-type 'slot  /cont 'a

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
**    |-- CLAUSE /clause /clause-type
**    |-- LINE   /clause /line
**    |-- TOKEN  /line /column /token-type /cont
**
**    <<< There is a clause numbered /clause on /line .
**        Type of the clause is /clause-type .
**        There is a token of content /cont at /line and /column .
**        Type of the token is /token-type . >>>
**

**  one-letter
**    ()
**    []
**    {}

|-- CLAUSE  /clause 1  /clause-type 'unknown
|-- LINE  /clause 1  /line 3
|-- LINE  /clause 1  /line 4
|-- LINE  /clause 1  /line 5
|-- LINE  /clause 1  /line 6

|-- TOKEN  /line 3  /column 0  /token-type 'text  /cont 'one-letter

|-- TOKEN  /line 4  /column 2  /token-type 'open  /cont "("
|-- TOKEN  /line 4  /column 3  /token-type 'close  /cont ")"

|-- TOKEN  /line 5  /column 2  /token-type 'open  /cont "["
|-- TOKEN  /line 5  /column 3  /token-type 'close  /cont "]"

|-- TOKEN  /line 6  /column 2  /token-type 'open  /cont "{"
|-- TOKEN  /line 6  /column 3  /token-type 'close  /cont "}"

**  two-letters
**    << >>
**    (| |)
**    {| |}

|-- CLAUSE  /clause 2  /clause-type 'unknown
|-- LINE  /clause 2  /line 8
|-- LINE  /clause 2  /line 9
|-- LINE  /clause 2  /line 10
|-- LINE  /clause 2  /line 11

|-- TOKEN  /line 8  /column 0  /token-type 'text  /cont 'two-letters

|-- TOKEN  /line 9  /column 2  /token-type 'open  /cont '<<
|-- TOKEN  /line 9  /column 5  /token-type 'close  /cont '>>

|-- TOKEN  /line 10  /column 2  /token-type 'open  /cont "(|"
|-- TOKEN  /line 10  /column 5  /token-type 'close  /cont "|)"

|-- TOKEN  /line 11  /column 2  /token-type 'open  /cont "{|"
|-- TOKEN  /line 11  /column 5  /token-type 'close  /cont "|}"

**  knob
**    (- -)
**    [- -]

|-- CLAUSE  /clause 3  /clause-type 'unknown
|-- LINE  /clause 3  /line 13
|-- LINE  /clause 3  /line 14
|-- LINE  /clause 3  /line 15

|-- TOKEN  /line 13  /column 0  /token-type 'text  /cont 'knob

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
**    |-- CLAUSE /clause /clause-type
**    |-- LINE   /clause /line
**    |-- TOKEN  /line /column /token-type /cont
**
**    <<< There is a clause numbered /clause on /line .
**        Type of the clause is /clause-type .
**        There is a token of content /cont at /line and /column .
**        Type of the token is /token-type . >>>
**

**  text
**    a 'a "a"
**    "aaa bbb"
**    34 100.25
**    |06:30| 2014-10-25
**    = : |

|-- CLAUSE  /clause 1  /clause-type 'unknown
|-- LINE  /clause 1  /line 3
|-- LINE  /clause 1  /line 4
|-- LINE  /clause 1  /line 5
|-- LINE  /clause 1  /line 6
|-- LINE  /clause 1  /line 7
|-- LINE  /clause 1  /line 8

|-- TOKEN  /line 3  /column 0  /token-type 'text  /cont 'text

|-- TOKEN  /line 4  /column 2  /token-type 'text  /cont 'a
|-- TOKEN  /line 4  /column 4  /token-type 'text  /cont 'a
|-- TOKEN  /line 4  /column 7  /token-type 'text  /cont 'a

|-- TOKEN  /line 5  /column 2  /token-type 'text  /cont "aaa bbb"

|-- TOKEN  /line 6  /column 2  /token-type 'text  /cont '34
|-- TOKEN  /line 6  /column 5  /token-type 'text  /cont '100.25

|-- TOKEN  /line 7  /column 2  /token-type 'text  /cont "|06:30|"
|-- TOKEN  /line 7  /column 10  /token-type 'text  /cont '2014-10-25

|-- TOKEN  /line 8  /column 2  /token-type 'text  /cont '=
|-- TOKEN  /line 8  /column 4  /token-type 'text  /cont ":"
|-- TOKEN  /line 8  /column 6  /token-type 'text  /cont "|"

**  short
**    a.xxx

|-- CLAUSE  /clause 2  /clause-type 'unknown
|-- LINE  /clause 2  /line 10
|-- LINE  /clause 2  /line 11

|-- TOKEN  /line 10  /column 0  /token-type 'text  /cont 'short

|-- TOKEN  /line 11  /column 2  /token-type 'short  /cont 'a.xxx

```



## command

This document is produced by the command:

```
koshu-inout.sh -r -g koshu-syntax -b
```
