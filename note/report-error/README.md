# エラーの報告

このノートでは、甲州計算機がエラーを報告する方法を考えます。
甲州計算機のバージョン 0.40 では、まだ、組織的なエラー報告が
できるようになっていません。



## 分類

甲州計算機のエラーは、大きく、つぎの 5 種類に分けられるでしょう。


| CLASS          | 分類             | 内容          |
|----------------|------------------|---------------|
| I/O ERROR      | 入出力不可能     | ファイルなどの資源がみつからない、文字 (バイト) を読み書きできないなどの状況。 |
| SYNTAX ERROR   | 文法間違い       | 判断の読み込み、計算式の読み込みでの文法間違いなど。 |
| ANALISYS ERROR | 解析エラー       | 関係式を解析した結果、計算不可能な状況が分かったとき。 |
| CALC ERROR     | 計算不可能       | 関係式の計算を実行する過程で、計算を進められない状況。 |
| OTHER ERROR    | そのほかのエラー | 上記のどれにも該当しないエラー。 |

この 5 種類のエラーをあらす記号 `/class` とその説明 `/class-desc` は、
日本語の場合、つぎのようになります。

    |-- ERROR-CLASS  /class 'IO-ERROR        /lang 'ja  /class-desc '入出力エラー
    |-- ERROR-CLASS  /class 'SYNTAX-ERROR    /lang 'ja  /class-desc '文法エラー
    |-- ERROR-CLASS  /class 'ANALISYS-ERROR  /lang 'ja  /class-desc '解析エラー
    |-- ERROR-CLASS  /class 'CALC-ERROR      /lang 'ja  /class-desc '計算不可能
    |-- ERROR-CLASS  /class 'OTHER-ERROR     /lang 'ja  /class-desc 'そのほかのエラー



## 中断理由

コンストラクタの名前を、中断理由をあらわす記号として使います。
項目 `/reason` の内容に、その記号が入るとすると、
自然言語の説明 `/reason-desc` が対応します。

 * `/reason` のエラーは言語 `/lang` では `/reason-desc` という説明に対応する。

ファイルなどの資源 `/resource` は節 `/clause` に分割されます。
節の実体は行の並びです。エラーが生じたとき、
どの節を処理中であったかに興味があるため、
つぎの意味の情報が出力されます。

 * `/resource` のなかの節 `/clause` を処理する過程で
   `/reason` という理由で処理を中断した。

節が特定できないときは、つぎのパターンになります。
たとえば、ファイルが見つからないなど。

 * `/resource` を処理する過程で `/reason` という理由で処理を中断した。



## 関係写像のエラー

関係写像の計算でエラーが生じたときは、
関係写像の位置 `/resource` `/line-number` `/relmap` と
詳細情報 `/detail` が報告されます。

 * 資源 `/resource` の行番号 `/line-number` にある
   関係写像 `/relmap` で `/detail` という詳細理由による
   `/reason` という理由で処理を中断した。

項目計算式を含む関係写像の場合は、
エラーに関係する部分式 `/term-expr` も報告されます。

 * 資源 `/resource` の行番号 `/line-number` にある
   関係写像 `/relmap` のなかの項目計算式 `/term-expr` で
   `/detail` という詳細理由による
   `/reason` という理由で処理を中断した。



## 報告例

たとえば、コードを解析した結果、関係写像 `pick /x /y` への入力関係に
項目 `/y` がないことがわかったら、つぎのようなエラーが報告され、
ステータス 2 で甲州計算機が終了します。

    **
    **  ABORTED
    **  --------- ----------------------------
    **  Class     ANALISYS-ERROR
    **  Reason    TermNotExist
    **  Detail    Input does not have term /y
    **  Relmap    8 foo.k
    **            pick /x /y
    **  Clause    14 foo.k
    **            |== B : a2
    **
    **  Exit with status 2
    **

この内容は、判断としても表現できます。
自動化されたバッチ処理のときは、
このようなエラー報告が独立したファイルに 1 行だけ書き出される方が便利です。

    |-- ERROR  /class 'ANALISYS-ERROR
        /reason 'TermNotExist  /detail "Input does not have term /y"
        /relmap "pick /x /y"  /relmap-line 8   /relmap-resource "foo.k"
        /clause "|== B : a2"  /clause-line 14  /clause-resource "foo.k"
               
