** -*- koshu -*-
**
**  概要
**    除外制約 (包含制約)
**
**  使用例
**    koshu exclude.k XY.k
**    koshu exclude.k XY.k Y40.k
**

my-exclude : none ( pick @'all | meet ( @from | pick @'all ))

|-- P  /x 1  /y 10
|-- P  /x 1  /y 20
|-- P  /x 2  /y 30
|-- P  /x 3  /y 40

x : source X /x
y : source Y /y
p : source P /x /y

|=V P-EXCLUDE-X : p | exclude /x -from x
|=V P-EXCLUDE-Y : p | exclude /y -from y

|=V MY-P-EXCLUDE-X : p | my-exclude /x -from x
|=V MY-P-EXCLUDE-Y : p | my-exclude /y -from y
