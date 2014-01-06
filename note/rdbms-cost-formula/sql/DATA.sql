--
--  表 PLUS にテスト用のデータを登録
--

truncate table PLUS
/

declare
  max_value number := 250;
  good_clustering_factor boolean := true;

begin
  for a in 1 .. max_value loop
    for b in 1 .. max_value loop

      if good_clustering_factor then
        insert into PLUS  (a, b, c) values (a, b, a + b);
      else
        insert into PLUS  (a, b, c) values (b, a, a + b);
      end if;

    end loop;
  end loop;

  commit;

  dbms_stats.gather_table_stats (ownname => 'DAIZU', tabname => 'PLUS');
end;
/

