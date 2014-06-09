# I/O List

- [token-table.k](#token-tablek)
- [TOKEN.k](#tokenk)
- [output](#output)



## [token-table.k](token-table.k)

```
** -*- koshu -*-
**
**  USAGE
**    koshu-syntax ... | koshu -i token-table.k
**

clause : source CLAUSE /clause /clause-type
token  : source TOKEN /clause /line /col /type /cont

|== TOKEN -order -table -fore /clause /clause-type
  : token
  | omit /type = 'space
  | meet clause
  | nest ~ /clause /clause-type -to /line
  | for /line ( nest ~ /line -to /token | fore-line )

fore-line : pick /line /token

```



## [TOKEN.k](TOKEN.k)

```
**
**  DESCRIPTION
**    Clauses and tokens from "token-table.k"
**
**  LEGEND
**    *** [C0] clause type
**    *** [C0] L0 line content
**    |-- CLAUSE /clause /clause-type
**    |-- TOKEN /clause /line /seq /type /cont
**

*** [C1] relmap
|-- CLAUSE  /clause 1  /clause-type 'relmap

*** [C1] L7 "clause : source CLAUSE /clause /clause-type"
|-- TOKEN  /clause 1  /line 7  /col 0  /type 'text  /cont 'clause
|-- TOKEN  /clause 1  /line 7  /col 6  /type 'space  /cont " "
|-- TOKEN  /clause 1  /line 7  /col 7  /type 'text  /cont ":"
|-- TOKEN  /clause 1  /line 7  /col 8  /type 'space  /cont " "
|-- TOKEN  /clause 1  /line 7  /col 9  /type 'text  /cont 'source
|-- TOKEN  /clause 1  /line 7  /col 15  /type 'space  /cont " "
|-- TOKEN  /clause 1  /line 7  /col 16  /type 'text  /cont 'CLAUSE
|-- TOKEN  /clause 1  /line 7  /col 22  /type 'space  /cont " "
|-- TOKEN  /clause 1  /line 7  /col 23  /type 'term  /cont "/clause"
|-- TOKEN  /clause 1  /line 7  /col 30  /type 'space  /cont " "
|-- TOKEN  /clause 1  /line 7  /col 31  /type 'term  /cont "/clause-type"

*** [C2] relmap
|-- CLAUSE  /clause 2  /clause-type 'relmap

*** [C2] L8 "token  : source TOKEN /clause /line /col /type /cont"
|-- TOKEN  /clause 2  /line 8  /col 0  /type 'text  /cont 'token
|-- TOKEN  /clause 2  /line 8  /col 5  /type 'space  /cont "  "
|-- TOKEN  /clause 2  /line 8  /col 7  /type 'text  /cont ":"
|-- TOKEN  /clause 2  /line 8  /col 8  /type 'space  /cont " "
|-- TOKEN  /clause 2  /line 8  /col 9  /type 'text  /cont 'source
|-- TOKEN  /clause 2  /line 8  /col 15  /type 'space  /cont " "
|-- TOKEN  /clause 2  /line 8  /col 16  /type 'text  /cont 'TOKEN
|-- TOKEN  /clause 2  /line 8  /col 21  /type 'space  /cont " "
|-- TOKEN  /clause 2  /line 8  /col 22  /type 'term  /cont "/clause"
|-- TOKEN  /clause 2  /line 8  /col 29  /type 'space  /cont " "
|-- TOKEN  /clause 2  /line 8  /col 30  /type 'term  /cont "/line"
|-- TOKEN  /clause 2  /line 8  /col 35  /type 'space  /cont " "
|-- TOKEN  /clause 2  /line 8  /col 36  /type 'term  /cont "/col"
|-- TOKEN  /clause 2  /line 8  /col 40  /type 'space  /cont " "
|-- TOKEN  /clause 2  /line 8  /col 41  /type 'term  /cont "/type"
|-- TOKEN  /clause 2  /line 8  /col 46  /type 'space  /cont " "
|-- TOKEN  /clause 2  /line 8  /col 47  /type 'term  /cont "/cont"

*** [C3] assert
|-- CLAUSE  /clause 3  /clause-type 'assert

*** [C3] L10 "|== TOKEN -order -table -fore /clause /clause-type"
|-- TOKEN  /clause 3  /line 10  /col 0  /type 'text  /cont "|"
|-- TOKEN  /clause 3  /line 10  /col 1  /type 'text  /cont '==
|-- TOKEN  /clause 3  /line 10  /col 3  /type 'space  /cont " "
|-- TOKEN  /clause 3  /line 10  /col 4  /type 'text  /cont 'TOKEN
|-- TOKEN  /clause 3  /line 10  /col 9  /type 'space  /cont " "
|-- TOKEN  /clause 3  /line 10  /col 10  /type 'text  /cont '-order
|-- TOKEN  /clause 3  /line 10  /col 16  /type 'space  /cont " "
|-- TOKEN  /clause 3  /line 10  /col 17  /type 'text  /cont '-table
|-- TOKEN  /clause 3  /line 10  /col 23  /type 'space  /cont " "
|-- TOKEN  /clause 3  /line 10  /col 24  /type 'text  /cont '-fore
|-- TOKEN  /clause 3  /line 10  /col 29  /type 'space  /cont " "
|-- TOKEN  /clause 3  /line 10  /col 30  /type 'term  /cont "/clause"
|-- TOKEN  /clause 3  /line 10  /col 37  /type 'space  /cont " "
|-- TOKEN  /clause 3  /line 10  /col 38  /type 'term  /cont "/clause-type"

*** [C3] L11 "  : token"
|-- TOKEN  /clause 3  /line 11  /col 0  /type 'space  /cont "  "
|-- TOKEN  /clause 3  /line 11  /col 2  /type 'text  /cont ":"
|-- TOKEN  /clause 3  /line 11  /col 3  /type 'space  /cont " "
|-- TOKEN  /clause 3  /line 11  /col 4  /type 'text  /cont 'token

*** [C3] L12 "  | omit /type = 'space"
|-- TOKEN  /clause 3  /line 12  /col 0  /type 'space  /cont "  "
|-- TOKEN  /clause 3  /line 12  /col 2  /type 'text  /cont "|"
|-- TOKEN  /clause 3  /line 12  /col 3  /type 'space  /cont " "
|-- TOKEN  /clause 3  /line 12  /col 4  /type 'text  /cont 'omit
|-- TOKEN  /clause 3  /line 12  /col 8  /type 'space  /cont " "
|-- TOKEN  /clause 3  /line 12  /col 9  /type 'term  /cont "/type"
|-- TOKEN  /clause 3  /line 12  /col 14  /type 'space  /cont " "
|-- TOKEN  /clause 3  /line 12  /col 15  /type 'text  /cont '=
|-- TOKEN  /clause 3  /line 12  /col 16  /type 'space  /cont " "
|-- TOKEN  /clause 3  /line 12  /col 17  /type 'text  /cont 'space

*** [C3] L13 "  | meet clause"
|-- TOKEN  /clause 3  /line 13  /col 0  /type 'space  /cont "  "
|-- TOKEN  /clause 3  /line 13  /col 2  /type 'text  /cont "|"
|-- TOKEN  /clause 3  /line 13  /col 3  /type 'space  /cont " "
|-- TOKEN  /clause 3  /line 13  /col 4  /type 'text  /cont 'meet
|-- TOKEN  /clause 3  /line 13  /col 8  /type 'space  /cont " "
|-- TOKEN  /clause 3  /line 13  /col 9  /type 'text  /cont 'clause

*** [C3] L14 "  | nest ~ /clause /clause-type -to /line"
|-- TOKEN  /clause 3  /line 14  /col 0  /type 'space  /cont "  "
|-- TOKEN  /clause 3  /line 14  /col 2  /type 'text  /cont "|"
|-- TOKEN  /clause 3  /line 14  /col 3  /type 'space  /cont " "
|-- TOKEN  /clause 3  /line 14  /col 4  /type 'text  /cont 'nest
|-- TOKEN  /clause 3  /line 14  /col 8  /type 'space  /cont " "
|-- TOKEN  /clause 3  /line 14  /col 9  /type 'text  /cont "~"
|-- TOKEN  /clause 3  /line 14  /col 10  /type 'space  /cont " "
|-- TOKEN  /clause 3  /line 14  /col 11  /type 'term  /cont "/clause"
|-- TOKEN  /clause 3  /line 14  /col 18  /type 'space  /cont " "
|-- TOKEN  /clause 3  /line 14  /col 19  /type 'term  /cont "/clause-type"
|-- TOKEN  /clause 3  /line 14  /col 31  /type 'space  /cont " "
|-- TOKEN  /clause 3  /line 14  /col 32  /type 'text  /cont '-to
|-- TOKEN  /clause 3  /line 14  /col 35  /type 'space  /cont " "
|-- TOKEN  /clause 3  /line 14  /col 36  /type 'term  /cont "/line"

*** [C3] L15 "  | for /line ( nest ~ /line -to /token | fore-line )"
|-- TOKEN  /clause 3  /line 15  /col 0  /type 'space  /cont "  "
|-- TOKEN  /clause 3  /line 15  /col 2  /type 'text  /cont "|"
|-- TOKEN  /clause 3  /line 15  /col 3  /type 'space  /cont " "
|-- TOKEN  /clause 3  /line 15  /col 4  /type 'text  /cont 'for
|-- TOKEN  /clause 3  /line 15  /col 7  /type 'space  /cont " "
|-- TOKEN  /clause 3  /line 15  /col 8  /type 'term  /cont "/line"
|-- TOKEN  /clause 3  /line 15  /col 13  /type 'space  /cont " "
|-- TOKEN  /clause 3  /line 15  /col 14  /type 'open  /cont "("
|-- TOKEN  /clause 3  /line 15  /col 15  /type 'space  /cont " "
|-- TOKEN  /clause 3  /line 15  /col 16  /type 'text  /cont 'nest
|-- TOKEN  /clause 3  /line 15  /col 20  /type 'space  /cont " "
|-- TOKEN  /clause 3  /line 15  /col 21  /type 'text  /cont "~"
|-- TOKEN  /clause 3  /line 15  /col 22  /type 'space  /cont " "
|-- TOKEN  /clause 3  /line 15  /col 23  /type 'term  /cont "/line"
|-- TOKEN  /clause 3  /line 15  /col 28  /type 'space  /cont " "
|-- TOKEN  /clause 3  /line 15  /col 29  /type 'text  /cont '-to
|-- TOKEN  /clause 3  /line 15  /col 32  /type 'space  /cont " "
|-- TOKEN  /clause 3  /line 15  /col 33  /type 'term  /cont "/token"
|-- TOKEN  /clause 3  /line 15  /col 39  /type 'space  /cont " "
|-- TOKEN  /clause 3  /line 15  /col 40  /type 'text  /cont "|"
|-- TOKEN  /clause 3  /line 15  /col 41  /type 'space  /cont " "
|-- TOKEN  /clause 3  /line 15  /col 42  /type 'text  /cont 'fore-line
|-- TOKEN  /clause 3  /line 15  /col 51  /type 'space  /cont " "
|-- TOKEN  /clause 3  /line 15  /col 52  /type 'close  /cont ")"

*** [C4] relmap
|-- CLAUSE  /clause 4  /clause-type 'relmap

*** [C4] L17 "fore-line : pick /line /token"
|-- TOKEN  /clause 4  /line 17  /col 0  /type 'text  /cont 'fore-line
|-- TOKEN  /clause 4  /line 17  /col 9  /type 'space  /cont " "
|-- TOKEN  /clause 4  /line 17  /col 10  /type 'text  /cont ":"
|-- TOKEN  /clause 4  /line 17  /col 11  /type 'space  /cont " "
|-- TOKEN  /clause 4  /line 17  /col 12  /type 'text  /cont 'pick
|-- TOKEN  /clause 4  /line 17  /col 16  /type 'space  /cont " "
|-- TOKEN  /clause 4  /line 17  /col 17  /type 'term  /cont "/line"
|-- TOKEN  /clause 4  /line 17  /col 22  /type 'space  /cont " "
|-- TOKEN  /clause 4  /line 17  /col 23  /type 'term  /cont "/token"
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

|-- TOKEN  /clause 1  /clause-type 'relmap  /line {| /line : /token | 7 : {| /col : /type : /cont | 0 : 'text : 'clause | 7 : 'text : ":" | 9 : 'text : 'source | 16 : 'text : 'CLAUSE | 23 : 'term : "/clause" | 31 : 'term : "/clause-type" |} |}
|-- TOKEN  /clause 2  /clause-type 'relmap  /line {| /line : /token | 8 : {| /col : /type : /cont | 0 : 'text : 'token | 7 : 'text : ":" | 9 : 'text : 'source | 16 : 'text : 'TOKEN | 22 : 'term : "/clause" | 30 : 'term : "/line" | 36 : 'term : "/col" | 41 : 'term : "/type" | 47 : 'term : "/cont" |} |}
|-- TOKEN  /clause 3  /clause-type 'assert  /line {| /line : /token | 10 : {| /col : /type : /cont | 0 : 'text : "|" | 1 : 'text : '== | 4 : 'text : 'TOKEN | 10 : 'text : '-order | 17 : 'text : '-table | 24 : 'text : '-fore | 30 : 'term : "/clause" | 38 : 'term : "/clause-type" |} | 11 : {| /col : /type : /cont | 2 : 'text : ":" | 4 : 'text : 'token |} | 12 : {| /col : /type : /cont | 2 : 'text : "|" | 4 : 'text : 'omit | 9 : 'term : "/type" | 15 : 'text : '= | 17 : 'text : 'space |} | 13 : {| /col : /type : /cont | 2 : 'text : "|" | 4 : 'text : 'meet | 9 : 'text : 'clause |} | 14 : {| /col : /type : /cont | 2 : 'text : "|" | 4 : 'text : 'nest | 9 : 'text : "~" | 11 : 'term : "/clause" | 19 : 'term : "/clause-type" | 32 : 'text : '-to | 36 : 'term : "/line" |} | 15 : {| /col : /type : /cont | 2 : 'text : "|" | 4 : 'text : 'for | 8 : 'term : "/line" | 14 : 'open : "(" | 16 : 'text : 'nest | 21 : 'text : "~" | 23 : 'term : "/line" | 29 : 'text : '-to | 33 : 'term : "/token" | 40 : 'text : "|" | 42 : 'text : 'fore-line | 52 : 'close : ")" |} |}
|-- TOKEN  /clause 4  /clause-type 'relmap  /line {| /line : /token | 17 : {| /col : /type : /cont | 0 : 'text : 'fore-line | 10 : 'text : ":" | 12 : 'text : 'pick | 17 : 'term : "/line" | 23 : 'term : "/token" |} |}

*** 4 judges

**  TABLE : TOKEN
**
**    /clause /clause-type /line
**    ------- ------------ ------------------------------------
**    1       'relmap      /line /token
**                         ----- ------------------------------
**                         7     /col /type    /cont
**                               ---- -------- ----------------
**                               0    'text    'clause
**                               7    'text    ":"
**                               9    'text    'source
**                               16   'text    'CLAUSE
**                               23   'term    "/clause"
**                               31   'term    "/clause-type"
**                         
**    2       'relmap      /line /token
**                         ----- ------------------------------
**                         8     /col /type    /cont
**                               ---- -------- ----------------
**                               0    'text    'token
**                               7    'text    ":"
**                               9    'text    'source
**                               16   'text    'TOKEN
**                               22   'term    "/clause"
**                               30   'term    "/line"
**                               36   'term    "/col"
**                               41   'term    "/type"
**                               47   'term    "/cont"
**                         
**    3       'assert      /line /token
**                         ----- ------------------------------
**                         10    /col /type    /cont
**                               ---- -------- ----------------
**                               0    'text    "|"
**                               1    'text    '==
**                               4    'text    'TOKEN
**                               10   'text    '-order
**                               17   'text    '-table
**                               24   'text    '-fore
**                               30   'term    "/clause"
**                               38   'term    "/clause-type"
**                               
**                         11    /col /type    /cont
**                               ---- -------- ----------------
**                               2    'text    ":"
**                               4    'text    'token
**                               
**                         12    /col /type    /cont
**                               ---- -------- ----------------
**                               2    'text    "|"
**                               4    'text    'omit
**                               9    'term    "/type"
**                               15   'text    '=
**                               17   'text    'space
**                               
**                         13    /col /type    /cont
**                               ---- -------- ----------------
**                               2    'text    "|"
**                               4    'text    'meet
**                               9    'text    'clause
**                               
**                         14    /col /type    /cont
**                               ---- -------- ----------------
**                               2    'text    "|"
**                               4    'text    'nest
**                               9    'text    "~"
**                               11   'term    "/clause"
**                               19   'term    "/clause-type"
**                               32   'text    '-to
**                               36   'term    "/line"
**                               
**                         15    /col /type    /cont
**                               ---- -------- ----------------
**                               2    'text    "|"
**                               4    'text    'for
**                               8    'term    "/line"
**                               14   'open    "("
**                               16   'text    'nest
**                               21   'text    "~"
**                               23   'term    "/line"
**                               29   'text    '-to
**                               33   'term    "/token"
**                               40   'text    "|"
**                               42   'text    'fore-line
**                               52   'close   ")"
**                         
**    4       'relmap      /line /token
**                         ----- ------------------------------
**                         17    /col /type    /cont
**                               ---- -------- ----------------
**                               0    'text    'fore-line
**                               10   'text    ":"
**                               12   'text    'pick
**                               17   'term    "/line"
**                               23   'term    "/token"
**                         

**
**  SUMMARY
**       4 judges on TOKEN
**       4 judges in total
**
```



## command

This document is produced by the command:

```
koshu-inout.sh -s koshu token-table.k TOKEN.k
```
