# I/O List

- koshu [eq.k](#eqk)
- koshu [eqq.k](#eqqk)
- koshu [eqqq.k](#eqqqk)
- koshu [eqqqq.k](#eqqqqk)
- koshu [hello.k](#hellok)
- koshu [section.k](#sectionk)



## [eq.k](eq.k)

```
= rel
```

Command `koshu eq.k` exits with 2 and produces:

```
** -*- koshu -*-
**
**  INPUT
**    eq.k
**

**
**  ABORTED  Unexpedted section delimiter
**  -------- ------------------------------------- --------
**  Detail   === rel    for relational calculation
**           === note   for commentary section
**           === end    for ending of input
**  Source   1 0 eq.k
**           > = rel                               .. token
**  Command  koshu
**           eq.k
**
**  Exit with status 2
**
```



## [eqq.k](eqq.k)

```
== rel
```

Command `koshu eqq.k` exits with 2 and produces:

```
** -*- koshu -*-
**
**  INPUT
**    eqq.k
**

**
**  ABORTED  Unexpedted section delimiter
**  -------- ------------------------------------- --------
**  Detail   === rel    for relational calculation
**           === note   for commentary section
**           === end    for ending of input
**  Source   1 0 eqq.k
**           > == rel                              .. token
**  Command  koshu
**           eqq.k
**
**  Exit with status 2
**
```



## [eqqq.k](eqqq.k)

```
=== rel
```

Command `koshu eqqq.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    eqqq.k
**

**
**  SUMMARY
**      no judges in total
**
```



## [eqqqq.k](eqqqq.k)

```
==== rel
```

Command `koshu eqqqq.k` exits with 2 and produces:

```
** -*- koshu -*-
**
**  INPUT
**    eqqqq.k
**

**
**  ABORTED  Unexpedted section delimiter
**  -------- ------------------------------------- --------
**  Detail   === rel    for relational calculation
**           === note   for commentary section
**           === end    for ending of input
**  Source   1 0 eqqqq.k
**           > ==== rel                            .. token
**  Command  koshu
**           eqqqq.k
**
**  Exit with status 2
**
```



## [hello.k](hello.k)

```
=== hello
```

Command `koshu hello.k` exits with 2 and produces:

```
** -*- koshu -*-
**
**  INPUT
**    hello.k
**

**
**  ABORTED  Unexpedted section delimiter
**  -------- ------------------------------------- --------
**  Detail   === rel    for relational calculation
**           === note   for commentary section
**           === end    for ending of input
**  Source   1 0 hello.k
**           > === hello                           .. token
**  Command  koshu
**           hello.k
**
**  Exit with status 2
**
```



## [section.k](section.k)

```
** -*- koshu -*-

=== note

  甲州記法では、ひとつのファイルを複数の区に区切れます。
  行頭に === をおくと、新しい区が始まります。

  この区は === note から始まっており、注釈と同じように扱われます。
  つぎの区が始まるまで、各行が読み飛ばされます。
  自由区 (note section) とよばれます。

=== rel

**
**  この区は、判断集合や関係写像を記述するための基本形になります。
**  関係区 (relational section) とよばれます。
**

|-- P  /x 12
|-- P  /x 14

|== Q : source P /x

=== end

終止区 (end section) は、ファイルの末尾まで読み飛ばします。
後続に === が書かれていても、ほかの区に切り替わることもありません。

=== rel

ここは、終止区のなかにあるため、読み飛ばされます。

|-- P  /x 8
|-- P  /x 10
```

Command `koshu section.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    section.k
**

|-- Q  /x 12
|-- Q  /x 14

*** 2 judges

**
**  SUMMARY
**       2 judges on Q
**       2 judges in total
**
```



## command

This document is produced by the command:

```
koshu-inout.sh -r -g koshu
```
