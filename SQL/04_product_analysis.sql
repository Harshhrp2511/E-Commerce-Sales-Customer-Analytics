-- E-Commerce Sales & Customer Analytics
-- 04_product_analysis.sql

SELECT p.product_category_name, ROUND(SUM(oi.price), 2) AS total_revenue
FROM ecommerce.order_items oi JOIN ecommerce.products p ON oi.product_id = p.product_id
GROUP BY p.product_category_name ORDER BY total_revenue DESC;

SELECT p.product_category_name, ROUND(SUM(oi.price), 2) AS total_revenue,
       COUNT(DISTINCT oi.order_id) AS total_orders
FROM ecommerce.order_items oi JOIN ecommerce.products p ON oi.product_id = p.product_id
GROUP BY p.product_category_name ORDER BY total_revenue DESC LIMIT 10;

SELECT p.product_category_name, COUNT(DISTINCT oi.order_id) AS total_orders,
       ROUND(SUM(oi.price), 2) AS total_revenue
FROM ecommerce.order_items oi JOIN ecommerce.products p ON oi.product_id = p.product_id
GROUP BY p.product_category_name ORDER BY total_orders DESC LIMIT 10;

SELECT p.product_category_name, ROUND(AVG(oi.price), 2) AS average_item_price
FROM ecommerce.order_items oi JOIN ecommerce.products p ON oi.product_id = p.product_id
GROUP BY p.product_category_name ORDER BY average_item_price DESC;

SELECT oi.product_id, ROUND(SUM(oi.price), 2) AS total_revenue, COUNT(*) AS items_sold
FROM ecommerce.order_items oi GROUP BY oi.product_id ORDER BY total_revenue DESC LIMIT 10;
