-- models/average_price_by_category.sql

{{ config(
  materialized='table',
  sql_where="transaction_date >= '2023-01-01' AND transaction_date < '2024-01-01'"
) }}

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