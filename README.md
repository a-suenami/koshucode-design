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



## もくじ

[近くのお店][boyce-codd-normal-form] (ボイス・コッド正規形) — ver 0.40

[関係写像の構成][construct-relmap] — ver 0.39

[連想リストへの分割][divide-into-assoc] — ver 0.38

[キー項目の重複][duplicate-keys] — ver 0.38

[終了ステータス][exit-status] — ver 0.39

[外部キー][foreign-key] — ver 0.40

[無項関係との結び][join-with-reldum] — ver 0.38

[関係化写像の種類][kind-of-relfiers] — ver 0.38

[判断リテラルの読み込み方][read-judge-literals] — ver 0.37

[関係写像の外部参照][relmap-in-outer-section] — ver 0.38

[エラーの報告][report-error] — ver 0.40

[関係写像の実行][run-relmap-using-relation-directly] — ver 0.37

[甲州計算機の処理の流れ][section-level-process] — ver 0.40

[略号][short-signs] — ver 0.38

[関係写像による関係の制限][some-and-none] — ver 0.37

[部分関係][subrelation] — ver 0.40

[テキストを使った表の描画][text-table] — ver 0.40

[関係を使ったデータの検証][validation-using-relation] — ver 0.37


[関係モデル -- 判断することの計算体系][prezi-relational-model]

[実行計画のためのコスト計算式][rdbms-cost-formula]


[boyce-codd-normal-form]: note/boyce-codd-normal-form
[construct-relmap]: note/construct-relmap
[divide-into-assoc]: note/divide-into-assoc
[duplicate-keys]: note/duplicate-keys
[exit-status]: note/exit-status
[foreign-key]: note/foreign-key
[join-with-reldum]: note/join-with-reldum
[kind-of-relfiers]: note/kind-of-relfiers
[read-judge-literals]: note/read-judge-literals
[relmap-in-outer-section]: note/relmap-in-outer-section
[report-error]: note/report-error
[run-relmap-using-relation-directly]: note/run-relmap-using-relation-directly
[section-level-process]: note/section-level-process
[short-signs]: note/short-signs
[some-and-none]: note/some-and-none
[subrelation]: note/subrelation
[text-table]: note/text-table
[validation-using-relation]: note/validation-using-relation

[prezi-relational-model]: note/prezi-relational-model
[rdbms-cost-formula]: note/rdbms-cost-formula

