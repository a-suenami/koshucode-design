# 命題関数とはなにか


[命題関数] は、一般的には、真偽値を返す関数をあらわしますが、
ここでは、[命題] を返す関数として再定義してみましょう。


命題
------------------------------------------------------------------

**命題関数** (propositional function) とは、どのような種類の関数なのでしょうか。
命題関数は、最終的な値が **命題** (proposition) である関数を指し示しますが、
この命題をどのようにとらえるかによって、命題関数の意味は変わってきます。
ここでは、命題を、その成否を判断できるような記号列としてとらえます。
たとえば、

    1 と 2 を足した結果は 3 である。

という記号列は、その成否を判断できる命題です。
この命題は、通常の数の算術を想定すれば、実際に、成立します。
成立しない命題の例としては、

    1 と 3 を足した結果は 5 である。

などがあります。これらの命題をひな形として、
3 つの整数から、この種の命題をつくる命題関数は

    addProp :: Int -> Int -> Int -> Prop Int
    addProp x y z = x と y を足した結果は z である。

のように表現できます。ここでは、[Haskell] の表記法で、
命題型を `Prop a` として、この命題関数の型を記述しています。


判断
------------------------------------------------------------------

命題それ自体では、その成否を表現する手段をもちません。
あくまでも、成否を判断可能であるという性質をもっているにすぎず、
命題の成否を判断できる系を与えないかぎり、その具体的な成否は決まりません。
そのような命題の成否を決める能力のある系を
**判断系** (judgemental system) とよびます。
判断系は、命題の成否を計算する **判断関数** (judgemental function)

    judge :: Prop a -> Maybe Bool

をもっており、命題が成立するときは `Just True` を、
成立しないときは `Just False` を返し、
その系内で取り扱い対象外の命題に対しては `Nothing` を返します。

命題を、その成否まで含めて表明した記号列は
**判断** (judgement) とよばれ、
フレーゲの [概念記法] の表記法では、
命題の左側に判断記号 `|--` をおいて、
その命題が成立することあらわします。

    |--  1 と 2 を足した結果は 3 である。

命題が成立しないという判断は、`|--` の代わりに
`|-x` を使うことにしましょう。

    |-x  1 と 3 を足した結果は 5 である。

判断は、命題の成否を静的に、あるいは、直接的に、表明するもので、
判断関数は、命題の成否を動的に、あるいは、間接的に、表現するものであるといえます。

フレーゲは、概念記法を応用した体系である [算術の基本法則] で、
`|--` の機能を、命題の成否の表明ではなく、
このノートでいうところの判断関数として扱っています。
これは、命題 P は命題「命題 P は真である」と同値であるという、
いわゆる、真理のデフレ理論に分類される考え方を背景にもちます。
しかし、それを採用すると、命題の成否を表明する手法がなくなり、
真である命題の集合を間接的にしか表現できなくなるため、
ここでは、オリジナルの概念記法の記号法を採用しています。


prop.hs
------------------------------------------------------------------

このディレクトリにある [prop.hs] は、
命題関数の使用例をプログラムとして提示しています。
具体的には `addProp` や `mulProp` が命題関数です。
runhaskell を使える環境であれば、つぎのようにして実行できます。

    $ runhaskell prop.hs

実行結果は [入出力リスト] にあります。

以下にプログラムの構成要素をかんたんに説明します。

### data Prop a

このデータ型は、命題 (proposition) をあらわします。
命題は、その成否を判断可能な記号列のことで,
命題の種類をあらわす文字列とその引数となる
連想リストを組み合わせたものとして実装されています。

### data Judge a

このデータ型は、判断 (judgement) をあらわします。
判断は、成否が宣言された命題で、
具体的には、`Bool` と `Prop a` の組として実装されています。
命題それ自体では、真偽は確定しないため、
公理や定理は、実際には、判断として記述されます。

### class Judgeable a

このクラスは、命題の成否を計算する判断関数をもつ型を一般化します。
命題の成否の決定は、もっぱら、`Judgeable` の実装によって取り扱われます。
典型的な `Judgeable` の実装は、公理としての `Judge` を参照しながら、
そこに計算を加えて、複雑な命題の成否を決定することになります。



[命題]: http://ja.wikipedia.org/wiki/命題
[命題関数]: http://ja.wikipedia.org/wiki/命題関数
[Haskell]: http://ja.wikipedia.org/wiki/Haskell
[概念記法]: http://ja.wikipedia.org/wiki/概念記法
[算術の基本法則]: http://www.keisoshobo.co.jp/book/b26703.html
[prop.hs]: prop.hs
[入出力リスト]: INOUT.md
