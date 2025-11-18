-- base_tables/products.sql
CREATE TABLE raw.products (
    product_id INT PRIMARY KEY,
    sku VARCHAR,
    name VARCHAR,
    category VARCHAR,
    list_price DECIMAL(12,2)
);
