** -*- koshu -*-

== text
**
**  文字列写像
**    time
**
**  入出力例
**    >>> 2014-10-15 12:45 +09:00
**    /date-type 'monthly  /year 2014  /month 10  /week ()  /day 15
**    /clock-type 'hm  /hour 12  /min 45  /sec ()
**    /zone-type 'zone  /sign "+"  /zhour 9  /zmin 0
**

export time

time       : date | maybe clock

date       : year | first yearly weekly monthly
yearly     : /date-type = 'yearly  | "-##" | /day n
weekly     : /date-type = 'weekly  | "-#"  | /week n  | "-" | /day n
monthly    : /date-type = 'monthly | "-"   | /month n | "-" | /day n

clock      : first hms hm h | maybe zone
hms        : /clock-type = 'hms | /hour n | ":" | /min n | ":" | /sec n
hm         : /clock-type = 'hm  | /hour n | ":" | /min n
h          : /clock-type = 'h   | /hour n

zone       : /zone-type = 'zone | first utc zone-hm
utc        : "UTC" | /sign = "+" | /zhour = 0 | /zmin = 0
zone-hm    : /sign char-of "+-" | /zhour n | ":" | /zmin n

n          : nat digits
digits     : min-max 1 4 digit
digit      : char-of "0123456789"
