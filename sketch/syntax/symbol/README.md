# I/O List

- koshu [ascii.k](#asciik)



## [ascii.k](ascii.k)

```
** -*- koshu -*-
**
**  DESCRIPTION
**    Table of symbol classes of ASCII chars.
**

|== GENERAL : symbol | keep /general = 'G | cut /numeric
  | char-order

|== NUMERIC : symbol | keep /numeric = 'N
  | char-order

|== UNKNOWN : symbol
  | keep /general = '- and /plain = '- and /numeric = '-
  | char-order

char-order : backward /char | order /char

ascii : range /n -from 0 -to 127
  | add /char ( char /n )

symbol : ascii
  | add /general ( if general-symbol? /char -> 'G : '- )
        /plain   ( if plain-symbol?   /char -> 'P : '- )
        /numeric ( if numeric-symbol? /char -> 'N : '- )
  | to-char-range /char /n
  | cut /n

to-char-range
  | subst @'1 ( if @'1 >= "0" and @'1 <= "9" -> '0-9
                 : @'1 >= "A" and @'1 <= "Z" -> 'A-Z
                 : @'1 >= "a" and @'1 <= "z" -> 'a-z
                 : @'2 >= 0   and @'2 <= 31  -> 'control
                 : @'2 = 127                 -> 'control
                 : @'1 )

```

Command `koshu ascii.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    ascii.k
**
**  OUTPUT
**    <stdout>
**

|-- GENERAL  /general 'G  /plain 'P  /char '0-9
|-- GENERAL  /general 'G  /plain 'P  /char 'A-Z
|-- GENERAL  /general 'G  /plain 'P  /char 'a-z
|-- GENERAL  /general 'G  /plain '-  /char "*"
|-- GENERAL  /general 'G  /plain 'P  /char "-"

|-- GENERAL  /general 'G  /plain '-  /char "<"
|-- GENERAL  /general 'G  /plain '-  /char "="
|-- GENERAL  /general 'G  /plain '-  /char ">"
|-- GENERAL  /general 'G  /plain 'P  /char "?"
|-- GENERAL  /general 'G  /plain 'P  /char "_"

|-- GENERAL  /general 'G  /plain '-  /char "~"

*** 11 judges

|-- NUMERIC  /general 'G  /plain 'P  /numeric 'N  /char '0-9
|-- NUMERIC  /general '-  /plain '-  /numeric 'N  /char "#"
|-- NUMERIC  /general '-  /plain '-  /numeric 'N  /char "+"
|-- NUMERIC  /general 'G  /plain 'P  /numeric 'N  /char "-"
|-- NUMERIC  /general '-  /plain '-  /numeric 'N  /char "."

*** 5 judges

|-- UNKNOWN  /general '-  /plain '-  /numeric '-  /char 'control
|-- UNKNOWN  /general '-  /plain '-  /numeric '-  /char " "
|-- UNKNOWN  /general '-  /plain '-  /numeric '-  /char "!"
|-- UNKNOWN  /general '-  /plain '-  /numeric '-  /char <qq>
|-- UNKNOWN  /general '-  /plain '-  /numeric '-  /char "$"

|-- UNKNOWN  /general '-  /plain '-  /numeric '-  /char "%"
|-- UNKNOWN  /general '-  /plain '-  /numeric '-  /char "&"
|-- UNKNOWN  /general '-  /plain '-  /numeric '-  /char "'"
|-- UNKNOWN  /general '-  /plain '-  /numeric '-  /char "("
|-- UNKNOWN  /general '-  /plain '-  /numeric '-  /char ")"

|-- UNKNOWN  /general '-  /plain '-  /numeric '-  /char ","
|-- UNKNOWN  /general '-  /plain '-  /numeric '-  /char "/"
|-- UNKNOWN  /general '-  /plain '-  /numeric '-  /char ":"
|-- UNKNOWN  /general '-  /plain '-  /numeric '-  /char ";"
|-- UNKNOWN  /general '-  /plain '-  /numeric '-  /char "@"

|-- UNKNOWN  /general '-  /plain '-  /numeric '-  /char "["
|-- UNKNOWN  /general '-  /plain '-  /numeric '-  /char "\"
|-- UNKNOWN  /general '-  /plain '-  /numeric '-  /char "]"
|-- UNKNOWN  /general '-  /plain '-  /numeric '-  /char "^"
|-- UNKNOWN  /general '-  /plain '-  /numeric '-  /char "`"

|-- UNKNOWN  /general '-  /plain '-  /numeric '-  /char "{"
|-- UNKNOWN  /general '-  /plain '-  /numeric '-  /char "|"
|-- UNKNOWN  /general '-  /plain '-  /numeric '-  /char "}"

*** 23 judges

**
**  SUMMARY
**      11 judges on GENERAL
**       5 judges on NUMERIC
**      23 judges on UNKNOWN
**      39 judges in total
**
```



## command

This document is produced by the command:

```
koshu-inout.sh -r -g koshu
```
