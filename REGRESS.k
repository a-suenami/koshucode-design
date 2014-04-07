** -*- koshu -*-
**
**  DESCRIPTION
**    Result of comparing I/O lists.
**    This dataset is produced by koshu-regress.sh.
**

|-- OK  /dir "note/equivalent-for-both/script"  /cmd "koshu-markdown.sh -r -f CALC DATA.k"
|-- OK  /dir "note/equivalent-for-down/script"  /cmd "koshu-markdown.sh -r copy.k"
|-- OK  /dir "note/koshu-markdown/script"  /cmd "koshu-markdown.sh -o A.md calc.k A.k"
|-- OK  /dir "note/koshu-markdown/script"  /cmd "koshu-markdown.sh -r -g calc.k"
|-- OK  /dir "note/koshu-markdown/script"  /cmd "koshu-markdown.sh -o ARGS.md -f ARGS calc.k"
