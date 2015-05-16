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
  | group line -to /line
  | for /line ( cut /clause
        | group token -to /token
        | for /token ( cut /line )
        | fore-line )
  --order --table --forward /clause /clause-type

fore-line : pick /line /token
