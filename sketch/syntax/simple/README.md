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
**
**  ABORTED  Dump token trees
**  -------- ----------------------------------------------------- ---------
**  Detail   TreeL : 17.21 TText TextRaw "a"
**           TreeL : 17.23 TText TextRaw "b"
**           TreeB BracketGroup : 17.25 TOpen "(" 17.31 TClose ")"
**             TreeL : 17.27 TText TextRaw "c"
**             TreeL : 17.29 TText TextRaw "d"
**  Source   17 11 basic.k
**           > dump-tree a b ( c d )                               .. relmap
**           17 0 basic.k
**           > |== TREE : dump-tree a b ( c d )                    .. assert
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
**
**  ABORTED  Dump token trees
**  -------- ------------------------------------------------------ ---------
**  Detail   TreeB BracketGroup : 10.4 TOpen "(" 10.16 TClose ")"
**             TreeL : 10.6 TTermN "x"
**             TreeL : 10.9 TText TextRaw "+"
**             TreeL : 13.5 TTermN "y"
**             TreeL : 13.8 TText TextRaw "+"
**             TreeL : 13.10 TTermN "z"
**           TreeB BracketGroup : 11.4 TOpen "(" 11.17 TClose ")"
**             TreeL : 11.6 TTermN "x"
**             TreeL : 11.9 TText TextRaw "+"
**             TreeB BracketGroup : 14.6 TOpen "(" 14.16 TClose ")"
**               TreeL : 14.8 TTermN "y"
**               TreeL : 14.11 TText TextRaw "+"
**               TreeL : 14.13 TTermN "z"
**  Source   8 11 slot.k
**           > dump-tree                                            .. relmap
**           8 0 slot.k
**           > |== TREE : dump-tree                                 .. assert
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
**
**  ABORTED  Dump token trees
**  -------- ---------------------------------------------------- ---------
**  Detail   TreeL : 11.4 TTermN "a"
**           TreeL : 12.4 TTerm TermTypePath ["b","c"]
**           TreeL : 13.4 TTerm TermTypePath ["d","e","f"]
**           TreeL : 15.4 TTermN "z"
**           TreeB BracketGroup : 15.7 TOpen "(" 15.17 TClose ")"
**             TreeL : 15.9 TTermN "x"
**             TreeL : 15.12 TText TextRaw "+"
**             TreeL : 15.14 TTermN "y"
**  Source   9 11 term.k
**           > dump-tree                                          .. relmap
**           9 0 term.k
**           > |== TREE : dump-tree                               .. assert
**  Command  koshu
**           term.k
**
**  Exit with status 2
**
```



## [text.k](text.k)

```
-*- koshu -*-

short
  a "apple-"
  bb "banana-"

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
**
**  ABORTED  Dump token trees
**  -------- ---------------------------------------------------- ---------
**  Detail   TreeB BracketGroup : 10.4 TOpen "(" 10.22 TClose ")"
**             TreeL : 10.6 TText TextRaw "a"
**             TreeL : 10.8 TText TextRaw ":"
**             TreeL : 10.10 TText TextQ "bb"
**             TreeL : 10.14 TText TextRaw ":"
**             TreeL : 10.16 TText TextQQ "ccc"
**           TreeB BracketGroup : 13.4 TOpen "(" 13.22 TClose ")"
**             TreeL : 13.6 TText TextRaw "0"
**             TreeL : 13.8 TText TextRaw "."
**             TreeL : 13.10 TText TextRaw "-02"
**             TreeL : 13.14 TText TextRaw "."
**             TreeL : 13.16 TText TextRaw "12.34"
**           TreeB BracketGroup : 16.4 TOpen "(" 16.27 TClose ")"
**             TreeL : 16.6 TText TextKey "\t"
**             TreeL : 16.12 TText TextRaw "|"
**             TreeL : 16.14 TText TextKey "\r\n"
**             TreeL : 16.21 TText TextRaw "|"
**             TreeL : 16.23 TText TextUnk "0"
**           TreeB BracketGroup : 19.4 TOpen "(" 19.19 TClose ")"
**             TreeL : 19.6 TText TextQQ "apple-xxx"
**             TreeL : 19.12 TText TextQQ "banana-yyy"
**  Source   7 11 text.k
**           > dump-tree                                          .. relmap
**           7 0 text.k
**           > |== TREE : dump-tree                               .. assert
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
