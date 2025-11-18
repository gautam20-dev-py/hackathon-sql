-- marts/mart_customer_ltv.sql
-- A more advanced view using window functions and depending on revenue_by_customer and product_performance
CREATE VIEW marts.customer_ltv AS
WITH revenue AS (
  SELECT customer_id, gross_revenue, net_collected, num_orders
  FROM marts.revenue_by_customer
),
product_stats AS (
  SELECT product_id, revenue AS product_revenue
  FROM marts.product_performance
)
SELECT r.customer_id,
       r.gross_revenue,
       r.net_collected,
       r.num_orders,
       SUM(ps.product_revenue) OVER (PARTITION BY r.customer_id) AS related_product_revenue
FROM revenue r
LEFT JOIN product_stats ps
  /* missing join condition: how product revenue links to customer in this demo */
  ON ps.product_id = /* missing join condition */
;
