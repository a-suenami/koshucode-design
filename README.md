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

[連想リストへの分割][divide-into-assoc] — ver 0.38

[キー項目の重複][duplicate-keys] — ver 0.38

[無項関係との結び][join-with-reldum] — ver 0.38

[関係化写像の種類][kind-of-relfiers] — ver 0.38

[判断リテラルの読み込み方][read-judge-literals] — ver 0.37

[関係写像の外部参照][relmap-in-outer-section] — ver 0.38

[関係写像の実行][run-relmap-using-relation-directly] — ver 0.37

[略号][short-signs] — ver 0.38

[関係写像による関係の制限][some-and-none] — ver 0.37

[関係を使ったデータの検証][validation-using-relation] — ver 0.37



[divide-into-assoc]: note/divide-into-assoc
[duplicate-keys]: note/duplicate-keys
[join-with-reldum]: note/join-with-reldum
[kind-of-relfiers]: note/kind-of-relfiers
[read-judge-literals]: note/read-judge-literals
[relmap-in-outer-section]: note/relmap-in-outer-section
[run-relmap-using-relation-directly]: note/run-relmap-using-relation-directly
[short-signs]: note/short-signs
[some-and-none]: note/some-and-none
[validation-using-relation]: note/validation-using-relation

