** -*- koshu -*-
**
**  DESCRIPTION
**    Replace subtexts
**

|-- TEXT  /text "abracadabra"

|-- FROM-TO  /from "br"  /to "BR"
|-- FROM-TO  /from "ab"  /to "AB"
|-- FROM-TO  /from "ra"  /to "RA"
|-- FROM-TO  /from ""    /to "BR"
|-- FROM-TO  /from "br"  /to ""
|-- FROM-TO  /from "a"   /to "a"

|== REPLACE : source TEXT /text
  | meet ( source FROM-TO /from /to )
  | add /all   ( replace-all   /from /to /text )
        /first ( replace-first /from /to /text )
        /last  ( replace-last  /from /to /text )
        /begin ( replace-begin /from /to /text )
        /end   ( replace-end   /from /to /text )
  | forward /from /to /text

