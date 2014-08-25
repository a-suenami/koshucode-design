** -*- koshu -*-

n : range /n -from 0 -to 10

|== A : n | keep /n >= 5 and /n <= 8
|== B : n | keep /n between 5 8
|== C : n | keep /n is between 5 8
|== D : n | keep /n is all ( >= 5 )( <= 8 )
