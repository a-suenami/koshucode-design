# Koshu I/O Listing

- koshu [slice.k](#slicek)



## [slice.k](slice.k)

```
** -*- koshu -*-
**
**  概要
**    rel を使って、group を実装する。
**
**  使用例
**    koshu slice.k
**

|-- P  /a 10  /b 40
|-- P  /a 10  /b 50

|-- Q  /b 40  /c 70
|-- Q  /b 40  /c 80
|-- Q  /b 50  /c 90

p : source P /a /b
q : source Q /b /c

|== GROUP -fore /a /b :
    p | group /g q

|== REL -fore /a /b : 
    p | rel /r ( meet q | pick-term q )

|== SLICE -fore /a /b : 
    p | rel /r id
```
Command `koshu slice.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    slice.k
**

|-- GROUP  /a 10  /b 40  /g {| /b : /c | 40 : 80 | 40 : 70 |}
|-- GROUP  /a 10  /b 50  /g {| /b : /c | 50 : 90 |}
|-- REL  /a 10  /b 40  /r {| /b : /c | 40 : 80 | 40 : 70 |}
|-- REL  /a 10  /b 50  /r {| /b : /c | 50 : 90 |}
|-- SLICE  /a 10  /b 40  /r {| /a : /b | 10 : 40 |}

|-- SLICE  /a 10  /b 50  /r {| /a : /b | 10 : 50 |}

**
**  SUMMARY
**       2 judges on GROUP
**       2 judges on REL
**       2 judges on SLICE
**       6 judges in total
**
```
