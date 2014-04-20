** -*- koshu -*-
**
**  DESCRIPTION
**    List relmap operators
**
**  UsAGE
**    koshu rop.k
**

|== VERSION : koshu-version /ver

|== ROP -with-table -fore /n /group
    : koshu-rop -group /group
                -name  /name
                -usage /usage
    | nest /name /usage -to /rop
    | for /rop number-name
    | number-group

number-group : number /n  -from 1  -order /group
number-name  : number /n  -from 1  -order /name
