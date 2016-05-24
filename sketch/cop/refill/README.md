# I/O List

- koshu [refill.k](#refillk)



## [refill.k](refill.k)

```
** -*- koshu -*-
**
**  DESCRIPTION
**    G of F of X  ==  G ( F X )
**    X to F to G  ==  G ( F X )
**

|== P : add /of ( double of double of double of 5 + 6 )
            /to ( 5 + 6 to double to double to double )
            /paren ( double ( double ( double ( 5 + 6 ))))
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

|-- P  /of 88  /to 88  /paren 88

*** 1 judge 

**
**  SUMMARY
**       1 judge  on P
**       1 judge  in total
**
```



## command

This document is produced by the command:

```
koshu-inout.sh -r -g koshu
```
