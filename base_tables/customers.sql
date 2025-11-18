-- base_tables/customers.sql
CREATE TABLE raw.customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR,
    last_name VARCHAR,
    email VARCHAR,
    signup_date DATE,
    country VARCHAR
);
