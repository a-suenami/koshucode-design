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

    << >>
    << /a 1 /b 2 >>
    << /a 1 /b { 2 : 3 } >>
```

Command `koshu assn.k` exits with 2 and produces:

```
** -*- koshu -*-
**
**  INPUT
**    assn.k
**

**
**  ABORTED  Dump token trees
**  -------- --------------------------------------------------- ---------
**  Detail   TreeB BracketAssn : 5.4 TOpen "<<" 5.7 TClose ">>"
**           TreeB BracketAssn : 6.4 TOpen "<<" 6.17 TClose ">>"
**             TreeL : 6.7 TTerm 0 ["a"]
**             TreeL : 6.10 TText 0 "1"
**             TreeL : 6.12 TTerm 0 ["b"]
**             TreeL : 6.15 TText 0 "2"
**           TreeB BracketAssn : 7.4 TOpen "<<" 7.25 TClose ">>"
**             TreeL : 7.7 TTerm 0 ["a"]
**             TreeL : 7.10 TText 0 "1"
**             TreeL : 7.12 TTerm 0 ["b"]
**             TreeB BracketSet : 7.15 TOpen "{" 7.23 TClose "}"
**               TreeL : 7.17 TText 0 "2"
**               TreeL : 7.19 TText 0 ":"
**               TreeL : 7.21 TText 0 "3"
**  Source   3 11 assn.k
**           > dump-tree                                         .. relmap
**           3 0 assn.k
**           > |== TREE : dump-tree                              .. assert
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
** -*- koshu -*-
**
**  INPUT
**    form.k
**

**
**  ABORTED  Dump token trees
**  -------- ----------------------------------------------------- ---------
**  Detail   TreeB BracketForm : 5.4 TOpen "(|" 5.17 TClose "|)"
**             TreeL : 5.7 TText 0 "x"
**             TreeL : 5.9 TText 0 "|"
**             TreeL : 5.11 TText 0 "x"
**             TreeL : 5.13 TText 0 "+"
**             TreeL : 5.15 TText 0 "1"
**           TreeB BracketGroup : 6.4 TOpen "(" 6.25 TClose ")"
**             TreeB BracketForm : 6.6 TOpen "(|" 6.19 TClose "|)"
**               TreeL : 6.9 TText 0 "x"
**               TreeL : 6.11 TText 0 "|"
**               TreeL : 6.13 TText 0 "x"
**               TreeL : 6.15 TText 0 "+"
**               TreeL : 6.17 TText 0 "1"
**             TreeL : 6.22 TText 0 "10"
**           TreeB BracketForm : 7.4 TOpen "(|" 7.27 TClose "|)"
**             TreeL : 7.7 TText 0 "f"
**             TreeL : 7.9 TText 0 "x"
**             TreeL : 7.11 TText 0 "y"
**             TreeL : 7.13 TText 0 "|"
**             TreeL : 7.15 TText 0 "f"
**             TreeB BracketGroup : 7.17 TOpen "(" 7.25 TClose ")"
**               TreeL : 7.19 TText 0 "x"
**               TreeL : 7.21 TText 0 "+"
**               TreeL : 7.23 TText 0 "y"
**  Source   3 11 form.k
**           > dump-tree                                           .. relmap
**           3 0 form.k
**           > |== TREE : dump-tree                                .. assert
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
** -*- koshu -*-
**
**  INPUT
**    group.k
**

**
**  ABORTED  Dump token trees
**  -------- --------------------------------------------------------- ---------
**  Detail   TreeB BracketGroup : 5.4 TOpen "(" 5.5 TClose ")"
**           TreeB BracketGroup : 6.4 TOpen "(" 6.6 TClose ")"
**           TreeB BracketGroup : 7.4 TOpen "(" 7.13 TClose ")"
**             TreeB BracketGroup : 7.5 TOpen "(" 7.12 TClose ")"
**               TreeB BracketGroup : 7.6 TOpen "(" 7.11 TClose ")"
**                 TreeB BracketGroup : 7.7 TOpen "(" 7.10 TClose ")"
**                   TreeB BracketGroup : 7.8 TOpen "(" 7.9 TClose ")"
**           TreeB BracketGroup : 8.4 TOpen "(" 8.15 TClose ")"
**             TreeL : 8.6 TText 0 "a"
**             TreeB BracketGroup : 8.8 TOpen "(" 8.14 TClose ")"
**               TreeL : 8.10 TText 0 "b"
**               TreeL : 8.12 TText 0 "c"
**           TreeB BracketGroup : 9.4 TOpen "(" 9.15 TClose ")"
**             TreeB BracketGroup : 9.5 TOpen "(" 9.11 TClose ")"
**               TreeL : 9.7 TText 0 "a"
**               TreeL : 9.9 TText 0 "b"
**             TreeL : 9.13 TText 0 "c"
**  Source   3 11 group.k
**           > dump-tree                                               .. relmap
**           3 0 group.k
**           > |== TREE : dump-tree                                    .. assert
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
** -*- koshu -*-
**
**  INPUT
**    list.k
**

**
**  ABORTED  Dump token trees
**  -------- ------------------------------------------------------ ---------
**  Detail   TreeB BracketList : 5.4 TOpen "[" 5.6 TClose "]"
**           TreeB BracketList : 6.4 TOpen "[" 6.16 TClose "]"
**             TreeL : 6.6 TText 0 "1"
**             TreeL : 6.8 TText 0 ":"
**             TreeL : 6.10 TText 0 "2"
**             TreeL : 6.12 TText 0 ":"
**             TreeL : 6.14 TText 0 "3"
**           TreeB BracketList : 7.4 TOpen "[" 7.22 TClose "]"
**             TreeL : 7.6 TText 0 "1"
**             TreeL : 7.8 TText 0 ":"
**             TreeB BracketSet : 7.10 TOpen "{" 7.21 TClose "}"
**               TreeL : 7.12 TText 0 "2"
**               TreeL : 7.14 TText 0 ":"
**               TreeB BracketList : 7.16 TOpen "[" 7.20 TClose "]"
**                 TreeL : 7.18 TText 0 "3"
**  Source   3 11 list.k
**           > dump-tree                                            .. relmap
**           3 0 list.k
**           > |== TREE : dump-tree                                 .. assert
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

    {| |}    ** dum
    {| | |}  ** dee
    {| /a : /b | 0 : 1 | 2 : 3 |}
    {| /a : /b | 0 : {| /x | 1 : 2 |} | 2 : {| /x | 3 : 4 |} |}
```

Command `koshu rel.k` exits with 2 and produces:

```
** -*- koshu -*-
**
**  INPUT
**    rel.k
**

**
**  ABORTED  Dump token trees
**  -------- ----------------------------------------------------- ---------
**  Detail   TreeB BracketRel : 5.4 TOpen "{|" 5.7 TClose "|}"
**           TreeB BracketRel : 6.4 TOpen "{|" 6.9 TClose "|}"
**             TreeL : 6.7 TText 0 "|"
**           TreeB BracketRel : 7.4 TOpen "{|" 7.31 TClose "|}"
**             TreeL : 7.7 TTerm 0 ["a"]
**             TreeL : 7.10 TText 0 ":"
**             TreeL : 7.12 TTerm 0 ["b"]
**             TreeL : 7.15 TText 0 "|"
**             TreeL : 7.17 TText 0 "0"
**             TreeL : 7.19 TText 0 ":"
**             TreeL : 7.21 TText 0 "1"
**             TreeL : 7.23 TText 0 "|"
**             TreeL : 7.25 TText 0 "2"
**             TreeL : 7.27 TText 0 ":"
**             TreeL : 7.29 TText 0 "3"
**           TreeB BracketRel : 8.4 TOpen "{|" 8.61 TClose "|}"
**             TreeL : 8.7 TTerm 0 ["a"]
**             TreeL : 8.10 TText 0 ":"
**             TreeL : 8.12 TTerm 0 ["b"]
**             TreeL : 8.15 TText 0 "|"
**             TreeL : 8.17 TText 0 "0"
**             TreeL : 8.19 TText 0 ":"
**             TreeB BracketRel : 8.21 TOpen "{|" 8.35 TClose "|}"
**               TreeL : 8.24 TTerm 0 ["x"]
**               TreeL : 8.27 TText 0 "|"
**               TreeL : 8.29 TText 0 "1"
**               TreeL : 8.31 TText 0 ":"
**               TreeL : 8.33 TText 0 "2"
**             TreeL : 8.38 TText 0 "|"
**             TreeL : 8.40 TText 0 "2"
**             TreeL : 8.42 TText 0 ":"
**             TreeB BracketRel : 8.44 TOpen "{|" 8.58 TClose "|}"
**               TreeL : 8.47 TTerm 0 ["x"]
**               TreeL : 8.50 TText 0 "|"
**               TreeL : 8.52 TText 0 "3"
**               TreeL : 8.54 TText 0 ":"
**               TreeL : 8.56 TText 0 "4"
**  Source   3 11 rel.k
**           > dump-tree                                           .. relmap
**           3 0 rel.k
**           > |== TREE : dump-tree                                .. assert
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
** -*- koshu -*-
**
**  INPUT
**    set.k
**

**
**  ABORTED  Dump token trees
**  -------- ------------------------------------------------------ ---------
**  Detail   TreeB BracketSet : 5.4 TOpen "{" 5.6 TClose "}"
**           TreeB BracketSet : 6.4 TOpen "{" 6.16 TClose "}"
**             TreeL : 6.6 TText 0 "1"
**             TreeL : 6.8 TText 0 ":"
**             TreeL : 6.10 TText 0 "2"
**             TreeL : 6.12 TText 0 ":"
**             TreeL : 6.14 TText 0 "3"
**           TreeB BracketSet : 7.4 TOpen "{" 7.22 TClose "}"
**             TreeL : 7.6 TText 0 "1"
**             TreeL : 7.8 TText 0 ":"
**             TreeB BracketList : 7.10 TOpen "[" 7.21 TClose "]"
**               TreeL : 7.12 TText 0 "2"
**               TreeL : 7.14 TText 0 ":"
**               TreeB BracketList : 7.16 TOpen "[" 7.20 TClose "]"
**                 TreeL : 7.18 TText 0 "3"
**  Source   3 11 set.k
**           > dump-tree                                            .. relmap
**           3 0 set.k
**           > |== TREE : dump-tree                                 .. assert
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
