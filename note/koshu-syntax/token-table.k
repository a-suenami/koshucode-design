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

