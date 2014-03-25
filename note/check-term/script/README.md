# Koshu I/O Listing

- koshu [but-abort.k](#but-abortk)
- koshu [but-normal.k](#but-normalk)
- koshu [has-abort.k](#has-abortk)
- koshu [has-normal.k](#has-normalk)
- koshu [just-abort.k](#just-abortk)
- koshu [just-normal.k](#just-normalk)



## [but-abort.k](but-abort.k)

```
** -*- koshu -*-
|-- A  /x 10  /y 20
|== B : source A /x /y | check-term -but /x
```
Command `koshu but-abort.k` exits at 2 and produces:

```
** -*- koshu -*-
**
**  INPUT
**    but-abort.k
**

**
**  ABORTED  check-term failed
**  -------- --------------------------------------------- -------------
**  Detail   But
**             /x
**           Relation
**             /x
**             /y
**  Source   3 25 but-abort.k
**           > check-term -but /x                          .. specialize
**           3 0 but-abort.k
**           > |== B : source A /x /y | check-term -but /x .. assert
**  Command  koshu
**           but-abort.k
**
**  Exit with status 2
**
```



## [but-normal.k](but-normal.k)

```
** -*- koshu -*-
|-- A  /x 10  /y 20
|== B : source A /x /y | check-term -but /z
```
Command `koshu but-normal.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    but-normal.k
**

|-- B  /x 10  /y 20

**
**  SUMMARY
**       1 judge  on B
**       1 judge  in total
**
```



## [has-abort.k](has-abort.k)

```
** -*- koshu -*-
|-- A  /x 10  /y 20
|== B : source A /x /y | check-term -has /z
```
Command `koshu has-abort.k` exits at 2 and produces:

```
** -*- koshu -*-
**
**  INPUT
**    has-abort.k
**

**
**  ABORTED  check-term failed
**  -------- --------------------------------------------- -------------
**  Detail   Has
**             /z
**           Relation
**             /x
**             /y
**  Source   3 25 has-abort.k
**           > check-term -has /z                          .. specialize
**           3 0 has-abort.k
**           > |== B : source A /x /y | check-term -has /z .. assert
**  Command  koshu
**           has-abort.k
**
**  Exit with status 2
**
```



## [has-normal.k](has-normal.k)

```
** -*- koshu -*-
|-- A  /x 10  /y 20
|== B : source A /x /y | check-term -has /x
```
Command `koshu has-normal.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    has-normal.k
**

|-- B  /x 10  /y 20

**
**  SUMMARY
**       1 judge  on B
**       1 judge  in total
**
```



## [just-abort.k](just-abort.k)

```
** -*- koshu -*-
|-- A  /x 10  /y 20
|== B : source A /x /y | check-term -just /x
```
Command `koshu just-abort.k` exits at 2 and produces:

```
** -*- koshu -*-
**
**  INPUT
**    just-abort.k
**

**
**  ABORTED  check-term failed
**  -------- ---------------------------------------------- -------------
**  Detail   Just
**             /x
**           Relation
**             /x
**             /y
**  Source   3 25 just-abort.k
**           > check-term -just /x                          .. specialize
**           3 0 just-abort.k
**           > |== B : source A /x /y | check-term -just /x .. assert
**  Command  koshu
**           just-abort.k
**
**  Exit with status 2
**
```



## [just-normal.k](just-normal.k)

```
** -*- koshu -*-
|-- A  /x 10  /y 20
|== B : source A /x /y | check-term -just /x /y
```
Command `koshu just-normal.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    just-normal.k
**

|-- B  /x 10  /y 20

**
**  SUMMARY
**       1 judge  on B
**       1 judge  in total
**
```
