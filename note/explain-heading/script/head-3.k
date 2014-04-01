** -*- koshu -*-

p  : source P /a /b
q  : source Q /b /c
pg : p | group /g q

|== HEAD : pg
         | pick /x   ** error

