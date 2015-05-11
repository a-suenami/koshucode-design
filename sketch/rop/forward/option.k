** -*- koshu -*-
**
**  '--forward' option moves terms to the front.
**

|-- P  /a 1  /b 10  /c 100
|-- P  /a 2  /b 20  /c 200

p : source P /a /b /c

|== A : p  --forward /a
|== B : p  --forward /b
|== C : p  --forward /c

|== AB : p  --forward /a /b
|== AC : p  --forward /a /c
|== BA : p  --forward /b /a
|== BC : p  --forward /b /c
|== CA : p  --forward /c /a
|== CB : p  --forward /c /b

|== ABC : p  --forward /a /b /c
|== ACB : p  --forward /a /c /b
|== BAC : p  --forward /b /a /c
|== BCA : p  --forward /b /c /a
|== CAB : p  --forward /c /a /b
|== CBA : p  --forward /c /b /a
