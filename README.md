# 甲州記法の設計ノート



このリポジトリは、甲州記法の設計の背景、
アイデア、試験的な実装などを記録したノートを集めたものです。
メモとしての性格が強いため、大部分は雑な記述になっています。

 - ひとつのノートは、ひとつのディレクトリを単位とし、
   `README.md` と関連するソース・ファイルなどから構成されます。

 - ディレクトリの名前は、原則として、小文字の英単語を
   ハイフンでつなぎ、やや、説明的な名前をつけます。

 - `README.md` の文字コードは UTF-8 で、
   改行コードは CRLF です。



バージョンに依存しないノート
------------------------------------------------------------------

[Wikipedia Infobox][infobox]

[LMCP 方式][lmcp-method]

[入出力リスト][koshu-markdown]

[関係モデル -- 判断することの計算体系][prezi-relational-model]

[実行計画のためのコスト計算式][rdbms-cost-formula]

[関係型データ交換][rdi]

[全称矛盾命題][universal-contradiction]

[入出力リスト][koshu-inout]


バージョンに依存するノート
------------------------------------------------------------------

ノートが甲州記法の使用例を含んでいるとき、その入出力結果へのリンクが
[入出力リストの要約][INOUT-SUMMARY.md] に一覧されています。
この要約は、入出力の使用例を分かりやすく提示すると同時に、
退行テストの内容とすることを兼ねています。

[計算の中断を補足する場所][abortable-points] — ver 0.43

[近くのお店][boyce-codd-normal-form] (ボイス・コッド正規形) — ver 0.40

[項目演算子 if][cop-if] — ver 0.44

[項目演算子 range][cop-range] — ver 0.44

[判断の件数][count-judgements] — ver 0.54

[データ構成行列][data-component-matrix] — ver 0.42

[デッドロックの検出][deadlock-detection] — ver 0.49

[連想リストへの分割][divide-into-assoc] — ver 0.38

[終了ステータス][exit-status] — ver 0.39

[見出しの平面表示][explain-heading] — ver 0.50

[中置記法から前置記法への変換][infix-notation] — ver 0.41

[関係写像演算子の一覧][koshu-rop] — ver 0.52

[メタデータつき CSV][koshu-xsv] — ver 0.43

[甲州記法のためのラムダ算法][lambda-calculus] — ver 0.45

[判断リテラルの読み込み方][read-judge-literals] — ver 0.37

[エラーの報告][report-error] — ver 0.40

[甲州計算機の処理の流れ][section-level-process] — ver 0.40

[短縮記号][short-signs] — ver 0.44

[Snip][snip] — ver 0.49

[テキストを使った表の描画][text-table] — ver 0.40

[表形式での関係の表示][text-table-for-relation] — ver 0.51



関係に関するノート
------------------------------------------------------------------

[関係写像の構成][construct-relmap] — ver 0.39

[導出関係写像][derived-relmap] — ver 0.53

[関係写像による計算の図解][diagram-of-relmap-calculation] — ver 0.50

[キー項目の重複][duplicate-keys] — ver 0.38

[外部キー][foreign-key] — ver 0.40

[包括演算子の等価定義][equivalent-for-down] — ver 0.50

[両結びの等価定義][equivalent-for-both] — ver 0.50

[無項関係との結び][join-with-reldum] — ver 0.38

[関係化写像の種類][kind-of-relfiers] — ver 0.38

[複数の関係を出力する演算子][multiple-output] — ver 0.43

[関係系としての入れ子関係][nested-relations-as-relational-system] — ver 0.50

[関係写像の外部参照][relmap-in-outer-section] — ver 0.38

[関係写像演算子の引数][relmap-operand] — ver 0.42

[関係写像の実行][run-relmap-using-relation-directly] — ver 0.37

[関係のうす切り][slices-of-relation] — ver 0.50

[関係写像による関係の制限][some-and-none] — ver 0.37

[部分関係][subrelation] — ver 0.40

[関係を使ったデータの検証][validation-using-relation] — ver 0.37



[INOUT-SUMMARY.md]:                       INOUT-SUMMARY.md

[abortable-points]:                       note/abortable-points
[boyce-codd-normal-form]:                 note/boyce-codd-normal-form
[construct-relmap]:                       note/construct-relmap
[cop-if]:                                 note/cop-if
[cop-range]:                              note/cop-range
[count-judgements]:                       note/count-judgements
[data-component-matrix]:                  note/data-component-matrix
[deadlock-detection]:                     note/deadlock-detection
[derived-relmap]:                         note/derived-relmap
[diagram-of-relmap-calculation]:          note/diagram-of-relmap-calculation
[divide-into-assoc]:                      note/divide-into-assoc
[duplicate-keys]:                         note/duplicate-keys
[equivalent-for-down]:                    note/equivalent-for-down
[equivalent-for-both]:                    note/equivalent-for-both
[exit-status]:                            note/exit-status
[explain-heading]:                        note/explain-heading
[foreign-key]:                            note/foreign-key
[infix-notation]:                         note/infix-notation
[infobox]:                                note/infobox
[join-with-reldum]:                       note/join-with-reldum
[kind-of-relfiers]:                       note/kind-of-relfiers
[koshu-inout]:                            note/koshu-inout
[koshu-markdown]:                         note/koshu-markdown
[koshu-rop]:                              note/koshu-rop
[koshu-xsv]:                              note/koshu-xsv
[lambda-calculus]:                        note/lambda-calculus
[lmcp-method]:                            note/lmcp-method
[multiple-output]:                        note/multiple-output
[nested-relations-as-relational-system]:  note/nested-relations-as-relational-system
[prezi-relational-model]:                 note/prezi-relational-model
[rdbms-cost-formula]:                     note/rdbms-cost-formula
[rdi]:                                    note/rdi
[read-judge-literals]:                    note/read-judge-literals
[relmap-in-outer-section]:                note/relmap-in-outer-section
[relmap-operand]:                         note/relmap-operand
[report-error]:                           note/report-error
[run-relmap-using-relation-directly]:     note/run-relmap-using-relation-directly
[section-level-process]:                  note/section-level-process
[short-signs]:                            note/short-signs
[slices-of-relation]:                     note/slices-of-relation
[snip]:                                   note/snip
[some-and-none]:                          note/some-and-none
[subrelation]:                            note/subrelation
[text-table]:                             note/text-table
[text-table-for-relation]:                note/text-table-for-relation
[universal-contradiction]:                note/universal-contradiction
[validation-using-relation]:              note/validation-using-relation
