-- marts/mart_product_performance.sql
CREATE VIEW marts.product_performance AS
WITH item_sales AS (
  SELECT p.product_id,
         p.name AS product_name,
         SUM(oi.quantity) AS total_qty,
         SUM(oi.line_total) AS revenue
  FROM analytics.vw_order_items_extended oi
  JOIN raw.products p ON oi.product_id = p.product_id
  GROUP BY p.product_id, p.name
),
refunded_orders AS (
  -- pretend we have a refunds table in future; show placeholder for missing join condition
  SELECT r.order_id, r.refund_amount
  FROM raw.refunds r -- NOTE: this table does not exist in base; used to simulate missing dependency
)
SELECT s.product_id,
       s.product_name,
       s.total_qty,
       s.revenue,
       COALESCE(r.refund_amount, 0) AS total_refunds -- may be NULL if refunds not present
FROM item_sales s
LEFT JOIN refunded_orders r
  ON s.product_id = r.order_id -- intentionally incorrect to simulate ambiguous join (for testing)
;
