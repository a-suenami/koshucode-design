# 真偽概念と命題写像


真理の余剰説
------------------------------------------------------------------

真理論は、真とはなにかを明確にしようとする理論です。
そのなかに、[フレーゲ] と [ラムゼイ] による **真理の余剰説**
と呼ばれる考え方があります。余剰説は、

 - **命題 _P_** : 任意の命題
 - **命題 _Q_** : _P_ は真である。

のふたつを比べると、 _P_ が正しいときは _Q_ も正しくなり、
_P_ が間違いのときは _Q_ も間違いになります。
まとめると、_P_ = _Q_ となることから、
「... は真である」には機能がない、
すなわち、余剰であると考えます。また

 - **命題 _R_** : _P_ は偽である。

では、_P_ が正しいときは _R_ が間違いになり、
_P_ が間違いのときは _R_ が正しくなります。

[フレーゲ]: https://ja.wikipedia.org/wiki/ゴットロープ・フレーゲ
[ラムゼイ]: https://ja.wikipedia.org/wiki/フランク・ラムゼイ


命題写像
------------------------------------------------------------------

「_P_ は真である」の「... は真である」という語句は、
命題 _P_ から命題 _Q_ を作るときに使われていることを考えると、
その機能形式は命題から命題を作り出す
**命題写像** (proposition map) です。
その命題写像は、入力をそのまま出力に写像する恒等命題写像 id にほかならず,
_P_ = _Q_ = id _P_ という等式が成り立ちます。
[恒等写像] はプログラミング言語の Haskell の書き方で書くと、
型パラメータ `a` に対する関数 `id :: a -> a` になります。
命題型 `Prop` に特殊化すると、恒等命題写像の型は
`id :: Prop -> Prop` とあらわされます。
これが「... は真である」のプログラミング的な定式化です。

恒等命題写像は、真理値 (Boolean) 間の写像ではなく、
命題型間の写像であることに注意してください。
言い換えると、`Bool -> Bool` ではなく
`Prop -> Prop` であるということです。
真理値と命題の差異は、文脈によっては無視されることもありますが、
つぎのように説明できます。
たとえば、「2016 年 2 月は 29 日まである」と
「2015 年 2 月は 28 日まである」はともに正しい命題ですが、
命題内容は異なります。
命題型の変数 `p16` と `p15` を、つぎのように定義しましょう。

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ .haskell
p16, p15 :: Prop
p16 = fromString "2016 年 2 月は 29 日まである。"
p15 = fromString "2015 年 2 月は 28 日まである。"
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

このとき `p16 /= p15` ですが、命題の正しさを真理値に写像する
`Prop -> Bool` という型の関数 `truth` を考えると、
`truth p16 == True` かつ `truth p15 == True` のため、
`truth p16 == truth p15` です。
これが命題 `Prop` と真理値 `Bool` の違いです。

[恒等写像]: https://ja.wikipedia.org/wiki/恒等写像


真偽判断
------------------------------------------------------------------

命題写像 `Prop -> Prop` は、命題を別な命題に変換するだけなので、
命題の真偽を確定する機能はありません。
その機能は `truth :: Prop -> Bool` に内在されていると考えられます。

余剰説の説明に使われる命題「_P_ は真である」にもどり、もともとの意図である、
命題 _P_ が真であることを表現するには、どうすればよいでしょうか。
ひとつは `truth P == True` という等式を使うことです。
この観点では、「... は真である」は
`truth ... == True` に対応していることになります。

興味深いことに、この真偽確定機能はフレーゲの初期の
[概念記法] で明瞭に説明されているだけでなく、
専用の記号が与えられています。
それは現代的な [ターンスタイル] `⊦` の元になった記号で、
判断線 `|` と内容線 `--` を組み合わせた `|--` です。
この記号は `|--` の右側に命題をおき、
その命題が正しいということを表明します。この記号を使うと、

 - `truth "2016 年 2 月は 29 日まである。" == True`

の代わりに

 - `|-- 2016 年 2 月は 29 日まである。`

と書けます。真偽確定された命題は論理学の用語で **判断** (judgment)
と呼ばれるため、この `|--` を含めた全体を判断と呼びます。
プログラミング言語風の定式化としては、`|--` に後続するテキストを
命題化して、それを肯定判断に変換する構文キーワードに相当します。

[概念記法]: https://ja.wikipedia.org/wiki/概念記法
[ターンスタイル]: https://en.wikipedia.org/wiki/Turnstile_(symbol)

