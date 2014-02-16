** -*- koshu -*-
**
**  This is an example of aborting calculation.
**
**  ABORTED  Unexpected operand
**  -------- ---------------------- ----------
**  Detail   Require one word
**  Source   21 15 abort-operand.k
**           > /x /y                .. operand
**           21 8 abort-operand.k
**           > source /x /y         .. relmap
**           21 0 abort-operand.k
**           > |== A : source /x /y .. clause
**  Command  koshu
**           abort-operand.k
**  Symbol   AAUnexpectedOperand
**
**  Exit with status 2
**

|== A : source /x /y

