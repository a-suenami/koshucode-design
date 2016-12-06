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
**  -------- ----------------------------------------------- ---------
**  Detail   | TText /17.21/ TextRaw "a"
**           | TText /17.23/ TextRaw "b"
**           <group> TOpen /17.25/ "(" -- TClose /17.31/ ")"
**             | TText /17.27/ TextRaw "c"
**             | TText /17.29/ TextRaw "d"
**
**  Source   17.11 basic.k
**             |== TREE :
**                 dump-tree a b ( c d )                     .. relmap
**
**           17.0 basic.k
**             |== TREE : dump-tree a b ( c d )              .. assert
**
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
**  -------- ------------------------------------------------ ---------
**  Detail   <group> TOpen /10.4/ "(" -- TClose /10.16/ ")"
**             | TTerm /10.6/ "/x"
**             | TText /10.9/ TextRaw "+"
**             | TTerm /13.5/ "/y"
**             | TText /13.8/ TextRaw "+"
**             | TTerm /13.10/ "/z"
**           <group> TOpen /11.4/ "(" -- TClose /11.17/ ")"
**             | TTerm /11.6/ "/x"
**             | TText /11.9/ TextRaw "+"
**             <group> TOpen /14.6/ "(" -- TClose /14.16/ ")"
**               | TTerm /14.8/ "/y"
**               | TText /14.11/ TextRaw "+"
**               | TTerm /14.13/ "/z"
**
**  Source   8.11 slot.k
**             |== TREE :
**                 dump-tree                                  .. relmap
**
**           8.0 slot.k
**             |== TREE : dump-tree                           .. assert
**
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
**  -------- ---------------------------------------------- ---------
**  Detail   | TTerm /11.4/ "/a"
**           <term> TOpen /12.4/ "(-" -- TClose /12.4/ "-)"
**             | TTerm /12.4/ "b"
**             | TTerm /12.4/ "c"
**           <term> TOpen /13.4/ "(-" -- TClose /13.4/ "-)"
**             | TTerm /13.4/ "d"
**             | TTerm /13.4/ "e"
**             | TTerm /13.4/ "f"
**           | TTerm /15.4/ "/z"
**           <group> TOpen /15.7/ "(" -- TClose /15.17/ ")"
**             | TTerm /15.9/ "/x"
**             | TText /15.12/ TextRaw "+"
**             | TTerm /15.14/ "/y"
**
**  Source   9.11 term.k
**             |== TREE :
**                 dump-tree                                .. relmap
**
**           9.0 term.k
**             |== TREE : dump-tree                         .. assert
**
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
    ( <tab> | <crlf> | <+> )

    ** short
    ( a.xxx bb.yyy )
```

Command `koshu text.k` exits with 2 and produces:

```
**
**  ABORTED  Dump token trees
**  -------- ---------------------------------------------- ---------
**  Detail   <group> TOpen /10.4/ "(" -- TClose /10.22/ ")"
**             | TText /10.6/ TextRaw "a"
**             | TText /10.8/ TextRaw ":"
**             | TText /10.10/ TextQ "bb"
**             | TText /10.14/ TextRaw ":"
**             | TText /10.16/ TextQQ "ccc"
**           <group> TOpen /13.4/ "(" -- TClose /13.22/ ")"
**             | TText /13.6/ TextRaw "0"
**             | TText /13.8/ TextRaw "."
**             | TText /13.10/ TextRaw "-02"
**             | TText /13.14/ TextRaw "."
**             | TText /13.16/ TextRaw "12.34"
**           <group> TOpen /16.4/ "(" -- TClose /16.27/ ")"
**             | TText /16.6/ TextQQ "\t"
**             | TText /16.12/ TextRaw "|"
**             | TText /16.14/ TextQQ "\r\n"
**             | TText /16.21/ TextRaw "|"
**             | TText /16.23/ TextUnk "+"
**           <group> TOpen /19.4/ "(" -- TClose /19.19/ ")"
**             | TText /19.6/ TextQQ "apple-xxxbanana-yyy"
**
**  Source   7.11 text.k
**             |== TREE :
**                 dump-tree                                .. relmap
**
**           7.0 text.k
**             |== TREE : dump-tree                         .. assert
**
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
