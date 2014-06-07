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

|-- ROP  /n 1  /group 'builtin  /rop {| /n : /name : /usage | 1 : 'append : "append R ..." | 2 : 'id : 'id |}
|-- ROP  /n 2  /group 'check  /rop {| /n : /name : /usage | 1 : 'check-term : "check-term [-just /N ... | -has /N ... | -but /N ...]" | 2 : 'dump : 'dump | 3 : 'duplicate : "duplicate /N ..." |}
|-- ROP  /n 3  /group 'control  /rop {| /n : /name : /usage | 1 : 'fix : "fix R" | 2 : 'fix-join : "fix-join R" | 3 : 'if : "if R ..." | 4 : 'repeat : "repeat N R" | 5 : 'unless : "unless R R" | 6 : 'when : "when R R" |}
|-- ROP  /n 4  /group 'cox  /rop {| /n : /name : /usage | 1 : 'add : "add /N E ..." | 2 : 'keep : "keep E" | 3 : 'omit : "omit E" | 4 : 'range : "range /N -from E -to E" | 5 : 'split : "split /N E ..." | 6 : 'subst : "subst /N E ..." |}
|-- ROP  /n 5  /group 'gadget  /rop {| /n : /name : /usage | 1 : 'contents : "contents /N" | 2 : 'empty : 'empty | 3 : 'number : "number /N -order /N ..." | 4 : 'rank : "rank /N -order /N ..." | 5 : 'size : "size /N" |}

|-- ROP  /n 6  /group 'lattice  /rop {| /n : /name : /usage | 1 : 'both : "both R" | 2 : 'compose : "compose R" | 3 : 'equal : 'equal | 4 : 'join : "join R" | 5 : 'maybe : "maybe R" | 6 : 'meet : "meet R" | 7 : 'none : "none R" | 8 : 'some : "some R" | 9 : 'sub : "sub R" |}
|-- ROP  /n 7  /group 'meta  /rop {| /n : /name : /usage | 1 : 'koshu-cop : "koshu-cop /N" | 2 : 'koshu-cop-infix : "koshu-cop-infix /N [ -height /N ][ -dir /N ]" | 3 : 'koshu-rop : "koshu-rop /N /N" | 4 : 'koshu-version : "koshu-version /N" |}
|-- ROP  /n 8  /group 'nest  /rop {| /n : /name : /usage | 1 : 'chunk : "chunk /T ... [-order /P ...]" | 2 : 'copy : "copy N R" | 3 : 'down : "down /N" | 4 : 'for : "for /N R [ -with /N ... ]" | 5 : 'group : "group /N R" | 6 : 'group-by : "group-by /N R" | 7 : 'join-up : "join-up /P ..." | 8 : 'nest : "nest [~] /P ... -to /N" | 9 : 'slice : "slice /N [R] [-with /N ...]" | 10 : 'slice-up : "slice-up R [-with /N ...]" | 11 : 'unnest : "unnest /P" | 12 : 'up : "up /N" |}
|-- ROP  /n 9  /group 'peripheral  /rop {| /n : /name : /usage | 1 : 'assn : "assn /P ... -to N." | 2 : 'member : "member /N /N" | 3 : 'rdf : "rdf P /S /O" | 4 : 'typename : "typename /N /P ..." | 5 : 'unassn : "unassn /P -only /P ..." |}
|-- ROP  /n 10  /group 'source  /rop {| /n : /name : /usage | 1 : 'const : "const R" | 2 : 'dee : 'dee | 3 : 'dum : 'dum | 4 : 'source : "source P /T ..." | 5 : 'source-term : "source-term P R" |}

|-- ROP  /n 11  /group 'term  /rop {| /n : /name : /usage | 1 : 'cut : "cut /P ..." | 2 : 'cut-term : "cut-term /R" | 3 : 'move : "move /P ... -to /N ..." | 4 : 'pick : "pick /P ..." | 5 : 'pick-term : "pick-term /R" | 6 : 'prefix : "prefix /P /N ..." | 7 : 'prefix-change : "prefix-change /P /Q" | 8 : 'rename : "rename /N /P ..." | 9 : 'unprefix : "unprefix /P" |}

*** 11 judges

**  TABLE : ROP
**
**    /n   /group        /rop
**    ---- ------------- ---------------------------------------------------------------------------------
**    1    'builtin      /n   /name              /usage
**                       ---- ------------------ ---------------------------------------------------------
**                       1    'append            "append R ..."
**                       2    'id                'id
**                       
**    2    'check        /n   /name              /usage
**                       ---- ------------------ ---------------------------------------------------------
**                       1    'check-term        "check-term [-just /N ... | -has /N ... | -but /N ...]"
**                       2    'dump              'dump
**                       3    'duplicate         "duplicate /N ..."
**                       
**    3    'control      /n   /name              /usage
**                       ---- ------------------ ---------------------------------------------------------
**                       1    'fix               "fix R"
**                       2    'fix-join          "fix-join R"
**                       3    'if                "if R ..."
**                       4    'repeat            "repeat N R"
**                       5    'unless            "unless R R"
**                       6    'when              "when R R"
**                       
**    4    'cox          /n   /name              /usage
**                       ---- ------------------ ---------------------------------------------------------
**                       1    'add               "add /N E ..."
**                       2    'keep              "keep E"
**                       3    'omit              "omit E"
**                       4    'range             "range /N -from E -to E"
**                       5    'split             "split /N E ..."
**                       6    'subst             "subst /N E ..."
**                       
**    5    'gadget       /n   /name              /usage
**                       ---- ------------------ ---------------------------------------------------------
**                       1    'contents          "contents /N"
**                       2    'empty             'empty
**                       3    'number            "number /N -order /N ..."
**                       4    'rank              "rank /N -order /N ..."
**                       5    'size              "size /N"
**                       
**    6    'lattice      /n   /name              /usage
**                       ---- ------------------ ---------------------------------------------------------
**                       1    'both              "both R"
**                       2    'compose           "compose R"
**                       3    'equal             'equal
**                       4    'join              "join R"
**                       5    'maybe             "maybe R"
**                       6    'meet              "meet R"
**                       7    'none              "none R"
**                       8    'some              "some R"
**                       9    'sub               "sub R"
**                       
**    7    'meta         /n   /name              /usage
**                       ---- ------------------ ---------------------------------------------------------
**                       1    'koshu-cop         "koshu-cop /N"
**                       2    'koshu-cop-infix   "koshu-cop-infix /N [ -height /N ][ -dir /N ]"
**                       3    'koshu-rop         "koshu-rop /N /N"
**                       4    'koshu-version     "koshu-version /N"
**                       
**    8    'nest         /n   /name              /usage
**                       ---- ------------------ ---------------------------------------------------------
**                       1    'chunk             "chunk /T ... [-order /P ...]"
**                       2    'copy              "copy N R"
**                       3    'down              "down /N"
**                       4    'for               "for /N R [ -with /N ... ]"
**                       5    'group             "group /N R"
**                       6    'group-by          "group-by /N R"
**                       7    'join-up           "join-up /P ..."
**                       8    'nest              "nest [~] /P ... -to /N"
**                       9    'slice             "slice /N [R] [-with /N ...]"
**                       10   'slice-up          "slice-up R [-with /N ...]"
**                       11   'unnest            "unnest /P"
**                       12   'up                "up /N"
**                       
**    9    'peripheral   /n   /name              /usage
**                       ---- ------------------ ---------------------------------------------------------
**                       1    'assn              "assn /P ... -to N."
**                       2    'member            "member /N /N"
**                       3    'rdf               "rdf P /S /O"
**                       4    'typename          "typename /N /P ..."
**                       5    'unassn            "unassn /P -only /P ..."
**                       
**    10   'source       /n   /name              /usage
**                       ---- ------------------ ---------------------------------------------------------
**                       1    'const             "const R"
**                       2    'dee               'dee
**                       3    'dum               'dum
**                       4    'source            "source P /T ..."
**                       5    'source-term       "source-term P R"
**                       
**    11   'term         /n   /name              /usage
**                       ---- ------------------ ---------------------------------------------------------
**                       1    'cut               "cut /P ..."
**                       2    'cut-term          "cut-term /R"
**                       3    'move              "move /P ... -to /N ..."
**                       4    'pick              "pick /P ..."
**                       5    'pick-term         "pick-term /R"
**                       6    'prefix            "prefix /P /N ..."
**                       7    'prefix-change     "prefix-change /P /Q"
**                       8    'rename            "rename /N /P ..."
**                       9    'unprefix          "unprefix /P"
**                       

**
**  SUMMARY
**      11 judges on ROP
**      11 judges in total
**
```



## command

This document is produced by the command:

```
koshu-inout.sh -s -g koshu
```
