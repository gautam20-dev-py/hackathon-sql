-- views/vw_order_items_extended.sql
CREATE VIEW analytics.vw_order_items_extended AS
SELECT oi.order_item_id,
       oi.order_id,
       oi.product_id,
       p.name AS product_name,
       p.category,
       oi.quantity,
       oi.unit_price,
       (oi.quantity * oi.unit_price) AS line_total
FROM raw.order_items oi
JOIN raw.products p
  ON oi.product_id = p.product_id
WHERE oi.quantity > 0;
