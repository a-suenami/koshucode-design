# 実行計画のためのコスト計算式

関係データベース管理システムは、問い合わせを実行するとき、計算式の同値変形、
内部演算の導入、アルゴリズムの選択などの最適化を行い、
その結果を実行計画として提示します。[この資料 (PDF)][PDF] は、
そのときの性能予測の評価材料であるコストの計算方法を、
初学者向けに説明しています。

甲州計算機は、その表記法を定式化することに焦点をあてているため、
バージョン 0.41 の時点で、最適化を実装していません。

[![PDF]](rdbms-cost-formula-560.png)

[PDF]: rdbms-cost-formula.pdf
