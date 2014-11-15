# 関係の属性という語法はなぜ避けるべきか


Wikipedia にも説明されているように、
[関係] は見出しと本体からなり、見出しはその関係の型を記述し、
本体はその型の組の集合で、各組は属性の集合として記述されます。
この構成は、たとえば、つぎのように図示できます。

    関係
      見出し
        属性 /a number  属性 /b text  属性 /c date
      本体
        組 : 属性 /a 1  属性 /b "XXX"  属性 /c |2014-09-01|
        組 : 属性 /a 2  属性 /b "YYY"  属性 /c |2014-09-01|
        組 : 属性 /a 3  属性 /b "ZZZ"  属性 /c |2014-09-02|

このノートでは、関係を説明するときの用語として、
[属性] が適切とはいえないということを簡単に説明します。

ひとつ目の理由は、属性は、それが属する主体に対して認められる性質で、
主体を無視して、属性だけを取り出したり、
属性と属性の間の関係を直接的に取り扱うことは、
二次的にしか意味をもたないからです。
しかし、関係では、属性と属性の間の関係を一次的に取り扱う必要があります。
このことは、属性という用語では、関係の一次的な特徴を捉えられないことを意味します。

たとえば、大小関係という関係を考えてみます。
「3 は 7 より小さい」という関係は、大小関係の具体例です。
このとき、3 や 7 は属性というよりも、
独立した要素として 3 や 7 があり、
その間に成立する関係のひとつとして大小関係がみとめられる
という感じがするのではないかと思います。
3 や 7 が「3 は 7 より小さい」の属性であるとすると、
その属性の属する主体が何であるか回答に困るのではないでしょうか。

ふたつ目は、大小関係のような 2 つの要素間の関係は、
通常、[2 項関係] とよばれており、2 属性関係とはよばれていないことです。
この 2 項関係や、一般に、n 項関係という用語と整合性をもたせるには、
属性の代わりに、項、ないし、項目という語を当てるのが適当です。
項は属性とは異なり、それが属する主体を必要とせず、
関係を記号によって記述するときのひとつの要素という
本来の意味に即した用語といえます。

属性の代わりに項目を使うと、上の図は、つぎのようになります。

    関係
      見出し
        項目 /a number  項目 /b text  項目 /c date
      本体
        組 : 項目 /a 1  項目 /b "XXX"  項目 /c |2014-09-01|
        組 : 項目 /a 2  項目 /b "YYY"  項目 /c |2014-09-01|
        組 : 項目 /a 3  項目 /b "ZZZ"  項目 /c |2014-09-02|


[関係]: http://ja.wikipedia.org/wiki/関係_(データベース)
[属性]: http://ja.wikipedia.org/wiki/属性_(データベース)
[2 項関係]: http://ja.wikipedia.org/wiki/二項関係