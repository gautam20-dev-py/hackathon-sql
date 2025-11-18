-- views/vw_payments_agg.sql
CREATE VIEW analytics.vw_payments_agg AS
SELECT order_id,
       SUM(paid_amount) AS paid_total,
       COUNT(DISTINCT payment_id) AS payment_count,
       MAX(payment_date) AS last_payment_date
FROM raw.payments
GROUP BY order_id;
