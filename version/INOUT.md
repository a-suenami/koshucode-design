# I/O List

- [list-version.k](#list-versionk)
- koshu list-version.k [VERSION.k](#versionk)



## [list-version.k](list-version.k)

```
|== VERSION -order :    -*- koshu -*-
    source VERSION /major /minor /date /summary
```



## [VERSION.k](VERSION.k)

```
** -*- koshu -*-
**
**  概要
**    甲州計算機の版数
**  
**  VERSION
**    {| 甲州計算機の /major . /minor の版を /date にリリースした。
**        その版のおもな変更内容は /summary である。 |}
**

about /major 0

|-- VERSION  /minor 0   /date 2013-04-18  /summary "生まれました"
|-- VERSION  /minor 1   /date 2013-05-03  /summary "標準入出力間でデータ編集を行う koshu コマンドをパッケージ化"
|-- VERSION  /minor 2   /date 2013-05-14  /summary "プログラムのなかに甲州記法を埋め込む [koshu| ... |] を実装"
|-- VERSION  /minor 3   /date 2013-05-20  /summary "ライブラリとコマンドを別パッケージに分割"
|-- VERSION  /minor 4   /date 2013-05-22  /summary "RDF を甲州記法に変換するプログラム koshu-rdf を追加"
|-- VERSION  /minor 5   /date 2013-06-03  /summary "関係写像の定義を Minimal モジュールへ分離"
|-- VERSION  /minor 6   /date 2013-06-07  /summary "関係写像のプリティプリンタを追加"
|-- VERSION  /minor 7   /date 2013-06-10  /summary "関係写像を別パッケージに分割"
|-- VERSION  /minor 8   /date 2013-06-12  /summary "koshu-baala パッケージを koshu-baala-base に改名"
|-- VERSION  /minor 9   /date 2013-06-14  /summary "間違いがみつかった箇所のソースコードを表示"
|-- VERSION  /minor 10  /date 2013-06-17  /summary "ソースコードを節単位に分割する処理を整理"
|-- VERSION  /minor 11  /date 2013-06-20  /summary "関係写像の実装に必要な機能を OpKit モジュールに集約"
|-- VERSION  /minor 12  /date 2013-06-21  /summary "節の合併"
|-- VERSION  /minor 13  /date 2013-06-26  /summary "関係写像のオペランドを整理"
|-- VERSION  /minor 14  /date 2013-06-29  /summary "構文ツール koshu-syntax を作成"
|-- VERSION  /minor 15  /date 2013-06-29  /summary "甲州プロセッサを koshu-baala-processor パッケージに分離"
|-- VERSION  /minor 16  /date 2013-07-01  /summary "四重星印 **** による注釈"
|-- VERSION  /minor 17  /date 2013-07-03  /summary "二重線による改行とワンライナー"
|-- VERSION  /minor 18  /date 2013-07-04  /summary "Order.hs などを base から operator パッケージに移動"
|-- VERSION  /minor 19  /date 2013-07-05  /summary "データの差異を計算する koshu-change コマンドを作成"
|-- VERSION  /minor 20  /date 2013-07-06  /summary "トークン番号を数えるように修正"
|-- VERSION  /minor 21  /date 2013-07-07  /summary "リストと組を読み書きする機能を追加"
|-- VERSION  /minor 22  /date 2013-07-09  /summary "引用符など特殊な文字を含んだ文字列を扱う機能を追加"
|-- VERSION  /minor 23  /date 2013-07-11  /summary "計算リストにしたがって計算する機能を実装"
|-- VERSION  /minor 24  /date 2013-07-12  /summary "退行テストを実施する koshu-regress コマンドを追加"
|-- VERSION  /minor 25  /date 2013-07-17  /summary "Content モジュールを追加"
|-- VERSION  /minor 26  /date 2013-07-20  /summary "項目内容を計算する機能を再実装"
|-- VERSION  /minor 27  /date 2013-07-21  /summary "関係写像が失敗できるように型を変更"
|-- VERSION  /minor 28  /date 2013-07-22  /summary "base パッケージの言語機能を core パッケージに分離"
|-- VERSION  /minor 30  /date 2013-07-27  /summary "リテラルを読み書きする機能を整理"
|-- VERSION  /minor 31  /date 2013-07-29  /summary "GHC 7.6.3 でビルドできるように修正"
|-- VERSION  /minor 32  /date 2013-08-02  /summary "関係演算子に関連するコードを整理"
|-- VERSION  /minor 33  /date 2013-08-08  /summary "小数を扱う機能を追加"
|-- VERSION  /minor 34  /date 2013-08-12  /summary "エラーメッセージを改善"
|-- VERSION  /minor 35  /date 2013-08-24  /summary "affirm と deny の構文を変更"
|-- VERSION  /minor 36  /date 2013-09-05  /summary "テキスト・リテラルの構文を変更"
|-- VERSION  /minor 37  /date 2013-09-07  /summary "判断記号として |== を導入"
|-- VERSION  /minor 38  /date 2013-09-19  /summary "関係計算式の実行方法を変更"
|-- VERSION  /minor 39  /date 2013-10-16  /summary "関係写像演算子のオペランドの処理方法を整理"
|-- VERSION  /minor 40  /date 2013-10-27  /summary "データ検証機能を追加"
|-- VERSION  /minor 41  /date 2013-12-31  /summary "エラーを報告する方法を書き直し"
|-- VERSION  /minor 42  /date 2014-01-15  /summary "大域データを扱う機能を追加"
|-- VERSION  /minor 43  /date 2014-02-05  /summary "関係写像の組み立て方法を見直し"
|-- VERSION  /minor 44  /date 2014-02-17  /summary "構文演算子の仕組みを追加"
|-- VERSION  /minor 45  /date 2014-02-21  /summary "短縮記号を読み込む処理を実装"
|-- VERSION  /minor 46  /date 2014-02-28  /summary "ラムダ算法を使用した項目計算の方法を実装"
|-- VERSION  /minor 47  /date 2014-03-11  /summary "再帰関係写像を処理する仕組みを実装"
|-- VERSION  /minor 48  /date 2014-03-15  /summary "関係写像の実装方法を整理"
|-- VERSION  /minor 49  /date 2014-03-19  /summary "エラーを報告する方法を書き直し"
|-- VERSION  /minor 50  /date 2014-03-27  /summary "項目名の扱い方を改善"
|-- VERSION  /minor 51  /date 2014-04-08  /summary "入れ子の関係を計算する方法を実装"
|-- VERSION  /minor 52  /date 2014-04-14  /summary "入れ子の関係を表形式で出力する方法を実装"
|-- VERSION  /minor 53  /date 2014-04-21  /summary "メタ演算子を独立したモジュールに分割"
|-- VERSION  /minor 54  /date 2014-04-27  /summary "スロットつき関係写像を実装"
|-- VERSION  /minor 55  /date 2014-05-02  /summary "大域スロットを実装"
|-- VERSION  /minor 56  /date 2014-05-11  /summary "関係写像のスコープを整理"
|-- VERSION  /minor 57  /date 2014-05-14  /summary "トークン木の組み立て失敗時のエラーを実装"
|-- VERSION  /minor 58  /date 2014-05-17  /summary "演算属性の編集機能を実装"
|-- VERSION  /minor 59  /date 2014-05-23  /summary "短縮語を書き出す機能を実装"
|-- VERSION  /minor 60  /date 2014-05-29  /summary "ハッシュ・キーワードを囲み句に変更"
|-- VERSION  /minor 61  /date 2014-06-03  /summary "項目内容としての組を扱う機能を見直し"
|-- VERSION  /minor 62  /date 2014-06-08  /summary "関係写像のグループを見直し"
|-- VERSION  /minor 63  /date 2014-06-14  /summary "ツールキットを最新化"
|-- VERSION  /minor 64  /date 2014-06-19  /summary "制約外判断を導入"
|-- VERSION  /minor 65  /date 2014-07-07  /summary "関係写像演算子の定義方法を変更"
|-- VERSION  /minor 66  /date 2014-08-03  /summary "空番の処理方法を見直し"
|-- VERSION  /minor 67  /date 2014-08-12  /summary "項目計算式の計算アルゴリズムを見直し"
|-- VERSION  /minor 68  /date 2014-08-15  /summary "項目演算子を別パッケージに分離"
|-- VERSION  /minor 69  /date 2014-08-23  /summary "項目計算式のバグを修正"
|-- VERSION  /minor 70  /date 2014-08-26  /summary "括弧の種類をデータ型として定義"
|-- VERSION  /minor 71  /date 2014-09-05  /summary "リテラル計算式を実装"
|-- VERSION  /minor 72  /date 2014-09-07  /summary "演算子セットをひとつのデータ型でとりまとめ"
|-- VERSION  /minor 73  /date 2014-09-14  /summary "データ解釈リテラルを導入"
|-- VERSION  /minor 74  /date 2014-09-20  /summary "トークン化処理を整理"
|-- VERSION  /minor 75  /date 2014-09-24  /summary "データ解釈による見出し検査を実装"
|-- VERSION  /minor 76  /date 2014-10-04  /summary "型定数を導入"
|-- VERSION  /minor 77  /date 2014-10-12  /summary "型定数を使った見出しに変更"
|-- VERSION  /minor 78  /date 2014-10-22  /summary "作業項目に関する機能を実装"
|-- VERSION  /minor 79  /date 2014-10-28  /summary "日付の基本機能を実装"
|-- VERSION  /minor 80  /date 2014-11-02  /summary "経過時間型を実装"
|-- VERSION  /minor 81  /date 2014-11-12  /summary "秒までの精度をもつ時刻型を実装"
|-- VERSION  /minor 82  /date 2014-11-18  /summary "年週日と年通日の時刻型を実装"
|-- VERSION  /minor 83  /date 2014-11-25  /summary "区の基本機能を実装"
|-- VERSION  /minor 84  /date 2014-12-03  /summary "構文ツール koshu-syntax を修正"
|-- VERSION  /minor 85  /date 2014-12-09  /summary "重関係参照のインタフェースを見直し"
|-- VERSION  /minor 86  /date 2014-12-18  /summary "GHC 7.8.3 向けに更新"
|-- VERSION  /minor 87  /date 2014-12-22  /summary "区番による有効範囲を実装"
|-- VERSION  /minor 88  /date 2014-12-25  /summary "関係写像にフックを追加"
|-- VERSION  /minor 89  /date 2014-12-26  /summary "関係写像のためのモジュールを整理"
|-- VERSION  /minor 90  /date 2015-01-06  /summary "資源に関する関係写像演算子"
|-- VERSION  /minor 91  /date 2015-01-11  /summary "ウェブ・リソースの読み込み機能を実装"
|-- VERSION  /minor 92  /date 2015-01-18  /summary "大域パラメータを状態として使用"
|-- VERSION  /minor 93  /date 2015-01-23  /summary "トークン・パラメータ"
|-- VERSION  /minor 94  /date 2015-02-03  /summary "関係写像演算子の属性を再実装"
|-- VERSION  /minor 95  /date 2015-02-06  /summary "about 節を導入"
|-- VERSION  /minor 96  /date 2015-02-09  /summary "節の構築を失敗可能に変更"
|-- VERSION  /minor 97  /date 2015-02-13  /summary "重関係参照の構文を変更"
|-- VERSION  /minor 98  /date 2015-02-17  /summary "演算子属性を再実装"
|-- VERSION  /minor 99  /date 2015-02-22  /summary "文面上の有効範囲をもつ重関係参照"
|-- VERSION  /minor 100  /date 2015-02-26  /summary "関係写像の構成方法を見直し"
|-- VERSION  /minor 101  /date 2015-03-02  /summary "写像中間体を導入"
|-- VERSION  /minor 102  /date 2015-03-04  /summary "節属性を導入"
|-- VERSION  /minor 103  /date 2015-03-15  /summary "表明属性を二重ハイフンに変更"
|-- VERSION  /minor 104  /date 2015-03-23  /summary "資源全体に対するオプションを導入"
|-- VERSION  /minor 105  /date 2015-04-02  /summary "甲州記法のフィルタ・コマンドを実装"
|-- VERSION  /minor 106  /date 2015-04-08  /summary "output 節を導入"
|-- VERSION  /minor 107  /date 2015-04-23  /summary "交わりや結びの実装を修正"
|-- VERSION  /minor 108  /date 2015-04-28  /summary "項目内容リストの構文を変更"
|-- VERSION  /minor 109  /date 2015-05-24  /summary "甲州計算機に -x オプションを追加"
|-- VERSION  /minor 110  /date 2015-06-18  /summary "メモリの使用量を改善"
|-- VERSION  /minor 111  /date 2015-07-01  /summary "--about オプションつきの入力を実装"
|-- VERSION  /minor 112  /date 2015-07-14  /summary "計算結果をあらわす Result 型を導入"
|-- VERSION  /minor 113  /date 2015-07-24  /summary "版権表示のための区を導入"
|-- VERSION  /minor 114  /date 2015-07-30  /summary "HTML での表形式出力を実装"
|-- VERSION  /minor 115  /date 2015-08-04  /summary "甲州記法以外の出力形式を扱えるように変更"
|-- VERSION  /minor 116  /date 2015-08-29  /summary "JSON 出力を実装"
|-- VERSION  /minor 117  /date 2015-09-04  /summary "出力形式をモジュール化"
|-- VERSION  /minor 118  /date 2015-09-09  /summary "writer パッケージを作成"
|-- VERSION  /minor 119  /date 2015-09-26  /summary "項目計算式を独立したモジュールに変更"
|-- VERSION  /minor 120  /date 2015-09-29  /summary "data パッケージを作成"
|-- VERSION  /minor 121  /date 2015-10-05  /summary "メッセージ・モジュールを整理"
|-- VERSION  /minor 122  /date 2015-10-15  /summary "cop パッケージを作成"
|-- VERSION  /minor 123  /date 2015-10-17  /summary "operator パッケージをふたつに分割"
|-- VERSION  /minor 124  /date 2015-10-22  /summary "演算子モジュールの名前を変更"
|-- VERSION  /minor 125  /date 2015-10-25  /summary "Rop.Flat モジュールを導入"
|-- VERSION  /minor 126  /date 2016-03-02  /summary "小数型の桁数関連の演算子を追加"
|-- VERSION  /minor 127  /date 2016-04-10  /summary "関係型などの表記法を変更"
|-- VERSION  /minor 128  /date 2016-04-15  /summary "肯定項目と否定項目を導入"
|-- VERSION  /minor 129  /date 2016-04-23  /summary "記号型を導入"
|-- VERSION  /minor 130  /date 2016-04-27  /summary "属性モジュールを整理"
|-- VERSION  /minor 131  /date 2016-04-27  /summary "syntax パッケージを作成"
|-- VERSION  /minor 132  /date 2016-04-28  /summary "小数を有理数で再実装"
|-- VERSION  /minor 133  /date 2016-05-02  /summary "有理数の追加の関数"

|-- VERSION  /minor 153  /date 2016-07-03  /summary "エンコード処理を整理"
|-- VERSION  /minor 154  /date 2016-07-04  /summary "トークン化をモジュール分割"
|-- VERSION  /minor 155  /date 2016-07-05  /summary "トークン化をニッパとスキャナに整理"
|-- VERSION  /minor 156  /date 2016-07-09  /summary "項目集合をもつデータの扱い方を改善"
|-- VERSION  /minor 157  /date 2016-09-19  /summary "subtext パッケージを開発"
|-- VERSION  /minor 158  /date 2016-09-21  /summary "関係写像演算子 subtext を実装"
|-- VERSION  /minor 159  /date 2016-09-26  /summary "subtext にテキストを収集する機能を追加"
|-- VERSION  /minor 160  /date 2016-10-08  /summary "subtext のキーワードを追加"
|-- VERSION  /minor 161  /date 2016-10-11  /summary "隣接テキストを連結する処理方法を変更"
|-- VERSION  /minor 162  /date 2016-10-15  /summary "overture パッケージを作成"
|-- VERSION  /minor 163  /date 2016-10-16  /summary "overture パッケージにコードを移動"
|-- VERSION  /minor 164  /date 2016-10-23  /summary "時刻と経過時間の計算モジュールを分離"
|-- VERSION  /minor 165  /date 2016-11-01  /summary "時刻を取得する演算子を追加"
|-- VERSION  /minor 166  /date 2016-11-04  /summary "項目内容と混在テキストをモジュール分割"
|-- VERSION  /minor 167  /date 2016-11-07  /summary "項目選択器を再定式化"
|-- VERSION  /minor 168  /date 2016-11-09  /summary "Unicode 符号位置によるテキストを導入"
|-- VERSION  /minor 169  /date 2016-11-11  /summary "data-plus モジュールを作成"
|-- VERSION  /minor 170  /date 2016-11-13  /summary "項目内容のデコード方法を整理"
|-- VERSION  /minor 171  /date 2016-11-16  /summary "項目内容の具象型を改善"
|-- VERSION  /minor 172  /date 2016-11-19  /summary "項目名のデータ型を導入するための準備"
|-- VERSION  /minor 173  /date 2016-11-20  /summary "項目名のデータ型を導入"
|-- VERSION  /minor 174  /date 2016-11-21  /summary "項目パスの括弧を導入"
|-- VERSION  /minor 175  /date 2016-11-24  /summary "関係写像演算子のエイリアスを導入"
|-- VERSION  /minor 176  /date 2016-11-26  /summary "エラーメッセージの処理を改善"
|-- VERSION  /minor 177  /date 2016-11-27  /summary "構文パターンを整理"
|-- VERSION  /minor 178  /date 2016-12-01  /summary "タブ区切りの判断出力を実装"
|-- VERSION  /minor 179  /date 2016-12-03  /summary "整数索引を導入"
|-- VERSION  /minor 180  /date 2016-12-06  /summary "入出力パスを導入"
|-- VERSION  /minor 181  /date 2016-12-07  /summary "エラーメッセージの出力方法を変更"
|-- VERSION  /minor 182  /date 2016-12-08  /summary "データセットの読み込み機能を実装"
|-- VERSION  /minor 183  /date 2016-12-10  /summary "時刻データを改善"
|-- VERSION  /minor 184  /date 2016-12-13  /summary "トークン化を uncons 方式に変更"
|-- VERSION  /minor 185  /date 2016-12-16  /summary "type パッケージを作成"
|-- VERSION  /minor 186  /date 2016-12-19  /summary "関係写像演算子のパラメータを改善"
|-- VERSION  /minor 187  /date 2016-12-20  /summary "中断理由の報告内容を改善"
|-- VERSION  /minor 188  /date 2016-12-21  /summary "rop パッケージ作成の準備"
|-- VERSION  /minor 189  /date 2016-12-21  /summary "項目の取り出し方法を改善"
|-- VERSION  /minor 190  /date 2016-12-22  /summary "関係写像演算子のエラーを一部改善"
|-- VERSION  /minor 191  /date 2016-12-23  /summary "特定関係写像を組み立てる関数を整備"
|-- VERSION  /minor 192  /date 2016-12-24  /summary "関係写像のパラメータの取得方法を改善"
|-- VERSION  /minor 193  /date 2016-12-26  /summary "項目列を変換する関係写像演算子を実装"
|-- VERSION  /minor 194  /date 2016-12-27  /summary "-where パラメータを -let へ変更"
|-- VERSION  /minor 195  /date 2017-01-02  /summary "部分木を取り出す機能を実装"
|-- VERSION  /minor 196  /date 2017-01-04  /summary "部分木パターンのデコード"
|-- VERSION  /minor 197  /date 2017-01-05  /summary "XML からデータ抽出する機能を実装"
|-- VERSION  /minor 198  /date 2017-01-06  /summary "XML ノードの採番機能を追加"
|-- VERSION  /minor 199  /date 2017-01-08  /summary "制限つき maybe を実装"
|-- VERSION  /minor 200  /date 2017-01-10  /summary "HTTP get を改善"
|-- VERSION  /minor 201  /date 2017-01-11  /summary "多重引用符によるテキスト"
|-- VERSION  /minor 202  /date 2017-01-13  /summary "Siv パターンを導入"
|-- VERSION  /minor 203  /date 2017-01-15  /summary "Some クラスを導入"
|-- VERSION  /minor 204  /date 2017-01-18  /summary "Sivmap を導入"
|-- VERSION  /minor 205  /date 2017-01-19  /summary "String を Textual へ変更"
|-- VERSION  /minor 206  /date 2017-01-20  /summary "コード位置を Textual に変更"
|-- VERSION  /minor 207  /date 2017-01-21  /summary "改行分割処理を改善"

```

Command `koshu list-version.k VERSION.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    list-version.k
**    VERSION.k
**
**  OUTPUT
**    <stdout>
**

|-- VERSION  /major 0  /minor 0  /date 2013-04-18  /summary "生まれました"
|-- VERSION  /major 0  /minor 1  /date 2013-05-03  /summary
    "標準入出力間でデータ編集を行う koshu コマンドをパッケージ化"
|-- VERSION  /major 0  /minor 2  /date 2013-05-14  /summary "プログラムのなかに甲州記法を埋め込む [koshu| ... |] を実装"
|-- VERSION  /major 0  /minor 3  /date 2013-05-20  /summary "ライブラリとコマンドを別パッケージに分割"
|-- VERSION  /major 0  /minor 4  /date 2013-05-22  /summary "RDF を甲州記法に変換するプログラム koshu-rdf を追加"

|-- VERSION  /major 0  /minor 5  /date 2013-06-03  /summary "関係写像の定義を Minimal モジュールへ分離"
|-- VERSION  /major 0  /minor 6  /date 2013-06-07  /summary "関係写像のプリティプリンタを追加"
|-- VERSION  /major 0  /minor 7  /date 2013-06-10  /summary "関係写像を別パッケージに分割"
|-- VERSION  /major 0  /minor 8  /date 2013-06-12  /summary "koshu-baala パッケージを koshu-baala-base に改名"
|-- VERSION  /major 0  /minor 9  /date 2013-06-14  /summary "間違いがみつかった箇所のソースコードを表示"

|-- VERSION  /major 0  /minor 10  /date 2013-06-17  /summary "ソースコードを節単位に分割する処理を整理"
|-- VERSION  /major 0  /minor 11  /date 2013-06-20  /summary "関係写像の実装に必要な機能を OpKit モジュールに集約"
|-- VERSION  /major 0  /minor 12  /date 2013-06-21  /summary "節の合併"
|-- VERSION  /major 0  /minor 13  /date 2013-06-26  /summary "関係写像のオペランドを整理"
|-- VERSION  /major 0  /minor 14  /date 2013-06-29  /summary "構文ツール koshu-syntax を作成"

|-- VERSION  /major 0  /minor 15  /date 2013-06-29  /summary "甲州プロセッサを koshu-baala-processor パッケージに分離"
|-- VERSION  /major 0  /minor 16  /date 2013-07-01  /summary "四重星印 **** による注釈"
|-- VERSION  /major 0  /minor 17  /date 2013-07-03  /summary "二重線による改行とワンライナー"
|-- VERSION  /major 0  /minor 18  /date 2013-07-04  /summary "Order.hs などを base から operator パッケージに移動"
|-- VERSION  /major 0  /minor 19  /date 2013-07-05  /summary "データの差異を計算する koshu-change コマンドを作成"

|-- VERSION  /major 0  /minor 20  /date 2013-07-06  /summary "トークン番号を数えるように修正"
|-- VERSION  /major 0  /minor 21  /date 2013-07-07  /summary "リストと組を読み書きする機能を追加"
|-- VERSION  /major 0  /minor 22  /date 2013-07-09  /summary "引用符など特殊な文字を含んだ文字列を扱う機能を追加"
|-- VERSION  /major 0  /minor 23  /date 2013-07-11  /summary "計算リストにしたがって計算する機能を実装"
|-- VERSION  /major 0  /minor 24  /date 2013-07-12  /summary "退行テストを実施する koshu-regress コマンドを追加"
*** 25

|-- VERSION  /major 0  /minor 25  /date 2013-07-17  /summary "Content モジュールを追加"
|-- VERSION  /major 0  /minor 26  /date 2013-07-20  /summary "項目内容を計算する機能を再実装"
|-- VERSION  /major 0  /minor 27  /date 2013-07-21  /summary "関係写像が失敗できるように型を変更"
|-- VERSION  /major 0  /minor 28  /date 2013-07-22  /summary "base パッケージの言語機能を core パッケージに分離"
|-- VERSION  /major 0  /minor 30  /date 2013-07-27  /summary "リテラルを読み書きする機能を整理"

|-- VERSION  /major 0  /minor 31  /date 2013-07-29  /summary "GHC 7.6.3 でビルドできるように修正"
|-- VERSION  /major 0  /minor 32  /date 2013-08-02  /summary "関係演算子に関連するコードを整理"
|-- VERSION  /major 0  /minor 33  /date 2013-08-08  /summary "小数を扱う機能を追加"
|-- VERSION  /major 0  /minor 34  /date 2013-08-12  /summary "エラーメッセージを改善"
|-- VERSION  /major 0  /minor 35  /date 2013-08-24  /summary "affirm と deny の構文を変更"

|-- VERSION  /major 0  /minor 36  /date 2013-09-05  /summary "テキスト・リテラルの構文を変更"
|-- VERSION  /major 0  /minor 37  /date 2013-09-07  /summary "判断記号として |== を導入"
|-- VERSION  /major 0  /minor 38  /date 2013-09-19  /summary "関係計算式の実行方法を変更"
|-- VERSION  /major 0  /minor 39  /date 2013-10-16  /summary "関係写像演算子のオペランドの処理方法を整理"
|-- VERSION  /major 0  /minor 40  /date 2013-10-27  /summary "データ検証機能を追加"

|-- VERSION  /major 0  /minor 41  /date 2013-12-31  /summary "エラーを報告する方法を書き直し"
|-- VERSION  /major 0  /minor 42  /date 2014-01-15  /summary "大域データを扱う機能を追加"
|-- VERSION  /major 0  /minor 43  /date 2014-02-05  /summary "関係写像の組み立て方法を見直し"
|-- VERSION  /major 0  /minor 44  /date 2014-02-17  /summary "構文演算子の仕組みを追加"
|-- VERSION  /major 0  /minor 45  /date 2014-02-21  /summary "短縮記号を読み込む処理を実装"

|-- VERSION  /major 0  /minor 46  /date 2014-02-28  /summary "ラムダ算法を使用した項目計算の方法を実装"
|-- VERSION  /major 0  /minor 47  /date 2014-03-11  /summary "再帰関係写像を処理する仕組みを実装"
|-- VERSION  /major 0  /minor 48  /date 2014-03-15  /summary "関係写像の実装方法を整理"
|-- VERSION  /major 0  /minor 49  /date 2014-03-19  /summary "エラーを報告する方法を書き直し"
|-- VERSION  /major 0  /minor 50  /date 2014-03-27  /summary "項目名の扱い方を改善"
*** 50

|-- VERSION  /major 0  /minor 51  /date 2014-04-08  /summary "入れ子の関係を計算する方法を実装"
|-- VERSION  /major 0  /minor 52  /date 2014-04-14  /summary "入れ子の関係を表形式で出力する方法を実装"
|-- VERSION  /major 0  /minor 53  /date 2014-04-21  /summary "メタ演算子を独立したモジュールに分割"
|-- VERSION  /major 0  /minor 54  /date 2014-04-27  /summary "スロットつき関係写像を実装"
|-- VERSION  /major 0  /minor 55  /date 2014-05-02  /summary "大域スロットを実装"

|-- VERSION  /major 0  /minor 56  /date 2014-05-11  /summary "関係写像のスコープを整理"
|-- VERSION  /major 0  /minor 57  /date 2014-05-14  /summary "トークン木の組み立て失敗時のエラーを実装"
|-- VERSION  /major 0  /minor 58  /date 2014-05-17  /summary "演算属性の編集機能を実装"
|-- VERSION  /major 0  /minor 59  /date 2014-05-23  /summary "短縮語を書き出す機能を実装"
|-- VERSION  /major 0  /minor 60  /date 2014-05-29  /summary "ハッシュ・キーワードを囲み句に変更"

|-- VERSION  /major 0  /minor 61  /date 2014-06-03  /summary "項目内容としての組を扱う機能を見直し"
|-- VERSION  /major 0  /minor 62  /date 2014-06-08  /summary "関係写像のグループを見直し"
|-- VERSION  /major 0  /minor 63  /date 2014-06-14  /summary "ツールキットを最新化"
|-- VERSION  /major 0  /minor 64  /date 2014-06-19  /summary "制約外判断を導入"
|-- VERSION  /major 0  /minor 65  /date 2014-07-07  /summary "関係写像演算子の定義方法を変更"

|-- VERSION  /major 0  /minor 66  /date 2014-08-03  /summary "空番の処理方法を見直し"
|-- VERSION  /major 0  /minor 67  /date 2014-08-12  /summary "項目計算式の計算アルゴリズムを見直し"
|-- VERSION  /major 0  /minor 68  /date 2014-08-15  /summary "項目演算子を別パッケージに分離"
|-- VERSION  /major 0  /minor 69  /date 2014-08-23  /summary "項目計算式のバグを修正"
|-- VERSION  /major 0  /minor 70  /date 2014-08-26  /summary "括弧の種類をデータ型として定義"

|-- VERSION  /major 0  /minor 71  /date 2014-09-05  /summary "リテラル計算式を実装"
|-- VERSION  /major 0  /minor 72  /date 2014-09-07  /summary "演算子セットをひとつのデータ型でとりまとめ"
|-- VERSION  /major 0  /minor 73  /date 2014-09-14  /summary "データ解釈リテラルを導入"
|-- VERSION  /major 0  /minor 74  /date 2014-09-20  /summary "トークン化処理を整理"
|-- VERSION  /major 0  /minor 75  /date 2014-09-24  /summary "データ解釈による見出し検査を実装"
*** 75

|-- VERSION  /major 0  /minor 76  /date 2014-10-04  /summary "型定数を導入"
|-- VERSION  /major 0  /minor 77  /date 2014-10-12  /summary "型定数を使った見出しに変更"
|-- VERSION  /major 0  /minor 78  /date 2014-10-22  /summary "作業項目に関する機能を実装"
|-- VERSION  /major 0  /minor 79  /date 2014-10-28  /summary "日付の基本機能を実装"
|-- VERSION  /major 0  /minor 80  /date 2014-11-02  /summary "経過時間型を実装"

|-- VERSION  /major 0  /minor 81  /date 2014-11-12  /summary "秒までの精度をもつ時刻型を実装"
|-- VERSION  /major 0  /minor 82  /date 2014-11-18  /summary "年週日と年通日の時刻型を実装"
|-- VERSION  /major 0  /minor 83  /date 2014-11-25  /summary "区の基本機能を実装"
|-- VERSION  /major 0  /minor 84  /date 2014-12-03  /summary "構文ツール koshu-syntax を修正"
|-- VERSION  /major 0  /minor 85  /date 2014-12-09  /summary "重関係参照のインタフェースを見直し"

|-- VERSION  /major 0  /minor 86  /date 2014-12-18  /summary "GHC 7.8.3 向けに更新"
|-- VERSION  /major 0  /minor 87  /date 2014-12-22  /summary "区番による有効範囲を実装"
|-- VERSION  /major 0  /minor 88  /date 2014-12-25  /summary "関係写像にフックを追加"
|-- VERSION  /major 0  /minor 89  /date 2014-12-26  /summary "関係写像のためのモジュールを整理"
|-- VERSION  /major 0  /minor 90  /date 2015-01-06  /summary "資源に関する関係写像演算子"

|-- VERSION  /major 0  /minor 91  /date 2015-01-11  /summary "ウェブ・リソースの読み込み機能を実装"
|-- VERSION  /major 0  /minor 92  /date 2015-01-18  /summary "大域パラメータを状態として使用"
|-- VERSION  /major 0  /minor 93  /date 2015-01-23  /summary "トークン・パラメータ"
|-- VERSION  /major 0  /minor 94  /date 2015-02-03  /summary "関係写像演算子の属性を再実装"
|-- VERSION  /major 0  /minor 95  /date 2015-02-06  /summary "about 節を導入"

|-- VERSION  /major 0  /minor 96  /date 2015-02-09  /summary "節の構築を失敗可能に変更"
|-- VERSION  /major 0  /minor 97  /date 2015-02-13  /summary "重関係参照の構文を変更"
|-- VERSION  /major 0  /minor 98  /date 2015-02-17  /summary "演算子属性を再実装"
|-- VERSION  /major 0  /minor 99  /date 2015-02-22  /summary "文面上の有効範囲をもつ重関係参照"
|-- VERSION  /major 0  /minor 100  /date 2015-02-26  /summary "関係写像の構成方法を見直し"
*** 100

|-- VERSION  /major 0  /minor 101  /date 2015-03-02  /summary "写像中間体を導入"
|-- VERSION  /major 0  /minor 102  /date 2015-03-04  /summary "節属性を導入"
|-- VERSION  /major 0  /minor 103  /date 2015-03-15  /summary "表明属性を二重ハイフンに変更"
|-- VERSION  /major 0  /minor 104  /date 2015-03-23  /summary "資源全体に対するオプションを導入"
|-- VERSION  /major 0  /minor 105  /date 2015-04-02  /summary "甲州記法のフィルタ・コマンドを実装"

|-- VERSION  /major 0  /minor 106  /date 2015-04-08  /summary "output 節を導入"
|-- VERSION  /major 0  /minor 107  /date 2015-04-23  /summary "交わりや結びの実装を修正"
|-- VERSION  /major 0  /minor 108  /date 2015-04-28  /summary "項目内容リストの構文を変更"
|-- VERSION  /major 0  /minor 109  /date 2015-05-24  /summary "甲州計算機に -x オプションを追加"
|-- VERSION  /major 0  /minor 110  /date 2015-06-18  /summary "メモリの使用量を改善"

|-- VERSION  /major 0  /minor 111  /date 2015-07-01  /summary "--about オプションつきの入力を実装"
|-- VERSION  /major 0  /minor 112  /date 2015-07-14  /summary "計算結果をあらわす Result 型を導入"
|-- VERSION  /major 0  /minor 113  /date 2015-07-24  /summary "版権表示のための区を導入"
|-- VERSION  /major 0  /minor 114  /date 2015-07-30  /summary "HTML での表形式出力を実装"
|-- VERSION  /major 0  /minor 115  /date 2015-08-04  /summary "甲州記法以外の出力形式を扱えるように変更"

|-- VERSION  /major 0  /minor 116  /date 2015-08-29  /summary "JSON 出力を実装"
|-- VERSION  /major 0  /minor 117  /date 2015-09-04  /summary "出力形式をモジュール化"
|-- VERSION  /major 0  /minor 118  /date 2015-09-09  /summary "writer パッケージを作成"
|-- VERSION  /major 0  /minor 119  /date 2015-09-26  /summary "項目計算式を独立したモジュールに変更"
|-- VERSION  /major 0  /minor 120  /date 2015-09-29  /summary "data パッケージを作成"

|-- VERSION  /major 0  /minor 121  /date 2015-10-05  /summary "メッセージ・モジュールを整理"
|-- VERSION  /major 0  /minor 122  /date 2015-10-15  /summary "cop パッケージを作成"
|-- VERSION  /major 0  /minor 123  /date 2015-10-17  /summary "operator パッケージをふたつに分割"
|-- VERSION  /major 0  /minor 124  /date 2015-10-22  /summary "演算子モジュールの名前を変更"
|-- VERSION  /major 0  /minor 125  /date 2015-10-25  /summary "Rop.Flat モジュールを導入"
*** 125

|-- VERSION  /major 0  /minor 126  /date 2016-03-02  /summary "小数型の桁数関連の演算子を追加"
|-- VERSION  /major 0  /minor 127  /date 2016-04-10  /summary "関係型などの表記法を変更"
|-- VERSION  /major 0  /minor 128  /date 2016-04-15  /summary "肯定項目と否定項目を導入"
|-- VERSION  /major 0  /minor 129  /date 2016-04-23  /summary "記号型を導入"
|-- VERSION  /major 0  /minor 130  /date 2016-04-27  /summary "属性モジュールを整理"

|-- VERSION  /major 0  /minor 131  /date 2016-04-27  /summary "syntax パッケージを作成"
|-- VERSION  /major 0  /minor 132  /date 2016-04-28  /summary "小数を有理数で再実装"
|-- VERSION  /major 0  /minor 133  /date 2016-05-02  /summary "有理数の追加の関数"
|-- VERSION  /major 0  /minor 153  /date 2016-07-03  /summary "エンコード処理を整理"
|-- VERSION  /major 0  /minor 154  /date 2016-07-04  /summary "トークン化をモジュール分割"

|-- VERSION  /major 0  /minor 155  /date 2016-07-05  /summary "トークン化をニッパとスキャナに整理"
|-- VERSION  /major 0  /minor 156  /date 2016-07-09  /summary "項目集合をもつデータの扱い方を改善"
|-- VERSION  /major 0  /minor 157  /date 2016-09-19  /summary "subtext パッケージを開発"
|-- VERSION  /major 0  /minor 158  /date 2016-09-21  /summary "関係写像演算子 subtext を実装"
|-- VERSION  /major 0  /minor 159  /date 2016-09-26  /summary "subtext にテキストを収集する機能を追加"

|-- VERSION  /major 0  /minor 160  /date 2016-10-08  /summary "subtext のキーワードを追加"
|-- VERSION  /major 0  /minor 161  /date 2016-10-11  /summary "隣接テキストを連結する処理方法を変更"
|-- VERSION  /major 0  /minor 162  /date 2016-10-15  /summary "overture パッケージを作成"
|-- VERSION  /major 0  /minor 163  /date 2016-10-16  /summary "overture パッケージにコードを移動"
|-- VERSION  /major 0  /minor 164  /date 2016-10-23  /summary "時刻と経過時間の計算モジュールを分離"

|-- VERSION  /major 0  /minor 165  /date 2016-11-01  /summary "時刻を取得する演算子を追加"
|-- VERSION  /major 0  /minor 166  /date 2016-11-04  /summary "項目内容と混在テキストをモジュール分割"
|-- VERSION  /major 0  /minor 167  /date 2016-11-07  /summary "項目選択器を再定式化"
|-- VERSION  /major 0  /minor 168  /date 2016-11-09  /summary "Unicode 符号位置によるテキストを導入"
|-- VERSION  /major 0  /minor 169  /date 2016-11-11  /summary "data-plus モジュールを作成"
*** 150

|-- VERSION  /major 0  /minor 170  /date 2016-11-13  /summary "項目内容のデコード方法を整理"
|-- VERSION  /major 0  /minor 171  /date 2016-11-16  /summary "項目内容の具象型を改善"
|-- VERSION  /major 0  /minor 172  /date 2016-11-19  /summary "項目名のデータ型を導入するための準備"
|-- VERSION  /major 0  /minor 173  /date 2016-11-20  /summary "項目名のデータ型を導入"
|-- VERSION  /major 0  /minor 174  /date 2016-11-21  /summary "項目パスの括弧を導入"

|-- VERSION  /major 0  /minor 175  /date 2016-11-24  /summary "関係写像演算子のエイリアスを導入"
|-- VERSION  /major 0  /minor 176  /date 2016-11-26  /summary "エラーメッセージの処理を改善"
|-- VERSION  /major 0  /minor 177  /date 2016-11-27  /summary "構文パターンを整理"
|-- VERSION  /major 0  /minor 178  /date 2016-12-01  /summary "タブ区切りの判断出力を実装"
|-- VERSION  /major 0  /minor 179  /date 2016-12-03  /summary "整数索引を導入"

|-- VERSION  /major 0  /minor 180  /date 2016-12-06  /summary "入出力パスを導入"
|-- VERSION  /major 0  /minor 181  /date 2016-12-07  /summary "エラーメッセージの出力方法を変更"
|-- VERSION  /major 0  /minor 182  /date 2016-12-08  /summary "データセットの読み込み機能を実装"
|-- VERSION  /major 0  /minor 183  /date 2016-12-10  /summary "時刻データを改善"
|-- VERSION  /major 0  /minor 184  /date 2016-12-13  /summary "トークン化を uncons 方式に変更"

|-- VERSION  /major 0  /minor 185  /date 2016-12-16  /summary "type パッケージを作成"
|-- VERSION  /major 0  /minor 186  /date 2016-12-19  /summary "関係写像演算子のパラメータを改善"
|-- VERSION  /major 0  /minor 187  /date 2016-12-20  /summary "中断理由の報告内容を改善"
|-- VERSION  /major 0  /minor 188  /date 2016-12-21  /summary "rop パッケージ作成の準備"
|-- VERSION  /major 0  /minor 189  /date 2016-12-21  /summary "項目の取り出し方法を改善"

|-- VERSION  /major 0  /minor 190  /date 2016-12-22  /summary "関係写像演算子のエラーを一部改善"
|-- VERSION  /major 0  /minor 191  /date 2016-12-23  /summary "特定関係写像を組み立てる関数を整備"
|-- VERSION  /major 0  /minor 192  /date 2016-12-24  /summary "関係写像のパラメータの取得方法を改善"
|-- VERSION  /major 0  /minor 193  /date 2016-12-26  /summary "項目列を変換する関係写像演算子を実装"
|-- VERSION  /major 0  /minor 194  /date 2016-12-27  /summary "-where パラメータを -let へ変更"
*** 175

|-- VERSION  /major 0  /minor 195  /date 2017-01-02  /summary "部分木を取り出す機能を実装"
|-- VERSION  /major 0  /minor 196  /date 2017-01-04  /summary "部分木パターンのデコード"
|-- VERSION  /major 0  /minor 197  /date 2017-01-05  /summary "XML からデータ抽出する機能を実装"
|-- VERSION  /major 0  /minor 198  /date 2017-01-06  /summary "XML ノードの採番機能を追加"
|-- VERSION  /major 0  /minor 199  /date 2017-01-08  /summary "制限つき maybe を実装"

|-- VERSION  /major 0  /minor 200  /date 2017-01-10  /summary "HTTP get を改善"
|-- VERSION  /major 0  /minor 201  /date 2017-01-11  /summary "多重引用符によるテキスト"
|-- VERSION  /major 0  /minor 202  /date 2017-01-13  /summary "Siv パターンを導入"
|-- VERSION  /major 0  /minor 203  /date 2017-01-15  /summary "Some クラスを導入"
|-- VERSION  /major 0  /minor 204  /date 2017-01-18  /summary "Sivmap を導入"

|-- VERSION  /major 0  /minor 205  /date 2017-01-19  /summary "String を Textual へ変更"
|-- VERSION  /major 0  /minor 206  /date 2017-01-20  /summary "コード位置を Textual に変更"
|-- VERSION  /major 0  /minor 207  /date 2017-01-21  /summary "改行分割処理を改善"

*** 188 judges

**
**  SUMMARY
**     188 judges on VERSION
**     188 judges in total
**
```



## command

This document is produced by the command:

```
koshu-inout.sh -s -g koshu list-version.k
```
