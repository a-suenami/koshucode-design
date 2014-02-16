** -*- koshu -*-
**
**  This is an example of aborting calculation.
**
**  ABORTED  Require new term
**  -------- ------------------------ -------------
**  Detail   /x /y
**  Source   18 8 abort-specialize.k
**           > rename /x /a /y /b     .. specialize
**           17 0 abort-specialize.k
**           > |== A : source R /x /y .. assert
**  Command  koshu
**           abort-specialize.k
**  Symbol   AAReqNewTerms
**
**  Exit with status 2
**

|== A : source R /x /y
      | rename /x /a /y /b

