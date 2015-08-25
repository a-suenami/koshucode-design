** -*- koshu -*-
**
**  平面直角座標系の原点の緯度・経度を計算します。
**

|== 原点 : range /n -from 1 -to 19
  | geo-datum-jp /n 0 0 -to /lat /long
  | add /name ( "第 " ++ to-text /n ++ " 座標系の原点" )
  --order --forward /n /name
