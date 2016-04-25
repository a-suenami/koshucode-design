** -*- koshu -*-
**
**  DESCRIPTION
**    Table of symbol classes of ASCII chars.
**

|== GENERAL : symbol | keep /general = 'G | cut /numeric
  | char-order

|== NUMERIC : symbol | keep /numeric = 'N
  | char-order

|== UNKNOWN : symbol
  | keep /general = '- and /plain = '- and /numeric = '-
  | char-order

char-order : backward /char | order /char

ascii : range /n -from 0 -to 127
  | add /char ( char /n )

symbol : ascii
  | add /general ( if general-symbol? /char -> 'G : '- )
        /plain   ( if plain-symbol?   /char -> 'P : '- )
        /numeric ( if numeric-symbol? /char -> 'N : '- )
  | to-char-range /char /n
  | cut /n

to-char-range
  | subst @'1 ( if @'1 >= "0" and @'1 <= "9" -> '0-9
                 : @'1 >= "A" and @'1 <= "Z" -> 'A-Z
                 : @'1 >= "a" and @'1 <= "z" -> 'a-z
                 : @'2 >= 0   and @'2 <= 31  -> 'control
                 : @'2 = 127                 -> 'control
                 : @'1 )

