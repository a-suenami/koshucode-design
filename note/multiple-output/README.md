# 複数の関係を出力する演算子


典型的な関係写像は、ひとつの入力関係をとり、
ひとつの出力関係を計算します。
たとえば、`pick /x /y` は、
入力関係から項目 `/x` `/y`
だけを残した出力関係を計算します。
関係の交わりを計算する `a | meet b` は、
主入力関係が `a` で副入力関係が `b` とみなせるので、
入力関係はふたつあり、出力関係はひとつです。
それでは、出力関係をふたつにすることはできるでしょうか。
このノートは、複数の出力関係を扱う方法を説明します。
(甲州計算機のバージョン 0.43 の段階では実装されていません)

具体的な関係写像演算子として、ひとつの関係を、
与えらた基準にもとづいて複数の関係に分割する `split` を考えます。
つぎの使用例は、`a` から出力された関係を、
`/x = 0` をみたす関係、`/x = 1` をみたす関係、
いずれもみたさない関係の 3 つに分割するとします。

    b : a | split /x = 0 : /x = 1

この 3 つの個々の関係は、つぎのようにして取得できます。

    c : b | select 0
    d : b | select 1
    e : b | select 2

いわば、通常の出力関係は 0 番目にあるとみなし、
複数の関係が出力されるときは、1 番目以降に置かれます。

`b | pick /x /y` のような演算は関係の個数が異なるため、実行できません。
`b | select 0 | pick /x /y` のように書けば可能です。
`|==` で判断集合を出力するときも、
複数の関係のままでは実行できません。
