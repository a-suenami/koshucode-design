-*- koshu -*-

|== Q1 : p | nest /b /c -to /g     --table
|== Q2 : p | my-nest /b /c -to /g  --table

my-nest : copy r ( cut @'all | slice @to ( meet ^r | pick @'all ))
