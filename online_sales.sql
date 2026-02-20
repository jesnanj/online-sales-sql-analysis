CREATE DATABASE IF NOT EXISTS online_sales;
USE online_sales;
SET FOREIGN_KEY_CHECKS = 0;
select count(*) from orders;

# highest performing months

SELECT 
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month,
    SUM(amount) AS total_revenue
FROM orders
GROUP BY year, month
ORDER BY total_revenue DESC
LIMIT 5;

# lowest revenue month

SELECT 
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month,
    SUM(amount) AS total_revenue
FROM orders
GROUP BY year, month
ORDER BY total_revenue ASC
LIMIT 1;

# peak order volume month

SELECT 
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month,
    COUNT(DISTINCT order_id) AS order_volume
FROM orders
GROUP BY year, month
ORDER BY order_volume DESC
LIMIT 1;

# yearly revenue comparison

SELECT 
    EXTRACT(YEAR FROM order_date) AS year,
    SUM(amount) AS yearly_revenue,
    COUNT(DISTINCT order_id) AS yearly_orders
FROM orders
GROUP BY year
ORDER BY year;