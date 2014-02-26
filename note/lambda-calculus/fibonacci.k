** -*- koshu -*-
**
**  DESCRIPTION
**    Calculate Fibonacci numbers
**
**  USAGE
**    koshu fibonacci.k
**

|== FIB : range /n -from 0 -to 12
        | add /fib ( fib /n )
              -let fib (| n | if : n <= 0 -> 0
                                 : n <= 1 -> 1
                                 : fib (n - 1) +
                                   fib (n - 2) |)

