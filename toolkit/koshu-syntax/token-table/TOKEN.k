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

*** |== TOKEN -order -table -fore /clause /clause-type
***   : clause
***   | group /line line
***   | for /line ( cut /clause
***         | group /token token
***         | for /token ( cut /line )
***         | fore-line )

|-- CLAUSE  /clause 4  /clause-type 'assert
|-- LINE  /line 14  /clause 4
|-- LINE  /line 15  /clause 4
|-- LINE  /line 16  /clause 4
|-- LINE  /line 17  /clause 4
|-- LINE  /line 18  /clause 4
|-- LINE  /line 19  /clause 4
|-- LINE  /line 20  /clause 4

|-- TOKEN  /line 14  /column 0  /token-type 'text  /token-subtype 'bar  /cont "|=="
|-- TOKEN  /line 14  /column 3  /token-type 'space  /cont " "
|-- TOKEN  /line 14  /column 4  /token-type 'text  /token-subtype 'raw  /cont 'TOKEN
|-- TOKEN  /line 14  /column 9  /token-type 'space  /cont " "
|-- TOKEN  /line 14  /column 10  /token-type 'text  /token-subtype 'raw  /cont '-order
|-- TOKEN  /line 14  /column 16  /token-type 'space  /cont " "
|-- TOKEN  /line 14  /column 17  /token-type 'text  /token-subtype 'raw  /cont '-table
|-- TOKEN  /line 14  /column 23  /token-type 'space  /cont " "
|-- TOKEN  /line 14  /column 24  /token-type 'text  /token-subtype 'raw  /cont '-fore
|-- TOKEN  /line 14  /column 29  /token-type 'space  /cont " "
|-- TOKEN  /line 14  /column 30  /token-type 'term  /cont "/clause"
|-- TOKEN  /line 14  /column 37  /token-type 'space  /cont " "
|-- TOKEN  /line 14  /column 38  /token-type 'term  /cont "/clause-type"

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

*** fore-line : pick /line /token

|-- CLAUSE  /clause 5  /clause-type 'relmap
|-- LINE  /line 22  /clause 5

|-- TOKEN  /line 22  /column 0  /token-type 'text  /token-subtype 'raw  /cont 'fore-line
|-- TOKEN  /line 22  /column 9  /token-type 'space  /cont " "
|-- TOKEN  /line 22  /column 10  /token-type 'text  /token-subtype 'raw  /cont ":"
|-- TOKEN  /line 22  /column 11  /token-type 'space  /cont " "
|-- TOKEN  /line 22  /column 12  /token-type 'text  /token-subtype 'raw  /cont 'pick
|-- TOKEN  /line 22  /column 16  /token-type 'space  /cont " "
|-- TOKEN  /line 22  /column 17  /token-type 'term  /cont "/line"
|-- TOKEN  /line 22  /column 22  /token-type 'space  /cont " "
|-- TOKEN  /line 22  /column 23  /token-type 'term  /cont "/token"

