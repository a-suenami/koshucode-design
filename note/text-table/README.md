テキストを使った表の描画
==================================================================

このノートでは、テキストを表形式に整列させる方法を説明します。
Haskell のデータ型でいうと、表の要素が `String` 型で、
表全体で `[[String]]` 型になっているもの、
あるいは、より一般的に、要素が `[String]` 型で複数行になりうるもので、
表全体で `[[[String]]]` となっているものを考えましょう。

つぎの表は、1 列目は左寄せ、2 列目は中央寄せ、3 列目は右寄せになっていて、
各列の間に `|` を配置しています。

    a   | bbb | cc
    p   |  q  |  r
    xxx | yy  |  z

この表は、[`TextTable.hs`][TextTable.hs] で定義された機能を使って、
つぎのような式でつくれます。

    putStr $ unlines $ renderTable " | " $ alignTable $ textTable (textPos "<->")
      $ [["a","bbb","cc"], ["p","q","r"], ["xxx","yy","z"]]

 - `textPos "<->"` は各列の寄せ方向を指定します。
 - `textTable` は、引数の寄せ方向と表の内容を `[[Cell]]` 型に変換します。
 - `alignTable` は桁数と行数を揃えます。
 - `renderTable " | "` は `[[Cell]]` を、
   行の並びである表形式の `[String]` に変換します。
 - その行の並びを `unlines` すると文字列としての表が得られます。

このノートの残りの部分では、データ型と関数の概略を説明します。

[TextTable.hs]: TextTable.hs



Position
------------------------------------------------------------------

`Position` は上中下、左中右、前中後のような位置をあらわします。
`textPos :: String -> [Position]` は、
`[Position]` を簡単に入力できるようにする関数です。
`[Front, Middle, Rear]` の代わりに `textPos "<->"` (左右) や
`textPos "^|v"` (上下) のように書けます。

    data Position = Front | Middle | Rear


Cell
------------------------------------------------------------------

`Cell` は表の要素となる文字列 `cellText` を、
その桁数 `cellWidth`、行数 `cellHeight`、
寄せ方向 `cellPos`、詰め文字 `cellPad` とともにまとめます。

    data Cell = Cell { cellText   :: [String]
                     , cellWidth  :: Int
                     , cellHeight :: Int
                     , cellPos    :: Position
                     , cellPad    :: Char
                     }


textTable
------------------------------------------------------------------

関数 `textTable :: [Position] -> [[String]] -> [[Cell]]`
は、表の要素となる `String` を `Cell` で包み込みます。
この関数は、表の要素が `"bbb"` のように 1 行に収まることを前提としています。
`textPos "<->"` という位置で、
`[["a", "bbb", "cc"]]` を `[[Cell]]` に変換すると、
その内容はつぎのようになります。

    Data Text    W H Pos    Pad
    ---- ------- - - ------ ---
    Cell ["a"]   1 1 Front  ' '
    Cell ["bbb"] 3 1 Middle ' '
    Cell ["cc"]  2 1 Rear   ' '

`textTable` はセルをまとめて作成しますが、
個々に作成するときは、`textCell` などを使うか `Cell` を直接使います。
`textCell` などの `Cell` を返す関数として、つぎの 4 つが定義されています。

| 関数              | 引数の型              | 内容                     |
|-------------------|-----------------------|--------------------------|
| textCell          | Position String                | 単一行の要素             |
| textRuleCell      | Char                  | 罫線としての要素         |
| textBlockCell     | Position [String]     | 複数行の要素             |
| textBlockCellPlus | Position [String] Int | 複数行の要素と追加の空行 |


alignTable
------------------------------------------------------------------

関数 `alignTable :: [[Cell]] -> [[Cell]]` は、
`Cell` のなかの桁数 `cellWidth` と行数 `cellHeight`
を最大の桁数と行数に合わせて再計算します。

 - 各行の `Cell` に対して、`cellWidth` の最大値を計算し、
   その最大値で各 `Cell` の `cellWidth` を置き換えます。

 - 各列の `Cell` に対して、`cellHeight` の最大値を計算し、
   その最大値で各 `Cell` の `cellHeight` を置き換えます。


renderTable
------------------------------------------------------------------

関数 `renderTable " | " :: [[Cell]] -> [String]` は
表形式の `Cell` の集団を文字列として描画します。
列の間に `" | "` を挿入します。
改行文字まで含んだ単一の文字列にする代わりに
`unlines` の手前までを計算します。
こうすることで、入れ子の表をつくったり、表に追加の加工が必要なときに、
`lines` し直す必要がなくなります。

