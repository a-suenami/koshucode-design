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

