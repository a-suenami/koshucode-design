# I/O List

- [lexical.k](#lexicalk)
- koshu lexical.k [data.k](#datak)
- koshu lexical.k [nest.k](#nestk)
- koshu lexical.k [pass.k](#passk)
- koshu lexical.k [seperate.k](#seperatek)



## [lexical.k](lexical.k)

```
-*- koshu -*-
**
**  概要
**    重関係参照が文面上の構造で決定される例
**

|-- A  /x 0  /y 15
|-- A  /x 1  /y 20

a  : source A /x /y
a2 : a | nest /y -to /g
a3 : a | nest /x -to /g
```



## [data.k](data.k)

```
-*- koshu -*-

|== A2 : a2  --table --fore /x 
|== A3 : a3  --table --fore /y
```

Command `koshu lexical.k data.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    lexical.k
**    data.k
**

|-- A2  /x 0  /g {| /y | 15 |}
|-- A2  /x 1  /g {| /y | 20 |}

*** 2 judges

**  TABLE : A2
**
**    /x  /g
**    --- ----
**    0   /y
**        ----
**        15
**        
**    1   /y
**        ----
**        20
**        

|-- A3  /y 15  /g {| /x | 0 |}
|-- A3  /y 20  /g {| /x | 1 |}

*** 2 judges

**  TABLE : A3
**
**    /y   /g
**    ---- ---
**    15   /x
**         ---
**         0
**         
**    20   /x
**         ---
**         1
**         

**
**  SUMMARY
**       2 judges on A2
**       2 judges on A3
**       4 judges in total
**
```



## [nest.k](nest.k)

```
-*- koshu -*-
** ^/g は a3 の重関係を参照します。

|== NEST :
    a2 | slice /h (
       a3 | slice /h ( ^/g )
          | up /h )
    --table --fore /x /g
```

Command `koshu lexical.k nest.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    lexical.k
**    nest.k
**

|-- NEST  /x 0  /g {| /y | 15 |}  /h {| /x | 0 | 1 |}
|-- NEST  /x 1  /g {| /y | 20 |}  /h {| /x | 0 | 1 |}

*** 2 judges

**  TABLE : NEST
**
**    /x  /g   /h
**    --- ---- ---
**    0   /y   /x
**        ---- ---
**        15   0
**             1
**             
**    1   /y   /x
**        ---- ---
**        20   0
**             1
**             

**
**  SUMMARY
**       2 judges on NEST
**       2 judges in total
**
```



## [pass.k](pass.k)

```
-*- koshu -*-
** @'1 では、a3 の重関係 /g ではなく、a2 の /g を参照します。

|== PASS : a2 | slice /h ( g2 ^/g )
  --table --fore /x /g

g2 : a3
   | slice /h ( @'1 )
   | up /h
```

Command `koshu lexical.k pass.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    lexical.k
**    pass.k
**

|-- PASS  /x 0  /g {| /y | 15 |}  /h {| /y | 15 |}
|-- PASS  /x 1  /g {| /y | 20 |}  /h {| /y | 20 |}

*** 2 judges

**  TABLE : PASS
**
**    /x  /g   /h
**    --- ---- ----
**    0   /y   /y
**        ---- ----
**        15   15
**             
**    1   /y   /y
**        ---- ----
**        20   20
**             

**
**  SUMMARY
**       2 judges on PASS
**       2 judges in total
**
```



## [seperate.k](seperate.k)

```
-*- koshu -*-
** a3 の重関係 /g を参照します。

|== SEPARATE : a2 | slice /h ( g3 )
   --table --fore /x /g

g3 : a3
   | slice /h ( ^/g )
   | up /h
```

Command `koshu lexical.k seperate.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    lexical.k
**    seperate.k
**

|-- SEPARATE  /x 0  /g {| /y | 15 |}  /h {| /x | 0 | 1 |}
|-- SEPARATE  /x 1  /g {| /y | 20 |}  /h {| /x | 0 | 1 |}

*** 2 judges

**  TABLE : SEPARATE
**
**    /x  /g   /h
**    --- ---- ---
**    0   /y   /x
**        ---- ---
**        15   0
**             1
**             
**    1   /y   /x
**        ---- ---
**        20   0
**             1
**             

**
**  SUMMARY
**       2 judges on SEPARATE
**       2 judges in total
**
```



## command

This document is produced by the command:

```
koshu-inout.sh -r -g koshu lexical.k
```
