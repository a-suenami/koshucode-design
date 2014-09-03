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
