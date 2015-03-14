** -*- koshu -*-
**
**  DESCRIPTION
**    Data interpretations of SUPPLIER-PARTS dataset.
**
**    <<< ... >>> is used for literal of data interpretations.
**    Interpretations are written as judgementable sentences
**    which include term names.
**
**    "term-set" operator extracts term names from interpretation.
**
**  USAGE
**    koshu term-set.k
**

|-- INTERP  /judge 'S
            /interp <<< Supplier /sno named /sname is under contract.
                        The supplier has status value /status ,
                        and is located in the /city . >>>

|-- INTERP  /judge 'P
            /interp <<< Parts /pno named /pname are managed.
                        Its color is /color , weight is /weight ,
                        and the parts are kept in the /city . >>>

|-- INTERP  /judge 'SP
            /interp <<< Supplier /sno ships parts /pno
                        in the amount of /qty . >>>

|== INTERP : interpretation

interpretation : source INTERP /judge /interp

|== TERMS : terms  --fore /judge
|== TERM  : terms | member /term /terms | cut /terms  --fore /judge

terms : interpretation
  | add /terms ( term-set /interp )
  | cut /interp
