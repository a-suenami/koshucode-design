** -*- koshu -*-

ascii-table : range @code -from 0 -to 127
  | add @char ( char @code )
  | pick @code @char
