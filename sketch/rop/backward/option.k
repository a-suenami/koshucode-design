** -*- koshu -*-
**
**  '--backward' option moves terms to the rear.
**

|-- P  /a 1  /b 10  /c 100
|-- P  /a 2  /b 20  /c 200

p : source P /a /b /c

|== A : p  --backward /a
|== B : p  --backward /b
|== C : p  --backward /c

|== AB : p  --backward /a /b
|== AC : p  --backward /a /c
|== BA : p  --backward /b /a
|== BC : p  --backward /b /c
|== CA : p  --backward /c /a
|== CB : p  --backward /c /b

|== ABC : p  --backward /a /b /c
|== ACB : p  --backward /a /c /b
|== BAC : p  --backward /b /a /c
|== BCA : p  --backward /b /c /a
|== CAB : p  --backward /c /a /b
|== CBA : p  --backward /c /b /a
