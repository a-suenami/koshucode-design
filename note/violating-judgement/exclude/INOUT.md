# I/O List

- koshu [exclude.k](#excludek)
- koshu [exclude.k XY.k](#excludek-xyk)
- koshu [exclude.k XY.k Y40.k](#excludek-xyk-y40k)



## exclude.k

```
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
```

Command `koshu exclude.k` exits with 1 and produces:

```
** -*- koshu -*-
**
**  INPUT
**    exclude.k
**
**  OUTPUT
**    <stdout>
**

|-V P-EXCLUDE-X  /x 1  /y 10
|-V P-EXCLUDE-X  /x 1  /y 20
|-V P-EXCLUDE-X  /x 2  /y 30
|-V P-EXCLUDE-X  /x 3  /y 40

*** 4 judges

|-V P-EXCLUDE-Y  /x 1  /y 10
|-V P-EXCLUDE-Y  /x 1  /y 20
|-V P-EXCLUDE-Y  /x 2  /y 30
|-V P-EXCLUDE-Y  /x 3  /y 40

*** 4 judges

|-V MY-P-EXCLUDE-X  /x 1  /y 10
|-V MY-P-EXCLUDE-X  /x 1  /y 20
|-V MY-P-EXCLUDE-X  /x 2  /y 30
|-V MY-P-EXCLUDE-X  /x 3  /y 40

*** 4 judges

|-V MY-P-EXCLUDE-Y  /x 1  /y 10
|-V MY-P-EXCLUDE-Y  /x 1  /y 20
|-V MY-P-EXCLUDE-Y  /x 2  /y 30
|-V MY-P-EXCLUDE-Y  /x 3  /y 40

*** 4 judges

**
**  SUMMARY (VIOLATED)
**       4 judges on MY-P-EXCLUDE-X
**       4 judges on MY-P-EXCLUDE-Y
**       4 judges on P-EXCLUDE-X
**       4 judges on P-EXCLUDE-Y
**      16 judges in total
**
```



## exclude.k XY.k

```
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
```
```
** -*- koshu -*-

|-- X  /x 1
|-- X  /x 2
|-- X  /x 3
|-- X  /x 4

|-- Y  /y 10
|-- Y  /y 20
|-- Y  /y 30

```

Command `koshu exclude.k XY.k` exits with 1 and produces:

```
** -*- koshu -*-
**
**  INPUT
**    exclude.k
**    XY.k
**
**  OUTPUT
**    <stdout>
**

|-V P-EXCLUDE-Y  /x 3  /y 40

*** 1 judge 

|-V MY-P-EXCLUDE-Y  /x 3  /y 40

*** 1 judge 

**
**  SUMMARY (VIOLATED)
**      no judges on MY-P-EXCLUDE-X
**       1 judge  on MY-P-EXCLUDE-Y
**      no judges on P-EXCLUDE-X
**       1 judge  on P-EXCLUDE-Y
**       2 judges in total
**
```



## exclude.k XY.k Y40.k

```
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
```
```
** -*- koshu -*-

|-- X  /x 1
|-- X  /x 2
|-- X  /x 3
|-- X  /x 4

|-- Y  /y 10
|-- Y  /y 20
|-- Y  /y 30

```
```
** -*- koshu -*-

|-- Y  /y 40

```

Command `koshu exclude.k XY.k Y40.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    exclude.k
**    XY.k
**    Y40.k
**
**  OUTPUT
**    <stdout>
**

**
**  SUMMARY
**      no judges on MY-P-EXCLUDE-X
**      no judges on MY-P-EXCLUDE-Y
**      no judges on P-EXCLUDE-X
**      no judges on P-EXCLUDE-Y
**      no judges in total
**
```



## command

This document is produced by the command:

```
koshu-inout.sh -s -f ARG koshu
```
