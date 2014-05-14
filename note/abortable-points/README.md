# 計算の中断を補足する場所

甲州計算機が計算を実行する過程で、
構文エラー、型の不一致、ゼロ除算のように、
処理を中断しなければならないことがあります。
このとき、該当箇所のソースコードとともに、
中断理由が表示され、ステータス 2 で終了します。
このノートは、中断時にソースコード情報を補足する場所を一覧します。
それぞれの場所にはタグがつけられており、
[このように][INOUT] ソースコードの各行といっしょに表示されます。

甲州計算機のバージョン 0.56 を対象としたとき、
[ABORTABLE.k] に記載されているタグが用意されています。


### 関係計算式にまつわるエラータグ

入力を読み込み、解析し、実行して、結果を出力するという
流れに沿ってエラータグを並べると、つぎのようになります。

|  # | エラータグ   | モジュール              | 場所の概要                         |
|----|--------------|-------------------------|------------------------------------|
|  1 | [clause]     | [Core.Section.Section]  | 節の組み立て                       |
|  2 | [lexmap]     | [Core.Relmap.Construct] | 関係写像のトークンレベルの組み立て |
|  3 | [operand]    | [Op.Builtin.Get]        | 関係写像の引数の取得               |
|  4 | [relmap]     | [Core.Relmap.Construct] | 総称関係写像の組み立て             |
|  5 | [specialize] | [Core.Relmap.Relmap]    | 関係写像の特定化                   |
|  6 | [run]        | [Core.Relmap.Relkit]    | 特定関係写像の実行                 |
|  7 | [assert]     | [Core.Assert.Run]       | 判断集合の出力                     |


### 項目計算式にまつわるエラータグ

項目計算式は、項目を追加・置換する関係写像演算子 `add` / `subst`、または、
組を残す・捨てる関係写像演算子 `keep` / `omit` のオペランドとなる計算式です。

|  # | エラータグ   | モジュール              | 場所の概要                         |
|----|--------------|-------------------------|------------------------------------|
|  1 | [syntax]     | [Core.Content.Cox]      | 項目計算式の構文展開               |
|  2 | [position]   | [Core.Content.Cox]      | 項目位置の特定                     |
|  3 | [calc]       | [Core.Content.Cox]      | 項目計算式の実行                   |


[INOUT]:        abort/README.md
[ABORTABLE.k]:  ABORTABLE.k

[assert]:       abort/abort-assert.k
[calc]:         abort/abort-calc.k
[clause]:       abort/abort-clause.k
[lexmap]:       abort/abort-lexmap.k
[operand]:      abort/abort-operand.k
[position]:     abort/abort-position.k
[relmap]:       abort/abort-relmap.k
[run]:          abort/abort-run.k
[specialize]:   abort/abort-specialize.k
[syntax]:       abort/abort-syntax.k

[Core.Assert.Run]:        https://github.com/seinokatsuhiro/koshucode/blob/master/baala/core/Koshucode/Baala/Core/Assert/Run.hs
[Core.Content.Cox]:       https://github.com/seinokatsuhiro/koshucode/blob/master/baala/core/Koshucode/Baala/Core/Content/Cox.hs
[Core.Relmap.Construct]:  https://github.com/seinokatsuhiro/koshucode/blob/master/baala/core/Koshucode/Baala/Core/Relmap/Construct.hs
[Core.Relmap.Relkit]:     https://github.com/seinokatsuhiro/koshucode/blob/master/baala/core/Koshucode/Baala/Core/Relmap/Relkit.hs
[Core.Relmap.Relmap]:     https://github.com/seinokatsuhiro/koshucode/blob/master/baala/core/Koshucode/Baala/Core/Relmap/Relmap.hs
[Core.Section.Section]:   https://github.com/seinokatsuhiro/koshucode/blob/master/baala/core/Koshucode/Baala/Core/Section/Section.hs
[Op.Builtin.Get]:         https://github.com/seinokatsuhiro/koshucode/blob/master/baala/operator/Koshucode/Baala/Op/Builtin/Get.hs

