** -*- koshu -*-
**
**  This is an example of aborting calculation.
**
**  ABORTED  Unexpected operand
**  -------- ---------------------------------- ---------
**  Detail   require one of -just / -has / -but
**  Source   20 8 abort-relmap.k
**           > check-term -has /x -but /z       .. relmap
**           19 0 abort-relmap.k
**           > |== A : source R /x /y           .. clause
**  Command  koshu
**           abort-relmap.k
**  Symbol   AAUnexpectedOperand
**
**  Exit with status 2
**

|== A : source R /x /y
      | check-term -has /x -but /z

