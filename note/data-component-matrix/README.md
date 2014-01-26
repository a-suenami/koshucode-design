# データ構成行列

このノートでは、データ型の依存関係をあらわす行列について、例をあげて説明します。
甲州計算機のバージョン 0.42 に対応します。



Core.Relmap.Construct
------------------------------------------------------------------

このモジュールでは `RelmapCons` `RelmapConsHalf` `RelmapConsFull`
の 3 つのデータ型を定義しています。
`RelmapCons` は `RelmapConsHalf` と `RelmapConsFull` を使って
定義されているため、`/` が `>` と `>` を使うという記号であらわしましょう。
モジュール外のデータ型を下にまとめて列挙します。
モジュール外のデータ型にしか依存していないデータ型の
依存関係の高さを 0 として、依存関係の高さを型名の右側に書きます。

|      |                  |   |    |    |    |
|:----:|------------------|---|:--:|:--:|:--:|
| data | RelmapCons       | 1 | /  |    |    |
| type | RelmapConsHalf   | 0 | >  | /  |    |
| type | RelmapConsFull   | 0 | >  |    | /  |
|      |                  |   |    |    |    |
| type | Ab               |   |    | >  | >  |
| data | HalfRelmap       |   |    | >  | >  |
| data | Relmap           |   |    |    | >  |
| type | TokenTree        |   |    | >  |    |



Core.Relmap.Rop
------------------------------------------------------------------

このモジュールは関係写像演算子をあらわす `Rop` などを定義しています。
`Rop` → `RopCons` → `RopUse` → `Global` → `Rop` 
のようにデータ型が循環しているため、少し複雑な定義といえます。
依存関係が循環しているデータ型群は、すべて、
依存関係の高さをすべて同じとみなし、`*` を付けて明示します。

|      |                  |    |    |    |    |    |    |    |
|:----:|------------------|----|:--:|:--:|:--:|:--:|:--:|:--:|
| data | Global           | 1* | /  | >  |    |    | >  |    |
| data | Relmap           | 1* |    | /> |    | >  | >  |    |
| data | Rop              | 1* | >  |    | /  |    |    |    |
| type | RopCons          | 1* |    |    | >  | /  |    |    |
| data | RopUse           | 1* |    |    |    | >  | /  |    |
| type | RelSelect        | 0  | >  |    |    |    |    | /  |
|      |                  |    |    |    |    |    |    |    |
| type | Ab               |    | >  |    |    | >  |    |    |
| data | Cop              |    | >  |    |    |    |    |    |
| type | CoxCons          |    | >  |    |    |    |    |    |
| data | HalfRelmap       |    |    | >  |    |    | >  |    |
| type | InfixHeight      |    | >  |    |    |    |    |    |
| data | Judge            |    | >  |    |    |    |    |    |
| type | JudgePattern     |    |    | >  |    |    |    | >  |
| type | Named            |    | >  |    |    |    |    |    |
| data | Rel              |    |    | >  |    |    |    | >  |
| type | RelmapCalcRelfy  |    |    | >  |    |    |    |    |
| type | RelmapConflRelfy |    |    | >  |    |    |    |    |
| type | RopFullSorter    |    |    |    | >  |    |    |    |
| type | Termname         |    |    | >  |    |    |    |    |
| type | TokenTree        |    | >  |    |    |    |    |    |
| type | String           |    | >  | >  | >  |    |    | >  |
| data | Version          |    | >  |    |    |    |    |    |

