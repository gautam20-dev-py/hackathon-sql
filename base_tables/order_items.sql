-- base_tables/order_items.sql
CREATE TABLE raw.order_items (
    order_item_id BIGINT PRIMARY KEY,
    order_id BIGINT,
    product_id INT,
    quantity INT,
    unit_price DECIMAL(12,2)
);
