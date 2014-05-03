# I/O List

- [./temp.sh](#/tempsh)
- [output](#output)



## [./temp.sh](./temp.sh)

```
#!/bin/sh
for temp in TEMP-KOSHU-*; do
    echo "A temporary file exists."
done
```



## output


Command `./temp.sh` produces:

```
A temporary file exists.
A temporary file exists.
```



## command

This document is produced by the command:

```
koshu-inout.sh -o A.md -t ./temp.sh
```
