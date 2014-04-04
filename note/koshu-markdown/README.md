# 入出力リスト


甲州計算機に付属するコマンド [`koshu-markdown.sh`][koshu-markdown.sh] は、
甲州記法で書かれたスクリプトを実行した結果をマークダウン文書にまとめます。
その文書は、`koshu` コマンド (甲州計算機) の入力となるスクリプトの内容と、
出力結果の対を含んでいるので、入出力リストとよばれます。



実行方式
------------------------------------------------------------------

`koshu-markdown.sh` には，3 つの実行方式があります。
(1) 甲州スクリプトを引数に与える方法，
(2) `*.k` に対して入出力を一覧する方法，
(3) 甲州スクリプトの一覧をファイルで提供する方法です。

つぎのコマンドは、ファイル [`calc.k`][calc.k] と
[`A.k`][A.k] を甲州計算機で実行し、
ファイルの内容とその出力を [`A.md`][A.md] に保存します。

```sh
koshu-markdown.sh calc.k A.k > A.md
```

 - このコマンドは 3 つの節 `calc.k` `A.k` `output` を作成します。

ひとつのディレクトリに `A.k` `B.k` `C.k` のように、
複数のデータ・ファイルがある場合は、
`-g` (glob) オプションを与えて `*.k` を一覧した文書をつくれます。
その結果を [`README.md`][README.md] に保存します。

```sh
koshu-markdown.sh -g calc.k > README.md
```
 - このコマンドは 4 つの節 `calc.k` `A.k` `B.k` `C.k` を作成します。
   `A.k` `B.k` `C.k` は、それぞれの出力結果も含みます。

計算式を含むスクリプト `calc.k` へ与えるデータが、
`*.k` という単純なパターンで表現できないときは、
そのデータ・ファイルを一覧したファイル [`ARGS`][ARGS] を用意し、
`-f` オプションへ与えます。
その結果を [`ARGS.md`][ARGS.md] に保存します。

```sh
koshu-markdown.sh -f ARGS calc.k > ARGS.md
```
 - `ARGS` が `A.k` と `B.k C.k` という 2 行からなるとき、
   このコマンドは 3 つの節 `calc.k` `A.k` `B.k C.k` を作成します。
   `A.k` `B.k C.k` は、それぞれの出力結果も含みます。



パラメータの変更
------------------------------------------------------------------

甲州記法のスクリプトは、通常、拡張子 `.k` がついていますが、
もし、異なる拡張子のときは `-x` (extension) オプションを使って指定します。

```sh
koshu-markdown.sh -x ksh -g calc.k
```

甲州計算機 `koshu` の代わりに、`-p` (program)
オプションを使うことで、ほかのプログラムを与えられます。
たとえば、`wc` であれば、出力結果は、行数、単語数、バイト数になります。

```sh
koshu-markdown.sh -p wc -g
```



[koshu-markdown.sh]: https://github.com/seinokatsuhiro/koshucode/blob/master/baala/koshu-markdown.sh
[README.md]: script/README.md
[A.md]:      script/A.md
[ARGS]:      script/ARGS
[ARGS.md]:   script/ARGS.md
[calc.k]:    script/calc.k
[A.k]:       script/A.k

