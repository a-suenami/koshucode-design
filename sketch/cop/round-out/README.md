# I/O List

- koshu [round-out.k](#round-outk)



## [round-out.k](round-out.k)

```
** -*- koshu -*-
**
**  DECSRIPTION
**    Round toward infinity
**
**  OPERATOR
**    round-out N
**    round-out-at L N
**    round-out-per P N
**

|== ROUND : zero | join pos | join neg
  | add /in    ( trunc /n )
        /out   ( round-out /n )
        /at    ( list ( round-out-at 0 /n )
                      ( round-out-at 1 /n )
                      ( round-out-at 2 /n ))
        /per   ( round-out-per 0.01 /n )
        /error ( trunc-error /n <> 0 )
  --order --forward /n /in /out /error /at /per

zero : add /n 0.00

pos : dee
  | range /d -from 1 -to 10
  | add /n ( 0.00 + 1 div /d )
  | pick /n

neg : pos | subst /n ( - /n )

```

Command `koshu round-out.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    round-out.k
**
**  OUTPUT
**    <stdout>
**

|-- ROUND  /n -1.00  /in -1.00  /out -1.00  /error (-)  /at [ -1 | -1.0 | -1.00 ]  /per -1.00
|-- ROUND  /n -0.50  /in -0.50  /out -0.50  /error (-)  /at [ -1 | -0.5 | -0.50 ]  /per -0.50
|-- ROUND  /n -0.33  /in -0.33  /out -0.34  /error (+)  /at [ -1 | -0.4 | -0.34 ]  /per -0.34
|-- ROUND  /n -0.25  /in -0.25  /out -0.25  /error (-)  /at [ -1 | -0.3 | -0.25 ]  /per -0.25
|-- ROUND  /n -0.20  /in -0.20  /out -0.20  /error (-)  /at [ -1 | -0.2 | -0.20 ]  /per -0.20

|-- ROUND  /n -0.16  /in -0.16  /out -0.17  /error (+)  /at [ -1 | -0.2 | -0.17 ]  /per -0.17
|-- ROUND  /n -0.14  /in -0.14  /out -0.15  /error (+)  /at [ -1 | -0.2 | -0.15 ]  /per -0.15
|-- ROUND  /n -0.12  /in -0.12  /out -0.13  /error (+)  /at [ -1 | -0.2 | -0.13 ]  /per -0.13
|-- ROUND  /n -0.11  /in -0.11  /out -0.12  /error (+)  /at [ -1 | -0.2 | -0.12 ]  /per -0.12
|-- ROUND  /n -0.10  /in -0.10  /out -0.10  /error (-)  /at [ -1 | -0.1 | -0.10 ]  /per -0.10

|-- ROUND  /n 0.00  /in 0.00  /out 0.00  /error (-)  /at [ 0 | 0.0 | 0.00 ]  /per 0.00
|-- ROUND  /n 0.10  /in 0.10  /out 0.10  /error (-)  /at [ 1 | 0.1 | 0.10 ]  /per 0.10
|-- ROUND  /n 0.11  /in 0.11  /out 0.12  /error (+)  /at [ 1 | 0.2 | 0.12 ]  /per 0.12
|-- ROUND  /n 0.12  /in 0.12  /out 0.13  /error (+)  /at [ 1 | 0.2 | 0.13 ]  /per 0.13
|-- ROUND  /n 0.14  /in 0.14  /out 0.15  /error (+)  /at [ 1 | 0.2 | 0.15 ]  /per 0.15

|-- ROUND  /n 0.16  /in 0.16  /out 0.17  /error (+)  /at [ 1 | 0.2 | 0.17 ]  /per 0.17
|-- ROUND  /n 0.20  /in 0.20  /out 0.20  /error (-)  /at [ 1 | 0.2 | 0.20 ]  /per 0.20
|-- ROUND  /n 0.25  /in 0.25  /out 0.25  /error (-)  /at [ 1 | 0.3 | 0.25 ]  /per 0.25
|-- ROUND  /n 0.33  /in 0.33  /out 0.34  /error (+)  /at [ 1 | 0.4 | 0.34 ]  /per 0.34
|-- ROUND  /n 0.50  /in 0.50  /out 0.50  /error (-)  /at [ 1 | 0.5 | 0.50 ]  /per 0.50

|-- ROUND  /n 1.00  /in 1.00  /out 1.00  /error (-)  /at [ 1 | 1.0 | 1.00 ]  /per 1.00

*** 21 judges

**
**  SUMMARY
**      21 judges on ROUND
**      21 judges in total
**
```



## command

This document is produced by the command:

```
koshu-inout.sh -r -g koshu
```
