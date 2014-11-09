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

|-- P  /time 2014-07                ** YEAR-MONTH
|-- P  /time 2014-07-20             ** YEAR-MONTH-DAY
|-- P  /time 2014-07-20 12          ** YEAR-MONTH-DAY HH
|-- P  /time 2014-07-20 12:45       ** YEAR-MONTH-DAY HH:MM
|-- P  /time 2014-07-20 12:45:30    ** YEAR-MONTH-DAY HH:MM:DD

|== Q -table -fore /time
    : source P /time
    | add /type ( type /time )
