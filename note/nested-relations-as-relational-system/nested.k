** -*- koshu -*-
**
**  DESCRIPTION
**    Nested relations as embedded relational system
**

|== S : s  --table
|== T : s | up /nr

r : p | meet q
      | add /d ( /a + /c )
      | cut /b

s : slice /np p
  | slice /nq q
  | slice /nr ( nr -np ^/np -nq ^/nq )

nr : @np | meet @nq
         | add /d ( /a + /c )
         | cut /b
