** -*- koshu -*-

p : source P /a /b
q : source Q /b /c

|== HEAD : p | meet q
         | pick /x   ** error

