{{ config(materialized='table')}}
select 'Benz' as car
union all
select 'Audi' as car
union all
select 'Bmw' as car
union all
select 'Honda' as car