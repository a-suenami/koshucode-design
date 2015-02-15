# I/O List

- [crlf.txt](#crlftxt)
- [empty.txt](#emptytxt)
- [lf.txt](#lftxt)
- [mix.txt](#mixtxt)
- [none.txt](#nonetxt)
- [output](#output)



## [crlf.txt](crlf.txt)

```
This line ends with CRLF.
This line ends with CRLF.
```



## [empty.txt](empty.txt)

```
```



## [lf.txt](lf.txt)

```
This line ends with LF.
This line ends with LF.
```



## [mix.txt](mix.txt)

```
This line ends with LF.
This line ends with CRLF.
This line ends with LF.
This line ends without a newline character.
```



## [none.txt](none.txt)

```
This file has no newline characters.
```



## output


Command `crlf.sh crlf.txt empty.txt lf.txt mix.txt none.txt` produces:

```
CRLF  crlf.txt
LF    empty.txt
LF    lf.txt
CRLF  mix.txt
LF    none.txt
```



## command

This document is produced by the command:

```
koshu-inout.sh -r crlf.sh crlf.txt empty.txt lf.txt mix.txt none.txt
```
