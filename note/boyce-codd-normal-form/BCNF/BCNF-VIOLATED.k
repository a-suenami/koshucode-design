** -*- koshu -*-
**
**  概要
**    ボイス・コッド正規形で制約違反になる例題
**
**  使用例
**    koshu bcnf-output.k BCNF-DATA.k BCNF-VIOLATED.k
**

**  /person 'Davidson さんの近くの店の情報として、
**  /shop-type 'Hairdressor (美容院) がふたつ出てくることで
**  制約 FD-OF-NEAREST-SHOP に違反します。

|-- SHOP-NEAR-PERSON  /person 'Davidson  /nearest-shop "Sweeney Todd's"

