** -*- koshu -*-

|== CLIENT-ADDRESS
  : client
  | meet address
  | nest /company /purchase-price /date /no -to /investments
  | for /investments ( nest /purchase-price /date /no -to /shares )
  --table --forward /name /address

client  : source CLIENT  /name /company /purchase-price /date /no
address : source ADDRESS /name /address
