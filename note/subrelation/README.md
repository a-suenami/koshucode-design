# 部分関係

`A` が `B` の部分関係であるというのは、
`A` が `B` の一部分となっていることです。
これは、`A` とある関係 `C` の結びが `B` になるような
`C` が存在するということでもあるし、
あるいは、`B` とある関係 `D` の交わりが `A` になるような
`D` が存在するということでもあります。

    A subrel B  iff  exists C : A join C = B
                iff  exists D : B meet D = A

甲州記法の計算式で書くと、
`A | join C` の `join C` が、`A → B` という写像になるし、
`B | meet D` の `meet D` が、`B → A` という写像になるということです。

関係の集合に join / meet による順序を入れて、
最小の関係を左端に、最大の関係を右端に書くと、
関係の集合は、つぎのようにイメージできます。
これは，ちょうど，ハッセ図を横にたおした形になっています．

                          |
                         / \
                        /   \
                       /     \
                      /   X   \
                     /   / \   \
                    /   /   \   \
        meet side  E - Z --- V -- F  join side
                    \   \   /   /
                     \   \ /   /
                      \   Y   /
                       \     /    Z subrel X subrel V
                        \   /     Z subrel Y subrel V
         E = reldau      \ /      Z = X meet Y
         F = reldee       |       V = X join Y

部分要素となる組を通過させる関係写像演算子は、
つぎのように書けるでしょう。

    A | subrel B

逆に、部分要素ではない組を通過させる関係写像演算子も考えられます。

    A | non-subrel B
    A | none (subrel B)

この演算子は、関係 `B` が項目 `/x` のドメインをあらわしているとすると、
関係 `A` の項目 `/x` がそのドメインの要素であるかを検査するときに使えます。

    |=V OUT-OF-B : A | pick /x | non-subrel B


