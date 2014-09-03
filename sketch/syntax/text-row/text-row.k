** -*- koshu -*-
**
**  DESCRIPTION
**    Examples of text row.
**    The calculator concats a row of texts into single text.
**

|-- ROW   /x "aaa"
|-- ROW   /x "aaa" "bb"
|-- ROW   /x "aaa" "bb" "c"
|-- ROW   /x "aaa" <tab> "bb"
|-- ROW   /x "aaa	bb" <q> "s"

|-- CALC  /x "aaa"
|-- CALC  /x "aaa" ++ "bb"
|-- CALC  /x "aaa" ++ "bb" ++ "c"
|-- CALC  /x "aaa" ++ <tab> ++ "bb"
|-- CALC  /x "aaa	bb" ++ <q> ++ "s"

|== ROW  : source ROW  /x | len
|== CALC : source CALC /x | len

len : add /n ( length /x )
