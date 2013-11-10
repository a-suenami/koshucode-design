** -*- koshu -*-
**
**  概要
**    三大喜劇王の共演
**
**  使用例
**    koshu COMIC-ACTOR.k co-start.k
**

** 判断集合を関係として読み出し。
star : source 三大喜劇王 /actor | rename /cast /actor
cast : source 出演 /title /cast

** /title の作品に /cast-1 が出演している。
** /title の作品に /cast-2 が出演している。
star-cast : star | meet cast
cast-1    : star-cast | rename /cast-1 /cast
cast-2    : star-cast | rename /cast-2 /cast

** /title で /cast-1 と /cast-2 が共演している
** という関係を計算します。
co-star-both :
  cast-1 | meet cast-2 | hold /cast-1 <> /cast-2

** A と B が共演しているときは、B と A も共演しているため、
** それを片方に制限します。
co-star-side : co-star-both | hold /cast-1 < /cast-2

** 共演をあらわすほかの方法として、キャストをグループ化します。
co-star-group :
  co-star-both
    | pick /title
    | group /r ( co-star-both | cut /cast-2 )
    | add /casts ( /r/cast-1 )
    | cut /r

** 関係を判断集合として書き出し。
|== BOTH -fore /title /cast-1 /cast-2 : co-star-both
|== SIDE -fore /title /cast-1 /cast-2 : co-star-side
|== GROUP -fore /title : co-star-group

