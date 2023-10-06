-- models/products_dimension.sql

{{ config(
  materialized='table',
  unique_key='product_id',
  strategy='merge'
) }}

WITH current_data AS (
  SELECT
    product_id,
    category AS current_category,
    transaction_date AS effective_date
  FROM ecommerce_schema.transactions
),
min_transaction_date AS (
  SELECT
    MIN(transaction_date) AS min_date
  FROM ecommerce_schema.transactions
),
historical_data AS (
  SELECT
    t.product_id,
    t.category AS historical_category,
    t.transaction_date AS effective_date
  FROM ecommerce_schema.transactions t
  JOIN min_transaction_date m
  ON t.transaction_date < m.min_date
),
merged_data AS (
  SELECT
    COALESCE(current_data.product_id, historical_data.product_id) AS product_id,
    COALESCE(current_data.current_category, historical_data.historical_category) AS category,
    COALESCE(current_data.effective_date, historical_data.effective_date) AS effective_date
  FROM current_data
  FULL JOIN historical_data
  ON current_data.product_id = historical_data.product_id
)

SELECT
  product_id,
  category,
  effective_date
FROM merged_data
ORDER BY product_id, effective_date