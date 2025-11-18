-- base_tables/orders.sql
CREATE TABLE raw.orders (
    order_id BIGINT PRIMARY KEY,
    customer_id INT,
    order_date TIMESTAMP,
    status VARCHAR,
    total_amount DECIMAL(12,2)
);
