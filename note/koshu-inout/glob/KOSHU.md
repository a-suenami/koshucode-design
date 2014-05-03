# I/O List

- od -ta [alphabet.k](#alphabetk)
- od -ta [digit.k](#digitk)



## [alphabet.k](alphabet.k)

```
** -*- koshu -*-

|-- ALPHABET  /line "abcdefg"
|-- ALPHABET  /line "hijklmn"
|-- ALPHABET  /line "opqrstu"
|-- ALPHABET  /line "vwxyz"
```

Command `od -ta alphabet.k` produces:

```
0000000    *   *  sp   -   *   -  sp   k   o   s   h   u  sp   -   *   -
0000020   nl  nl   |   -   -  sp   A   L   P   H   A   B   E   T  sp  sp
0000040    /   l   i   n   e  sp   "   a   b   c   d   e   f   g   "  nl
0000060    |   -   -  sp   A   L   P   H   A   B   E   T  sp  sp   /   l
0000100    i   n   e  sp   "   h   i   j   k   l   m   n   "  nl   |   -
0000120    -  sp   A   L   P   H   A   B   E   T  sp  sp   /   l   i   n
0000140    e  sp   "   o   p   q   r   s   t   u   "  nl   |   -   -  sp
0000160    A   L   P   H   A   B   E   T  sp  sp   /   l   i   n   e  sp
0000200    "   v   w   x   y   z   "  nl                                
0000210
```



## [digit.k](digit.k)

```
** -*- koshu -*-

|-- DIGIT  /char "0"  /number 0
|-- DIGIT  /char "1"  /number 1
|-- DIGIT  /char "2"  /number 2
|-- DIGIT  /char "3"  /number 3
|-- DIGIT  /char "4"  /number 4
|-- DIGIT  /char "5"  /number 5
|-- DIGIT  /char "6"  /number 6
|-- DIGIT  /char "7"  /number 7
|-- DIGIT  /char "8"  /number 8
|-- DIGIT  /char "9"  /number 9
```

Command `od -ta digit.k` produces:

```
0000000    *   *  sp   -   *   -  sp   k   o   s   h   u  sp   -   *   -
0000020   nl  nl   |   -   -  sp   D   I   G   I   T  sp  sp   /   c   h
0000040    a   r  sp   "   0   "  sp  sp   /   n   u   m   b   e   r  sp
0000060    0  nl   |   -   -  sp   D   I   G   I   T  sp  sp   /   c   h
0000100    a   r  sp   "   1   "  sp  sp   /   n   u   m   b   e   r  sp
0000120    1  nl   |   -   -  sp   D   I   G   I   T  sp  sp   /   c   h
0000140    a   r  sp   "   2   "  sp  sp   /   n   u   m   b   e   r  sp
0000160    2  nl   |   -   -  sp   D   I   G   I   T  sp  sp   /   c   h
0000200    a   r  sp   "   3   "  sp  sp   /   n   u   m   b   e   r  sp
0000220    3  nl   |   -   -  sp   D   I   G   I   T  sp  sp   /   c   h
0000240    a   r  sp   "   4   "  sp  sp   /   n   u   m   b   e   r  sp
0000260    4  nl   |   -   -  sp   D   I   G   I   T  sp  sp   /   c   h
0000300    a   r  sp   "   5   "  sp  sp   /   n   u   m   b   e   r  sp
0000320    5  nl   |   -   -  sp   D   I   G   I   T  sp  sp   /   c   h
0000340    a   r  sp   "   6   "  sp  sp   /   n   u   m   b   e   r  sp
0000360    6  nl   |   -   -  sp   D   I   G   I   T  sp  sp   /   c   h
0000400    a   r  sp   "   7   "  sp  sp   /   n   u   m   b   e   r  sp
0000420    7  nl   |   -   -  sp   D   I   G   I   T  sp  sp   /   c   h
0000440    a   r  sp   "   8   "  sp  sp   /   n   u   m   b   e   r  sp
0000460    8  nl   |   -   -  sp   D   I   G   I   T  sp  sp   /   c   h
0000500    a   r  sp   "   9   "  sp  sp   /   n   u   m   b   e   r  sp
0000520    9  nl                                                        
0000522
```



## command

This document is produced by the command:

```
koshu-inout.sh -o KOSHU.md -g od -ta
```
