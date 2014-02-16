** -*- koshu -*-
**
**  This is an example of aborting calculation.
**
**  ABORTED  Unexpected operand
**  -------- ----------------------- ---------
**  Detail   if
**  Source   25 17 abort-syntax.k
**           > ( if 1 -> 2 -> 3 ))   .. syntax
**           24 15 abort-syntax.k
**           > ( if /x = 0 ->        .. syntax
**           24 8 abort-syntax.k
**           > add /y ( if /x = 0 -> .. relmap
**           23 0 abort-syntax.k
**           > |== A : add /x 0      .. clause
**  Command  koshu
**           abort-syntax.k
**  Symbol   AAUnexpectedOperand
**
**  Exit with status 2
**

|== A : add /x 0
      | add /y ( if /x = 0 ->
                 ( if 1 -> 2 -> 3 ))

