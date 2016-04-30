# I/O List

- koshu [round-to-even.k](#round-to-evenk)
- koshu [round-to-integer.k](#round-to-integerk)
- koshu [round-to-quater.k](#round-to-quaterk)
- koshu [round-to-ternary.k](#round-to-ternaryk)



## [round-to-even.k](round-to-even.k)

```
** -*- koshu -*-
**
**  round-even N           round N per self fractional length
**  round-even-at L N      round N per given fractional length L
**  round-even-per U N     round N per unit U
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
  | add /self ( round-even of  @self .+ /n )
        /at   ( round-even-at  @at      /n )
        /per  ( round-even-per @per     /n )
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
|-- ROUND  /self -1  /at -1  /per -1  /from -1.49  /to -0.51  /ns [ -1.49 | -1.25 | -1.01 | -1.00 | -0.99 | -0.75 | -0.51 ]
|-- ROUND  /self 0  /at 0  /per 0  /from -0.50  /to 0.50  /ns [ -0.50 | -0.49 | -0.25 | -0.01 | 0.00 | 0.01 | 0.25 | 0.49 | 0.50 ]
|-- ROUND  /self 1  /at 1  /per 1  /from 0.51  /to 1.49  /ns [ 0.51 | 0.75 | 0.99 | 1.00 | 1.01 | 1.25 | 1.49 ]
|-- ROUND  /self 2  /at 2  /per 2  /from 1.50  /to 2.50  /ns [ 1.50 | 1.51 | 1.75 | 1.99 | 2.00 | 2.01 | 2.25 | 2.49 | 2.50 ]

|-- ROUND  /self 3  /at 3  /per 3  /from 2.51  /to 3.49  /ns [ 2.51 | 2.75 | 2.99 | 3.00 | 3.01 | 3.25 | 3.49 ]
|-- ROUND  /self 4  /at 4  /per 4  /from 3.50  /to 4.50  /ns [ 3.50 | 3.51 | 3.75 | 3.99 | 4.00 | 4.01 | 4.25 | 4.49 | 4.50 ]
|-- ROUND  /self 5  /at 5  /per 5  /from 4.51  /to 5.49  /ns [ 4.51 | 4.75 | 4.99 | 5.00 | 5.01 | 5.25 | 5.49 ]
|-- ROUND  /self 6  /at 6  /per 6  /from 5.50  /to 5.99  /ns [ 5.50 | 5.51 | 5.75 | 5.99 ]

*** 9 judges

=== note

TABLE : ROUND

  /self /at  /per /from   /to     /ns
  ----- ---- ---- ------- ------- ----------------------------------------------------------------------
  -2    -2   -2   -2.00   -1.50   [ -2.00 | -1.99 | -1.75 | -1.51 | -1.50 ]
  -1    -1   -1   -1.49   -0.51   [ -1.49 | -1.25 | -1.01 | -1.00 | -0.99 | -0.75 | -0.51 ]
  0     0    0    -0.50   0.50    [ -0.50 | -0.49 | -0.25 | -0.01 | 0.00 | 0.01 | 0.25 | 0.49 | 0.50 ]
  1     1    1    0.51    1.49    [ 0.51 | 0.75 | 0.99 | 1.00 | 1.01 | 1.25 | 1.49 ]
  2     2    2    1.50    2.50    [ 1.50 | 1.51 | 1.75 | 1.99 | 2.00 | 2.01 | 2.25 | 2.49 | 2.50 ]
  3     3    3    2.51    3.49    [ 2.51 | 2.75 | 2.99 | 3.00 | 3.01 | 3.25 | 3.49 ]
  4     4    4    3.50    4.50    [ 3.50 | 3.51 | 3.75 | 3.99 | 4.00 | 4.01 | 4.25 | 4.49 | 4.50 ]
  5     5    5    4.51    5.49    [ 4.51 | 4.75 | 4.99 | 5.00 | 5.01 | 5.25 | 5.49 ]
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



## [round-to-quater.k](round-to-quater.k)

```
** -*- koshu -*-
**
**  round-per U N     round N per unit U
**

|-- INT  /int 1
|-- INT  /int 2
|-- INT  /int 3

|-- FRAC  /frac 0.000
|-- FRAC  /frac 0.001
|-- FRAC  /frac 0.249
|-- FRAC  /frac 0.250
|-- FRAC  /frac 0.241
|-- FRAC  /frac 0.499
|-- FRAC  /frac 0.500
|-- FRAC  /frac 0.501
|-- FRAC  /frac 0.749
|-- FRAC  /frac 0.750
|-- FRAC  /frac 0.751
|-- FRAC  /frac 0.999

|== ROUND : round -per 0.25
  --table --order --backward /from /to /ns

round : source INT /int
  | meet ( source FRAC /frac )
  | add /n    ( /int + /frac )
  | add /per  ( round-per @per /n )
  | hier /per -to /g
  | add /ns   ( sort /g/n )
  | add /from ( min /ns )
        /to   ( max /ns )
  | cut /g

```

Command `koshu round-to-quater.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    round-to-quater.k
**
**  OUTPUT
**    <stdout>
**

|-- ROUND  /per 1.00  /from 1.000  /to 1.001  /ns [ 1.000 | 1.001 ]
|-- ROUND  /per 1.25  /from 1.241  /to 1.250  /ns [ 1.241 | 1.249 | 1.250 ]
|-- ROUND  /per 1.50  /from 1.499  /to 1.501  /ns [ 1.499 | 1.500 | 1.501 ]
|-- ROUND  /per 1.75  /from 1.749  /to 1.751  /ns [ 1.749 | 1.750 | 1.751 ]
|-- ROUND  /per 2.00  /from 1.999  /to 2.001  /ns [ 1.999 | 2.000 | 2.001 ]

|-- ROUND  /per 2.25  /from 2.241  /to 2.250  /ns [ 2.241 | 2.249 | 2.250 ]
|-- ROUND  /per 2.50  /from 2.499  /to 2.501  /ns [ 2.499 | 2.500 | 2.501 ]
|-- ROUND  /per 2.75  /from 2.749  /to 2.751  /ns [ 2.749 | 2.750 | 2.751 ]
|-- ROUND  /per 3.00  /from 2.999  /to 3.001  /ns [ 2.999 | 3.000 | 3.001 ]
|-- ROUND  /per 3.25  /from 3.241  /to 3.250  /ns [ 3.241 | 3.249 | 3.250 ]

|-- ROUND  /per 3.50  /from 3.499  /to 3.501  /ns [ 3.499 | 3.500 | 3.501 ]
|-- ROUND  /per 3.75  /from 3.749  /to 3.751  /ns [ 3.749 | 3.750 | 3.751 ]
|-- ROUND  /per 4.00  /from 3.999  /to 3.999  /ns [ 3.999 ]

*** 13 judges

=== note

TABLE : ROUND

  /per   /from   /to     /ns
  ------ ------- ------- ---------------------------
  1.00   1.000   1.001   [ 1.000 | 1.001 ]
  1.25   1.241   1.250   [ 1.241 | 1.249 | 1.250 ]
  1.50   1.499   1.501   [ 1.499 | 1.500 | 1.501 ]
  1.75   1.749   1.751   [ 1.749 | 1.750 | 1.751 ]
  2.00   1.999   2.001   [ 1.999 | 2.000 | 2.001 ]
  2.25   2.241   2.250   [ 2.241 | 2.249 | 2.250 ]
  2.50   2.499   2.501   [ 2.499 | 2.500 | 2.501 ]
  2.75   2.749   2.751   [ 2.749 | 2.750 | 2.751 ]
  3.00   2.999   3.001   [ 2.999 | 3.000 | 3.001 ]
  3.25   3.241   3.250   [ 3.241 | 3.249 | 3.250 ]
  3.50   3.499   3.501   [ 3.499 | 3.500 | 3.501 ]
  3.75   3.749   3.751   [ 3.749 | 3.750 | 3.751 ]
  4.00   3.999   3.999   [ 3.999 ]

=== rel

**
**  SUMMARY
**      13 judges on ROUND
**      13 judges in total
**
```



## [round-to-ternary.k](round-to-ternary.k)

```
** -*- koshu -*-
**
**  round-per U N     round N per unit U
**

|-- PER  /per 1.00 div 3

|-- INT  /int 1
|-- INT  /int 2
|-- INT  /int 3

|-- FRAC  /frac 0.0
|-- FRAC  /frac 0.1
|-- FRAC  /frac 0.2
|-- FRAC  /frac 0.3
|-- FRAC  /frac 0.4
|-- FRAC  /frac 0.5
|-- FRAC  /frac 0.6
|-- FRAC  /frac 0.7
|-- FRAC  /frac 0.8
|-- FRAC  /frac 0.9

|-- THIN  /thin 0.00
|-- THIN  /thin 0.05

|== ROUND : round
  --table --order --backward /from /to /ns

round : source INT /int
  | meet ( source FRAC /frac )
  | meet ( source THIN /thin )
  | meet ( source PER /per )
  | add /n     ( /int + /frac + /thin )
  | add /round ( round-per /per /n )
  | hier /round -to /g
  | add /ns    ( sort /g/n )
  | add /from  ( min /ns )
        /to    ( max /ns )
  | cut /g

```

Command `koshu round-to-ternary.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    round-to-ternary.k
**
**  OUTPUT
**    <stdout>
**

|-- ROUND  /round 1.00  /from 1.00  /to 1.15  /ns [ 1.00 | 1.05 | 1.10 | 1.15 ]
|-- ROUND  /round 1.33  /from 1.20  /to 1.45  /ns [ 1.20 | 1.25 | 1.30 | 1.35 | 1.40 | 1.45 ]
|-- ROUND  /round 1.66  /from 1.50  /to 1.80  /ns [ 1.50 | 1.55 | 1.60 | 1.65 | 1.70 | 1.75 | 1.80 ]
|-- ROUND  /round 2.00  /from 1.85  /to 2.15  /ns [ 1.85 | 1.90 | 1.95 | 2.00 | 2.05 | 2.10 | 2.15 ]
|-- ROUND  /round 2.33  /from 2.20  /to 2.45  /ns [ 2.20 | 2.25 | 2.30 | 2.35 | 2.40 | 2.45 ]

|-- ROUND  /round 2.66  /from 2.50  /to 2.80  /ns [ 2.50 | 2.55 | 2.60 | 2.65 | 2.70 | 2.75 | 2.80 ]
|-- ROUND  /round 3.00  /from 2.85  /to 3.15  /ns [ 2.85 | 2.90 | 2.95 | 3.00 | 3.05 | 3.10 | 3.15 ]
|-- ROUND  /round 3.33  /from 3.20  /to 3.45  /ns [ 3.20 | 3.25 | 3.30 | 3.35 | 3.40 | 3.45 ]
|-- ROUND  /round 3.66  /from 3.50  /to 3.80  /ns [ 3.50 | 3.55 | 3.60 | 3.65 | 3.70 | 3.75 | 3.80 ]
|-- ROUND  /round 4.00  /from 3.85  /to 3.95  /ns [ 3.85 | 3.90 | 3.95 ]

*** 10 judges

=== note

TABLE : ROUND

  /round /from  /to    /ns
  ------ ------ ------ ----------------------------------------------------
  1.00   1.00   1.15   [ 1.00 | 1.05 | 1.10 | 1.15 ]
  1.33   1.20   1.45   [ 1.20 | 1.25 | 1.30 | 1.35 | 1.40 | 1.45 ]
  1.66   1.50   1.80   [ 1.50 | 1.55 | 1.60 | 1.65 | 1.70 | 1.75 | 1.80 ]
  2.00   1.85   2.15   [ 1.85 | 1.90 | 1.95 | 2.00 | 2.05 | 2.10 | 2.15 ]
  2.33   2.20   2.45   [ 2.20 | 2.25 | 2.30 | 2.35 | 2.40 | 2.45 ]
  2.66   2.50   2.80   [ 2.50 | 2.55 | 2.60 | 2.65 | 2.70 | 2.75 | 2.80 ]
  3.00   2.85   3.15   [ 2.85 | 2.90 | 2.95 | 3.00 | 3.05 | 3.10 | 3.15 ]
  3.33   3.20   3.45   [ 3.20 | 3.25 | 3.30 | 3.35 | 3.40 | 3.45 ]
  3.66   3.50   3.80   [ 3.50 | 3.55 | 3.60 | 3.65 | 3.70 | 3.75 | 3.80 ]
  4.00   3.85   3.95   [ 3.85 | 3.90 | 3.95 ]

=== rel

**
**  SUMMARY
**      10 judges on ROUND
**      10 judges in total
**
```



## command

This document is produced by the command:

```
koshu-inout.sh -r -g koshu
```
