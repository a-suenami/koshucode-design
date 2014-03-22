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
