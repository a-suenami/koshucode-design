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

