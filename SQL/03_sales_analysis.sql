-- E-Commerce Sales & Customer Analytics
-- 03_sales_analysis.sql

SELECT COUNT(DISTINCT order_id) AS total_orders FROM ecommerce.orders;
SELECT ROUND(SUM(price), 2) AS total_revenue FROM ecommerce.order_items;

SELECT ROUND(SUM(oi.price) / NULLIF(COUNT(DISTINCT o.order_id), 0), 2) AS average_order_value
FROM ecommerce.orders o JOIN ecommerce.order_items oi ON o.order_id = oi.order_id;

SELECT c.customer_state, ROUND(SUM(oi.price), 2) AS total_revenue,
       COUNT(DISTINCT o.order_id) AS total_orders,
       COUNT(DISTINCT c.customer_unique_id) AS customers
FROM ecommerce.orders o
JOIN ecommerce.customers c ON o.customer_id = c.customer_id
JOIN ecommerce.order_items oi ON o.order_id = oi.order_id
GROUP BY c.customer_state ORDER BY total_revenue DESC;

SELECT p.product_category_name, ROUND(SUM(oi.price), 2) AS total_revenue,
       COUNT(DISTINCT o.order_id) AS total_orders
FROM ecommerce.orders o
JOIN ecommerce.order_items oi ON o.order_id = oi.order_id
JOIN ecommerce.products p ON oi.product_id = p.product_id
GROUP BY p.product_category_name ORDER BY total_revenue DESC LIMIT 10;

SELECT order_status, COUNT(DISTINCT order_id) AS total_orders,
       ROUND(100.0 * COUNT(DISTINCT order_id) / SUM(COUNT(DISTINCT order_id)) OVER (), 2) AS percentage
FROM ecommerce.orders GROUP BY order_status ORDER BY total_orders DESC;

SELECT DATE_TRUNC('month', o.order_purchase_timestamp) AS month, ROUND(SUM(oi.price), 2) AS revenue
FROM ecommerce.orders o JOIN ecommerce.order_items oi ON o.order_id = oi.order_id
GROUP BY DATE_TRUNC('month', o.order_purchase_timestamp) ORDER BY month;

WITH monthly_revenue AS (
    SELECT DATE_TRUNC('month', o.order_purchase_timestamp) AS month, SUM(oi.price) AS revenue
    FROM ecommerce.orders o JOIN ecommerce.order_items oi ON o.order_id = oi.order_id
    GROUP BY DATE_TRUNC('month', o.order_purchase_timestamp)
)
SELECT month, ROUND(revenue, 2) AS revenue,
       ROUND(100.0 * (revenue - LAG(revenue) OVER (ORDER BY month)) /
             NULLIF(LAG(revenue) OVER (ORDER BY month), 0), 2) AS mom_growth_percentage
FROM monthly_revenue ORDER BY month;

SELECT DATE_TRUNC('month', o.order_purchase_timestamp) AS month, ROUND(SUM(oi.price), 2) AS revenue
FROM ecommerce.orders o JOIN ecommerce.order_items oi ON o.order_id = oi.order_id
GROUP BY DATE_TRUNC('month', o.order_purchase_timestamp) ORDER BY revenue DESC LIMIT 5;

SELECT DATE_TRUNC('month', o.order_purchase_timestamp) AS month, ROUND(SUM(oi.price), 2) AS revenue
FROM ecommerce.orders o JOIN ecommerce.order_items oi ON o.order_id = oi.order_id
GROUP BY DATE_TRUNC('month', o.order_purchase_timestamp)
HAVING SUM(oi.price) > 100000 ORDER BY revenue ASC LIMIT 5;
