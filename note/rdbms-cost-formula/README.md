# 実行計画のためのコスト計算式

関係データベース管理システム (RDBMS) は、問い合わせを実行するとき、計算式の同値変形、
内部演算の導入、アルゴリズムの選択などの最適化を行い、
その結果を実行計画として提示します。[この資料][PDF] (PDF) は、
そのときの性能予測の評価材料であるコストの計算方法を、
初学者向けに説明しています。

この資料が説明の対象としている RDBMS は Oracle であり、
[Wolfgang Breitling] さんが 2003 年ころに書いた
[A Look Under the Hood of CBO: The 10053 Event][CBO] (PDF)
にもとづいています。

![PDF]

[PDF]: rdbms-cost-formula.pdf
[CBO]: http://www.centrexcc.com/A%20Look%20under%20the%20Hood%20of%20CBO%20-%20the%2010053%20Event.pdf
[Wolfgang Breitling]: http://www.centrexcc.com

