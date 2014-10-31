** -*- koshu -*-
**
**  DESCRIPTION
**    Clock is a measured time.
**    It indicates hours, minutes, seconds,
**    and days when more than 24 hours.
**    Clocks are in certain precision
**    as multiple of day, hour, minute, or second.
**

|-- P  /clock |0'00:00:10|   ** |DAY'HOUR:MIN:SEC|   10 seconds
|-- P  /clock |00:00:20|     ** |HOUR:MIN:SEC|       20 seconds
|-- P  /clock |00:30|        ** |HOUR:MIN|           30 minutes
|-- P  /clock |00:00|        ** |HOUR:MIN|           0 minutes
|-- P  /clock |04|           ** |HOUR|               4 hours
|-- P  /clock |5'|           ** |DAY'|               5 days
|-- P  /clock |5'12:00|      ** |DAY'HOUR:MIN|       5 days and 12 horus

|-- P  /clock |+01:15|       ** positive clock is same as sign-less clock
|-- P  /clock |-01:15|       ** negative clock

|== Q : source P /clock
