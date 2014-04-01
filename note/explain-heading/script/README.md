# Koshu I/O Listing

- koshu [head-1.k](#head-1k)
- koshu [head-2.k](#head-2k)
- koshu [head-3.k](#head-3k)
- koshu [head-4.k](#head-4k)
- koshu [head-5.k](#head-5k)



## [head-1.k](head-1.k)

```
** -*- koshu -*-

p : source P /a /b

|== HEAD : p
         | pick /x   ** error

```
Command `koshu head-1.k` exits at 2 and produces:

```
** -*- koshu -*-
**
**  INPUT
**    head-1.k
**

**
**  ABORTED  Unknown term name
**  -------- -------------------- -------------
**  Detail   Unknown
**             /x
**           Relation
**             /a
**             /b
**  Source   6 11 head-1.k
**           > pick /x   ** error .. specialize
**           5 0 head-1.k
**           > |== HEAD : p       .. assert
**  Command  koshu
**           head-1.k
**
**  Exit with status 2
**
```



## [head-2.k](head-2.k)

```
** -*- koshu -*-

p : source P /a /b
q : source Q /b /c

|== HEAD : p | meet q
         | pick /x   ** error

```
Command `koshu head-2.k` exits at 2 and produces:

```
** -*- koshu -*-
**
**  INPUT
**    head-2.k
**

**
**  ABORTED  Unknown term name
**  -------- ----------------------- -------------
**  Detail   Unknown
**             /x
**           Relation
**             /c
**             /a
**             /b
**  Source   7 11 head-2.k
**           > pick /x   ** error    .. specialize
**           6 0 head-2.k
**           > |== HEAD : p | meet q .. assert
**  Command  koshu
**           head-2.k
**
**  Exit with status 2
**
```



## [head-3.k](head-3.k)

```
** -*- koshu -*-

p  : source P /a /b
q  : source Q /b /c
pg : p | group /g q

|== HEAD : pg
         | pick /x   ** error

```
Command `koshu head-3.k` exits at 2 and produces:

```
** -*- koshu -*-
**
**  INPUT
**    head-3.k
**

**
**  ABORTED  Unknown term name
**  -------- -------------------- -------------
**  Detail   Unknown
**             /x
**           Relation
**             /g /b
**                /c
**             /a
**             /b
**  Source   8 11 head-3.k
**           > pick /x   ** error .. specialize
**           7 0 head-3.k
**           > |== HEAD : pg      .. assert
**  Command  koshu
**           head-3.k
**
**  Exit with status 2
**
```



## [head-4.k](head-4.k)

```
** -*- koshu -*-

p  : source P /a /b
q  : source Q /b /c
pg : p | group /g q
gc : pg | for /g ( pick /c )

|== HEAD : gc
         | pick /x   ** error

```
Command `koshu head-4.k` exits at 2 and produces:

```
** -*- koshu -*-
**
**  INPUT
**    head-4.k
**

**
**  ABORTED  Unknown term name
**  -------- -------------------- -------------
**  Detail   Unknown
**             /x
**           Relation
**             /g /c
**             /a
**             /b
**  Source   9 11 head-4.k
**           > pick /x   ** error .. specialize
**           8 0 head-4.k
**           > |== HEAD : gc      .. assert
**  Command  koshu
**           head-4.k
**
**  Exit with status 2
**
```



## [head-5.k](head-5.k)

```
** -*- koshu -*-

p  : source P /a /b
q  : source Q /b /c
pg : p | group /g q
gc : pg | for /g ( pick /c )
gh : gc | for /g ( group /h ( source R /c /d )
                 | for /h ( cut /c ))
        | add /e ( /g/h/d )

|== HEAD : gh
         | pick /x   ** error

```
Command `koshu head-5.k` exits at 2 and produces:

```
** -*- koshu -*-
**
**  INPUT
**    head-5.k
**

**
**  ABORTED  Unknown term name
**  -------- -------------------- -------------
**  Detail   Unknown
**             /x
**           Relation
**             /e
**             /g /h /d
**                /c
**             /a
**             /b
**  Source   12 11 head-5.k
**           > pick /x   ** error .. specialize
**           11 0 head-5.k
**           > |== HEAD : gh      .. assert
**  Command  koshu
**           head-5.k
**
**  Exit with status 2
**
```
