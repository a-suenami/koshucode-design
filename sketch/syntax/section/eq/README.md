# I/O List

- koshu [eq.k](#eqk)
- koshu [eqq.k](#eqqk)
- koshu [eqqq.k](#eqqqk)
- koshu [eqqqq.k](#eqqqqk)



## [eq.k](eq.k)

```
= rel
```

Command `koshu eq.k` exits with 2 and produces:

```
**
**  ABORTED  Unexpedted section delimiter
**  -------- --------------------------------------- ---------
**  Detail   === rel      for relational calculation
**           === note     for commentary section
**           === license  for license section
**           === end      for ending of input
**
**  Source   1.0 eq.k
**             = rel                                 .. clause
**
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
**
**  ABORTED  Unexpedted section delimiter
**  -------- --------------------------------------- ---------
**  Detail   === rel      for relational calculation
**           === note     for commentary section
**           === license  for license section
**           === end      for ending of input
**
**  Source   1.0 eqq.k
**             == rel                                .. clause
**
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
**  OUTPUT
**    <stdout>
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
**
**  ABORTED  Unexpedted section delimiter
**  -------- --------------------------------------- ---------
**  Detail   === rel      for relational calculation
**           === note     for commentary section
**           === license  for license section
**           === end      for ending of input
**
**  Source   1.0 eqqqq.k
**             ==== rel                              .. clause
**
**  Command  koshu
**           eqqqq.k
**
**  Exit with status 2
**
```



## command

This document is produced by the command:

```
koshu-inout.sh -r -g koshu
```
