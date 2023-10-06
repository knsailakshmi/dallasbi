-- models/avg_price_by_category.sql

{{ config(materialized='table') }}

WITH average_price_by_category AS (
  SELECT
    category,
    AVG(price) AS avg_price
  FROM ecommerce_schema.transactions
  GROUP BY category
)

SELECT
  category,
  avg_price
FROM average_price_by_category
