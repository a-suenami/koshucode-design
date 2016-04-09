# I/O List

- koshu [add.k](#addk)
- koshu [cut.k](#cutk)
- koshu [dee.k](#deek)
- koshu [dum.k](#dumk)
- koshu [keep.k](#keepk)
- koshu [move.k](#movek)
- koshu [omit.k](#omitk)
- koshu [pick.k](#pickk)
- koshu [rename.k](#renamek)
- koshu [source.k](#sourcek)



## [add.k](add.k)

```
** -*- koshu -*-
**
**  add /N E ... は、式 E を使って項目の内容を計算し、
**  その結果を新しい項目 /N として追加します。
**  式 E に含まれる入力関係の項目名が、
**  各組の項目内容を置き換えられた上で計算されます。
**

|== Q : p | add /c ( /a + /b )
                /d ( /a - /b )
                /e 0

p : source P /a /b

|-- P  /a 1  /b 10
|-- P  /a 2  /b 20
|-- P  /a 3  /b 30
```

Command `koshu add.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    add.k
**
**  OUTPUT
**    <stdout>
**

|-- Q  /c 11  /d -9  /e 0  /a 1  /b 10
|-- Q  /c 22  /d -18  /e 0  /a 2  /b 20
|-- Q  /c 33  /d -27  /e 0  /a 3  /b 30

*** 3 judges

**
**  SUMMARY
**       3 judges on Q
**       3 judges in total
**
```



## [cut.k](cut.k)

```
** -*- koshu -*-
**
**  cut /P ... は、入力関係から項目 /P ... を取り除きます。
**
**  入力関係が項目 /P ... /Q ... をもっているとき、
**  cut /P ... は、pick /Q ... と同じ効果をもちます。
**

|== Q : p | cut /a
|== R : p | cut /b /c
|== S : p | cut /a /b /c

p : source P /a /b /c

|-- P  /a 1  /b 10  /c 100
|-- P  /a 1  /b 10  /c 150
|-- P  /a 2  /b 20  /c 200
```

Command `koshu cut.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    cut.k
**
**  OUTPUT
**    <stdout>
**

|-- Q  /b 10  /c 100
|-- Q  /b 10  /c 150
|-- Q  /b 20  /c 200

*** 3 judges

|-- R  /a 1
|-- R  /a 2

*** 2 judges

|-- S

*** 1 judge 

**
**  SUMMARY
**       3 judges on Q
**       2 judges on R
**       1 judge  on S
**       6 judges in total
**
```



## [dee.k](dee.k)

```
** -*- koshu -*-
**
**  dee は無項万有関係を出力します。
**  この関係は、項目がなく、すべての組を含みます。
**  すべての組といっても、項目がない組は、ただひとつしかないため、
**  そのひとつだけを含む関係が無項万有関係になります。
**
**  一般に、すべての組を含む関係は万有関係 (ばんゆうかんけい) とよばれ、
**  項目がない関係は無項関係 (むこうかんけい) とよばれます。
**
**  down /P は入力関係を内容とする項目 /P をもつ関係を出力します。
**

|== P : dee
|== Q : dee | down /r
```

Command `koshu dee.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    dee.k
**
**  OUTPUT
**    <stdout>
**

|-- P

*** 1 judge 

|-- Q  /r {= [ ] =}

*** 1 judge 

**
**  SUMMARY
**       1 judge  on P
**       1 judge  on Q
**       2 judges in total
**
```



## [dum.k](dum.k)

```
** -*- koshu -*-
**
**  dum は無項空関係を出力します。
**  この関係は、項目がなく、組もありません。
**  計算結果が無項関係のとき、判断はひとつも出力されません。
**
**  一般に、組がない関係は空関係 (くうかんけい) とよばれ、
**  項目がない関係は無項関係 (むこうかんけい) とよばれます。
**
**  down /P は入力関係を内容とする項目 /P をもつ関係を出力します。
**

|== P : dum
|== Q : dum | down /r
```

Command `koshu dum.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    dum.k
**
**  OUTPUT
**    <stdout>
**

*** no judges

|-- Q  /r {= =}

*** 1 judge 

**
**  SUMMARY
**      no judges on P
**       1 judge  on Q
**       1 judge  in total
**
```



## [keep.k](keep.k)

```
** -*- koshu -*-
**
**  keep E は、式 E が成立する組のみを残します。
**  式 E に含まれる入力関係の項目名が、
**  各組の項目内容を置き換えられた上で計算されます。
**
**  keep E は omit not E と同じ意味になります。
**

|== Q : p | keep /c = 100 or /c = 200
|== R : p | omit not ( /c = 100 or /c = 200 )

p : source P /a /b /c

|-- P  /a 1  /b 10  /c 100
|-- P  /a 1  /b 10  /c 150
|-- P  /a 2  /b 20  /c 200
```

Command `koshu keep.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    keep.k
**
**  OUTPUT
**    <stdout>
**

|-- Q  /a 1  /b 10  /c 100
|-- Q  /a 2  /b 20  /c 200

*** 2 judges

|-- R  /a 1  /b 10  /c 100
|-- R  /a 2  /b 20  /c 200

*** 2 judges

**
**  SUMMARY
**       2 judges on Q
**       2 judges on R
**       4 judges in total
**
```



## [move.k](move.k)

```
** -*- koshu -*-
**
**  move /P ... -to /N ... は、項目名を変更します。
**  入力関係の項目 /P を /N に置き換えた関係を出力します。
**
**  move /P ... -to /N ... は、rename /N /P ... と同じ効果をもちます。
**  項目数が多いときは rename を使い、少ないときは move を使うことをおすすめします。
**

|== Q : p | move /a /b -to /x /y
|== R : p | rename /x /a
                   /y /b

p : source P /a /b /c

|-- P  /a 1  /b 10  /c 100
|-- P  /a 1  /b 10  /c 150
|-- P  /a 2  /b 20  /c 200
```

Command `koshu move.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    move.k
**
**  OUTPUT
**    <stdout>
**

|-- Q  /x 1  /y 10  /c 100
|-- Q  /x 1  /y 10  /c 150
|-- Q  /x 2  /y 20  /c 200

*** 3 judges

|-- R  /x 1  /y 10  /c 100
|-- R  /x 1  /y 10  /c 150
|-- R  /x 2  /y 20  /c 200

*** 3 judges

**
**  SUMMARY
**       3 judges on Q
**       3 judges on R
**       6 judges in total
**
```



## [omit.k](omit.k)

```
** -*- koshu -*-
**
**  omit E は、式 E が成立する組を取り除きます。
**  式 E に含まれる項目名は、入力関係の項目であると解釈され、
**  各組の項目内容を置き換えられた上で計算されます。
**
**  omit E は keep not E と同じ意味になります。
**

|== Q : p | omit /c = 100 or /c = 200
|== R : p | keep not ( /c = 100 or /c = 200 )

p : source P /a /b /c

|-- P  /a 1  /b 10  /c 100
|-- P  /a 1  /b 10  /c 150
|-- P  /a 2  /b 20  /c 200
```

Command `koshu omit.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    omit.k
**
**  OUTPUT
**    <stdout>
**

|-- Q  /a 1  /b 10  /c 150

*** 1 judge 

|-- R  /a 1  /b 10  /c 150

*** 1 judge 

**
**  SUMMARY
**       1 judge  on Q
**       1 judge  on R
**       2 judges in total
**
```



## [pick.k](pick.k)

```
** -*- koshu -*-
**
**  pick /P ... は、入力関係の項目 /P ... だけを残します。
**
**  入力関係が項目 /P ... /Q ... をもっているとき、
**  pick /P ... は、cut /Q ... と同じ効果をもちます。
**

|== Q : p | pick /a
|== R : p | pick /b /c
|== S : p | pick

p : source P /a /b /c

|-- P  /a 1  /b 10  /c 100
|-- P  /a 1  /b 10  /c 150
|-- P  /a 2  /b 20  /c 200
```

Command `koshu pick.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    pick.k
**
**  OUTPUT
**    <stdout>
**

|-- Q  /a 1
|-- Q  /a 2

*** 2 judges

|-- R  /b 10  /c 100
|-- R  /b 10  /c 150
|-- R  /b 20  /c 200

*** 3 judges

|-- S

*** 1 judge 

**
**  SUMMARY
**       2 judges on Q
**       3 judges on R
**       1 judge  on S
**       6 judges in total
**
```



## [rename.k](rename.k)

```
** -*- koshu -*-
**
**  rename /N /P ... は、項目名を変更します。
**  入力関係の項目 /P を /N に置き換えた関係を出力します。
**
**  rename /N /P ... は、move /P ... -to /N ... と同じ効果をもちます。
**  項目数が多いときは rename を使い、少ないときは move を使うことをおすすめします。
**

|== Q : p | rename /x /a
                   /y /b
|== R : p | move /a /b -to /x /y

p : source P /a /b /c

|-- P  /a 1  /b 10  /c 100
|-- P  /a 1  /b 10  /c 150
|-- P  /a 2  /b 20  /c 200
```

Command `koshu rename.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    rename.k
**
**  OUTPUT
**    <stdout>
**

|-- Q  /x 1  /y 10  /c 100
|-- Q  /x 1  /y 10  /c 150
|-- Q  /x 2  /y 20  /c 200

*** 3 judges

|-- R  /x 1  /y 10  /c 100
|-- R  /x 1  /y 10  /c 150
|-- R  /x 2  /y 20  /c 200

*** 3 judges

**
**  SUMMARY
**       3 judges on Q
**       3 judges on R
**       6 judges in total
**
```



## [source.k](source.k)

```
** -*- koshu -*-
**
**  source X /N ... は、判断種 X の判断集合を
**  項目 /N ... をもつ関係として読み出します。
**
**  判断が /N 以外の項目をもっているときは、それらの項目は無視されます。
**  判断が項目 /N をもっていない場合は、項目内容は空 () になります。
**  --empty オプションをつけると空の項目も表示されます。
**

|== Q : p
|== R : p --empty

p : source P /a /b /c

|-- P  /a 1  /b 10  /c 100
|-- P  /a 2  /b 20  /c 200  /d 2000    ** 項目 /d は無視されます。
|-- P  /a 3  /b 30                     ** 項目 /c は空の内容として読まれます。
```

Command `koshu source.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    source.k
**
**  OUTPUT
**    <stdout>
**

|-- Q  /a 1  /b 10  /c 100
|-- Q  /a 2  /b 20  /c 200
|-- Q  /a 3  /b 30

*** 3 judges

|-- R  /a 1  /b 10  /c 100
|-- R  /a 2  /b 20  /c 200
|-- R  /a 3  /b 30  /c ()

*** 3 judges

**
**  SUMMARY
**       3 judges on Q
**       3 judges on R
**       6 judges in total
**
```



## command

This document is produced by the command:

```
koshu-inout.sh -s -g koshu
```
