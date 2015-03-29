** -*- koshu -*-
**
**  概要
**    ボイス・コッド正規形の「近くのお店」のデータを読み込み、
**    制約条件を検査した上で、第 3 正規形に変換します。
**

|=V FD-OF-NEAREST-SHOP :
  nearest-shop | duplicate /person /shop-type
  --forward /person /shop-type
|=V FD-OF-SHOP-TYPE :
  shop-type | duplicate /shop

shop-type        : source SHOP-TYPE /shop /shop-type
shop-near-person : source SHOP-NEAR-PERSON /person /nearest-shop
nearest-shop     : shop-type
                 | rename /nearest-shop /shop
                 | meet shop-near-person

|== NEAREST-SHOP : nearest-shop  --forward /person /shop-type

