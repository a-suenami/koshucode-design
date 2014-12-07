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

|== TOKEN -order -table -fore /clause /clause-type
  : clause
  | group /line line
  | for /line ( cut /clause
        | group /token token
        | for /token ( cut /line )
        | fore-line )

fore-line : pick /line /token
