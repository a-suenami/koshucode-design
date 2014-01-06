--
--  PLUS のデータ解釈
--
--    a + b = c
--    1 <= a <= max_value (250)
--    1 <= b <= max_value (250)
--

drop table PLUS
/

create table PLUS (
 a number (10),
 b number (10),
 c number (10),
 constraint PLUS_PK primary key (a, b)
)
/

