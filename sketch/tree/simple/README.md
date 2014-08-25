# I/O List

- koshu [basic.k](#basick)
- koshu [slot.k](#slotk)
- koshu [term.k](#termk)
- koshu [text.k](#textk)



## [basic.k](basic.k)

```
** -*- koshu -*-
**
**  DESCRIPTION
**    dump-tree operator shows operands
**    as internal token trees.
**
**    For a leaf of trees, it shows like:
**      TreeL LINE.COL TOKEN-TYPE CONTENT ...
**
**    For a branch of trees, it shows like:
**      TeeeB PAREN-TYPE : OPEN-TOKEN CLOSE-TOKEN
**        SUBTREE
**        SUBTREE
**        ...
**

|== TREE : dump-tree a b ( c d )
```

Command `koshu basic.k` exits with 2 and produces:

```
** -*- koshu -*-
**
**  INPUT
**    basic.k
**

**
**  ABORTED  Dump token trees
**  -------- --------------------------------------------------- ---------
**  Detail   TreeL : 17.21 TText 0 "a"
**           TreeL : 17.23 TText 0 "b"
**           TreeB ParenGroup : 17.25 TOpen "(" 17.31 TClose ")"
**             TreeL : 17.27 TText 0 "c"
**             TreeL : 17.29 TText 0 "d"
**  Source   17 11 basic.k
**           > dump-tree a b ( c d )                             .. relmap
**           17 0 basic.k
**           > |== TREE : dump-tree a b ( c d )                  .. assert
**  Command  koshu
**           basic.k
**
**  Exit with status 2
**
```



## [slot.k](slot.k)

```
** -*- koshu -*-
**
**  DESCRIPTION
**    Double "at" sign represents global slots.
**    Global slots are substituted by its contents.
**

|== TREE : dump-tree

    ( /x + @@yz )
    ( /x + @@pyz )

@@yz /y + /z
@@pyz ( /y + /z )
```

Command `koshu slot.k` exits with 2 and produces:

```
** -*- koshu -*-
**
**  INPUT
**    slot.k
**

**
**  ABORTED  Dump token trees
**  -------- ---------------------------------------------------- ---------
**  Detail   TreeB ParenGroup : 10.4 TOpen "(" 10.16 TClose ")"
**             TreeL : 10.6 TTerm ["x"]
**             TreeL : 10.9 TText 0 "+"
**             TreeL : 13.5 TTerm ["y"]
**             TreeL : 13.8 TText 0 "+"
**             TreeL : 13.10 TTerm ["z"]
**           TreeB ParenGroup : 11.4 TOpen "(" 11.17 TClose ")"
**             TreeL : 11.6 TTerm ["x"]
**             TreeL : 11.9 TText 0 "+"
**             TreeB ParenGroup : 14.6 TOpen "(" 14.16 TClose ")"
**               TreeL : 14.8 TTerm ["y"]
**               TreeL : 14.11 TText 0 "+"
**               TreeL : 14.13 TTerm ["z"]
**  Source   8 11 slot.k
**           > dump-tree                                          .. relmap
**           8 0 slot.k
**           > |== TREE : dump-tree                               .. assert
**  Command  koshu
**           slot.k
**
**  Exit with status 2
**
```



## [term.k](term.k)

```
** -*- koshu -*-
**
**  DESCRIPTION
**    Term names are beginning with slash.
**    Nested terms are represented by
**    appending two or more term names.
**

|== TREE : dump-tree

    /a
    /b/c
    /d/e/f

    /z ( /x + /y )
```

Command `koshu term.k` exits with 2 and produces:

```
** -*- koshu -*-
**
**  INPUT
**    term.k
**

**
**  ABORTED  Dump token trees
**  -------- -------------------------------------------------- ---------
**  Detail   TreeL : 11.4 TTerm ["a"]
**           TreeL : 12.4 TTerm ["b","c"]
**           TreeL : 13.4 TTerm ["d","e","f"]
**           TreeL : 15.4 TTerm ["z"]
**           TreeB ParenGroup : 15.7 TOpen "(" 15.17 TClose ")"
**             TreeL : 15.9 TTerm ["x"]
**             TreeL : 15.12 TText 0 "+"
**             TreeL : 15.14 TTerm ["y"]
**  Source   9 11 term.k
**           > dump-tree                                        .. relmap
**           9 0 term.k
**           > |== TREE : dump-tree                             .. assert
**  Command  koshu
**           term.k
**
**  Exit with status 2
**
```



## [text.k](text.k)

```
** -*- koshu -*-

|== TREE : dump-tree

    ** text
    ( a : 'bb : "ccc" )

    ** number
    ( 0 . -02 . 12.34 )

    ** bracket
    ( <tab> | <crlf> | <0> )

    ** short
    ( a.xxx bb.yyy )
```

Command `koshu text.k` exits with 2 and produces:

```
** -*- koshu -*-
**
**  INPUT
**    text.k
**

**
**  ABORTED  Dump token trees
**  -------- -------------------------------------------------- ---------
**  Detail   TreeB ParenGroup : 6.4 TOpen "(" 6.22 TClose ")"
**             TreeL : 6.6 TText 0 "a"
**             TreeL : 6.8 TText 0 ":"
**             TreeL : 6.10 TText 1 "bb"
**             TreeL : 6.14 TText 0 ":"
**             TreeL : 6.16 TText 2 "ccc"
**           TreeB ParenGroup : 9.4 TOpen "(" 9.22 TClose ")"
**             TreeL : 9.6 TText 0 "0"
**             TreeL : 9.8 TText 0 "."
**             TreeL : 9.10 TText 0 "-02"
**             TreeL : 9.14 TText 0 "."
**             TreeL : 9.16 TText 0 "12.34"
**           TreeB ParenGroup : 12.4 TOpen "(" 12.27 TClose ")"
**             TreeL : 12.6 TText 3 "\t"
**             TreeL : 12.12 TText 0 "|"
**             TreeL : 12.14 TText 3 "\r\n"
**             TreeL : 12.21 TText 0 "|"
**             TreeL : 12.23 TText -1 "0"
**           TreeB ParenGroup : 15.4 TOpen "(" 15.19 TClose ")"
**             TreeL : 15.6 TShort "a" "xxx"
**             TreeL : 15.12 TShort "bb" "yyy"
**  Source   3 11 text.k
**           > dump-tree                                        .. relmap
**           3 0 text.k
**           > |== TREE : dump-tree                             .. assert
**  Command  koshu
**           text.k
**
**  Exit with status 2
**
```



## command

This document is produced by the command:

```
koshu-inout.sh -r -g koshu
```
