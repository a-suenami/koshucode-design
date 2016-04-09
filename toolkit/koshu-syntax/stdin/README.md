# I/O List

- [./stdin.sh](#stdinsh)
- [output](#output)



## [./stdin.sh](./stdin.sh)

```
#!/bin/sh

cat <<EOF | koshu-syntax -ib
|-- P  /x 0
       /y 1
|== Q : source P /x /y
EOF
```



## output


Command `./stdin.sh` produces:

```
**
**  DESCRIPTION
**    Clauses and tokens
**
**  INPUT
**    (stdin)
**
**  JUDGES
**    |-- CLAUSE  /clause -> /clause-type
**    |-- LINE    /line -> /clause
**    |-- TOKEN   /line /column -> /token-type [/token-subtype] /cont
**
**    {| There is a clause numbered /clause on /line .
**       Type of the clause is /clause-type .
**       There is a token of content /cont at /line and /column .
**       Type of the token is /token-type .
**       Some tokens are classified into /token-subtype . |}
**

*** |-- P  /x 0
***        /y 1

|-- CLAUSE  /clause 1  /clause-type "judge"
|-- LINE  /line 1  /clause 1
|-- LINE  /line 2  /clause 1

|-- TOKEN  /line 1  /column 0  /token-type "text"  /token-subtype "bar"  /cont "|--"
|-- TOKEN  /line 1  /column 4  /token-type "text"  /token-subtype "raw"  /cont "P"
|-- TOKEN  /line 1  /column 7  /token-type "term"  /cont "/x"
|-- TOKEN  /line 1  /column 10  /token-type "text"  /token-subtype "raw"  /cont "0"

|-- TOKEN  /line 2  /column 7  /token-type "term"  /cont "/y"
|-- TOKEN  /line 2  /column 10  /token-type "text"  /token-subtype "raw"  /cont "1"

*** |== Q : source P /x /y

|-- CLAUSE  /clause 2  /clause-type "assert"
|-- LINE  /line 3  /clause 2

|-- TOKEN  /line 3  /column 0  /token-type "text"  /token-subtype "bar"  /cont "|=="
|-- TOKEN  /line 3  /column 4  /token-type "text"  /token-subtype "raw"  /cont "Q"
|-- TOKEN  /line 3  /column 6  /token-type "text"  /token-subtype "raw"  /cont ":"
|-- TOKEN  /line 3  /column 8  /token-type "text"  /token-subtype "raw"  /cont "source"
|-- TOKEN  /line 3  /column 15  /token-type "text"  /token-subtype "raw"  /cont "P"
|-- TOKEN  /line 3  /column 17  /token-type "term"  /cont "/x"
|-- TOKEN  /line 3  /column 20  /token-type "term"  /cont "/y"

```



## command

This document is produced by the command:

```
koshu-inout.sh -r ./stdin.sh
```
