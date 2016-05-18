** -*- koshu -*-
**
**  trim-text-begin     Remove given chars from beginning of text
**  trim-text-end       Remove given chars from end of text
**  trim-text-both      Remove given chars from beginning and end of text
**

|== TRIM : source TEXT /text
  | add /begin ( trim-text-begin "123" /text )
        /end   ( trim-text-end   "123" /text )
        /both  ( trim-text-both  "123" /text )
  --table

|-- TEXT  /text ".1"
|-- TEXT  /text "1.1"
|-- TEXT  /text "12.21"
|-- TEXT  /text "123.321"
|-- TEXT  /text "1234.4321"
|-- TEXT  /text "12345.54321"
