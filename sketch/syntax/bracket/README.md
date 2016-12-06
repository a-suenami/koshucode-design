# I/O List

- koshu [assn.k](#assnk)
- koshu [form.k](#formk)
- koshu [group.k](#groupk)
- koshu [list.k](#listk)
- koshu [rel.k](#relk)
- koshu [set.k](#setk)



## [assn.k](assn.k)

```
** -*- koshu -*-

|== TREE : dump-tree

    {- -}
    {- /a 1 /b 2 -}
    {- /a 1 /b { 2 | 3 } -}
```

Command `koshu assn.k` exits with 2 and produces:

```
**
**  ABORTED  Dump token trees
**  -------- --------------------------------------------- ---------
**  Detail   <tie> TOpen /5.4/ "{-" -- TClose /5.7/ "-}"
**           <tie> TOpen /6.4/ "{-" -- TClose /6.17/ "-}"
**             | TTerm /6.7/ "/a"
**             | TText /6.10/ TextRaw "1"
**             | TTerm /6.12/ "/b"
**             | TText /6.15/ TextRaw "2"
**           <tie> TOpen /7.4/ "{-" -- TClose /7.25/ "-}"
**             | TTerm /7.7/ "/a"
**             | TText /7.10/ TextRaw "1"
**             | TTerm /7.12/ "/b"
**             <set> TOpen /7.15/ "{" -- TClose /7.23/ "}"
**               | TText /7.17/ TextRaw "2"
**               | TText /7.19/ TextRaw "|"
**               | TText /7.21/ TextRaw "3"
**
**  Source   3.11 assn.k
**             |== TREE :
**                 dump-tree                               .. relmap
**
**           3.0 assn.k
**             |== TREE : dump-tree                        .. assert
**
**  Command  koshu
**           assn.k
**
**  Exit with status 2
**
```



## [form.k](form.k)

```
** -*- koshu -*-

|== TREE : dump-tree

    (| x | x + 1 |)
    ( (| x | x + 1 |) 10 )
    (| f x y | f ( x + y ) |)
```

Command `koshu form.k` exits with 2 and produces:

```
**
**  ABORTED  Dump token trees
**  -------- ----------------------------------------------- ---------
**  Detail   <form> TOpen /5.4/ "(|" -- TClose /5.17/ "|)"
**             | TText /5.7/ TextRaw "x"
**             | TText /5.9/ TextRaw "|"
**             | TText /5.11/ TextRaw "x"
**             | TText /5.13/ TextRaw "+"
**             | TText /5.15/ TextRaw "1"
**           <group> TOpen /6.4/ "(" -- TClose /6.25/ ")"
**             <form> TOpen /6.6/ "(|" -- TClose /6.19/ "|)"
**               | TText /6.9/ TextRaw "x"
**               | TText /6.11/ TextRaw "|"
**               | TText /6.13/ TextRaw "x"
**               | TText /6.15/ TextRaw "+"
**               | TText /6.17/ TextRaw "1"
**             | TText /6.22/ TextRaw "10"
**           <form> TOpen /7.4/ "(|" -- TClose /7.27/ "|)"
**             | TText /7.7/ TextRaw "f"
**             | TText /7.9/ TextRaw "x"
**             | TText /7.11/ TextRaw "y"
**             | TText /7.13/ TextRaw "|"
**             | TText /7.15/ TextRaw "f"
**             <group> TOpen /7.17/ "(" -- TClose /7.25/ ")"
**               | TText /7.19/ TextRaw "x"
**               | TText /7.21/ TextRaw "+"
**               | TText /7.23/ TextRaw "y"
**
**  Source   3.11 form.k
**             |== TREE :
**                 dump-tree                                 .. relmap
**
**           3.0 form.k
**             |== TREE : dump-tree                          .. assert
**
**  Command  koshu
**           form.k
**
**  Exit with status 2
**
```



## [group.k](group.k)

```
** -*- koshu -*-

|== TREE : dump-tree

    ()
    ( )
    ((((()))))
    ( a ( b c ))
    (( a b ) c )
```

Command `koshu group.k` exits with 2 and produces:

```
**
**  ABORTED  Dump token trees
**  -------- --------------------------------------------------- ---------
**  Detail   <group> TOpen /5.4/ "(" -- TClose /5.5/ ")"
**           <group> TOpen /6.4/ "(" -- TClose /6.6/ ")"
**           <group> TOpen /7.4/ "(" -- TClose /7.13/ ")"
**             <group> TOpen /7.5/ "(" -- TClose /7.12/ ")"
**               <group> TOpen /7.6/ "(" -- TClose /7.11/ ")"
**                 <group> TOpen /7.7/ "(" -- TClose /7.10/ ")"
**                   <group> TOpen /7.8/ "(" -- TClose /7.9/ ")"
**           <group> TOpen /8.4/ "(" -- TClose /8.15/ ")"
**             | TText /8.6/ TextRaw "a"
**             <group> TOpen /8.8/ "(" -- TClose /8.14/ ")"
**               | TText /8.10/ TextRaw "b"
**               | TText /8.12/ TextRaw "c"
**           <group> TOpen /9.4/ "(" -- TClose /9.15/ ")"
**             <group> TOpen /9.5/ "(" -- TClose /9.11/ ")"
**               | TText /9.7/ TextRaw "a"
**               | TText /9.9/ TextRaw "b"
**             | TText /9.13/ TextRaw "c"
**
**  Source   3.11 group.k
**             |== TREE :
**                 dump-tree                                     .. relmap
**
**           3.0 group.k
**             |== TREE : dump-tree                              .. assert
**
**  Command  koshu
**           group.k
**
**  Exit with status 2
**
```



## [list.k](list.k)

```
** -*- koshu -*-

|== TREE : dump-tree

    [ ]
    [ 1 : 2 : 3 ]
    [ 1 : { 2 : [ 3 ]}]
```

Command `koshu list.k` exits with 2 and produces:

```
**
**  ABORTED  Dump token trees
**  -------- ------------------------------------------------ ---------
**  Detail   <list> TOpen /5.4/ "[" -- TClose /5.6/ "]"
**           <list> TOpen /6.4/ "[" -- TClose /6.16/ "]"
**             | TText /6.6/ TextRaw "1"
**             | TText /6.8/ TextRaw ":"
**             | TText /6.10/ TextRaw "2"
**             | TText /6.12/ TextRaw ":"
**             | TText /6.14/ TextRaw "3"
**           <list> TOpen /7.4/ "[" -- TClose /7.22/ "]"
**             | TText /7.6/ TextRaw "1"
**             | TText /7.8/ TextRaw ":"
**             <set> TOpen /7.10/ "{" -- TClose /7.21/ "}"
**               | TText /7.12/ TextRaw "2"
**               | TText /7.14/ TextRaw ":"
**               <list> TOpen /7.16/ "[" -- TClose /7.20/ "]"
**                 | TText /7.18/ TextRaw "3"
**
**  Source   3.11 list.k
**             |== TREE :
**                 dump-tree                                  .. relmap
**
**           3.0 list.k
**             |== TREE : dump-tree                           .. assert
**
**  Command  koshu
**           list.k
**
**  Exit with status 2
**
```



## [rel.k](rel.k)

```
** -*- koshu -*-

|== TREE : dump-tree

    {= =}    ** dum
    {= | =}  ** dee
    {= /a /b [ 0 | 1 ][ 2 | 3 ] =}
    {= /a /b [ 0 | {= /x [ 1 ][ 2 ] =} ]
             [ 2 | {= /x [ 3 ][ 4 ] =} ] =}
```

Command `koshu rel.k` exits with 2 and produces:

```
**
**  ABORTED  Dump token trees
**  -------- -------------------------------------------------- ---------
**  Detail   <rel> TOpen /5.4/ "{=" -- TClose /5.7/ "=}"
**           <rel> TOpen /6.4/ "{=" -- TClose /6.9/ "=}"
**             | TText /6.7/ TextRaw "|"
**           <rel> TOpen /7.4/ "{=" -- TClose /7.32/ "=}"
**             | TTerm /7.7/ "/a"
**             | TTerm /7.10/ "/b"
**             <list> TOpen /7.13/ "[" -- TClose /7.21/ "]"
**               | TText /7.15/ TextRaw "0"
**               | TText /7.17/ TextRaw "|"
**               | TText /7.19/ TextRaw "1"
**             <list> TOpen /7.22/ "[" -- TClose /7.30/ "]"
**               | TText /7.24/ TextRaw "2"
**               | TText /7.26/ TextRaw "|"
**               | TText /7.28/ TextRaw "3"
**           <rel> TOpen /8.4/ "{=" -- TClose /9.41/ "=}"
**             | TTerm /8.7/ "/a"
**             | TTerm /8.10/ "/b"
**             <list> TOpen /8.13/ "[" -- TClose /8.39/ "]"
**               | TText /8.15/ TextRaw "0"
**               | TText /8.17/ TextRaw "|"
**               <rel> TOpen /8.19/ "{=" -- TClose /8.36/ "=}"
**                 | TTerm /8.22/ "/x"
**                 <list> TOpen /8.25/ "[" -- TClose /8.29/ "]"
**                   | TText /8.27/ TextRaw "1"
**                 <list> TOpen /8.30/ "[" -- TClose /8.34/ "]"
**                   | TText /8.32/ TextRaw "2"
**             <list> TOpen /9.13/ "[" -- TClose /9.39/ "]"
**               | TText /9.15/ TextRaw "2"
**               | TText /9.17/ TextRaw "|"
**               <rel> TOpen /9.19/ "{=" -- TClose /9.36/ "=}"
**                 | TTerm /9.22/ "/x"
**                 <list> TOpen /9.25/ "[" -- TClose /9.29/ "]"
**                   | TText /9.27/ TextRaw "3"
**                 <list> TOpen /9.30/ "[" -- TClose /9.34/ "]"
**                   | TText /9.32/ TextRaw "4"
**
**  Source   3.11 rel.k
**             |== TREE :
**                 dump-tree                                    .. relmap
**
**           3.0 rel.k
**             |== TREE : dump-tree                             .. assert
**
**  Command  koshu
**           rel.k
**
**  Exit with status 2
**
```



## [set.k](set.k)

```
** -*- koshu -*-

|== TREE : dump-tree

    { }
    { 1 : 2 : 3 }
    { 1 : [ 2 : [ 3 ]]}
```

Command `koshu set.k` exits with 2 and produces:

```
**
**  ABORTED  Dump token trees
**  -------- ------------------------------------------------ ---------
**  Detail   <set> TOpen /5.4/ "{" -- TClose /5.6/ "}"
**           <set> TOpen /6.4/ "{" -- TClose /6.16/ "}"
**             | TText /6.6/ TextRaw "1"
**             | TText /6.8/ TextRaw ":"
**             | TText /6.10/ TextRaw "2"
**             | TText /6.12/ TextRaw ":"
**             | TText /6.14/ TextRaw "3"
**           <set> TOpen /7.4/ "{" -- TClose /7.22/ "}"
**             | TText /7.6/ TextRaw "1"
**             | TText /7.8/ TextRaw ":"
**             <list> TOpen /7.10/ "[" -- TClose /7.21/ "]"
**               | TText /7.12/ TextRaw "2"
**               | TText /7.14/ TextRaw ":"
**               <list> TOpen /7.16/ "[" -- TClose /7.20/ "]"
**                 | TText /7.18/ TextRaw "3"
**
**  Source   3.11 set.k
**             |== TREE :
**                 dump-tree                                  .. relmap
**
**           3.0 set.k
**             |== TREE : dump-tree                           .. assert
**
**  Command  koshu
**           set.k
**
**  Exit with status 2
**
```



## command

This document is produced by the command:

```
koshu-inout.sh -r -g koshu
```
