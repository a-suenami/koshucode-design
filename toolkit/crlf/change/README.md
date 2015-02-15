# I/O List


Prepare

-  [./prepare.sh](#preparesh)
-  [od -ta A.txt](#od--ta-atxt)
-  [od -ta B.txt](#od--ta-btxt)

LF to CRLF

-  [crlf.sh A.txt B.txt](#crlfsh-atxt-btxt)
-  [crlf.sh -c A.txt B.txt](#crlfsh--c-atxt-btxt)
-  [od -ta A.txt](#od--ta-atxt)
-  [od -ta B.txt](#od--ta-btxt)

CRLF to LF

-  [crlf.sh A.txt B.txt](#crlfsh-atxt-btxt)
-  [crlf.sh -b A.txt B.txt](#crlfsh--b-atxt-btxt)
-  [od -ta A.txt](#od--ta-atxt)
-  [od -ta B.txt](#od--ta-btxt)

# Prepare




## ./prepare.sh

```
#!/bin/sh

( echo "AAA"
  echo "AA AAA"
) > A.txt

( echo "BBB"
  echo "BB BBB"
) > B.txt
```

Command `./prepare.sh` produces:

```
```



## od -ta A.txt

```
AAA
AA AAA
```

Command `od -ta A.txt` produces:

```
0000000    A   A   A  nl   A   A  sp   A   A   A  nl                    
0000013
```



## od -ta B.txt

```
BBB
BB BBB
```

Command `od -ta B.txt` produces:

```
0000000    B   B   B  cr  nl   B   B  sp   B   B   B  cr  nl            
0000015
```

# LF to CRLF




## crlf.sh A.txt B.txt

```
AAA
AA AAA
```
```
BBB
BB BBB
```

Command `crlf.sh A.txt B.txt` produces:

```
LF    A.txt
CRLF  B.txt
```



## crlf.sh -c A.txt B.txt

```
AAA
AA AAA
```
```
BBB
BB BBB
```

Command `crlf.sh -c A.txt B.txt` produces:

```
Convert LF to CRLF : A.txt
```



## od -ta A.txt

```
AAA
AA AAA
```

Command `od -ta A.txt` produces:

```
0000000    A   A   A  cr  nl   A   A  sp   A   A   A  cr  nl            
0000015
```



## od -ta B.txt

```
BBB
BB BBB
```

Command `od -ta B.txt` produces:

```
0000000    B   B   B  cr  nl   B   B  sp   B   B   B  cr  nl            
0000015
```

# CRLF to LF




## crlf.sh A.txt B.txt

```
AAA
AA AAA
```
```
BBB
BB BBB
```

Command `crlf.sh A.txt B.txt` produces:

```
CRLF  A.txt
CRLF  B.txt
```



## crlf.sh -b A.txt B.txt

```
AAA
AA AAA
```
```
BBB
BB BBB
```

Command `crlf.sh -b A.txt B.txt` produces:

```
Convert CRLF to LF : A.txt
Convert CRLF to LF : B.txt
```



## od -ta A.txt

```
AAA
AA AAA
```

Command `od -ta A.txt` produces:

```
0000000    A   A   A  nl   A   A  sp   A   A   A  nl                    
0000013
```



## od -ta B.txt

```
BBB
BB BBB
```

Command `od -ta B.txt` produces:

```
0000000    B   B   B  nl   B   B  sp   B   B   B  nl                    
0000013
```



## command

This document is produced by the command:

```
koshu-inout.sh -r -f command
```
