# I/O List

- koshu [round-to-even.k](#round-to-evenk)
- koshu [round-to-integer.k](#round-to-integerk)



## [round-to-even.k](round-to-even.k)

```
** -*- koshu -*-
**
**  round N           round N per self fractional length
**  round-at L N      round N per given fractional length L
**  round-per U N     round N per unit U
**

|-- INT  /int -2
|-- INT  /int -1
|-- INT  /int 0
|-- INT  /int 1
|-- INT  /int 2
|-- INT  /int 3
|-- INT  /int 4
|-- INT  /int 5

|-- FRAC  /frac 0.00
|-- FRAC  /frac 0.01
|-- FRAC  /frac 0.25
|-- FRAC  /frac 0.49
|-- FRAC  /frac 0.50
|-- FRAC  /frac 0.51
|-- FRAC  /frac 0.75
|-- FRAC  /frac 0.99

|== ROUND : round -self 0 -at 0 -per 1
  --table --order --backward /from /to /ns

round : source INT /int
  | meet ( source FRAC /frac )
  | add /n ( /int + /frac )
  | cut /int /frac
  | add /self ( round of  @self .+ /n )
        /at   ( round-at  @at      /n )
        /per  ( round-per @per     /n )
  | hier /self /at /per -to /g
  | add /ns ( sort /g/n )
  | add /from ( min /ns )
        /to   ( max /ns )
  | cut /g

```

Command `koshu round-to-even.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    round-to-even.k
**
**  OUTPUT
**    <stdout>
**

|-- ROUND  /self -2  /at -2  /per -2  /from -2.00  /to -1.50  /ns [ -2.00 | -1.99 | -1.75 | -1.51 | -1.50 ]
|-- ROUND  /self -1  /at -1  /per -1  /from -1.49  /to -0.50  /ns [ -1.49 | -1.25 | -1.01 | -1.00 | -0.99 | -0.75 | -0.51 | -0.50 ]
|-- ROUND  /self 0  /at 0  /per 0  /from -0.49  /to 0.49  /ns [ -0.49 | -0.25 | -0.01 | 0.00 | 0.01 | 0.25 | 0.49 ]
|-- ROUND  /self 1  /at 1  /per 1  /from 0.50  /to 1.49  /ns [ 0.50 | 0.51 | 0.75 | 0.99 | 1.00 | 1.01 | 1.25 | 1.49 ]
|-- ROUND  /self 2  /at 2  /per 2  /from 1.50  /to 2.49  /ns [ 1.50 | 1.51 | 1.75 | 1.99 | 2.00 | 2.01 | 2.25 | 2.49 ]

|-- ROUND  /self 3  /at 3  /per 3  /from 2.50  /to 3.49  /ns [ 2.50 | 2.51 | 2.75 | 2.99 | 3.00 | 3.01 | 3.25 | 3.49 ]
|-- ROUND  /self 4  /at 4  /per 4  /from 3.50  /to 4.49  /ns [ 3.50 | 3.51 | 3.75 | 3.99 | 4.00 | 4.01 | 4.25 | 4.49 ]
|-- ROUND  /self 5  /at 5  /per 5  /from 4.50  /to 5.49  /ns [ 4.50 | 4.51 | 4.75 | 4.99 | 5.00 | 5.01 | 5.25 | 5.49 ]
|-- ROUND  /self 6  /at 6  /per 6  /from 5.50  /to 5.99  /ns [ 5.50 | 5.51 | 5.75 | 5.99 ]

*** 9 judges

=== note

TABLE : ROUND

  /self /at  /per /from   /to     /ns
  ----- ---- ---- ------- ------- -------------------------------------------------------------------
  -2    -2   -2   -2.00   -1.50   [ -2.00 | -1.99 | -1.75 | -1.51 | -1.50 ]
  -1    -1   -1   -1.49   -0.50   [ -1.49 | -1.25 | -1.01 | -1.00 | -0.99 | -0.75 | -0.51 | -0.50 ]
  0     0    0    -0.49   0.49    [ -0.49 | -0.25 | -0.01 | 0.00 | 0.01 | 0.25 | 0.49 ]
  1     1    1    0.50    1.49    [ 0.50 | 0.51 | 0.75 | 0.99 | 1.00 | 1.01 | 1.25 | 1.49 ]
  2     2    2    1.50    2.49    [ 1.50 | 1.51 | 1.75 | 1.99 | 2.00 | 2.01 | 2.25 | 2.49 ]
  3     3    3    2.50    3.49    [ 2.50 | 2.51 | 2.75 | 2.99 | 3.00 | 3.01 | 3.25 | 3.49 ]
  4     4    4    3.50    4.49    [ 3.50 | 3.51 | 3.75 | 3.99 | 4.00 | 4.01 | 4.25 | 4.49 ]
  5     5    5    4.50    5.49    [ 4.50 | 4.51 | 4.75 | 4.99 | 5.00 | 5.01 | 5.25 | 5.49 ]
  6     6    6    5.50    5.99    [ 5.50 | 5.51 | 5.75 | 5.99 ]

=== rel

**
**  SUMMARY
**       9 judges on ROUND
**       9 judges in total
**
```



## [round-to-integer.k](round-to-integer.k)

```
** -*- koshu -*-
**
**  round N           round N per self fractional length
**  round-at L N      round N per given fractional length L
**  round-per U N     round N per unit U
**

|-- INT  /int -2
|-- INT  /int -1
|-- INT  /int 0
|-- INT  /int 1
|-- INT  /int 2
|-- INT  /int 3
|-- INT  /int 4
|-- INT  /int 5

|-- FRAC  /frac 0.00
|-- FRAC  /frac 0.01
|-- FRAC  /frac 0.25
|-- FRAC  /frac 0.49
|-- FRAC  /frac 0.50
|-- FRAC  /frac 0.51
|-- FRAC  /frac 0.75
|-- FRAC  /frac 0.99

|== ROUND : round -self 0 -at 0 -per 1
  --table --order --backward /from /to /ns

round : source INT /int
  | meet ( source FRAC /frac )
  | add /n ( /int + /frac )
  | cut /int /frac
  | add /self ( round of  @self .+ /n )
        /at   ( round-at  @at      /n )
        /per  ( round-per @per     /n )
  | hier /self /at /per -to /g
  | add /ns ( sort /g/n )
  | add /from ( min /ns )
        /to   ( max /ns )
  | cut /g

```

Command `koshu round-to-integer.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    round-to-integer.k
**
**  OUTPUT
**    <stdout>
**

|-- ROUND  /self -2  /at -2  /per -2  /from -2.00  /to -1.50  /ns [ -2.00 | -1.99 | -1.75 | -1.51 | -1.50 ]
|-- ROUND  /self -1  /at -1  /per -1  /from -1.49  /to -0.50  /ns [ -1.49 | -1.25 | -1.01 | -1.00 | -0.99 | -0.75 | -0.51 | -0.50 ]
|-- ROUND  /self 0  /at 0  /per 0  /from -0.49  /to 0.49  /ns [ -0.49 | -0.25 | -0.01 | 0.00 | 0.01 | 0.25 | 0.49 ]
|-- ROUND  /self 1  /at 1  /per 1  /from 0.50  /to 1.49  /ns [ 0.50 | 0.51 | 0.75 | 0.99 | 1.00 | 1.01 | 1.25 | 1.49 ]
|-- ROUND  /self 2  /at 2  /per 2  /from 1.50  /to 2.49  /ns [ 1.50 | 1.51 | 1.75 | 1.99 | 2.00 | 2.01 | 2.25 | 2.49 ]

|-- ROUND  /self 3  /at 3  /per 3  /from 2.50  /to 3.49  /ns [ 2.50 | 2.51 | 2.75 | 2.99 | 3.00 | 3.01 | 3.25 | 3.49 ]
|-- ROUND  /self 4  /at 4  /per 4  /from 3.50  /to 4.49  /ns [ 3.50 | 3.51 | 3.75 | 3.99 | 4.00 | 4.01 | 4.25 | 4.49 ]
|-- ROUND  /self 5  /at 5  /per 5  /from 4.50  /to 5.49  /ns [ 4.50 | 4.51 | 4.75 | 4.99 | 5.00 | 5.01 | 5.25 | 5.49 ]
|-- ROUND  /self 6  /at 6  /per 6  /from 5.50  /to 5.99  /ns [ 5.50 | 5.51 | 5.75 | 5.99 ]

*** 9 judges

=== note

TABLE : ROUND

  /self /at  /per /from   /to     /ns
  ----- ---- ---- ------- ------- -------------------------------------------------------------------
  -2    -2   -2   -2.00   -1.50   [ -2.00 | -1.99 | -1.75 | -1.51 | -1.50 ]
  -1    -1   -1   -1.49   -0.50   [ -1.49 | -1.25 | -1.01 | -1.00 | -0.99 | -0.75 | -0.51 | -0.50 ]
  0     0    0    -0.49   0.49    [ -0.49 | -0.25 | -0.01 | 0.00 | 0.01 | 0.25 | 0.49 ]
  1     1    1    0.50    1.49    [ 0.50 | 0.51 | 0.75 | 0.99 | 1.00 | 1.01 | 1.25 | 1.49 ]
  2     2    2    1.50    2.49    [ 1.50 | 1.51 | 1.75 | 1.99 | 2.00 | 2.01 | 2.25 | 2.49 ]
  3     3    3    2.50    3.49    [ 2.50 | 2.51 | 2.75 | 2.99 | 3.00 | 3.01 | 3.25 | 3.49 ]
  4     4    4    3.50    4.49    [ 3.50 | 3.51 | 3.75 | 3.99 | 4.00 | 4.01 | 4.25 | 4.49 ]
  5     5    5    4.50    5.49    [ 4.50 | 4.51 | 4.75 | 4.99 | 5.00 | 5.01 | 5.25 | 5.49 ]
  6     6    6    5.50    5.99    [ 5.50 | 5.51 | 5.75 | 5.99 ]

=== rel

**
**  SUMMARY
**       9 judges on ROUND
**       9 judges in total
**
```



## command

This document is produced by the command:

```
koshu-inout.sh -r -g koshu
```
