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
**             TreeL : 6.7 TTerm TermTypePath ["a"]
**             TreeL : 6.10 TText TextRaw "1"
**             TreeL : 6.12 TTerm TermTypePath ["b"]
**             TreeL : 6.15 TText TextRaw "2"
**           TreeB BracketAssn : 7.4 TOpen "<<" 7.25 TClose ">>"
**             TreeL : 7.7 TTerm TermTypePath ["a"]
**             TreeL : 7.10 TText TextRaw "1"
**             TreeL : 7.12 TTerm TermTypePath ["b"]
**             TreeB BracketSet : 7.15 TOpen "{" 7.23 TClose "}"
**               TreeL : 7.17 TText TextRaw "2"
**               TreeL : 7.19 TText TextRaw ":"
**               TreeL : 7.21 TText TextRaw "3"
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
**             TreeL : 5.7 TText TextRaw "x"
**             TreeL : 5.9 TText TextRaw "|"
**             TreeL : 5.11 TText TextRaw "x"
**             TreeL : 5.13 TText TextRaw "+"
**             TreeL : 5.15 TText TextRaw "1"
**           TreeB BracketGroup : 6.4 TOpen "(" 6.25 TClose ")"
**             TreeB BracketForm : 6.6 TOpen "(|" 6.19 TClose "|)"
**               TreeL : 6.9 TText TextRaw "x"
**               TreeL : 6.11 TText TextRaw "|"
**               TreeL : 6.13 TText TextRaw "x"
**               TreeL : 6.15 TText TextRaw "+"
**               TreeL : 6.17 TText TextRaw "1"
**             TreeL : 6.22 TText TextRaw "10"
**           TreeB BracketForm : 7.4 TOpen "(|" 7.27 TClose "|)"
**             TreeL : 7.7 TText TextRaw "f"
**             TreeL : 7.9 TText TextRaw "x"
**             TreeL : 7.11 TText TextRaw "y"
**             TreeL : 7.13 TText TextRaw "|"
**             TreeL : 7.15 TText TextRaw "f"
**             TreeB BracketGroup : 7.17 TOpen "(" 7.25 TClose ")"
**               TreeL : 7.19 TText TextRaw "x"
**               TreeL : 7.21 TText TextRaw "+"
**               TreeL : 7.23 TText TextRaw "y"
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
**             TreeL : 8.6 TText TextRaw "a"
**             TreeB BracketGroup : 8.8 TOpen "(" 8.14 TClose ")"
**               TreeL : 8.10 TText TextRaw "b"
**               TreeL : 8.12 TText TextRaw "c"
**           TreeB BracketGroup : 9.4 TOpen "(" 9.15 TClose ")"
**             TreeB BracketGroup : 9.5 TOpen "(" 9.11 TClose ")"
**               TreeL : 9.7 TText TextRaw "a"
**               TreeL : 9.9 TText TextRaw "b"
**             TreeL : 9.13 TText TextRaw "c"
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
**             TreeL : 6.6 TText TextRaw "1"
**             TreeL : 6.8 TText TextRaw ":"
**             TreeL : 6.10 TText TextRaw "2"
**             TreeL : 6.12 TText TextRaw ":"
**             TreeL : 6.14 TText TextRaw "3"
**           TreeB BracketList : 7.4 TOpen "[" 7.22 TClose "]"
**             TreeL : 7.6 TText TextRaw "1"
**             TreeL : 7.8 TText TextRaw ":"
**             TreeB BracketSet : 7.10 TOpen "{" 7.21 TClose "}"
**               TreeL : 7.12 TText TextRaw "2"
**               TreeL : 7.14 TText TextRaw ":"
**               TreeB BracketList : 7.16 TOpen "[" 7.20 TClose "]"
**                 TreeL : 7.18 TText TextRaw "3"
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
**             TreeL : 6.7 TText TextRaw "|"
**           TreeB BracketRel : 7.4 TOpen "{|" 7.31 TClose "|}"
**             TreeL : 7.7 TTerm TermTypePath ["a"]
**             TreeL : 7.10 TText TextRaw ":"
**             TreeL : 7.12 TTerm TermTypePath ["b"]
**             TreeL : 7.15 TText TextRaw "|"
**             TreeL : 7.17 TText TextRaw "0"
**             TreeL : 7.19 TText TextRaw ":"
**             TreeL : 7.21 TText TextRaw "1"
**             TreeL : 7.23 TText TextRaw "|"
**             TreeL : 7.25 TText TextRaw "2"
**             TreeL : 7.27 TText TextRaw ":"
**             TreeL : 7.29 TText TextRaw "3"
**           TreeB BracketRel : 8.4 TOpen "{|" 8.61 TClose "|}"
**             TreeL : 8.7 TTerm TermTypePath ["a"]
**             TreeL : 8.10 TText TextRaw ":"
**             TreeL : 8.12 TTerm TermTypePath ["b"]
**             TreeL : 8.15 TText TextRaw "|"
**             TreeL : 8.17 TText TextRaw "0"
**             TreeL : 8.19 TText TextRaw ":"
**             TreeB BracketRel : 8.21 TOpen "{|" 8.35 TClose "|}"
**               TreeL : 8.24 TTerm TermTypePath ["x"]
**               TreeL : 8.27 TText TextRaw "|"
**               TreeL : 8.29 TText TextRaw "1"
**               TreeL : 8.31 TText TextRaw ":"
**               TreeL : 8.33 TText TextRaw "2"
**             TreeL : 8.38 TText TextRaw "|"
**             TreeL : 8.40 TText TextRaw "2"
**             TreeL : 8.42 TText TextRaw ":"
**             TreeB BracketRel : 8.44 TOpen "{|" 8.58 TClose "|}"
**               TreeL : 8.47 TTerm TermTypePath ["x"]
**               TreeL : 8.50 TText TextRaw "|"
**               TreeL : 8.52 TText TextRaw "3"
**               TreeL : 8.54 TText TextRaw ":"
**               TreeL : 8.56 TText TextRaw "4"
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
**             TreeL : 6.6 TText TextRaw "1"
**             TreeL : 6.8 TText TextRaw ":"
**             TreeL : 6.10 TText TextRaw "2"
**             TreeL : 6.12 TText TextRaw ":"
**             TreeL : 6.14 TText TextRaw "3"
**           TreeB BracketSet : 7.4 TOpen "{" 7.22 TClose "}"
**             TreeL : 7.6 TText TextRaw "1"
**             TreeL : 7.8 TText TextRaw ":"
**             TreeB BracketList : 7.10 TOpen "[" 7.21 TClose "]"
**               TreeL : 7.12 TText TextRaw "2"
**               TreeL : 7.14 TText TextRaw ":"
**               TreeB BracketList : 7.16 TOpen "[" 7.20 TClose "]"
**                 TreeL : 7.18 TText TextRaw "3"
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
