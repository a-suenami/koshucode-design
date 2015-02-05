** -*- koshu -*-
**
**  概要
**    短縮設定のグループ化
**

xy : source A /x /y | /z 'cocoa-zzz

short
  a "apple-"
  b "banana-"
  c "cocoa-"

|-- A /x a.xxx /y b.yyy

|== B : xy
|== C : xy

** 最初と同じ短縮設定のため、
** B と C と D はグループ化されます。
short
  a "apple-"
  b "banana-"
  c "cocoa-"

|== D : xy

short
  a "apple-"

|== E : xy

** 最初と同じ短縮設定ですが、
** 途中に異なる設定があるため、グループ化されません。
short
  a "apple-"
  b "banana-"
  c "cocoa-"

|== F : xy
