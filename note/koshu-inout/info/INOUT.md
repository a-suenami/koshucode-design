# I/O List

- koshu-inout.sh [-V](#-v)
- koshu-inout.sh [-h](#-h)



## -V


Command `koshu-inout.sh -V` produces:

```
koshu-inout-0.54
```



## -h


Command `koshu-inout.sh -h` produces:

```
DESCRIPTION
  Generate I/O list

USAGE
  koshu-inout.sh [OPTION ...] koshu FILE.k ...

OPTION
  -d          show differences from last document
  -f FILE     take input files from FILE
  -g          glob input files by *.k
  -h          print help message
  -l          link to I/O list when -d specified
  -o FILE.md  save document to FILE.md
  -r          save document to README.md
  -s          save document to INOUT.md
  -t          do not delete temporary files
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
