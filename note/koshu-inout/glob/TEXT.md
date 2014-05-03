# I/O List

- od -ta [alphabet.txt](#alphabettxt)
- od -ta [digit.txt](#digittxt)



## [alphabet.txt](alphabet.txt)

```
abcdefg hijklmn opqrstu vwxyz
```

Command `od -ta alphabet.txt` produces:

```
0000000    a   b   c   d   e   f   g  sp   h   i   j   k   l   m   n  sp
0000020    o   p   q   r   s   t   u  sp   v   w   x   y   z  nl        
0000036
```



## [digit.txt](digit.txt)

```
0123456789
```

Command `od -ta digit.txt` produces:

```
0000000    0   1   2   3   4   5   6   7   8   9  nl                    
0000013
```



## command

This document is produced by the command:

```
koshu-inout.sh -o TEXT.md -x txt -g od -ta
```
