** -*- koshu -*-

|== STOCK-EXCHANGE
  : stock
  | meet exchange
  | nest /exchanges -to /exchanges-traded
  --table --forward /company /current-price

stock    : source STOCK /company /current-price /last-dividend
exchange : source EXCHANGE /company /exchanges
