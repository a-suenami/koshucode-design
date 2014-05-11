** -*- koshu -*-

|== Q1 -with-table : p | nest /b /c -to /g
|== Q2 -with-table : p | my-nest /b /c -to /g

my-nest : copy r ( cut @'all | slice @to ( meet r | pick @'all ))
