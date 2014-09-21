# I/O List

- koshu [koshu-angle-text.k](#koshu-angle-textk)



## [koshu-angle-text.k](koshu-angle-text.k)

```
** -*- koshu -*-
**
**  DESCRIPTION
**    List angle texts.
**    Angle texts are named texts
**    enclosed in angle brackets, e.g., <tab>.
**

|== ANGLE -table -fore /name /text /code
    | koshu-angle-text /name /text
    | add /code ( code-list /text )
```

Command `koshu koshu-angle-text.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    koshu-angle-text.k
**

|-- ANGLE  /name '<colon>  /text ":"  /code [ 58 ]
|-- ANGLE  /name '<comma>  /text ","  /code [ 44 ]
|-- ANGLE  /name '<cr>  /text <cr>  /code [ 13 ]
|-- ANGLE  /name '<crlf>  /text <crlf>  /code [ 13 : 10 ]
|-- ANGLE  /name '<dot>  /text '.  /code [ 46 ]

|-- ANGLE  /name '<lf>  /text <lf>  /code [ 10 ]
|-- ANGLE  /name '<q>  /text "'"  /code [ 39 ]
|-- ANGLE  /name '<qq>  /text <qq>  /code [ 34 ]
|-- ANGLE  /name '<semicolon>  /text ";"  /code [ 59 ]
|-- ANGLE  /name '<sp>  /text " "  /code [ 32 ]

|-- ANGLE  /name '<tab>  /text <tab>  /code [ 9 ]

*** 11 judges

**  TABLE : ANGLE
**
**    /name          /text    /code
**    -------------- -------- -------------
**    '<colon>       ":"      [ 58 ]
**    '<comma>       ","      [ 44 ]
**    '<cr>          <cr>     [ 13 ]
**    '<crlf>        <crlf>   [ 13 : 10 ]
**    '<dot>         '.       [ 46 ]
**    '<lf>          <lf>     [ 10 ]
**    '<q>           "'"      [ 39 ]
**    '<qq>          <qq>     [ 34 ]
**    '<semicolon>   ";"      [ 59 ]
**    '<sp>          " "      [ 32 ]
**    '<tab>         <tab>    [ 9 ]

**
**  SUMMARY
**      11 judges on ANGLE
**      11 judges in total
**
```



## command

This document is produced by the command:

```
koshu-inout.sh -r -g koshu
```
