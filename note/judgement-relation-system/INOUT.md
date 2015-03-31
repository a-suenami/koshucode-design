# I/O List

- [SENTENCE.k](#sentencek)
- koshu SENTENCE.k [count.k](#countk)
- koshu SENTENCE.k [structure.k](#structurek)
- koshu SENTENCE.k [summary.k](#summaryk)



## [SENTENCE.k](SENTENCE.k)

```
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
|-- SECTION-PARAGRAPH  /sect 2  /par-set { 2 : 3 : 4 : 5 }
|-- SECTION-PARAGRAPH  /sect 3  /par-set { 6 : 7 : 8 }
|-- SECTION-PARAGRAPH  /sect 4  /par-set { 9 : 10 }
```



## [count.k](count.k)

```
** -*- koshu -*-
**
**  COUNT
**    <<< 第 2 段落は /sent つの文からなる。>>>
**

|== COUNT :
  source SENTENCE-COUNT /par /sent
    | keep /par = 2
    | pick /sent
```

Command `koshu SENTENCE.k count.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    SENTENCE.k
**    count.k
**

|-- COUNT  /sent 5

*** 1 judge 

**
**  SUMMARY
**       1 judge  on COUNT
**       1 judge  in total
**
```



## [structure.k](structure.k)

```
** -*- koshu -*-
**
**  STRUCTURE
**    <<< 第 /sect 節は、/start という語句から始まる
**        第 /par 段落を構成要素にもっている。>>>
**

|== STRUCTURE :
  sect | maybe sect-name
    | nest /par-set -to /par-start
    | for /par-start par
  --table --forward /sect /sect-name

sect      : source SECTION-PARAGRAPH /sect /par-set
sect-name : source SECTION-NAME      /sect /sect-name
par-start : source PARAGRAPH-START   /par /start

par : member /par /par-set
    | meet par-start
    | pick /par /start
```

Command `koshu SENTENCE.k structure.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    SENTENCE.k
**    structure.k
**

|-- STRUCTURE  /sect 1  /par-start {| /par : /start | 1 : "関係モデル (リレーショナル・モデル) は、どのような形式で" |}
|-- STRUCTURE  /sect 2  /sect-name '関係  /par-start {| /par : /start | 2 : "判断 (judgement) は、なにかが正しいか間違っているか" | 3 : "命題と判断の違いに注意しておくと、命題自体は判断ではなく" | 4 : "上の判断の「この段落」を「第 2 段落」と置き換え" | 5 : "これが判断関係系における、一方の構成要素である判断の" |}
|-- STRUCTURE  /sect 3  /sect-name '判断  /par-start {| /par : /start | 6 : "関係 (relation) は、判断集合を計算するための記号と" | 7 : "この例が示唆しているように、関係は、項目の集合としての" | 8 : "上の例のように関係を経由して計算する方法は、一見したところ" |}
|-- STRUCTURE  /sect 4  /sect-name 'まとめ  /par-start {| /par : /start | 9 : "このノートでは、関係モデルにもとづくデータが" | 10 : "判断は The Third Manifesto の用語でいうところの" |}

*** 4 judges

=== note

TABLE : STRUCTURE

  /sect /sect-name /par-start
  ----- ---------- -----------------------------------------------------------------
  1     ()         /par /start
                   ---- --------------------------------------
                   1    "関係モデル (リレーショナル・モデル) は、どのような形式で"
                   
  2     '関係      /par /start
                   ---- --------------------------------------
                   2    "判断 (judgement) は、なにかが正しいか間違っているか"
                   3    "命題と判断の違いに注意しておくと、命題自体は判断ではなく"
                   4    "上の判断の「この段落」を「第 2 段落」と置き換え"
                   5    "これが判断関係系における、一方の構成要素である判断の"
                   
  3     '判断      /par /start
                   ---- --------------------------------------
                   6    "関係 (relation) は、判断集合を計算するための記号と"
                   7    "この例が示唆しているように、関係は、項目の集合としての"
                   8    "上の例のように関係を経由して計算する方法は、一見したところ"
                   
  4     'まとめ    /par /start
                   ---- --------------------------------------
                   9    "このノートでは、関係モデルにもとづくデータが"
                   10   "判断は The Third Manifesto の用語でいうところの"
                   

=== rel

**
**  SUMMARY
**       4 judges on STRUCTURE
**       4 judges in total
**
```



## [summary.k](summary.k)

```
** -*- koshu -*-
**
**  SUMMARY
**    <<< 第 /par 段落は、/sent つの文からなり、
**       /start という語句から始まる。>>>
**

|== SUMMARY : s | meet p  --forward /par /sent /start

s : source SENTENCE-COUNT  /par /sent
p : source PARAGRAPH-START /par /start
```

Command `koshu SENTENCE.k summary.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    SENTENCE.k
**    summary.k
**

|-- SUMMARY  /par 1  /sent 3  /start "関係モデル (リレーショナル・モデル) は、どのような形式で"
|-- SUMMARY  /par 2  /sent 5  /start "判断 (judgement) は、なにかが正しいか間違っているか"
|-- SUMMARY  /par 3  /sent 2  /start "命題と判断の違いに注意しておくと、命題自体は判断ではなく"
|-- SUMMARY  /par 4  /sent 9  /start "上の判断の「この段落」を「第 2 段落」と置き換え"
|-- SUMMARY  /par 5  /sent 3  /start "これが判断関係系における、一方の構成要素である判断の"

|-- SUMMARY  /par 6  /sent 10  /start "関係 (relation) は、判断集合を計算するための記号と"
|-- SUMMARY  /par 7  /sent 5  /start "この例が示唆しているように、関係は、項目の集合としての"
|-- SUMMARY  /par 8  /sent 5  /start "上の例のように関係を経由して計算する方法は、一見したところ"
|-- SUMMARY  /par 9  /sent 2  /start "このノートでは、関係モデルにもとづくデータが"
|-- SUMMARY  /par 10  /sent 3  /start "判断は The Third Manifesto の用語でいうところの"

*** 10 judges

**
**  SUMMARY
**      10 judges on SUMMARY
**      10 judges in total
**
```



## command

This document is produced by the command:

```
koshu-inout.sh -s -g koshu SENTENCE.k
```
