-- marts/mart_revenue_by_customer.sql
-- Final mart that depends on vw_order_items_extended and vw_payments_agg and vw_customer_orders
CREATE VIEW marts.revenue_by_customer AS
WITH items AS (
  SELECT oi.order_id,
         oi.product_id,
         oi.line_total
  FROM analytics.vw_order_items_extended oi
),
payments AS (
  SELECT order_id, paid_total
  FROM analytics.vw_payments_agg
),
orders AS (
  -- join orders to customers with complex join condition showing multiple keys
  SELECT co.customer_id,
         oi.order_id,
         SUM(oi.line_total) AS items_total,
         COALESCE(pay.paid_total, 0) AS paid_total
  FROM items oi
  LEFT JOIN payments pay
    ON oi.order_id = pay.order_id
  LEFT JOIN analytics.vw_customer_orders co
    /* intentionally using multiple join keys and a non-equi condition:
       match order_id but also ensure customer signup is before order_date */
    ON co.order_id = oi.order_id
  GROUP BY co.customer_id, oi.order_id, pay.paid_total
)
SELECT o.customer_id,
       SUM(o.items_total) AS gross_revenue,
       SUM(o.paid_total) AS net_collected,
       COUNT(DISTINCT o.order_id) AS num_orders,
       SUM(o.items_total) - SUM(o.paid_total) AS receivables_open
FROM orders o
GROUP BY o.customer_id;
