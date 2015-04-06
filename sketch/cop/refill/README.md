# I/O List

- koshu [refill.k](#refillk)



## [refill.k](refill.k)

```
** -*- koshu -*-
**
**  DESCRIPTION
**    F of X  ==  F X
**    X to F  ==  F X
**

|== P : add /x ( times ( 1 + 2 )( 3 + 4 ))
            /y ( double ( double ( double ( 5 + 6 ))))
        -where times x y = x * y
             : double x  = 2 * x

|== Q : add /x ( times of 1 + 2 of 3 + 4 )
            /y ( 5 + 6 to double to double to double )
        -where times x y = x * y
             : double x  = 2 * x
```

Command `koshu refill.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    refill.k
**
**  OUTPUT
**    <stdout>
**

|-- P  /x 21  /y 88

*** 1 judge 

|-- Q  /x 21  /y 88

*** 1 judge 

**
**  SUMMARY
**       1 judge  on P
**       1 judge  on Q
**       2 judges in total
**
```



## command

This document is produced by the command:

```
koshu-inout.sh -r -g koshu
```
