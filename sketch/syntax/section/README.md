# I/O List

- koshu [hello.k](#hellok)
- koshu [section.k](#sectionk)



## [hello.k](hello.k)

```
=== hello
```

Command `koshu hello.k` exits with 2 and produces:

```
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
