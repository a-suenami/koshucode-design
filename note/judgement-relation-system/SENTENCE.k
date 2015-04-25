** -*- koshu -*-
**
**  概要
**    判断関係系の例として、段落の文の数 SENTENCE-COUNT などの
**    データを記述します。同じディレクトリの README.md で説明されている
**    COUNT (第 2 段落の文数) の計算は、count.k を参照してください。
**    
**  使用例
**    koshu SENTENCE.k count.k
**

**  SENTENCE-COUNT
**    <<< 第 /par 段落は /sent つの文からなる。>>>
**
**    コード・ブロックが文のなかに含まれるときは、
**    コードも含めて、ひとつの文とします。
**    コード・ブロックが文のなかに含まれないときは、
**    コード・ブロック自体をひとつの文と数えます。

|-- SENTENCE-COUNT  /par 1   /sent 3    ** 関係モデル
|-- SENTENCE-COUNT  /par 2   /sent 5    ** 判断 (judgement) は
|-- SENTENCE-COUNT  /par 3   /sent 2    ** 命題と判断の
|-- SENTENCE-COUNT  /par 4   /sent 9    ** 上の判断の
|-- SENTENCE-COUNT  /par 5   /sent 3    ** これが判断関係系
|-- SENTENCE-COUNT  /par 6   /sent 10   ** 関係 (relation) は
|-- SENTENCE-COUNT  /par 7   /sent 5    ** この例が示唆
|-- SENTENCE-COUNT  /par 8   /sent 5    ** 上の例のように
|-- SENTENCE-COUNT  /par 9   /sent 2    ** このノートでは
|-- SENTENCE-COUNT  /par 10  /sent 3    ** 判断は The

**  PARAGRAPH-START
**    <<< 第 /par 段落は、/start という語句から始まる。>>>

|-- PARAGRAPH-START  /par 1   /start "関係モデル (リレーショナル・モデル) は、どのような形式で"
|-- PARAGRAPH-START  /par 2   /start "判断 (judgement) は、なにかが正しいか間違っているか"
|-- PARAGRAPH-START  /par 3   /start "命題と判断の違いに注意しておくと、命題自体は判断ではなく"
|-- PARAGRAPH-START  /par 4   /start "上の判断の「この段落」を「第 2 段落」と置き換え"
|-- PARAGRAPH-START  /par 5   /start "これが判断関係系における、一方の構成要素である判断の"
|-- PARAGRAPH-START  /par 6   /start "関係 (relation) は、判断集合を計算するための記号と"
|-- PARAGRAPH-START  /par 7   /start "この例が示唆しているように、関係は、項目の集合としての"
|-- PARAGRAPH-START  /par 8   /start "上の例のように関係を経由して計算する方法は、一見したところ"
|-- PARAGRAPH-START  /par 9   /start "このノートでは、関係モデルにもとづくデータが"
|-- PARAGRAPH-START  /par 10  /start "判断は The Third Manifesto の用語でいうところの"

**  SECTION-NAME
**    <<< 第 /sect 節には /sect-name という題名が与えられている。>>>
**
**    /sect 1 のような題名が与えられていない節では、
**    どのような題名をとっても偽になるため、判断として記述しません。

|-- SECTION-NAME  /sect 2  /sect-name "関係"
|-- SECTION-NAME  /sect 3  /sect-name "判断"
|-- SECTION-NAME  /sect 4  /sect-name "まとめ"

**  SECTION-PARAGRAPH
**    <<< 第 /sect 節は段落集合 /par-set に属す番号の段落から構成される。>>>

|-- SECTION-PARAGRAPH  /sect 1  /par-set { 1 }
|-- SECTION-PARAGRAPH  /sect 2  /par-set { 2 | 3 | 4 | 5 }
|-- SECTION-PARAGRAPH  /sect 3  /par-set { 6 | 7 | 8 }
|-- SECTION-PARAGRAPH  /sect 4  /par-set { 9 | 10 }
