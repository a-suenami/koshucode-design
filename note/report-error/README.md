# エラーの報告

このノートでは、甲州計算機がエラーを報告する方法を考えます。
甲州計算機のバージョン 0.40 では、まだ、組織的なエラー報告が
できるようになっていません。



## 分類

甲州計算機のエラーは、大きく、つぎの 5 種類に分けられるでしょう。

 * **入出力不可能** (I/O ERROR) --
   ファイルなどの資源がみつからない、
   文字 (バイト) を読み書きできないなどの状況。

 * **文法間違い** (SYNTAX ERROR) --
   判断の読み込み、計算式の読み込みでの文法間違いなど。

 * **解析エラー** (ANALISYS ERROR) --
   関係式を解析した結果、計算不可能な状況が分かったとき。

 * **計算不可能** (CALC ERROR) --
   関係式の計算を実行する過程で、計算を進められない状況。

 * **そのほかのエラー** (OTHER ERROR) --
   上記のどれにも該当しないエラー。

この 5 種類のエラーをあらす記号 `/class` とその説明 `/class-desc` は、
日本語の場合、つぎのようになります。

    |-- ERROR-CLASS  /class 'IO-ERROR        /lang 'ja  /class-desc '入出力エラー
    |-- ERROR-CLASS  /class 'SYNTAX-ERROR    /lang 'ja  /class-desc '文法エラー
    |-- ERROR-CLASS  /class 'ANALISYS-ERROR  /lang 'ja  /class-desc '解析エラー
    |-- ERROR-CLASS  /class 'CALC-ERROR      /lang 'ja  /class-desc '計算不可能
    |-- ERROR-CLASS  /class 'OTHER-ERROR     /lang 'ja  /class-desc 'そのほかのエラー



## エラー種

エラー型のコンストラクタの名前を、
エラーの種類をあらわす記号として使います。
項目 `/type` の内容に、その記号が入るとすると、
自然言語の説明 `/desc` が対応します。

 * `/type` のエラーは言語 `/lang` では `/type-desc` という説明に対応する。

ファイルなどの資源 `/resource` は節 `/clause` に分割されます。
節の実体は行の並びです。エラーが生じたとき、
どの節を処理中であったかに興味があるため、
つぎの意味の情報が出力されます。

 * `/resource` のなかの節 `/clause` を処理する過程で
   `/type` のエラーが発生した。

節が特定できないときは、つぎのパターンになります。
たとえば、ファイルが見つからないなど

 * `/resource` を処理する過程で `/type` のエラーが発生した。



## 関係写像のエラー

関係写像の計算でエラーが生じたときは、
関係写像の位置 `/resource` `/line-number` `/relmap` と
詳細情報 `/reason` が報告されます。

 * 資源 `/resource` の行番号 `/line-number` にある
   関係写像 `/relmap` で `/reason` という原因による
   `/type` のエラーが発生した。

項目計算式を含む関係写像の場合は、
エラーに関係する部分式 `/term-expr` も報告されます。

 * 資源 `/resource` の行番号 `/line-number` にある
   関係写像 `/relmap` のなかの項目計算式 `/term-expr` で
   `/reason` という原因による `/type` のエラーが発生した。



## 報告例

たとえば、コードを解析した結果、関係写像 `pick /x /y` への入力関係に
項目 `/y` がないことがわかったら、つぎのようなエラーが報告され、
ステータス 2 で甲州計算機が終了します。

    **
    **  処理を中断しました
    **
    **  分類        ANALISYS-ERROR / 解析エラー
    **  種類        TermNotExist / 項目が存在しない
    **  理由        項目 /y が存在しない
    **  関係写像     pick /x /y
    **  その位置     8 / foo.k
    **  節          |== B : a2
    **  その位置     14 / foo.k
    **

この内容は、判断としても表現できます。
自動化されたバッチ処理のときは、
このようなエラー報告が独立したファイルに 1 行だけ書き出される方が便利です。

    |-- ERROR  /class 'ANALISYS-ERROR
        /type 'TermNotExist  /reason "項目 /y が存在しない"
        /relmap "pick /x /y"  /relmap-line 8  /relmap-resource 'foo.k
        /clause "|== B : a2"  /clause-line 14  /clause-resource 'foo.k
               
