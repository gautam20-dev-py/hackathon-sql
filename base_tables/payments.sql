-- base_tables/payments.sql
CREATE TABLE raw.payments (
    payment_id BIGINT PRIMARY KEY,
    order_id BIGINT,
    paid_amount DECIMAL(12,2),
    payment_date TIMESTAMP,
    payment_method VARCHAR
);
