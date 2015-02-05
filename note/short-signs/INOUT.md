# I/O List

- koshu [group.k](#groupk)
- koshu [short.k](#shortk)



## [group.k](group.k)

```
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
```

Command `koshu group.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    group.k
**

short
  a "apple-"
  b "banana-"
  c "cocoa-"

|-- B  /z c.zzz  /x a.xxx  /y b.yyy

*** 1 judge 

|-- C  /z c.zzz  /x a.xxx  /y b.yyy

*** 1 judge 

|-- D  /z c.zzz  /x a.xxx  /y b.yyy

*** 1 judge 

short
  a "apple-"

|-- E  /z 'cocoa-zzz  /x a.xxx  /y 'banana-yyy

*** 1 judge 

short
  a "apple-"
  b "banana-"
  c "cocoa-"

|-- F  /z c.zzz  /x a.xxx  /y b.yyy

*** 1 judge 

**
**  SUMMARY
**       1 judge  on B
**       1 judge  on C
**       1 judge  on D
**       1 judge  on E
**       1 judge  on F
**       5 judges in total
**
```



## [short.k](short.k)

```
** -*- koshu -*-

short
  a abcdef
  b abcde

|-- A  /text a.g
|-- A  /text b.f
|-- A  /text b.fg

|== B : source A /text
  | add /n ( length /text )
        /q ( /text = 'abcdefg )

```

Command `koshu short.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    short.k
**

short
  a "abcdef"
  b "abcde"

|-- B  /n 7  /q <1>  /text a.g
|-- B  /n 6  /q <0>  /text a.

*** 2 judges

**
**  SUMMARY
**       2 judges on B
**       2 judges in total
**
```



## command

This document is produced by the command:

```
koshu-inout.sh -s -g koshu
```
