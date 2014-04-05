** -*- koshu -*-
**
**  DESCRIPTION
**    Implement "down" by "copy-dee-slice" combination.
**
**  USAGE
**    koshu copy.k
**

|-- P  /a 10  /b 40
|-- P  /a 10  /b 50
|-- P  /a 20  /b 60

p : source P /a /b

|== DOWN-1 : p | down /r
|== DOWN-2 : slice /r p
|== DOWN-3 : p | copy r ( slice /r r )
|== DOWN-4 : p | copy r ( dee | slice /r r )
