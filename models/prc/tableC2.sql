{{ config(materialized='table')}}
select 'Nexon' as car
union all
select 'Nexas' as car
union all
select 'i20' as car
union all
select 'i10' as car