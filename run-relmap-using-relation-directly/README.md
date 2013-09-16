# 関係写像の実行

このノートでは、関係写像を実行するひとつの方法を記述します。
関係写像が、入力関係をとり、出力関係を返す関数を
もつように定式化されているとします。
これは、バージョン 0.37 まで使われていた方法です。

関係写像を実行する関数は、
関係写像 `Relmap c` を入力関係 `Rel c` に適用して、
出力関係 `Rel c` を計算します。
その計算が失敗する可能性があるので、
つぎのような型をもちます。

``` haskell
Relmap c -> Rel c -> AbortOr (Rel c)
```

さらに、関係写像 `source A /x /y` などで、
データセットから関係を読み出すために、

``` haskell
type RelSelect c = String -> [String] -> Rel c
```

という型の関数も必要です。

これらの型をもつ関係写像を実行する関数全体は、
以下のように実装できます。

``` haskell
runRelmap
    :: C.RelSelect c       -- ^ Relation selector
    -> C.Relmap c          -- ^ Mapping from 'Rel' to 'Rel'
    -> B.Rel c             -- ^ Input relation
    -> B.AbortOr (B.Rel c) -- ^ Output relation
runRelmap sel = (<$>) where
    C.RelmapSource _ p ns <$> _  =  Right $ sel p ns
    C.RelmapConst  _ _ r  <$> _  =  Right r
    C.RelmapAlias  _ m    <$> r  =  m <$> r
    C.RelmapAppend m1 m2  <$> r  =  (m1 <$> r) >>= (m2 <$>)
    C.RelmapName   h op   <$> _  =  left h $ B.AbortUnkRelmap op
    C.RelmapCalc h _ f ms <$> r  =
        do rs' <- (<$> r) `mapM` ms
           case f rs' r of
             Right r' -> Right r'
             Left a   -> left h a

    left h a = Left (a, [], C.halfLines h)
```

- `RelmapSource` は、`sel` を使って、
  データセットから関係を読み出します。

- `RelmapConst` は、`reldee` などの関係定数で使われ、
  内包する関係 `r` を取り出すだけです。

- `RelmapAlias` は、内包する関係写像 `m` を取り出して、
  それを実行します。

- `RelmapAppend` は、`source A /x /y | hold /x = 0` のような、
  ふたつの関係写像を連結をあらわします。
  入力関係 `r` を関係写像 `m1` で変換した結果を
  関係写像 `m2` で変換します。

- `RelmapName` は名前による関係式の参照です。
  これが実行時に残っているとエラーとしています。

- `RelmapCalc` は、関係から関係を計算する関数 `f` を内包する関係写像です。
  多くの関係写像は、ここに該当します。
  この計算内容について、以下で詳しく説明します。

`RelmapCalc` が内包する `f` は、
関係のリスト `[Rel c]` と入力関係 `Rel c`
から出力関係 `Ab (Rel c)` を
計算するという型をもちます。

``` haskell
f :: [Rel c] -> Rel c -> Ab (Rel c)
```

`source A /x /y | meet (source B /y /z)` のような計算式を例にとると、
この `meet (source B /y /z)` が `RelmapCalc ...` に対応し、
`(source B /y /z)` が従関係写像のリスト `ms` の要素になります。
従関係写像という用語は、演算子の内側にある関係写像を指し示します。
主関係写像 `source A /x /y` が出力した関係が主関係 `r` です。

``` haskell
    C.RelmapCalc h _ f ms <$> r  =
        do rs' <- (<$> r) `mapM` ms
           case f rs' r of
             Right r' -> Right r'
             Left a   -> left h a
```

- 従関係写像 `ms` に対して主関係 `r` を与えることで、
  従関係リスト `rs'` に変換します。

- その従関係リスト `rs'` と主関係 `r` を引数として、
  関数 `f` を計算することで、出力関係 `r'` が得られます。

