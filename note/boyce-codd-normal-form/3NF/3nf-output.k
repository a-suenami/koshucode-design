** -*- koshu -*-
**
**  概要
**    第 3 正規形の「近くのお店」データをボイス・コッド正規形に変換します。
**    「近くのお店」のデータを読み込み、その制約条件を検査し、
**    問題がなければ、ボイス・コッド正規形に分解して出力します。
**

|=V FD-OF-NEAREST-SHOP : nearest-shop | duplicate /person /shop-type
|=V FD-OF-SHOP-TYPE    : shop-type    | duplicate /shop

nearest-shop     : source NEAREST-SHOP /person /shop-type /nearest-shop
shop-near-person : nearest-shop | pick /person /nearest-shop
shop-type        : nearest-shop | pick /nearest-shop /shop-type 
                                | rename /shop /nearest-shop

|== SHOP-NEAR-PERSON -fore /person : shop-near-person
|== SHOP-TYPE : shop-type 

