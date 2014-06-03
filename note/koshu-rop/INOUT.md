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

|== ROP -table -fore /n /group
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
|-- ROP  /n 2  /group 'cox  /rop {| /n : /name : /usage | 1 : 'add : "add /N E ..." | 2 : 'keep : "keep E" | 3 : 'omit : "omit E" | 4 : 'range : "range /N -from E -to E" | 5 : 'subst : "subst /N E ..." |}
|-- ROP  /n 3  /group 'meta  /rop {| /n : /name : /usage | 1 : 'koshu-cop : "koshu-cop /N" | 2 : 'koshu-cop-infix : "koshu-cop-infix /N [ -height /N ][ -dir /N ]" | 3 : 'koshu-rop : "koshu-rop /N /N" | 4 : 'koshu-version : "koshu-version /N" |}
|-- ROP  /n 4  /group 'minimal  /rop {| /n : /name : /usage | 1 : 'contents : "contents /N" | 2 : 'cut : "cut /P ..." | 3 : 'cut-term : "cut-term /R" | 4 : 'dee : 'dee | 5 : 'dum : 'dum | 6 : 'empty : 'empty | 7 : 'equal : 'equal | 8 : 'id : 'id | 9 : 'join : "join R" | 10 : 'meet : "meet R" | 11 : 'move : "move /P ... -to /N ..." | 12 : 'none : "none R" | 13 : 'pick : "pick /P ..." | 14 : 'pick-term : "pick-term /R" | 15 : 'rename : "rename /N /P ..." | 16 : 'some : "some R" | 17 : 'source : "source P /T ..." | 18 : 'source-term : "source-term P R" | 19 : 'sub : "sub R" |}
|-- ROP  /n 5  /group 'nest  /rop {| /n : /name : /usage | 1 : 'chunk : "chunk /T ... [-order /P ...]" | 2 : 'copy : "copy N R" | 3 : 'down : "down /N" | 4 : 'for : "for /N R [ -with /N ... ]" | 5 : 'group : "group /N R" | 6 : 'group-by : "group-by /N R" | 7 : 'join-up : "join-up /P ..." | 8 : 'nest : "nest /P ... -to /N" | 9 : 'slice : "slice /N [R] [ -with /N ... ]" | 10 : 'slice-up : "slice-up R [ -with /N ... ]" | 11 : 'split : "split /N E ..." | 12 : 'unnest : "unnest /P" | 13 : 'up : "up /N" |}

|-- ROP  /n 6  /group 'vanilla  /rop {| /n : /name : /usage | 1 : 'assn : "assn /P ... -to N." | 2 : 'both : "both R" | 3 : 'check-term : "check-term [ -just /N ... | -has /N ... | -but /N ... ]" | 4 : 'compose : "compose R" | 5 : 'const : "const R" | 6 : 'dump : 'dump | 7 : 'duplicate : "duplicate /N ..." | 8 : 'fix : "fix R" | 9 : 'fix-join : "fix-join R" | 10 : 'if : "if R ..." | 11 : 'maybe : "maybe R" | 12 : 'member : "member /N /N" | 13 : 'number : "number /N -order /N ..." | 14 : 'prefix : "prefix /P /N ..." | 15 : 'prefix-change : "prefix-change /P /Q" | 16 : 'rank : "rank /N -order /N ..." | 17 : 'rdf : "rdf P /S /O" | 18 : 'repeat : "repeat N R" | 19 : 'size : "size /N" | 20 : 'typename : "typename /N /P ..." | 21 : 'unassn : "unassn /P -only /P ..." | 22 : 'unless : "unless R R" | 23 : 'unprefix : "unprefix /P" | 24 : 'when : "when R R" |}

*** 6 judges

**  TABLE : ROP
**
**    /n  /group     /rop
**    --- ---------- -----------------------------------------------------------------------------------
**    1   'builtin   /n   /name              /usage
**                   ---- ------------------ -----------------------------------------------------------
**                   1    'append            "append R ..."
**                   
**    2   'cox       /n   /name              /usage
**                   ---- ------------------ -----------------------------------------------------------
**                   1    'add               "add /N E ..."
**                   2    'keep              "keep E"
**                   3    'omit              "omit E"
**                   4    'range             "range /N -from E -to E"
**                   5    'subst             "subst /N E ..."
**                   
**    3   'meta      /n   /name              /usage
**                   ---- ------------------ -----------------------------------------------------------
**                   1    'koshu-cop         "koshu-cop /N"
**                   2    'koshu-cop-infix   "koshu-cop-infix /N [ -height /N ][ -dir /N ]"
**                   3    'koshu-rop         "koshu-rop /N /N"
**                   4    'koshu-version     "koshu-version /N"
**                   
**    4   'minimal   /n   /name              /usage
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
**    5   'nest      /n   /name              /usage
**                   ---- ------------------ -----------------------------------------------------------
**                   1    'chunk             "chunk /T ... [-order /P ...]"
**                   2    'copy              "copy N R"
**                   3    'down              "down /N"
**                   4    'for               "for /N R [ -with /N ... ]"
**                   5    'group             "group /N R"
**                   6    'group-by          "group-by /N R"
**                   7    'join-up           "join-up /P ..."
**                   8    'nest              "nest /P ... -to /N"
**                   9    'slice             "slice /N [R] [ -with /N ... ]"
**                   10   'slice-up          "slice-up R [ -with /N ... ]"
**                   11   'split             "split /N E ..."
**                   12   'unnest            "unnest /P"
**                   13   'up                "up /N"
**                   
**    6   'vanilla   /n   /name              /usage
**                   ---- ------------------ -----------------------------------------------------------
**                   1    'assn              "assn /P ... -to N."
**                   2    'both              "both R"
**                   3    'check-term        "check-term [ -just /N ... | -has /N ... | -but /N ... ]"
**                   4    'compose           "compose R"
**                   5    'const             "const R"
**                   6    'dump              'dump
**                   7    'duplicate         "duplicate /N ..."
**                   8    'fix               "fix R"
**                   9    'fix-join          "fix-join R"
**                   10   'if                "if R ..."
**                   11   'maybe             "maybe R"
**                   12   'member            "member /N /N"
**                   13   'number            "number /N -order /N ..."
**                   14   'prefix            "prefix /P /N ..."
**                   15   'prefix-change     "prefix-change /P /Q"
**                   16   'rank              "rank /N -order /N ..."
**                   17   'rdf               "rdf P /S /O"
**                   18   'repeat            "repeat N R"
**                   19   'size              "size /N"
**                   20   'typename          "typename /N /P ..."
**                   21   'unassn            "unassn /P -only /P ..."
**                   22   'unless            "unless R R"
**                   23   'unprefix          "unprefix /P"
**                   24   'when              "when R R"
**                   

**
**  SUMMARY
**       6 judges on ROP
**       6 judges in total
**
```



## command

This document is produced by the command:

```
koshu-inout.sh -s -g koshu
```
