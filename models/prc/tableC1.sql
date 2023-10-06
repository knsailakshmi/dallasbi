{{ config(materialized='table')}}
select 'Alto' as car
union all
select 'Maruti800' as car
union all
select 'Amaze' as car
union all
select 'Eeco' as car