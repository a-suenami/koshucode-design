** -*- koshu -*-

p  : source P /a /b
q  : source Q /b /c
r  : source R /c /d
pg : p | group /g q
gc : pg | for /g ( pick /c )
gh : gc | for /g ( group /h r | for /h ( cut /c ))
        | add /e ( /g/h/d )

|== HEAD : gh
         | pick /x   ** error

