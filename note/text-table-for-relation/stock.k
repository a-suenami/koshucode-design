** -*- koshu -*-

|== STOCK-EXCHANGE -with-table -fore /company /current-price
  : stock
  | meet exchange
  | nest /exchanges -to /exchanges-traded

stock    : source STOCK /company /current-price /last-dividend
exchange : source EXCHANGE /company /exchanges
