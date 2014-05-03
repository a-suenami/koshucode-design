# 入出力リスト



koshu-inout
------------------------------------------------------------------

入出力リストは、あるプログラムへの入力データと出力データを
対にして掲載した文書です。
たとえば、8 進ダンプ (octal dump) を行う
`od alphabet.txt` というコマンドの入出力リストをつくるには、
このコマンドを `koshu-inout.sh` の引数に与えます。

```sh
$ koshu-inout.sh od alphabet.txt
```

`koshu-inout.sh` は、つぎのような入力ファイルの内容と、
コマンドの出力結果を出力します。
実際の出力は [`OD.md`][OD.md] をみてください。

```
abcdefg hijklmn opqrstu vwxyz
```

Command `od alphabet.txt` produces:

```
0000000    061141  062143  063145  020147  064550  065552  066554  020156
0000020    070157  071161  072163  020165  073566  074570  005172
0000036
```


koshu-inout-summary
------------------------------------------------------------------

`koshu-inout.sh` がコマンドの入出力を文書化するのに対して、
`koshu-inout-summary.sh` は、`koshu-inout.sh` の実行結果の一覧を
[`INOUT-SUMMARY.md`][INOUT-SUMMARY.md] のように文書化します。
このコマンドは、まず、`koshu-inout.sh` が `INOUT.sh`
というスクリプトから実行されると仮定し、
現在のディレクトリの下にあるすべての `INOUT.sh` 見つけ出します。
つぎに、それらの `INOUT.sh` に `-d` オプションをつけて再実行することで、
保存ずみの入出力リストと差異があるかを調べる退行テストを実施しながら、
一覧を作成します。

`koshu-inout.sh` と `koshu-inout-summary.sh` に関係する
ファイルは 4 種類あります。

* `INOUT.sh` は、`koshu-inout.sh` の実行を含み、
  それを実行することで、`INOUT.md` などの入出力リストを作成します。
  実際には、入出力リストのファイル名はほかの名前かもしれません。
  `koshu-inout-summary.sh` を正しく動作させるためには、
  `INOUT.sh` に `-d` オプションを与えると、`koshu-inout.sh` にも
  `-d` オプションが与えられるようになっている必要があります。

* `INOUT.md` は、入出力リストの既定のファイル名です。
  `koshu-inout.sh -s` として実行すると `INOUT.md` に保存します。
  `koshu-inout.sh -o README.md` などは `README.md` に保存します。

* `INOUT-SUMMARY.md` は、`koshu-inout-summary.sh` が出力する
  既定の要約ファイルの名前です。このファイルの内容は、
  各サブディレクトリにある入出力リストの一覧です。

* `INOUT-GRAND-SUMMARY.md` は、
  `koshu-inout-summary.sh -g` が出力する既定の要約ファイルの名前です。
  このファイルの内容は、`INOUT-SUMMARY.md` を一覧した要約の要約です。



[OD.md]: glob/OD.md
[INOUT-SUMMARY.md]: INOUT-SUMMARY.md

