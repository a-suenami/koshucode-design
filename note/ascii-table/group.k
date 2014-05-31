** -*- koshu -*-
**
**  使用例
**    koshu ascii.k group.k
**

|== GROUP -fore /g -order -table
  : ascii-table -code /n -char /c
  | add /g ( char-group-1 /c )
  | nest /n /c -to /nc
  | for /nc ( chunk /0 /1 /2 /3 -order /n )
