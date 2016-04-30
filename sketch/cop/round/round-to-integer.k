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

