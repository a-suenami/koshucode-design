** -*- koshu -*-
**
**  DESCRIPTION
**    Nested relations as embedded relational system
**

|== S -table : s
|== T : s | up /nr

r : p | meet q
      | add /d ( /a + /c )
      | cut /b

s : slice /np p
  | slice /nq q
  | slice /nr ( nr -np np -nq nq ) -< /np /nq

nr : @np | meet @nq
         | add /d ( /a + /c )
         | cut /b
