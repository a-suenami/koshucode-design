** -*- koshu -*-
**
**  DESCRIPTION
**    Consider B and C with the following rewriting rules.
**
**    /n is F      ->  F /n
**    between L H  ->  (| x | x >= L and x <= H |)
**    all F G      ->  (| x | F x and G x |)
**    >= L         ->  (| x | x >= L |)
**    <= H         ->  (| x | x <= H |)
**

n : range /n -from 0 -to 10

|== A : n | keep /n >= 5 and /n <= 8
|== B : n | keep /n is between 5 8
|== C : n | keep /n is all ( >= 5 )( <= 8 )
