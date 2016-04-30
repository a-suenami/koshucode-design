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

