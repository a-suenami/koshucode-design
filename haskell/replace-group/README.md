# I/O List

- [./replace-group.sh](#replace-groupsh)
- [output](#output)



## [./replace-group.sh](./replace-group.sh)

```
#!/bin/sh
runhaskell replace-group.hs <<EOF
** Examples of 'shortenGroup'
abc (xyz) def [xyz] gh
abc (x (y) [z]) def
abc (x (y [z]) def
abc (x (y z]) def

** Example of 'deleteTag'
-abc <t>xyz</t> def
EOF
```



## output


Command `./replace-group.sh` produces:

```
** Examples of 'shortenGroup'
abc () def [] gh
abc () def
abc (x (y [z]) def
abc () def

** Example of 'deleteTag'
abc xyz def
```



## command

This document is produced by the command:

```
koshu-inout.sh -r ./replace-group.sh
```
