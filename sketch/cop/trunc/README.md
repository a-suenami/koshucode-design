# I/O List

- koshu [trunc.k](#trunck)



## [trunc.k](trunc.k)

```
** -*- koshu -*-
**
**  trunc N
**  trunc-at L N
**  trunc-per P N
**

|-- INT  /int -2
|-- INT  /int -1
|-- INT  /int 0
|-- INT  /int 1
|-- INT  /int 2

|-- FRAC  /frac 0.0
|-- FRAC  /frac 0.1
|-- FRAC  /frac 0.2
|-- FRAC  /frac 0.4
|-- FRAC  /frac 0.6
|-- FRAC  /frac 0.8

|== ROUND : source INT /int
  | meet ( source FRAC /frac )
  | add /n     ( /int + /frac )
  | add /trunc ( trunc ( 0 .+ /n ))
        /at    ( trunc-at  0  /n )
        /per   ( trunc-per 1  /n )
  | hier /trunc /at /per -to /g
  | add /ns    ( sort /g/n )
  | add /from  ( min /ns )
        /to    ( max /ns )
  | cut /g
  --table --order --backward /from /to /ns

```

Command `koshu trunc.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    trunc.k
**
**  OUTPUT
**    <stdout>
**

|-- ROUND  /trunc -2  /at -2  /per -2  /from -2.0  /to -2.0  /ns [ -2.0 ]
|-- ROUND  /trunc -1  /at -1  /per -1  /from -1.9  /to -1.0  /ns [ -1.9 | -1.8 | -1.6 | -1.4 | -1.2 | -1.0 ]
|-- ROUND  /trunc 0  /at 0  /per 0  /from -0.9  /to 0.8  /ns [ -0.9 | -0.8 | -0.6 | -0.4 | -0.2 | 0.0 | 0.1 | 0.2 | 0.4
    | 0.6 | 0.8 ]
|-- ROUND  /trunc 1  /at 1  /per 1  /from 1.0  /to 1.8  /ns [ 1.0 | 1.1 | 1.2 | 1.4 | 1.6 | 1.8 ]
|-- ROUND  /trunc 2  /at 2  /per 2  /from 2.0  /to 2.8  /ns [ 2.0 | 2.1 | 2.2 | 2.4 | 2.6 | 2.8 ]

*** 5 judges

=== note

TABLE : ROUND

  /trunc /at  /per /from  /to    /ns
  ------ ---- ---- ------ ------ --------------------------------------------------------------------------
  -2     -2   -2   -2.0   -2.0   [ -2.0 ]
  -1     -1   -1   -1.9   -1.0   [ -1.9 | -1.8 | -1.6 | -1.4 | -1.2 | -1.0 ]
  0      0    0    -0.9   0.8    [ -0.9 | -0.8 | -0.6 | -0.4 | -0.2 | 0.0 | 0.1 | 0.2 | 0.4 | 0.6 | 0.8 ]
  1      1    1    1.0    1.8    [ 1.0 | 1.1 | 1.2 | 1.4 | 1.6 | 1.8 ]
  2      2    2    2.0    2.8    [ 2.0 | 2.1 | 2.2 | 2.4 | 2.6 | 2.8 ]

=== rel

**
**  SUMMARY
**       5 judges on ROUND
**       5 judges in total
**
```



## command

This document is produced by the command:

```
koshu-inout.sh -r -g koshu
```
