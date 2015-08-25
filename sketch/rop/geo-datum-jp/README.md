# I/O List

- koshu [origin.k](#origink)



## [origin.k](origin.k)

```
** -*- koshu -*-
**
**  平面直角座標系の原点の緯度・経度を計算します。
**

|== 原点 : range /n -from 1 -to 19
  | geo-datum-jp /n 0 0 -to /lat /long
  | add /name ( "第 " ++ to-text /n ++ " 座標系の原点" )
  --order --forward /n /name
```

Command `koshu origin.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    origin.k
**
**  OUTPUT
**    <stdout>
**

|-- 原点  /n 1  /name "第 1 座標系の原点"  /lat 32.9999  /long 129.5000
|-- 原点  /n 2  /name "第 2 座標系の原点"  /lat 32.9999  /long 131.0000
|-- 原点  /n 3  /name "第 3 座標系の原点"  /lat 35.9999  /long 132.1666
|-- 原点  /n 4  /name "第 4 座標系の原点"  /lat 32.9999  /long 133.5000
|-- 原点  /n 5  /name "第 5 座標系の原点"  /lat 35.9999  /long 134.3333

|-- 原点  /n 6  /name "第 6 座標系の原点"  /lat 35.9999  /long 136.0000
|-- 原点  /n 7  /name "第 7 座標系の原点"  /lat 35.9999  /long 137.1666
|-- 原点  /n 8  /name "第 8 座標系の原点"  /lat 35.9999  /long 138.5000
|-- 原点  /n 9  /name "第 9 座標系の原点"  /lat 35.9999  /long 139.8333
|-- 原点  /n 10  /name "第 10 座標系の原点"  /lat 39.9999  /long 140.8333

|-- 原点  /n 11  /name "第 11 座標系の原点"  /lat 44.0000  /long 140.2500
|-- 原点  /n 12  /name "第 12 座標系の原点"  /lat 44.0000  /long 142.2500
|-- 原点  /n 13  /name "第 13 座標系の原点"  /lat 44.0000  /long 144.2500
|-- 原点  /n 14  /name "第 14 座標系の原点"  /lat 25.9999  /long 142.0000
|-- 原点  /n 15  /name "第 15 座標系の原点"  /lat 25.9999  /long 127.5000

|-- 原点  /n 16  /name "第 16 座標系の原点"  /lat 25.9999  /long 124.0000
|-- 原点  /n 17  /name "第 17 座標系の原点"  /lat 25.9999  /long 131.0000
|-- 原点  /n 18  /name "第 18 座標系の原点"  /lat 19.9999  /long 136.0000
|-- 原点  /n 19  /name "第 19 座標系の原点"  /lat 25.9999  /long 154.0000

*** 19 judges

**
**  SUMMARY
**      19 judges on 原点
**      19 judges in total
**
```



## command

This document is produced by the command:

```
koshu-inout.sh -r -g koshu
```
