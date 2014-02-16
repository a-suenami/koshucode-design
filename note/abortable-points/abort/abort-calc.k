** -*- koshu -*-
**
**  This is an example of aborting calculation.
**
**  ABORTED  Type unmatch
**  -------- ---------------------------- ---------
**  Detail   decimal
**  Source   24 17 abort-calc.k
**           > ( #false or 0 ))           .. calc
**           23 15 abort-calc.k
**           > ( #true and                .. calc
**           23 8 abort-calc.k
**           > add /x ( #true and         .. run
**           23 0 abort-calc.k
**           > |== A : add /x ( #true and .. assert
**  Command  koshu
**           abort-calc.k
**  Symbol   ACUnmatchType
**
**  Exit with status 2
**

|== A : add /x ( #true and
                 ( #false or 0 ))

