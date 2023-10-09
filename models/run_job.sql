{{ config(
   materialized='table',
   append_prepend=false
) }}

-- Run multiple dbt jobs
{{ run(
   config={'models': 'tableC1'},
   tags=['my_custom_tag_1']
) }}

{{ run(
   config={'models': 'tableC2'},
   tags=['my_custom_tag_2']
) }}
