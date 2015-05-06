-*- koshu -*-

n : p | nest /b /c -to /g

|== R0 : n  --table
|== R1 : n | ungroup /g
|== R2 : n | slice /r ( cut /g | meet ^/g ) | up /r
|== R3 : n | my-ungroup /g
|== R4 : n | rename /h /g | my-ungroup /h

my-ungroup : slice-up ( cut @'1 | meet @g )
  --attr nest -g @'1
