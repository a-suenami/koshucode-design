-*- koshu -*-

n : p | nest /b /c -to /g

|== R0 : n  --table
|== R1 : n | unnest /g
|== R2 : n | slice /r ( cut /g | meet ^/g ) | up /r
|== R3 : n | my-unnest /g
|== R4 : n | rename /h /g | my-unnest /h

my-unnest : slice-up ( cut @'1 | meet @g )
  --attr nest -g @'1
