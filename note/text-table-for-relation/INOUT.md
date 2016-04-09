# I/O List

- [DATA.k](#datak)
- koshu DATA.k [client.k](#clientk)
- koshu DATA.k [stock.k](#stockk)



## [DATA.k](DATA.k)

```
** -*- koshu -*-
**
**  REFERENCE
**    Latha S. Colby, A Recursive Algebra for Nested Relations, 1988
**    Fig. 1  An Example of a Flat Relational Model
**    Fig. 2  An Example of a Nested Relational Model
**

|-- CLIENT    /name "John Smith"  /company 'XEROX  /purchase-price 64.50  /date "02/10/83"  /no 100
|-- CLIENT    /name "John Smith"  /company 'XEROX  /purchase-price 92.50  /date "08/10/87"  /no 500
|-- CLIENT    /name "John Smith"  /company 'IBM    /purchase-price 89.75  /date "06/20/83"  /no 200
|-- CLIENT    /name "John Smith"  /company 'IBM    /purchase-price 96.50  /date "11/10/84"  /no 100
|-- CLIENT    /name "Jill Brody"  /company 'EXXON  /purchase-price 35.00  /date "01/30/81"  /no 100
|-- CLIENT    /name "Jill Brody"  /company 'EXXON  /purchase-price 64.50  /date "01/30/82"  /no 100
|-- CLIENT    /name "Jill Brody"  /company 'EXXON  /purchase-price 59.50  /date "02/10/83"  /no 200
|-- CLIENT    /name "Jill Brody"  /company 'FORD   /purchase-price 35.50  /date "02/10/83"  /no 200
|-- CLIENT    /name "Jill Brody"  /company 'SEARS  /purchase-price 35.75  /date "12/25/87"  /no 100

|-- ADDRESS   /name "John Smith"  /address "311 Eash 2nd. St..."
|-- ADDRESS   /name "Jill Brody"  /address "41 North Main St..."

|-- STOCK     /company 'XEROX  /current-price 52.25  /last-dividend 0.44
|-- STOCK     /company 'IBM    /current-price 97.50  /last-dividend 1.25
|-- STOCK     /company 'EXXON  /current-price 90.00  /last-dividend 0.82
|-- STOCK     /company 'FORD   /current-price 41.75  /last-dividend 0.20
|-- STOCK     /company 'SEARS  /current-price 77.50  /last-dividend 0.34

|-- EXCHANGE  /company 'XEROX  /exchanges "NEW YORK"
|-- EXCHANGE  /company 'IBM    /exchanges "NEW YORK"
|-- EXCHANGE  /company 'IBM    /exchanges "LONDON"
|-- EXCHANGE  /company 'IBM    /exchanges "HONG KONG"
|-- EXCHANGE  /company 'IBM    /exchanges "TOKYO"
|-- EXCHANGE  /company 'EXXON  /exchanges "NEW YORK"
|-- EXCHANGE  /company 'EXXON  /exchanges "LONDON"
|-- EXCHANGE  /company 'EXXON  /exchanges "TOKYO"
|-- EXCHANGE  /company 'FORD   /exchanges "NEW YORK"
|-- EXCHANGE  /company 'SEARS  /exchanges "NEW YORK"
```



## [client.k](client.k)

```
** -*- koshu -*-

|== CLIENT-ADDRESS
  : client
  | meet address
  | nest /company /purchase-price /date /no -to /investments
  | for /investments ( nest /purchase-price /date /no -to /shares )
  --table --forward /name /address

client  : source CLIENT  /name /company /purchase-price /date /no
address : source ADDRESS /name /address
```

Command `koshu DATA.k client.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    DATA.k
**    client.k
**
**  OUTPUT
**    <stdout>
**

|-- CLIENT-ADDRESS  /name "John Smith"  /address "311 Eash 2nd. St..."  /investments {= /shares /company [ {= /purchase-price /date /no [ 89.75 | "06/20/83" | 200 ] [ 96.50 | "11/10/84" | 100 ] =} | 'IBM ] [ {= /purchase-price /date /no [ 64.50 | "02/10/83" | 100 ] [ 92.50 | "08/10/87" | 500 ] =} | 'XEROX ] =}
|-- CLIENT-ADDRESS  /name "Jill Brody"  /address "41 North Main St..."  /investments {= /shares /company [ {= /purchase-price /date /no [ 35.75 | "12/25/87" | 100 ] =} | 'SEARS ] [ {= /purchase-price /date /no [ 35.50 | "02/10/83" | 200 ] =} | 'FORD ] [ {= /purchase-price /date /no [ 35.00 | "01/30/81" | 100 ] [ 64.50 | "01/30/82" | 100 ] [ 59.50 | "02/10/83" | 200 ] =} | 'EXXON ] =}

*** 2 judges

=== note

TABLE : CLIENT-ADDRESS

  /name          /address                /investments
  -------------- ----------------------- -------------------------------------------
  "John Smith"   "311 Eash 2nd. St..."   /shares                            /company
                                         ---------------------------------- --------
                                         /purchase-price /date        /no   'IBM
                                         --------------- ------------ ----- 
                                         89.75           "06/20/83"   200   
                                         96.50           "11/10/84"   100   
                                                                            
                                         /purchase-price /date        /no   'XEROX
                                         --------------- ------------ ----- 
                                         64.50           "02/10/83"   100   
                                         92.50           "08/10/87"   500   
                                         
  "Jill Brody"   "41 North Main St..."   /shares                            /company
                                         ---------------------------------- --------
                                         /purchase-price /date        /no   'SEARS
                                         --------------- ------------ ----- 
                                         35.75           "12/25/87"   100   
                                                                            
                                         /purchase-price /date        /no   'FORD
                                         --------------- ------------ ----- 
                                         35.50           "02/10/83"   200   
                                                                            
                                         /purchase-price /date        /no   'EXXON
                                         --------------- ------------ ----- 
                                         35.00           "01/30/81"   100   
                                         64.50           "01/30/82"   100   
                                         59.50           "02/10/83"   200   
                                         

=== rel

**
**  SUMMARY
**       2 judges on CLIENT-ADDRESS
**       2 judges in total
**
```



## [stock.k](stock.k)

```
** -*- koshu -*-

|== STOCK-EXCHANGE
  : stock
  | meet exchange
  | nest /exchanges -to /exchanges-traded
  --table --forward /company /current-price

stock    : source STOCK /company /current-price /last-dividend
exchange : source EXCHANGE /company /exchanges
```

Command `koshu DATA.k stock.k` produces:

```
** -*- koshu -*-
**
**  INPUT
**    DATA.k
**    stock.k
**
**  OUTPUT
**    <stdout>
**

|-- STOCK-EXCHANGE  /company 'XEROX  /current-price 52.25  /exchanges-traded {= /exchanges [ "NEW YORK" ] =}  /last-dividend 0.44
|-- STOCK-EXCHANGE  /company 'IBM  /current-price 97.50  /exchanges-traded {= /exchanges [ "NEW YORK" ] [ "LONDON" ] [ "HONG KONG" ] [ "TOKYO" ] =}  /last-dividend 1.25
|-- STOCK-EXCHANGE  /company 'EXXON  /current-price 90.00  /exchanges-traded {= /exchanges [ "NEW YORK" ] [ "LONDON" ] [ "TOKYO" ] =}  /last-dividend 0.82
|-- STOCK-EXCHANGE  /company 'FORD  /current-price 41.75  /exchanges-traded {= /exchanges [ "NEW YORK" ] =}  /last-dividend 0.20
|-- STOCK-EXCHANGE  /company 'SEARS  /current-price 77.50  /exchanges-traded {= /exchanges [ "NEW YORK" ] =}  /last-dividend 0.34

*** 5 judges

=== note

TABLE : STOCK-EXCHANGE

  /company /current-price /exchanges-traded /last-dividend
  -------- -------------- ----------------- --------------
  'XEROX   52.25          /exchanges        0.44
                          -------------     
                          "NEW YORK"        
                                            
  'IBM     97.50          /exchanges        1.25
                          -------------     
                          "NEW YORK"        
                          "LONDON"          
                          "HONG KONG"       
                          "TOKYO"           
                                            
  'EXXON   90.00          /exchanges        0.82
                          -------------     
                          "NEW YORK"        
                          "LONDON"          
                          "TOKYO"           
                                            
  'FORD    41.75          /exchanges        0.20
                          -------------     
                          "NEW YORK"        
                                            
  'SEARS   77.50          /exchanges        0.34
                          -------------     
                          "NEW YORK"        
                                            

=== rel

**
**  SUMMARY
**       5 judges on STOCK-EXCHANGE
**       5 judges in total
**
```



## command

This document is produced by the command:

```
koshu-inout.sh -s -g koshu DATA.k
```
