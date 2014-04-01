** -*- koshu -*-

p  : source P /a /b
q  : source Q /b /c
pg : p | group /g q
gc : pg | for /g ( pick /c )

|== HEAD : gc
         | pick /x   ** error

