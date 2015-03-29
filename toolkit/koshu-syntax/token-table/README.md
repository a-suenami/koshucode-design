# I/O List

- [token-table.k](#token-tablek)
- [TOKEN.k](#tokenk)
- [output](#output)



## [token-table.k](token-table.k)

```
#!/usr/bin/env koshu
** -*- koshu -*-
**
**  USAGE
**    ./token-table.k TOKEN.k
**    koshu-syntax ... | ./token-table.k -i
**

clause  : source CLAUSE /clause /clause-type
line    : source LINE /clause /line
token   : source TOKEN /line /column /token-type /cont
        | omit /token-type = 'space

|== TOKEN
  : clause
  | group /line line
  | for /line ( cut /clause
        | group /token token
        | for /token ( cut /line )
        | fore-line )
  --order --table --forward /clause /clause-type

fore-line : pick /line /token
```



## [TOKEN.k](TOKEN.k)

```
**
**  DESCRIPTION
**    Clauses and tokens
**
**  INPUT
**    token-table.k
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

*** clause  : source CLAUSE /clause /clause-type

|-- CLAUSE  /clause 1  /clause-type 'relmap
|-- LINE  /line 9  /clause 1

|-- TOKEN  /line 9  /column 0  /token-type 'text  /token-subtype 'raw  /cont 'clause
|-- TOKEN  /line 9  /column 6  /token-type 'space  /cont "  "
|-- TOKEN  /line 9  /column 8  /token-type 'text  /token-subtype 'raw  /cont ":"
|-- TOKEN  /line 9  /column 9  /token-type 'space  /cont " "
|-- TOKEN  /line 9  /column 10  /token-type 'text  /token-subtype 'raw  /cont 'source
|-- TOKEN  /line 9  /column 16  /token-type 'space  /cont " "
|-- TOKEN  /line 9  /column 17  /token-type 'text  /token-subtype 'raw  /cont 'CLAUSE
|-- TOKEN  /line 9  /column 23  /token-type 'space  /cont " "
|-- TOKEN  /line 9  /column 24  /token-type 'term  /cont "/clause"
|-- TOKEN  /line 9  /column 31  /token-type 'space  /cont " "
|-- TOKEN  /line 9  /column 32  /token-type 'term  /cont "/clause-type"

*** line    : source LINE /clause /line

|-- CLAUSE  /clause 2  /clause-type 'relmap
|-- LINE  /line 10  /clause 2

|-- TOKEN  /line 10  /column 0  /token-type 'text  /token-subtype 'raw  /cont 'line
|-- TOKEN  /line 10  /column 4  /token-type 'space  /cont "    "
|-- TOKEN  /line 10  /column 8  /token-type 'text  /token-subtype 'raw  /cont ":"
|-- TOKEN  /line 10  /column 9  /token-type 'space  /cont " "
|-- TOKEN  /line 10  /column 10  /token-type 'text  /token-subtype 'raw  /cont 'source
|-- TOKEN  /line 10  /column 16  /token-type 'space  /cont " "
|-- TOKEN  /line 10  /column 17  /token-type 'text  /token-subtype 'raw  /cont 'LINE
|-- TOKEN  /line 10  /column 21  /token-type 'space  /cont " "
|-- TOKEN  /line 10  /column 22  /token-type 'term  /cont "/clause"
|-- TOKEN  /line 10  /column 29  /token-type 'space  /cont " "
|-- TOKEN  /line 10  /column 30  /token-type 'term  /cont "/line"

*** token   : source TOKEN /line /column /token-type /cont
***         | omit /token-type = 'space

|-- CLAUSE  /clause 3  /clause-type 'relmap
|-- LINE  /line 11  /clause 3
|-- LINE  /line 12  /clause 3

|-- TOKEN  /line 11  /column 0  /token-type 'text  /token-subtype 'raw  /cont 'token
|-- TOKEN  /line 11  /column 5  /token-type 'space  /cont "   "
|-- TOKEN  /line 11  /column 8  /token-type 'text  /token-subtype 'raw  /cont ":"
|-- TOKEN  /line 11  /column 9  /token-type 'space  /cont " "
|-- TOKEN  /line 11  /column 10  /token-type 'text  /token-subtype 'raw  /cont 'source
|-- TOKEN  /line 11  /column 16  /token-type 'space  /cont " "
|-- TOKEN  /line 11  /column 17  /token-type 'text  /token-subtype 'raw  /cont 'TOKEN
|-- TOKEN  /line 11  /column 22  /token-type 'space  /cont " "
|-- TOKEN  /line 11  /column 23  /token-type 'term  /cont "/line"
|-- TOKEN  /line 11  /column 28  /token-type 'space  /cont " "
|-- TOKEN  /line 11  /column 29  /token-type 'term  /cont "/column"
|-- TOKEN  /line 11  /column 36  /token-type 'space  /cont " "
|-- TOKEN  /line 11  /column 37  /token-type 'term  /cont "/token-type"
|-- TOKEN  /line 11  /column 48  /token-type 'space  /cont " "
|-- TOKEN  /line 11  /column 49  /token-type 'term  /cont "/cont"

|-- TOKEN  /line 12  /column 0  /token-type 'space  /cont "        "
|-- TOKEN  /line 12  /column 8  /token-type 'text  /token-subtype 'raw  /cont "|"
|-- TOKEN  /line 12  /column 9  /token-type 'space  /cont " "
|-- TOKEN  /line 12  /column 10  /token-type 'text  /token-subtype 'raw  /cont 'omit
|-- TOKEN  /line 12  /column 14  /token-type 'space  /cont " "
|-- TOKEN  /line 12  /column 15  /token-type 'term  /cont "/token-type"
|-- TOKEN  /line 12  /column 26  /token-type 'space  /cont " "
|-- TOKEN  /line 12  /column 27  /token-type 'text  /token-subtype 'raw  /cont '=
|-- TOKEN  /line 12  /column 28  /token-type 'space  /cont " "
|-- TOKEN  /line 12  /column 29  /token-type 'text  /token-subtype 'q  /cont 'space

*** |== TOKEN
***   : clause
***   | group /line line
***   | for /line ( cut /clause
***         | group /token token
***         | for /token ( cut /line )
***         | fore-line )
***   --order --table --forward /clause /clause-type

|-- CLAUSE  /clause 4  /clause-type 'assert
|-- LINE  /line 14  /clause 4
|-- LINE  /line 15  /clause 4
|-- LINE  /line 16  /clause 4
|-- LINE  /line 17  /clause 4
|-- LINE  /line 18  /clause 4
|-- LINE  /line 19  /clause 4
|-- LINE  /line 20  /clause 4
|-- LINE  /line 21  /clause 4

|-- TOKEN  /line 14  /column 0  /token-type 'text  /token-subtype 'bar  /cont "|=="
|-- TOKEN  /line 14  /column 3  /token-type 'space  /cont " "
|-- TOKEN  /line 14  /column 4  /token-type 'text  /token-subtype 'raw  /cont 'TOKEN

|-- TOKEN  /line 15  /column 0  /token-type 'space  /cont "  "
|-- TOKEN  /line 15  /column 2  /token-type 'text  /token-subtype 'raw  /cont ":"
|-- TOKEN  /line 15  /column 3  /token-type 'space  /cont " "
|-- TOKEN  /line 15  /column 4  /token-type 'text  /token-subtype 'raw  /cont 'clause

|-- TOKEN  /line 16  /column 0  /token-type 'space  /cont "  "
|-- TOKEN  /line 16  /column 2  /token-type 'text  /token-subtype 'raw  /cont "|"
|-- TOKEN  /line 16  /column 3  /token-type 'space  /cont " "
|-- TOKEN  /line 16  /column 4  /token-type 'text  /token-subtype 'raw  /cont 'group
|-- TOKEN  /line 16  /column 9  /token-type 'space  /cont " "
|-- TOKEN  /line 16  /column 10  /token-type 'term  /cont "/line"
|-- TOKEN  /line 16  /column 15  /token-type 'space  /cont " "
|-- TOKEN  /line 16  /column 16  /token-type 'text  /token-subtype 'raw  /cont 'line

|-- TOKEN  /line 17  /column 0  /token-type 'space  /cont "  "
|-- TOKEN  /line 17  /column 2  /token-type 'text  /token-subtype 'raw  /cont "|"
|-- TOKEN  /line 17  /column 3  /token-type 'space  /cont " "
|-- TOKEN  /line 17  /column 4  /token-type 'text  /token-subtype 'raw  /cont 'for
|-- TOKEN  /line 17  /column 7  /token-type 'space  /cont " "
|-- TOKEN  /line 17  /column 8  /token-type 'term  /cont "/line"
|-- TOKEN  /line 17  /column 13  /token-type 'space  /cont " "
|-- TOKEN  /line 17  /column 14  /token-type 'open  /cont "("
|-- TOKEN  /line 17  /column 15  /token-type 'space  /cont " "
|-- TOKEN  /line 17  /column 16  /token-type 'text  /token-subtype 'raw  /cont 'cut
|-- TOKEN  /line 17  /column 19  /token-type 'space  /cont " "
|-- TOKEN  /line 17  /column 20  /token-type 'term  /cont "/clause"

|-- TOKEN  /line 18  /column 0  /token-type 'space  /cont "        "
|-- TOKEN  /line 18  /column 8  /token-type 'text  /token-subtype 'raw  /cont "|"
|-- TOKEN  /line 18  /column 9  /token-type 'space  /cont " "
|-- TOKEN  /line 18  /column 10  /token-type 'text  /token-subtype 'raw  /cont 'group
|-- TOKEN  /line 18  /column 15  /token-type 'space  /cont " "
|-- TOKEN  /line 18  /column 16  /token-type 'term  /cont "/token"
|-- TOKEN  /line 18  /column 22  /token-type 'space  /cont " "
|-- TOKEN  /line 18  /column 23  /token-type 'text  /token-subtype 'raw  /cont 'token

|-- TOKEN  /line 19  /column 0  /token-type 'space  /cont "        "
|-- TOKEN  /line 19  /column 8  /token-type 'text  /token-subtype 'raw  /cont "|"
|-- TOKEN  /line 19  /column 9  /token-type 'space  /cont " "
|-- TOKEN  /line 19  /column 10  /token-type 'text  /token-subtype 'raw  /cont 'for
|-- TOKEN  /line 19  /column 13  /token-type 'space  /cont " "
|-- TOKEN  /line 19  /column 14  /token-type 'term  /cont "/token"
|-- TOKEN  /line 19  /column 20  /token-type 'space  /cont " "
|-- TOKEN  /line 19  /column 21  /token-type 'open  /cont "("
|-- TOKEN  /line 19  /column 22  /token-type 'space  /cont " "
|-- TOKEN  /line 19  /column 23  /token-type 'text  /token-subtype 'raw  /cont 'cut
|-- TOKEN  /line 19  /column 26  /token-type 'space  /cont " "
|-- TOKEN  /line 19  /column 27  /token-type 'term  /cont "/line"
|-- TOKEN  /line 19  /column 32  /token-type 'space  /cont " "
|-- TOKEN  /line 19  /column 33  /token-type 'close  /cont ")"

|-- TOKEN  /line 20  /column 0  /token-type 'space  /cont "        "
|-- TOKEN  /line 20  /column 8  /token-type 'text  /token-subtype 'raw  /cont "|"
|-- TOKEN  /line 20  /column 9  /token-type 'space  /cont " "
|-- TOKEN  /line 20  /column 10  /token-type 'text  /token-subtype 'raw  /cont 'fore-line
|-- TOKEN  /line 20  /column 19  /token-type 'space  /cont " "
|-- TOKEN  /line 20  /column 20  /token-type 'close  /cont ")"

|-- TOKEN  /line 21  /column 0  /token-type 'space  /cont "  "
|-- TOKEN  /line 21  /column 2  /token-type 'text  /token-subtype 'raw  /cont '--order
|-- TOKEN  /line 21  /column 9  /token-type 'space  /cont " "
|-- TOKEN  /line 21  /column 10  /token-type 'text  /token-subtype 'raw  /cont '--table
|-- TOKEN  /line 21  /column 17  /token-type 'space  /cont " "
|-- TOKEN  /line 21  /column 18  /token-type 'text  /token-subtype 'raw  /cont '--forward
|-- TOKEN  /line 21  /column 27  /token-type 'space  /cont " "
|-- TOKEN  /line 21  /column 28  /token-type 'term  /cont "/clause"
|-- TOKEN  /line 21  /column 35  /token-type 'space  /cont " "
|-- TOKEN  /line 21  /column 36  /token-type 'term  /cont "/clause-type"

*** fore-line : pick /line /token

|-- CLAUSE  /clause 5  /clause-type 'relmap
|-- LINE  /line 23  /clause 5

|-- TOKEN  /line 23  /column 0  /token-type 'text  /token-subtype 'raw  /cont 'fore-line
|-- TOKEN  /line 23  /column 9  /token-type 'space  /cont " "
|-- TOKEN  /line 23  /column 10  /token-type 'text  /token-subtype 'raw  /cont ":"
|-- TOKEN  /line 23  /column 11  /token-type 'space  /cont " "
|-- TOKEN  /line 23  /column 12  /token-type 'text  /token-subtype 'raw  /cont 'pick
|-- TOKEN  /line 23  /column 16  /token-type 'space  /cont " "
|-- TOKEN  /line 23  /column 17  /token-type 'term  /cont "/line"
|-- TOKEN  /line 23  /column 22  /token-type 'space  /cont " "
|-- TOKEN  /line 23  /column 23  /token-type 'term  /cont "/token"

```



## output


Command `koshu token-table.k TOKEN.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    token-table.k
**    TOKEN.k
**

|-- TOKEN  /clause 1  /clause-type 'relmap  /line {| /line : /token | 9 : {| /column : /token-type : /cont | 0 : 'text : 'clause | 8 : 'text : ":" | 10 : 'text : 'source | 17 : 'text : 'CLAUSE | 24 : 'term : "/clause" | 32 : 'term : "/clause-type" |} |}
|-- TOKEN  /clause 2  /clause-type 'relmap  /line {| /line : /token | 10 : {| /column : /token-type : /cont | 0 : 'text : 'line | 8 : 'text : ":" | 10 : 'text : 'source | 17 : 'text : 'LINE | 22 : 'term : "/clause" | 30 : 'term : "/line" |} |}
|-- TOKEN  /clause 3  /clause-type 'relmap  /line {| /line : /token | 11 : {| /column : /token-type : /cont | 0 : 'text : 'token | 8 : 'text : ":" | 10 : 'text : 'source | 17 : 'text : 'TOKEN | 23 : 'term : "/line" | 29 : 'term : "/column" | 37 : 'term : "/token-type" | 49 : 'term : "/cont" |} | 12 : {| /column : /token-type : /cont | 8 : 'text : "|" | 10 : 'text : 'omit | 15 : 'term : "/token-type" | 27 : 'text : '= | 29 : 'text : 'space |} |}
|-- TOKEN  /clause 4  /clause-type 'assert  /line {| /line : /token | 14 : {| /column : /token-type : /cont | 0 : 'text : "|==" | 4 : 'text : 'TOKEN |} | 15 : {| /column : /token-type : /cont | 2 : 'text : ":" | 4 : 'text : 'clause |} | 16 : {| /column : /token-type : /cont | 2 : 'text : "|" | 4 : 'text : 'group | 10 : 'term : "/line" | 16 : 'text : 'line |} | 17 : {| /column : /token-type : /cont | 2 : 'text : "|" | 4 : 'text : 'for | 8 : 'term : "/line" | 14 : 'open : "(" | 16 : 'text : 'cut | 20 : 'term : "/clause" |} | 18 : {| /column : /token-type : /cont | 8 : 'text : "|" | 10 : 'text : 'group | 16 : 'term : "/token" | 23 : 'text : 'token |} | 19 : {| /column : /token-type : /cont | 8 : 'text : "|" | 10 : 'text : 'for | 14 : 'term : "/token" | 21 : 'open : "(" | 23 : 'text : 'cut | 27 : 'term : "/line" | 33 : 'close : ")" |} | 20 : {| /column : /token-type : /cont | 8 : 'text : "|" | 10 : 'text : 'fore-line | 20 : 'close : ")" |} | 21 : {| /column : /token-type : /cont | 2 : 'text : '--order | 10 : 'text : '--table | 18 : 'text : '--forward | 28 : 'term : "/clause" | 36 : 'term : "/clause-type" |} |}
|-- TOKEN  /clause 5  /clause-type 'relmap  /line {| /line : /token | 23 : {| /column : /token-type : /cont | 0 : 'text : 'fore-line | 10 : 'text : ":" | 12 : 'text : 'pick | 17 : 'term : "/line" | 23 : 'term : "/token" |} |}

*** 5 judges

**  TABLE : TOKEN
**
**    /clause /clause-type /line
**    ------- ------------ ------------------------------------------
**    1       'relmap      /line /token
**                         ----- ------------------------------------
**                         9     /column /token-type /cont
**                               ------- ----------- ----------------
**                               0       'text       'clause
**                               8       'text       ":"
**                               10      'text       'source
**                               17      'text       'CLAUSE
**                               24      'term       "/clause"
**                               32      'term       "/clause-type"
**                         
**    2       'relmap      /line /token
**                         ----- ------------------------------------
**                         10    /column /token-type /cont
**                               ------- ----------- ----------------
**                               0       'text       'line
**                               8       'text       ":"
**                               10      'text       'source
**                               17      'text       'LINE
**                               22      'term       "/clause"
**                               30      'term       "/line"
**                         
**    3       'relmap      /line /token
**                         ----- ------------------------------------
**                         11    /column /token-type /cont
**                               ------- ----------- ----------------
**                               0       'text       'token
**                               8       'text       ":"
**                               10      'text       'source
**                               17      'text       'TOKEN
**                               23      'term       "/line"
**                               29      'term       "/column"
**                               37      'term       "/token-type"
**                               49      'term       "/cont"
**                               
**                         12    /column /token-type /cont
**                               ------- ----------- ----------------
**                               8       'text       "|"
**                               10      'text       'omit
**                               15      'term       "/token-type"
**                               27      'text       '=
**                               29      'text       'space
**                         
**    4       'assert      /line /token
**                         ----- ------------------------------------
**                         14    /column /token-type /cont
**                               ------- ----------- ----------------
**                               0       'text       "|=="
**                               4       'text       'TOKEN
**                               
**                         15    /column /token-type /cont
**                               ------- ----------- ----------------
**                               2       'text       ":"
**                               4       'text       'clause
**                               
**                         16    /column /token-type /cont
**                               ------- ----------- ----------------
**                               2       'text       "|"
**                               4       'text       'group
**                               10      'term       "/line"
**                               16      'text       'line
**                               
**                         17    /column /token-type /cont
**                               ------- ----------- ----------------
**                               2       'text       "|"
**                               4       'text       'for
**                               8       'term       "/line"
**                               14      'open       "("
**                               16      'text       'cut
**                               20      'term       "/clause"
**                               
**                         18    /column /token-type /cont
**                               ------- ----------- ----------------
**                               8       'text       "|"
**                               10      'text       'group
**                               16      'term       "/token"
**                               23      'text       'token
**                               
**                         19    /column /token-type /cont
**                               ------- ----------- ----------------
**                               8       'text       "|"
**                               10      'text       'for
**                               14      'term       "/token"
**                               21      'open       "("
**                               23      'text       'cut
**                               27      'term       "/line"
**                               33      'close      ")"
**                               
**                         20    /column /token-type /cont
**                               ------- ----------- ----------------
**                               8       'text       "|"
**                               10      'text       'fore-line
**                               20      'close      ")"
**                               
**                         21    /column /token-type /cont
**                               ------- ----------- ----------------
**                               2       'text       '--order
**                               10      'text       '--table
**                               18      'text       '--forward
**                               28      'term       "/clause"
**                               36      'term       "/clause-type"
**                         
**    5       'relmap      /line /token
**                         ----- ------------------------------------
**                         23    /column /token-type /cont
**                               ------- ----------- ----------------
**                               0       'text       'fore-line
**                               10      'text       ":"
**                               12      'text       'pick
**                               17      'term       "/line"
**                               23      'term       "/token"
**                         

**
**  SUMMARY
**       5 judges on TOKEN
**       5 judges in total
**
```



## command

This document is produced by the command:

```
koshu-inout.sh -r koshu token-table.k TOKEN.k
```
