** -*- koshu -*-
**
**  This is an example of aborting calculation.
**
**  ABORTED  Unexpected operand
**  -------- ------------------- -------
**  Detail   Require one operand
**  Source   23 18 abort-half.k
**           > meet)             .. half
**           23 14 abort-half.k
**           > a | meet)         .. half
**           23 13 abort-half.k
**           > (a | meet)        .. half
**           23 8 abort-half.k
**           > meet (a | meet)   .. half
**  Command  koshu
**           abort-half.k
**  Symbol   AAUnexpectedOperand
**
**  Exit with status 2
**

|== A : meet (a | meet)

