-*- koshu -*-

|== Q1 -table : p | nest /b /c -to /g
|== Q2 -table : p | my-nest /b /c -to /g

my-nest : copy r ( cut @'all | slice @to ( meet ^r | pick @'all ))
