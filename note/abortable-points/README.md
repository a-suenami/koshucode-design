# 計算の中断を補足する場所

甲州計算機が計算を実行する過程で、
構文エラー、型の不一致、ゼロ除算のように、
処理を中断しなければならないことがあります。
このとき、該当箇所のソースコードとともに、
中断理由が表示され、ステータス 2 で終了します。
このノートは、中断時にソースコード情報を補足する場所を一覧します。
それぞれの場所にはタグがつけられており、
ソースコードの各行といっしょに表示されます。

甲州計算機のバージョン 0.43 を対象とします。

|  # | タグ         | モジュール              | 場所の概要                         |
|----|--------------|-------------------------|------------------------------------|
|  1 | [clause]     | [Core.Section.Section]  | 節の組み立て                       |
|  2 | [half]       | [Core.Relmap.Construct] | 関係写像のトークンレベルの組み立て |
|  3 | [operand]    | [Builtin.Get]           | 関係写像の引数の取得               |
|  4 | [relmap]     | [Core.Relmap.Construct] | 汎用関係写像の組み立て             |
|  5 | [specialize] | [Core.Assert.Run]       | 関係写像の特定化                   |
|  6 | [run]        | [Core.Relmap.Relkit]    | 特定化関係写像の実行               |
|  7 | [assert]     | [Core.Assert.Run]       | 判断集合の出力                     |
|  8 | [syntax]     | [Core.Content.Cox]      | 項目計算式の構文展開               |
|  9 | [calc]       | [Core.Content.Cox]      | 項目計算式の実行                   |

[clause]:     abort/abort-clause.k
[half]:       abort/abort-half.k
[relmap]:     abort/abort-relmap.k
[operand]:    abort/abort-operand.k
[syntax]:     abort/abort-syntax.k
[specialize]: abort/abort-specialize.k
[assert]:     abort/abort-assert.k
[run]:        abort/abort-run.k
[calc]:       abort/abort-calc.k

[Builtin.Get]:           https://github.com/seinokatsuhiro/koshucode/blob/master/baala/core/Koshucode/Baala/Core/Builtin/Get.hs
[Core.Assert.Run]:       https://github.com/seinokatsuhiro/koshucode/blob/master/baala/core/Koshucode/Baala/Core/Assert/Run.hs
[Core.Content.Cox]:      https://github.com/seinokatsuhiro/koshucode/blob/master/baala/core/Koshucode/Baala/Core/Content/Cox.hs
[Core.Relmap.Construct]: https://github.com/seinokatsuhiro/koshucode/blob/master/baala/core/Koshucode/Baala/Core/Relmap/Construct.hs
[Core.Relmap.Relkit]:    https://github.com/seinokatsuhiro/koshucode/blob/master/baala/core/Koshucode/Baala/Core/Relmap/Relkit.hs
[Core.Section.Section]:  https://github.com/seinokatsuhiro/koshucode/blob/master/baala/core/Koshucode/Baala/Core/Section/Section.hs

