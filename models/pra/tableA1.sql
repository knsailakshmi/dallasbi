{{ config(materialized='table')}}
select 'praveen' as name1,
'123' AS name2
union all
select 'zubdah' as name1, '123' AS name2
union all
select 'rayyan' as name1, '123' AS name2
union all
select 'Sai' as name1,
'123' AS name2
