# RDI: Relational Data Interchange


関係型データ交換 (RDI: relational data interchange)
は、関係モデルに準拠したデータを使って、
コンピュータ間でデータ交換を行う技術です。
この技術は、[関係データベース][RDB] (RDB: relational database) と、
[電子データ交換][EDI] (EDI: electronic data interchange) の両方に関係します。

EDI は、ある観点からみれば、人間の会話の一部分を抜き出し、
それをコンピュータで扱えるように定型化したものといえます。
たとえば、「そのペットボトルの水を買います」という会話から、
「○○○ という商品を単価 ○○○ 円で ○○○ 本購入するので ○○○ へ届けてほしい」
のような意味に対応するデータを定義して、
買い手から売り手へ送信するデータとします。

2014 年現在では、EDI のデータ形式として、
[COBOL] のレコードに似た固定形式の階層型や、
自由形式の階層型である [XML] がよく使われています。
COBOL のレコードも XML もデータ構造依存性が高く、
人間の会話のように意味に軸があるわけではありません。
これらの技術は、データ構造の変更に対する障壁が高くなるため、
環境変化への対応能力を維持しにくくします。
もし、意味、つまり、データ解釈を保ったまま、
データ構造を変化させられる技術を採用すれば、
データ交換を行う双方で合意した過去の規格を変更しやすくなります。
「形態はつねに機能にしたがう」の実現が近づきます。

データ構造優位からデータ解釈優位に乗り換えるひとつの方法は、
階層形式の代わりに、関係形式を採用することです。
関係形式は、ひとつのデータ解釈を実現するために、
複数のデータ構造からひとつが選択されるため、
つねに、意味を軸として、データ構造に変化の余地が残されています。
同時に、データに関する計算体系が、数学の理論として整備されており、
基礎の構造が違っていても、求めるデータ解釈に合致するように
計算しなおせるようになっています。

関係形式でデータ交換を行う技術が RDI です。
これは、関係データベースと同じ理論にもとづいており、
関係データベース間のデータ交換であれば、
データベースとデータ交換が、連続する技術的基盤の上に乗ることになります。
RDI は、COBOL や XML がもつデータ構造依存性をやわらげ、
関係データベースと連携でき、人間の会話にもとづいた形式で、
データ交換が実現できます。


[RDB]: http://ja.wikipedia.org/wiki/関係データベース
[EDI]: http://ja.wikipedia.org/wiki/電子データ交換
[COBOL]: http://www.cobol.gr.jp/
[XML]: http://xmlconsortium.org/
