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
