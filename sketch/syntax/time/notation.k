** -*- koshu -*-
**
**  DESCRIPTION
**    Time is a scale for judging before-or-after between events.
**    The time scale is measured with some precisions.
**
**    ------------|------------------------|-------> time with precision of a day
**                :                        :
**       2014-07-20               2014-07-21
**
**    --------|----------|----------|----------|---> time with precision of an hour
**                       :          :
**           2014-07-20 12          2014-07-20 13
**
**    --|----|----|----|----|----|----|----|----|--> time with precision of a minute
**                          :    :
**           2014-07-20 12:45    2014-07-20 12:46
**
**    -|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-> time with precision of a second
**                             : :
**           2014-07-20 12:45:30 :
**             2014-07-20 12:45:31
**

|-- P  /time 2014-07                     ** YEAR-MONTH
|-- P  /time 2014-07-20                  ** YEAR-MONTH-DAY
|-- P  /time 2014-07-20 12               ** YEAR-MONTH-DAY HH
|-- P  /time 2014-07-20 12:45            ** YEAR-MONTH-DAY HH:MM
|-- P  /time 2014-07-20 12:45:30         ** YEAR-MONTH-DAY HH:MM:DD
|-- P  /time 2014-07-20 12:45 +09:00     ** YEAR-MONTH-DAY HH:MM ZONE
|-- P  /time 2014-07-20 03:45:30 +00:00  ** YEAR-MONTH-DAY HH:MM:DD ZONE

|-- P  /time 2014-#30                    ** YEAR-#WEEK
|-- P  /time 2014-#30-1                  ** YEAR-#WEEK-DAY
|-- P  /time 2014-#30-1 12:45            ** YEAR-#WEEK-DAY HH:MM

|-- P  /time 2014-##203                  ** YEAR-##DAY
|-- P  /time 2014-##203 12:45            ** YEAR-##DAY HH:MM

|== Q
  : source P /time
  | add /type ( type /time )
  --table --fore /time
