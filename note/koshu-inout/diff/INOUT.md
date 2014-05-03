# I/O List

- [A.md](#amd)
- [abc](#abc)
- [output](#output)



## [A.md](A.md)

```
# I/O List

- [abc](#abc)
- [output](#output)



## [abc](abc)

---
aaa
ccc
dd
eee
fff
ggg
---



## output


Command `od -ta abc` produces:

---
0000000    a   a   a  nl   b   b   b  nl   c   c   c  nl   d   d   d  nl
0000020    e   e   e  nl   f   f   f  nl   g   g   g  nl                
0000034
---



## command

This document is produced by the command:

---
koshu-inout.sh -o A.md od -ta abc
---
```



## [abc](abc)

```
aaa
bbb
ccc
ddd
eee
fff
ggg
```



## output


Command `koshu-inout.sh -d -o A.md od -ta abc` exits with 2 and produces:

```

* DIFF – A.md in  / Users / katsu / web / github / koshucode-design / note / koshu-inout / diff

Differences are found:

```
Changed from
 - 0010 | ---
to
 + 0010 | ```

Added
 + 0012 | bbb

Changed from
 - 0013 | dd
to
 + 0014 | ddd

Changed from
 - 0017 | ---
to
 + 0018 | ```

Changed from
 - 0026 | ---
to
 + 0027 | ```

Changed from
 - 0030 | ---
to
 + 0031 | ```

Changed from
 - 0038 | ---
to
 + 0039 | ```

Changed from
 - 0040 | ---
to
 + 0041 | ```

```

To show all differences, please give more -d flags.
To examine this differences, type: cd /Users/katsu/web/github/koshucode-design/note/koshu-inout/diff

```



## command

This document is produced by the command:

```
koshu-inout.sh -s koshu-inout.sh -o A.md od -ta abc
```
