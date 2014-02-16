** -*- koshu -*-
**
**  This is an example of aborting calculation.
**
**  ABORTED  Require boolean
**  -------- ---------------- ---------
**  Detail
**  Source   16 8 abort-run.k
**           > hold 1         .. run
**           16 0 abort-run.k
**           > |== A : hold 1 .. assert
**  Command  koshu
**           abort-run.k
**  Symbol   AAReqBoolean
**
**  Exit with status 2
**

|== A : hold 1

