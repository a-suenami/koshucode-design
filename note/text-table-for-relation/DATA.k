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
