-- models/total_quantity_by_category.sql

{{ config(materialized='table') }}

WITH total_quantity_by_category AS (
  SELECT
    category,
    SUM(quantity) AS total_quantity
  FROM ecommerce_schema.transactions
  GROUP BY category
)

SELECT
  category,
  total_quantity
FROM total_quantity_by_category