# 甲州記法によるテンプレート・エンジン


甲州記法のデータ資源を読み込み、それをテキストに変換する
テンプレート・エンジンを考えてみましょう。
基本的な考え方は、関係の各組の各項目を、
対応する項目を含んだテンプレートに差し込むことです。

関係写像の出力項目が `/a` と `/b` をもっているとき、
つぎのテンプレート

    for ( source P /a /b )
      | xxxx xxxxxxxxx xx xxxx
      > xxxx /a xxxxx /b xx
      | xxxx xxxxxx

を実行すると、`source P /a /b` の出力関係の各組に対して、
`/a` と `/b` を置き換え、つぎのようなテキストを出力します。

    xxxx xxxxxxxxx xx xxxx
    xxxx AAAA xxxxx BB xx
    xxxx xxxxxx

この例が示しているように、`>` は項目置換を含み、
`|` は置換を含まない固定のテキストです。

`for` は入れ子に配置でき、内側の `for` は、
入力関係として、外側の組をひとつだけもつスライスを受け取ります。

    for ( source P /a /b )
      | xxxx xxxxxxxxx xx xxxx
      > xxxx /a xxxxx /b xx
      | xxxx xxxxxx
      |
      for ( meet ( source Q /b /c ))
        >  * yyy /c yyyyy
      |

このテンプレートを実行すると、
つぎのようなテキストの繰り返しが得られます。

    xxxx xxxxxxxxx xx xxxx
    xxxx AAAA xxxxx BB xx
    xxxx xxxxxx
    
     * yyy CC yyyyy
     * yyy CC yyyyy
     * yyy CC yyyyy

