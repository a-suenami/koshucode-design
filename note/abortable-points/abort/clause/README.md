# I/O List

- koshu [dup-prefix.k](#dup-prefixk)
- koshu [dup-replace.k](#dup-replacek)
- koshu [unk-clause-frege.k](#unk-clause-fregek)
- koshu [unk-clause-judge.k](#unk-clause-judgek)
- koshu [unk-clause-pattern.k](#unk-clause-patternk)
- koshu [unk-clause.k](#unk-clausek)
- koshu [unres-prefix.k](#unres-prefixk)



## [dup-prefix.k](dup-prefix.k)

```
short
  a "apple-"
  a "apple-"
```

Command `koshu dup-prefix.k` exits with 2 and produces:

```
** -*- koshu -*-
**
**  INPUT
**    dup-prefix.k
**

**
**  ABORTED  Duplicate prefix
**  -------- ---------------- ---------
**  Detail   a
**  Source   1 0 dup-prefix.k
**           > short          .. clause
**  Command  koshu
**           dup-prefix.k
**
**  Exit with status 2
**
```



## [dup-replace.k](dup-replace.k)

```
short
  a "apple-"
  b "apple-"
```

Command `koshu dup-replace.k` exits with 2 and produces:

```
** -*- koshu -*-
**
**  INPUT
**    dup-replace.k
**

**
**  ABORTED  Duplicate replacement
**  -------- --------------------- ---------
**  Detail   apple-
**  Source   1 0 dup-replace.k
**           > short               .. clause
**  Command  koshu
**           dup-replace.k
**
**  Exit with status 2
**
```



## [unk-clause-frege.k](unk-clause-frege.k)

```
|-s P /a 0
```

Command `koshu unk-clause-frege.k` exits with 2 and produces:

```
** -*- koshu -*-
**
**  INPUT
**    unk-clause-frege.k
**

**
**  ABORTED  Unknown clause
**  -------- -------------------------------------- ---------
**  Detail   Expect |--, |-x, |-xx, |-c, |-cc, |-v,
**                    or |=x, |=xx, |=c, |=cc, |=v
**           Actual |-s
**  Source   1 0 unk-clause-frege.k
**           > |-s P /a 0                           .. clause
**  Command  koshu
**           unk-clause-frege.k
**
**  Exit with status 2
**
```



## [unk-clause-judge.k](unk-clause-judge.k)

```
|--
```

Command `koshu unk-clause-judge.k` exits with 2 and produces:

```
** -*- koshu -*-
**
**  INPUT
**    unk-clause-judge.k
**

**
**  ABORTED  Unknown clause
**  -------- ------------------------ ---------
**  Detail   Give a judgement pattern
**  Source   1 0 unk-clause-judge.k
**           > |--                    .. clause
**  Command  koshu
**           unk-clause-judge.k
**
**  Exit with status 2
**
```



## [unk-clause-pattern.k](unk-clause-pattern.k)

```
|-- []
```

Command `koshu unk-clause-pattern.k` exits with 2 and produces:

```
** -*- koshu -*-
**
**  INPUT
**    unk-clause-pattern.k
**

**
**  ABORTED  Unknown clause
**  -------- ----------------------------- ---------
**  Detail   Use text in judgement pattern
**  Source   1 4 unk-clause-pattern.k
**           > []                          .. clause
**  Command  koshu
**           unk-clause-pattern.k
**
**  Exit with status 2
**
```



## [unk-clause.k](unk-clause.k)

```
xxx
```

Command `koshu unk-clause.k` exits with 2 and produces:

```
** -*- koshu -*-
**
**  INPUT
**    unk-clause.k
**

**
**  ABORTED  Unknown clause
**  -------- ---------------- ---------
**  Source   1 0 unk-clause.k
**           > xxx            .. clause
**  Command  koshu
**           unk-clause.k
**
**  Exit with status 2
**
```



## [unres-prefix.k](unres-prefix.k)

```
|-- P /a a.xxx
```

Command `koshu unres-prefix.k` exits with 2 and produces:

```
** -*- koshu -*-
**
**  INPUT
**    unres-prefix.k
**

**
**  ABORTED  Unresolved prefix
**  -------- -------------------------------------- ---------
**  Detail   Require short definition : short a ...
**  Source   1 9 unres-prefix.k
**           > a.xxx                                .. clause
**  Command  koshu
**           unres-prefix.k
**
**  Exit with status 2
**
```



## command

This document is produced by the command:

```
koshu-inout.sh -r -g koshu
```
