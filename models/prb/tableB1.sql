{{config(materialized='table')}}
select 'p_A' as ID
union all
select 'p_B' as ID
union all
select 'p_C' as ID
union all
select 'p_D' as ID
union all
select 'p_E' as ID
union all
select 'p_F' as ID
