-- views/vw_customer_orders.sql
CREATE VIEW analytics.vw_customer_orders AS
WITH latest_order AS (
    SELECT o.*,
           ROW_NUMBER() OVER (PARTITION BY o.customer_id ORDER BY o.order_date DESC) AS rn
    FROM raw.orders o
)
SELECT c.customer_id,
       c.first_name || ' ' || c.last_name AS full_name,
       c.email,
       lo.order_id,
       lo.order_date,
       lo.status,
       lo.total_amount
FROM raw.customers c
LEFT JOIN latest_order lo
  ON c.customer_id = lo.customer_id
WHERE lo.rn = 1 OR lo.rn IS NULL;
