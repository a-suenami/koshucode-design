--
--  表と索引の主要な統計情報
--

create view TABLE_INDEX_STATS as

with

TAB as (
 select
  table_name,
  num_rows,
  blocks,
  last_analyzed as table_analyzed
 from USER_TABLES
),

IND as (
 select
  table_name,
  index_name,
  blevel,
  distinct_keys,
  leaf_blocks,
  clustering_factor,
  last_analyzed as index_analyzed
 from USER_INDEXES
),

TAB_IND as (
 select *
 from TAB
 natural left join IND
)

 select *
 from TAB_IND

/

