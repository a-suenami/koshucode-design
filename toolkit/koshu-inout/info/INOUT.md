# I/O List

- koshu-inout.sh [-V](#-v)
- koshu-inout.sh [-h](#-h)



## -V


Command `koshu-inout.sh -V` produces:

```
koshu-inout-0.97
```



## -h


Command `koshu-inout.sh -h` produces:

```
DESCRIPTION
  Generate I/O list

USAGE
  koshu-inout.sh [OPTION ...] COMMAND ARG ...

OPTION
  -d          show all differences against last I/O list
  -f FILE     take command lines from FILE
  -g          glob input files by *.k
  -h          print help message
  -l          link to I/O list
  -o FILE.md  save document to FILE.md
  -r          save document to README.md
  -s          save document to INOUT.md
  -t          do not delete temporary files
  -V          print version of this program
  -u          update differences without prompt
  -x EXT      use EXTension instead of *.k

EXAMPLE
  koshu-inout.sh -r -g koshu CALC.k
  koshu-inout.sh -o CALC.md -f FILE koshu CALC.k
  koshu-inout.sh koshu CALC.k DATA.k

```



## command

This document is produced by the command:

```
koshu-inout.sh -s -f option koshu-inout.sh
```
