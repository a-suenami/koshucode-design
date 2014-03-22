# Snip


甲州計算機の `base` パッケージの [`Snip`][Snip] モジュールは、
リストの一部の要素を切り取る機能を提供します。
たとえば、リストの 1 番目と 3 番目の要素を切り取るとします。

```haskell
"abcdefg"
 -1-3---
```

そのためには、索引のリスト `[1,3]` とともに
関数 `snipFrom` と `snipOff` を使います。
`snipFrom` は甲州記法の `pick` と似ており、要素を選び出すのに対して、
`snipOff` は `cut` と似ており、要素を切り捨てます。
`>>>` は Haskell の対話系のプロンプトです。

```haskell
>>> snipFrom [1,3] "abcdefg"
"bd"
```

```haskell
>>> snipOff [1,3] "abcdefg"
"acefg"
```

`snipFrom` と `snipOff` で使う索引リストは、
`"abcdefg"` のなかの `"bd"` の位置として、
`snipIndex` で計算できます。

```haskell
>>> snipIndex "bd" "abcdefg"
[1,3]
```

関係写像 `pick /a /b` は、入力関係の項目に対して、
`/a` `/b` の位置を `snipIndex` で計算し、
見出しと本体の各組に対して、`snipFrom` を適用することで計算されます。
また、`snipIndex` の結果と引数の項目 `/a` `/b` の数 (いまの場合は 2)
が一致するかどうかを確認し、一致しなければ、
指定された項目に間違いがあるとみなして、処理を中断します。


[Snip]: https://github.com/seinokatsuhiro/koshucode/blob/master/baala/base/Koshucode/Baala/Base/Prelude/Snip.hs

