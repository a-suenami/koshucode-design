# 甲州記法の設計ノート



このリポジトリは、甲州記法の設計の背景、
アイデア、試験的な実装などを記録したノートを集めたものです。
メモとしての性格が強いため、大部分は雑な記述になっています。

 * 甲州記法の使用例は [入出力リストの総要約][grand-summary] からたどれます。
   甲州記法を初めて学ぶ方は、[甲州記法の ABC][abc] をご覧ください。

 * ひとつのノートは、ひとつのディレクトリを単位とし、
   `README.md` と関連するソース・ファイルなどから構成されます。

 * ディレクトリの名前は、原則として、小文字の英単語を
   ハイフンでつなぎ、やや、説明的な名前をつけます。

 * `README.md` の文字コードは UTF-8 で、
   改行コードは CRLF です。



バージョンに依存しないノート
------------------------------------------------------------------

[変更判断][alterative-judgement] と
[制約外判断][violating-judgement]

[データ解釈の書き方][data-interpretation]

[データモデルの解釈構造比][i-s-ratio]

[Wikipedia Infobox][infobox]

[関係モデルはどのような種類の理論か][kind-of-theory]

[入出力リスト][koshu-markdown]

[LMCP 方式][lmcp-method]

[関係モデルの理解をゆがめる 2 大要因][misunderstanding]

[関係モデル -- 判断することの計算体系][prezi-relational-model]

[命題関数とはなにか][propositional-function]

[実行計画のためのコスト計算式][rdbms-cost-formula]

[関係型データ交換][rdi]

[記号空間の範囲][signscope]

[表形式による判断集合の表示][tabular-form]

[全称矛盾命題][universal-contradiction]



バージョンに依存するノート
------------------------------------------------------------------

ノートが甲州記法の使用例を含んでいるとき、その入出力結果へのリンクが
[入出力リストの要約][summary-of-notes] に一覧されています。
この要約は、入出力の使用例を分かりやすく提示すると同時に、
退行テストの内容とすることを兼ねています。

### 例題

[甲州計算機の版数][VERSION]

[ASCII コード][ascii-table] — ver 0.60

[近くのお店][boyce-codd-normal-form] (ボイス・コッド正規形) — ver 0.40

[デッドロックの検出][deadlock-detection] — ver 0.49

[判断集合の差分][koshu-change] — ver 0.62

[入出力リスト][koshu-inout]

[N-Triples と Turtle に似た出力形式][serialize-rdf] — ver 0.59

[Turtle][turtle]

[トークン列の出力][koshu-syntax] — ver 0.62

[メタデータつき CSV][koshu-xsv] — ver 0.43

### 計算方式

[計算の中断を補足する場所][abortable-points] — ver 0.43

[空番][empty-filler] — ver 0.65

[終了ステータス][exit-status] — ver 0.39

[中置記法から前置記法への変換][infix-notation] — ver 0.41

[甲州記法のためのラムダ算法][lambda-calculus] — ver 0.45

[甲州計算機の処理の流れ][section-level-process] — ver 0.40

### 表示方法

[判断の件数][count-judgements] — ver 0.54

[見出しの平面表示][explain-heading] — ver 0.50

[エラーの報告][report-error] — ver 0.40

[テキストを使った表の描画][text-table] — ver 0.40

[表形式での関係の表示][text-table-for-relation] — ver 0.51

### そのほか

[データ構成行列][data-component-matrix] — ver 0.42

[連想リストへの分割][divide-into-assoc] — ver 0.38

[判断リテラルの読み込み方][read-judge-literals] — ver 0.37

[短縮記号][short-signs] — ver 0.44

[Snip][snip] — ver 0.49



関係に関するノート
------------------------------------------------------------------

[演算属性の編集][attribute-editor] — ver 0.57

[関係写像の構成][construct-relmap] — ver 0.39

[導出関係写像][derived-relmap] — ver 0.53

[関係写像による計算の図解][diagram-of-relmap-calculation] — ver 0.50

[外部キー][foreign-key] — ver 0.40

[無項関係との結び][join-with-reldum] — ver 0.38

[関係化写像の種類][kind-of-relfiers] — ver 0.38

[複数の関係を出力する演算子][multiple-output] — ver 0.43

[関係系としての重関係][nested-relations-as-relational-system] — ver 0.50

[関係写像の外部参照][relmap-in-outer-section] — ver 0.38

[関係写像演算子の引数][relmap-operand] — ver 0.42

[関係写像の実行][run-relmap-using-relation-directly] — ver 0.37

[関係を使ったデータの検証][validation-using-relation] — ver 0.37



演算子の説明
------------------------------------------------------------------

特定の関係写像演算子を題材にしたノートです。
関係写像演算子は、関係を関係に変換する演算子です。
これらのノートは、演算子のひとつの側面に注目して説明したり、
演算子の案を説明しているもので、
より体系的な説明は [関係写像演算子の説明書][rop] にあります。

### 関係写像演算子

both — [両結びの等価定義][equivalent-for-both]

down — [包括演算子の等価定義][equivalent-for-down]

duplicate — [キー項目の重複][duplicate-keys]

slice up nest unnest — [重関係の基礎演算子][slices-up]

slice — [関係のうす切り][slices-of-relation]

some none — [関係写像による関係の制限][some-and-none]

sub — [部分関係][subrelation]

### 項目演算子

if — [条件分岐][cop-if]

range — [範囲判定][cop-range]


[abc]:                                     https://github.com/seinokatsuhiro/abc-of-koshucode/blob/master/draft/japanese/README.md

[VERSION]:                                VERSION.k
[grand-summary]:                          INOUT-GRAND-SUMMARY.md
[summary-of-notes]:                       note/INOUT-SUMMARY.md
[rop]:                                    rop/README.md

[alterative-judgement]:                   note/alterative-judgement
[abortable-points]:                       note/abortable-points
[ascii-table]:                            note/ascii-table
[attribute-editor]:                       note/attribute-editor
[boyce-codd-normal-form]:                 note/boyce-codd-normal-form
[construct-relmap]:                       note/construct-relmap
[cop-if]:                                 note/cop-if
[cop-range]:                              note/cop-range
[count-judgements]:                       note/count-judgements
[data-component-matrix]:                  note/data-component-matrix
[data-interpretation]:                    note/data-interpretation
[deadlock-detection]:                     note/deadlock-detection
[derived-relmap]:                         note/derived-relmap
[diagram-of-relmap-calculation]:          note/diagram-of-relmap-calculation
[divide-into-assoc]:                      note/divide-into-assoc
[duplicate-keys]:                         note/duplicate-keys
[empty-filler]:                           note/empty-filler
[equivalent-for-down]:                    note/equivalent-for-down
[equivalent-for-both]:                    note/equivalent-for-both
[exit-status]:                            note/exit-status
[explain-heading]:                        note/explain-heading
[foreign-key]:                            note/foreign-key
[infix-notation]:                         note/infix-notation
[infobox]:                                note/infobox
[i-s-ratio]:                              note/i-s-ratio
[join-with-reldum]:                       note/join-with-reldum
[kind-of-theory]:                         note/kind-of-theory
[kind-of-relfiers]:                       note/kind-of-relfiers
[koshu-markdown]:                         note/koshu-markdown
[koshu-xsv]:                              note/koshu-xsv
[lambda-calculus]:                        note/lambda-calculus
[lmcp-method]:                            note/lmcp-method
[misunderstanding]:                       note/misunderstanding
[multiple-output]:                        note/multiple-output
[nested-relations-as-relational-system]:  note/nested-relations-as-relational-system
[prezi-relational-model]:                 note/prezi-relational-model
[propositional-function]:                 note/propositional-function
[rdbms-cost-formula]:                     note/rdbms-cost-formula
[rdi]:                                    note/rdi
[read-judge-literals]:                    note/read-judge-literals
[relmap-in-outer-section]:                note/relmap-in-outer-section
[relmap-operand]:                         note/relmap-operand
[report-error]:                           note/report-error
[run-relmap-using-relation-directly]:     note/run-relmap-using-relation-directly
[section-level-process]:                  note/section-level-process
[short-signs]:                            note/short-signs
[signscope]:                              note/signscope
[slices-of-relation]:                     note/slices-of-relation
[slices-up]:                              note/slice-up
[snip]:                                   note/snip
[some-and-none]:                          note/some-and-none
[subrelation]:                            note/subrelation
[tabular-form]:                           note/tabular-form
[text-table]:                             note/text-table
[text-table-for-relation]:                note/text-table-for-relation
[universal-contradiction]:                note/universal-contradiction
[validation-using-relation]:              note/validation-using-relation
[violating-judgement]:                    note/violating-judgement

[koshu-change]:                           toolkit/koshu-change
[koshu-inout]:                            toolkit/koshu-inout
[serialize-rdf]:                          toolkit/koshu-rdf/serialize-rdf
[turtle]:                                 toolkit/koshu-rdf/turtle
[koshu-syntax]:                           toolkit/koshu-syntax
