** -*- koshu -*-
**
**  trim-begin     Remove spaces from beginning of text
**  trim-end       Remove spaces from end of text
**  trim-both      Remove spaces from beginning and end of text
**

|== TRIM : source TEXT /text
  | add /begin ( trim-begin /text )
        /end   ( trim-end   /text )
        /both  ( trim-both  /text )
  --table

|-- TEXT  /text "ABC"
|-- TEXT  /text " ABC "
|-- TEXT  /text "  ABC  "
|-- TEXT  /text "   ABC   "
|-- TEXT  /text <tab> "ABC" <tab>
|-- TEXT  /text <crlf> "ABC" <crlf>
