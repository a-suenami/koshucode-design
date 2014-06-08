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
|-- TOKEN  /clause 1  /line 7  /col 0  /type 'text  /cont 'clause
|-- TOKEN  /clause 1  /line 7  /col 6  /type 'space  /cont " "
|-- TOKEN  /clause 1  /line 7  /col 7  /type 'text  /cont ":"
|-- TOKEN  /clause 1  /line 7  /col 8  /type 'space  /cont " "
|-- TOKEN  /clause 1  /line 7  /col 9  /type 'text  /cont 'source
|-- TOKEN  /clause 1  /line 7  /col 15  /type 'space  /cont " "
|-- TOKEN  /clause 1  /line 7  /col 16  /type 'text  /cont 'CLAUSE
|-- TOKEN  /clause 1  /line 7  /col 22  /type 'space  /cont " "
|-- TOKEN  /clause 1  /line 7  /col 23  /type 'term  /cont "/clause"
|-- TOKEN  /clause 1  /line 7  /col 30  /type 'space  /cont " "
|-- TOKEN  /clause 1  /line 7  /col 31  /type 'term  /cont "/clause-type"
```

[入出力リスト][INOUT.md] には、
`koshu-syntax` の出力結果を `TOKEN.k` に出力し、
それを `token-table.k` で表形式に表示する例があります。


[INOUT.md]: INOUT.md

