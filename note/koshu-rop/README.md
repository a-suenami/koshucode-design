# 関係写像演算子の一覧


甲州記法の演算子 `koshu-rop` (koshu relmap operator) は、
関係写像の一覧を出力します。演算子はその名前 `/name` で識別され、
個々の演算子はひとつのグループ `/group` に所属します。
演算子の使用法 `/usage` も文字列で取り出せます。

`/group` に所属する演算子 `/name` の使用法は `/usage` である
という情報を `/group` ごとにまとめて、以下のように表形式で出力できます。
すべての出力と計算式は [`INOUT.md`][INOUT.md] で確認できます。

[INOUT.md]: INOUT.md

```
/n  /group     /rop
--- ---------- -----------------------------------------------------------------------------------
1   'builtin   /n   /name              /usage
               ---- ------------------ -----------------------------------------------------------
               1    'append            "append R ..."

2   'meta      /n   /name              /usage
               ---- ------------------ -----------------------------------------------------------
               1    'koshu-cop         "koshu-cop /N"
               2    'koshu-cop-infix   "koshu-cop-infix /N [ -height /N ][ -dir /N ]"
               3    'koshu-rop         "koshu-rop /N /N"
               ...

3   'minimal   /n   /name              /usage
               ---- ------------------ -----------------------------------------------------------
               1    'contents          "contents /N"
               2    'cut               "cut /P ..."
               3    'cut-term          "cut-term /R"
               ...

4   'nest      /n   /name              /usage
               ---- ------------------ -----------------------------------------------------------
               1    'copy              "copy N R"
               2    'down              "down /N"
               3    'for               "for /N R [ -with /N ... ]"
               ...

5   'vanilla   /n   /name              /usage
               ---- ------------------ -----------------------------------------------------------
               1    'add               "add /N E ..."
               2    'both              "both R"
               3    'check-term        "check-term [ -just /N ... | -has /N ... | -but /N ... ]"
               ...
```

