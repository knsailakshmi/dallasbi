-- models/revenue_by_category

{{ config(materialized='table') }}

WITH revenue_by_category AS (
  SELECT
    category,
    SUM(price * quantity) AS total_revenue
  FROM ecommerce_schema.transactions
  GROUP BY category
)

SELECT
  category,
  total_revenue
FROM revenue_by_category;