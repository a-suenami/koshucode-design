# I/O List

- koshu [rop.k](#ropk)



## [rop.k](rop.k)

```
** -*- koshu -*-
**
**  DESCRIPTION
**    List relmap operators
**
**  UsAGE
**    koshu rop.k
**

|== ROP -with-table -fore /n /group
    : koshu-rop -group /group
                -name  /name
                -usage /usage
    | nest /name /usage -to /rop
    | for /rop number-name
    | number-group

number-group : number /n  -from 1  -order /group
number-name  : number /n  -from 1  -order /name
```

Command `koshu rop.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    rop.k
**

|-- ROP  /n 1  /group 'builtin  /rop {| /n : /name : /usage | 1 : 'append : "append R ..." |}
|-- ROP  /n 2  /group 'meta  /rop {| /n : /name : /usage | 1 : 'koshu-cop : "koshu-cop /N" | 2 : 'koshu-cop-infix : "koshu-cop-infix /N [ -height /N ][ -dir /N ]" | 3 : 'koshu-rop : "koshu-rop /N /N" | 4 : 'koshu-version : "koshu-version /N" |}
|-- ROP  /n 3  /group 'minimal  /rop {| /n : /name : /usage | 1 : 'contents : "contents /N" | 2 : 'cut : "cut /P ..." | 3 : 'cut-term : "cut-term /R" | 4 : 'dee : 'dee | 5 : 'dum : 'dum | 6 : 'empty : 'empty | 7 : 'equal : 'equal | 8 : 'id : 'id | 9 : 'join : "join R" | 10 : 'meet : "meet R" | 11 : 'move : "move /P ... -to /N ..." | 12 : 'none : "none R" | 13 : 'pick : "pick /P ..." | 14 : 'pick-term : "pick-term /R" | 15 : 'rename : "rename /N /P ..." | 16 : 'some : "some R" | 17 : 'source : "source P /T ..." | 18 : 'source-term : "source-term P R" | 19 : 'sub : "sub R" |}
|-- ROP  /n 4  /group 'nest  /rop {| /n : /name : /usage | 1 : 'copy : "copy N R" | 2 : 'down : "down /N" | 3 : 'for : "for /N R [ -with /N ... ]" | 4 : 'group : "group /N R" | 5 : 'group-by : "group-by /N R" | 6 : 'join-up : "join-up /P ..." | 7 : 'nest : "nest /P ... -to /N" | 8 : 'slice : "slice /N [R] [ -with /N ... ]" | 9 : 'slice-up : "slice-up R [ -with /N ... ]" | 10 : 'split : "split /N E ..." | 11 : 'unnest : "unnest /P" | 12 : 'up : "up /N" |}
|-- ROP  /n 5  /group 'vanilla  /rop {| /n : /name : /usage | 1 : 'add : "add /N E ..." | 2 : 'both : "both R" | 3 : 'check-term : "check-term [ -just /N ... | -has /N ... | -but /N ... ]" | 4 : 'compose : "compose R" | 5 : 'const : "const R" | 6 : 'dump : 'dump | 7 : 'duplicate : "duplicate /N ..." | 8 : 'fix : "fix R" | 9 : 'fix-join : "fix-join R" | 10 : 'hold : "hold E" | 11 : 'if : "if R ..." | 12 : 'keep : "keep E" | 13 : 'maybe : "maybe R" | 14 : 'member : "member /N /N" | 15 : 'number : "number /N -order /N ..." | 16 : 'omit : "omit E" | 17 : 'prefix : "prefix /P /N ..." | 18 : 'prefix-change : "prefix-change /P /Q" | 19 : 'range : "range /N -from E -to E" | 20 : 'rank : "rank /N -order /N ..." | 21 : 'rdf : "rdf P /S /O" | 22 : 'repeat : "repeat N R" | 23 : 'size : "size /N" | 24 : 'subst : "subst /N E ..." | 25 : 'typename : "typename /N /P ..." | 26 : 'unless : "unless R R" | 27 : 'unprefix : "unprefix /P" | 28 : 'when : "when R R" |}

*** 5 judges

**  TABLE : ROP
**
**    /n  /group     /rop
**    --- ---------- -----------------------------------------------------------------------------------
**    1   'builtin   /n   /name              /usage
**                   ---- ------------------ -----------------------------------------------------------
**                   1    'append            "append R ..."
**                   
**    2   'meta      /n   /name              /usage
**                   ---- ------------------ -----------------------------------------------------------
**                   1    'koshu-cop         "koshu-cop /N"
**                   2    'koshu-cop-infix   "koshu-cop-infix /N [ -height /N ][ -dir /N ]"
**                   3    'koshu-rop         "koshu-rop /N /N"
**                   4    'koshu-version     "koshu-version /N"
**                   
**    3   'minimal   /n   /name              /usage
**                   ---- ------------------ -----------------------------------------------------------
**                   1    'contents          "contents /N"
**                   2    'cut               "cut /P ..."
**                   3    'cut-term          "cut-term /R"
**                   4    'dee               'dee
**                   5    'dum               'dum
**                   6    'empty             'empty
**                   7    'equal             'equal
**                   8    'id                'id
**                   9    'join              "join R"
**                   10   'meet              "meet R"
**                   11   'move              "move /P ... -to /N ..."
**                   12   'none              "none R"
**                   13   'pick              "pick /P ..."
**                   14   'pick-term         "pick-term /R"
**                   15   'rename            "rename /N /P ..."
**                   16   'some              "some R"
**                   17   'source            "source P /T ..."
**                   18   'source-term       "source-term P R"
**                   19   'sub               "sub R"
**                   
**    4   'nest      /n   /name              /usage
**                   ---- ------------------ -----------------------------------------------------------
**                   1    'copy              "copy N R"
**                   2    'down              "down /N"
**                   3    'for               "for /N R [ -with /N ... ]"
**                   4    'group             "group /N R"
**                   5    'group-by          "group-by /N R"
**                   6    'join-up           "join-up /P ..."
**                   7    'nest              "nest /P ... -to /N"
**                   8    'slice             "slice /N [R] [ -with /N ... ]"
**                   9    'slice-up          "slice-up R [ -with /N ... ]"
**                   10   'split             "split /N E ..."
**                   11   'unnest            "unnest /P"
**                   12   'up                "up /N"
**                   
**    5   'vanilla   /n   /name              /usage
**                   ---- ------------------ -----------------------------------------------------------
**                   1    'add               "add /N E ..."
**                   2    'both              "both R"
**                   3    'check-term        "check-term [ -just /N ... | -has /N ... | -but /N ... ]"
**                   4    'compose           "compose R"
**                   5    'const             "const R"
**                   6    'dump              'dump
**                   7    'duplicate         "duplicate /N ..."
**                   8    'fix               "fix R"
**                   9    'fix-join          "fix-join R"
**                   10   'hold              "hold E"
**                   11   'if                "if R ..."
**                   12   'keep              "keep E"
**                   13   'maybe             "maybe R"
**                   14   'member            "member /N /N"
**                   15   'number            "number /N -order /N ..."
**                   16   'omit              "omit E"
**                   17   'prefix            "prefix /P /N ..."
**                   18   'prefix-change     "prefix-change /P /Q"
**                   19   'range             "range /N -from E -to E"
**                   20   'rank              "rank /N -order /N ..."
**                   21   'rdf               "rdf P /S /O"
**                   22   'repeat            "repeat N R"
**                   23   'size              "size /N"
**                   24   'subst             "subst /N E ..."
**                   25   'typename          "typename /N /P ..."
**                   26   'unless            "unless R R"
**                   27   'unprefix          "unprefix /P"
**                   28   'when              "when R R"
**                   

**
**  SUMMARY
**       5 judges on ROP
**       5 judges in total
**
```



## command

This document is produced by the command:

```
koshu-inout.sh -s -g koshu
```
