# I/O List

- [deadlock.k](#deadlockk)
- koshu deadlock.k [fine.k](#finek)
- koshu deadlock.k [many.k](#manyk)
- koshu deadlock.k [one.k](#onek)



## [deadlock.k](deadlock.k)

```
** -*- koshu -*-
**
**  説明
**    デッドロックしている処理単位を表示する
**
**  使用例
**    koshu deadlock.k one.k
**


** **********************  出力

**  判断
**    NODE-SET
**  解釈
**    /node-set はデッドロック関係にある処理単位の集合である。

|== NODE-SET : nodes

**  判断
**    NODE
**  解釈
**    /node はデットロックしている処理単位である。

|== NODE : nodes | member /node /node-set | pick /node


** **********************  計算

**  判断
**    WAIT
**  解釈
**    処理単位 /after は処理単位 /before の終了を待っている。

wait    : source WAIT /before /after
wait-ma : wait | rename /medium /before    ** /medium /after

closure : wait
  | add /node-set {}
  | push-before
  | fix-join ( rename /medium /after
             | push-medium
             | compose wait-ma )
  | push-after

push-before : subst /node-set ( push /before /node-set )
push-medium : subst /node-set ( push /medium /node-set )
push-after  : subst /node-set ( push /after  /node-set )

nodes : closure
  | keep /before = /after
  | pick /node-set
```



## [fine.k](fine.k)

```
** -*- koshu -*-
**
**  判断
**    WAIT
**
**  解釈
**    処理単位 /after は処理単位 /before の終了を待っている。
**

|-- WAIT  /before 'A  /after 'B
|-- WAIT  /before 'A  /after 'C
|-- WAIT  /before 'B  /after 'D
|-- WAIT  /before 'C  /after 'D
|-- WAIT  /before 'D  /after 'E
```

Command `koshu deadlock.k fine.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    deadlock.k
**    fine.k
**
**  OUTPUT
**    <stdout>
**

*** no judges

*** no judges

**
**  SUMMARY
**      no judges on NODE
**      no judges on NODE-SET
**      no judges in total
**
```



## [many.k](many.k)

```
** -*- koshu -*-
**
**  A -> B -> D -> A [ -> C -> D -> A ]
**  A -> C -> D -> A
**

|-- WAIT  /before 'A  /after 'B
|-- WAIT  /before 'A  /after 'C
|-- WAIT  /before 'B  /after 'D
|-- WAIT  /before 'C  /after 'D
|-- WAIT  /before 'D  /after 'E

|-- WAIT  /before 'D  /after 'A
```

Command `koshu deadlock.k many.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    deadlock.k
**    many.k
**
**  OUTPUT
**    <stdout>
**

|-- NODE-SET  /node-set { 'A | 'D | 'B }
|-- NODE-SET  /node-set { 'A | 'D | 'C }
|-- NODE-SET  /node-set { 'A | 'D | 'C | 'B }

*** 3 judges

|-- NODE  /node 'A
|-- NODE  /node 'D
|-- NODE  /node 'B
|-- NODE  /node 'C

*** 4 judges

**
**  SUMMARY
**       4 judges on NODE
**       3 judges on NODE-SET
**       7 judges in total
**
```



## [one.k](one.k)

```
** -*- koshu -*-
**
**  B -> D -> E -> B
**

|-- WAIT  /before 'A  /after 'B
|-- WAIT  /before 'A  /after 'C
|-- WAIT  /before 'B  /after 'D
|-- WAIT  /before 'C  /after 'D
|-- WAIT  /before 'D  /after 'E

|-- WAIT  /before 'E  /after 'B
```

Command `koshu deadlock.k one.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    deadlock.k
**    one.k
**
**  OUTPUT
**    <stdout>
**

|-- NODE-SET  /node-set { 'B | 'E | 'D }

*** 1 judge 

|-- NODE  /node 'B
|-- NODE  /node 'E
|-- NODE  /node 'D

*** 3 judges

**
**  SUMMARY
**       3 judges on NODE
**       1 judge  on NODE-SET
**       4 judges in total
**
```



## command

This document is produced by the command:

```
koshu-inout.sh -r -g koshu deadlock.k
```
