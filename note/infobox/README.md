# Wikipedia Infobox


このノートでは、Wikipedia の Infobox を甲州記法にあてはめてみます。
甲州記法はデータ記述言語であると同時に、データ処理言語でもあるので、
[ファイル・フォーマット] と [プログラミング言語] のテンプレートが使えるでしょうか。


## 甲州記法

|                  |                     |
|------------------|---------------------|
| 拡張子           | `.k`                |
| MIME Type        | `application/koshu` |
| パラダイム       | 関係型              |
| 種別             | データ言語          |
| 登場時期         | 2013 年             |
| 設計者           | 清野克宏            |
| 影響を受けた言語 | [位取り記数法] と [四則演算記号]、[概念記法]、[シェルスクリプト]、[Tutorial D]、[qbql] |

[位取り記数法] と [四則演算記号] から、
数そのものとその計算の両方をあらわす記号体系という考え方をもらい、
甲州記法も、データそのものとその計算式の両方をあらわす
記号体系となるように設計されています。
[概念記法] からは、フレーゲの判断線 `|--` と
それが依拠する考え方である判断優位仮説をもらっています。
[シェルスクリプト] から、たて棒 `|` によるパイプラインの記述法、
`/a/b` のようなパスによる項目名などに影響を受けています。
[Tutorial D] からは、本来の関係型言語として言語を規定する方法を受け継いでいます。
[qbql] からは、関係束の理論を教えてもらっています。


[ファイル・フォーマット]: http://ja.wikipedia.org/wiki/Template:Infobox_file_format
[プログラミング言語]: http://ja.wikipedia.org/wiki/Template:Infobox_programming_language

[位取り記数法]: http://ja.wikipedia.org/wiki/位取り記数法
[四則演算記号]: http://www.wolframalpha.com/input/?i=10+%2B+20+-+30+x+40+%2F+50
[概念記法]: http://ja.wikipedia.org/wiki/概念記法
[シェルスクリプト]: http://ja.wikipedia.org/wiki/シェルスクリプト
[Tutorial D]: http://ja.wikipedia.org/wiki/Tutorial_D
[qbql]: http://code.google.com/p/qbql/

