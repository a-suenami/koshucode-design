# エラーの報告

このノートでは、甲州計算機がエラーを報告する方法を考えます。
甲州計算機のバージョン 0.40 では、まだ、組織的なエラー報告が
できるようになっていません。



## 分類

甲州計算機のエラーは、大きく、つぎの 5 種類に分けられるでしょう。

| 分類           | 日本語           | 内容 |
|----------------|------------------|---------------|
| I/O ERROR      | 入出力不可能     | ファイルなどの資源がみつからない、文字 (バイト) を読み書きできないなどの状況。 |
| SYNTAX ERROR   | 文法間違い       | 判断の読み込み、計算式の読み込みでの文法間違いなど。 |
| ANALISYS ERROR | 解析エラー       | 関係式を解析した結果、計算不可能な状況が分かったとき。 |
| CALC ERROR     | 計算不可能       | 関係式の計算を実行する過程で、計算を進められない状況。 |
| OTHER ERROR    | そのほかのエラー | 上記のどれにも該当しないエラー。 |



## 報告内容

処理が中断した理由を説明するために、つぎの内容が報告されます。

| 属性    | 日本語   | 説明 |
|---------|----------|------------------------|
| Symbol  | 記号     | 中断理由をあらわす記号 |
| Class   | 分類     | 中断理由の分類 |
| Reason  | 理由     | 中断理由の説明 |
| Detail  | 詳細     | 中断理由の詳細 |
| Source  | ソース   | 行番号、列番号、資源名、行の内容からなるソース情報 |
| Command | コマンド | コマンドライン |

まず、中断のパターンをあらわす記号 Symbol があります。
たとえば、項目がないための中断は `AANoTerms` という記号であらわされます。
この記号に対して、前節の分類にしたがって、Class が割り当てられ、
その理由を自然言語で説明した Reason が表示されます。
Reason は Symbol に従属するため、個々の事情によらず、同じ文言になります。
個々の事情に依存する内容は Detail で説明されます。
エラーが発生した場所を特定するために Source が割り当てられます。
中断理由を分析するときに、起動コマンドをかんたんに特定できるように、
Command も表示されます。



## 報告例

[GNU Coding Standards]: http://www.gnu.org/prep/standards/html_node/Errors.html

たとえば、コードを解析した結果、関係写像 `pick /x /y` への入力関係に
項目 `/y` がないことがわかったら、つぎのようなエラーが報告され、
ステータス 2 で甲州計算機が終了します。
なお、この報告形式は、[GNU Coding Standards] で説明されている
`resource` `:` `line` `:` `column` `message`
という形式とは、かなり、異なります。

    **
    **  ABORTED     [AANoTerms]
    **  ----------- -----------------------------------
    **  Class       ANALYSIS ERROR
    **  Reason      Input relation does not have terms
    **  Detail      /y
    **  Source      8 4 foo.k
    **              > pick /x /y
    **              10 0 foo.k
    **              > |== B : a | c
    **  Command     koshu
    **              foo.k
    **
    **  Exit with status 2
    **

この内容は、判断としても表現できます。
自動化されたバッチ処理のときは、
このようなエラー報告が独立したファイルに 1 行だけ書き出される方が便利です。

    |-- ERROR
        /symbol 'AANoTerms
        /class "ANALISYS ERROR"
        /reason "Input relation does not have terms"
        /detail "/y"  /resource "foo.k"  /line 8  /column 4
        /source [ "8 4 foo.k" : "> pick /x /y" : ...]
        /command [ "koshu" : "foo.k" ]

