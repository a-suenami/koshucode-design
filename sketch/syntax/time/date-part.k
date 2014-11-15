** -*- koshu -*-
**
**  DESCRIPTION
**    Date-part of time can be written in three formats.
**
**    - YYYY-MM-DD    monthly format
**    - YYYY-#WW-D    weekly format
**    - YYYY-##DDD    yearly format
**

|== P -fore /monthly /weekly /yearly
    : range-day /monthly -from 2014-12-15 -to 2015-1-15
    | add /weekly ( weekly /monthly )
          /yearly ( yearly /monthly )
