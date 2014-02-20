** -*- koshu -*-
**
**  USAGE
**    koshu if.k
**

x : range /x -from 1 -to 5

|== A : x | add /y ( if /x <= 3 -> 'A : 'B )
|== B : x | add /y ( if : /x <= 3 -> 'A : 'B )

|== C : x | add /y ( if : /x = 1 -> 'S
                        : /x < 3 -> 'A
                        :           'B )

|== D : x | add /y ( if : 'S <- /x = 1
                        : 'A <- /x < 3
                        : 'B )

|== E : x | add /y ( if : 'S <- /x = 1
                        : 'A <- /x = 2
                             << /x = 3
                        : 'B )

