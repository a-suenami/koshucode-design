-*- koshu -*-

n : p | nest /b /c -to /g

|== R0 -table : n
|== R1 : n | unnest /g
|== R2 : n | slice /r ( cut /g | meet ^/g ) | up /r
|== R3 : n | my-unnest /g

my-unnest : slice-up ( cut @'1 | meet ^/g )   ** ^@'1
