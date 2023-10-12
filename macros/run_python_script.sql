-- macros/run_python_script.sql

{% macro run_python_script() %}
    {{ log("Running Python script: python/s3_copy.py") }}
    {{ run_sql("EXECUTE 'python python/s3_copy.py'") }}
{% endmacro %}