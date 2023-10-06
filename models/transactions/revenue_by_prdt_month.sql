-- models/revenue_quantity_by_product_month.sql

{{ config(materialized='table') }}

WITH revenue_quantity_by_product_month AS (
  SELECT
    DATE_TRUNC('MONTH', transaction_date) AS month,
    product_id,
    SUM(price * quantity) AS total_revenue,
    SUM(quantity) AS total_quantity
  FROM ecommerce_schema.transactions
  GROUP BY month, product_id
)

SELECT
  month,
  product_id,
  total_revenue,
  total_quantity
FROM revenue_quantity_by_product_month