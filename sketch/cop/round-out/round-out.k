** -*- koshu -*-
**
**  DECSRIPTION
**    Round toward infinity
**
**  OPERATOR
**    round-out N
**    round-out-at L N
**    round-out-per P N
**

|== ROUND : zero | join pos | join neg
  | add /in    ( trunc /n )
        /out   ( round-out /n )
        /at    ( list ( round-out-at 0 /n )
                      ( round-out-at 1 /n )
                      ( round-out-at 2 /n ))
        /per   ( round-out-per 0.01 /n )
        /error ( trunc-error /n <> 0 )
  --order --forward /n /in /out /error /at /per

zero : add /n 0.00

pos : dee
  | range /d -from 1 -to 10
  | add /n ( 0.00 + 1 div /d )
  | pick /n

neg : pos | subst /n ( - /n )

