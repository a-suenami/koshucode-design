** -*- koshu -*-

short
  a abcdef
  b abcde

|-- A  /text a.g
|-- A  /text b.f
|-- A  /text b.fg

|== B : source A /text
  | add /n ( length /text )
        /q ( /text = 'abcdefg )

