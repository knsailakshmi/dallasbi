{{ config(materialized='table')}}
select 'Arthi' as name1,
'123' AS name2
union all
select 'Ananth' as name1, '123' AS name2
union all
select 'Janaki' as name1, '123' AS name2
union all
select 'Aravind' as name1,
'123' AS name2