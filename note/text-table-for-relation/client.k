** -*- koshu -*-

|== CLIENT-ADDRESS -table -fore /name /address
  : client
  | meet address
  | nest /company /purchase-price /date /no -to /investments
  | for /investments ( nest /purchase-price /date /no -to /shares )

client  : source CLIENT  /name /company /purchase-price /date /no
address : source ADDRESS /name /address
