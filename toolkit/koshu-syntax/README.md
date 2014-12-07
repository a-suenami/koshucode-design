# トークン列の出力


甲州計算機のパッケージには `koshu-syntax` というコマンドが含まれています。
このコマンドは、甲州記法で書かれたファイルを読み込み、
それをトークン列に分解した結果を出力します。
たとえば、つぎのような関係写像の定義

```
clause : source CLAUSE /clause /clause-type
```

をトークン列に分解すると、
`clause` `:` `source` `CLAUSE`  `/clause` `/clause-type`
とその間の空白トークンからなる列が得られます。
その結果を甲州記法で一覧すると、つぎのようになります。

```
|-- TOKEN  /line 9  /column 0  /token-type 'text  /cont 'clause
|-- TOKEN  /line 9  /column 6  /token-type 'space  /cont "  "
|-- TOKEN  /line 9  /column 8  /token-type 'text  /cont ":"
|-- TOKEN  /line 9  /column 9  /token-type 'space  /cont " "
|-- TOKEN  /line 9  /column 10  /token-type 'text  /cont 'source
|-- TOKEN  /line 9  /column 16  /token-type 'space  /cont " "
|-- TOKEN  /line 9  /column 17  /token-type 'text  /cont 'CLAUSE
|-- TOKEN  /line 9  /column 23  /token-type 'space  /cont " "
|-- TOKEN  /line 9  /column 24  /token-type 'term  /cont "/clause"
|-- TOKEN  /line 9  /column 31  /token-type 'space  /cont " "
|-- TOKEN  /line 9  /column 32  /token-type 'term  /cont "/clause-type"
```

[入出力リスト] には `koshu-syntax` の出力結果を `TOKEN.k` に出力し、
それを `token-table.k` で表形式に表示する例があります。


[入出力リスト]: token-table/README.md

