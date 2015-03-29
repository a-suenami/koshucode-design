# I/O List

- koshu [term-set.k](#term-setk)



## [term-set.k](term-set.k)

```
** -*- koshu -*-
**
**  DESCRIPTION
**    Data interpretations of SUPPLIER-PARTS dataset.
**
**    <<< ... >>> is used for literal of data interpretations.
**    Interpretations are written as judgementable sentences
**    which include term names.
**
**    "term-set" operator extracts term names from interpretation.
**
**  USAGE
**    koshu term-set.k
**

|-- INTERP  /judge 'S
            /interp <<< Supplier /sno named /sname is under contract.
                        The supplier has status value /status ,
                        and is located in the /city . >>>

|-- INTERP  /judge 'P
            /interp <<< Parts /pno named /pname are managed.
                        Its color is /color , weight is /weight ,
                        and the parts are kept in the /city . >>>

|-- INTERP  /judge 'SP
            /interp <<< Supplier /sno ships parts /pno
                        in the amount of /qty . >>>

|== INTERP : interpretation

interpretation : source INTERP /judge /interp

|== TERMS : terms  --forward /judge
|== TERM  : terms | member /term /terms | cut /terms  --forward /judge

terms : interpretation
  | add /terms ( term-set /interp )
  | cut /interp
```

Command `koshu term-set.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    term-set.k
**

|-- INTERP  /judge 'S  /interp <<< Supplier /sno named /sname is under contract. The supplier has status value /status , and is located in the /city .  >>>
|-- INTERP  /judge 'P  /interp <<< Parts /pno named /pname are managed. Its color is /color , weight is /weight , and the parts are kept in the /city .  >>>
|-- INTERP  /judge 'SP  /interp <<< Supplier /sno ships parts /pno in the amount of /qty .  >>>

*** 3 judges

|-- TERMS  /judge 'S  /terms { '/sno : '/sname : '/status : '/city }
|-- TERMS  /judge 'P  /terms { '/pno : '/pname : '/color : '/weight : '/city }
|-- TERMS  /judge 'SP  /terms { '/sno : '/pno : '/qty }

*** 3 judges

|-- TERM  /judge 'S  /term '/sno
|-- TERM  /judge 'S  /term '/sname
|-- TERM  /judge 'S  /term '/status
|-- TERM  /judge 'S  /term '/city
|-- TERM  /judge 'P  /term '/pno

|-- TERM  /judge 'P  /term '/pname
|-- TERM  /judge 'P  /term '/color
|-- TERM  /judge 'P  /term '/weight
|-- TERM  /judge 'P  /term '/city
|-- TERM  /judge 'SP  /term '/sno

|-- TERM  /judge 'SP  /term '/pno
|-- TERM  /judge 'SP  /term '/qty

*** 12 judges

**
**  SUMMARY
**       3 judges on INTERP
**      12 judges on TERM
**       3 judges on TERMS
**      18 judges in total
**
```



## command

This document is produced by the command:

```
koshu-inout.sh -r -g koshu
```
