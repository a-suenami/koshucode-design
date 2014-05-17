** -*- koshu -*-
**
**  省略可能な有標属性
**

key : keep /a = @a and /b = @b
    --- opt -a 1
      | opt -b 30

|== KEY-1 : p | key -a 1 -b 30
|== KEY-2 : p | key -a 1
|== KEY-3 : p | key
