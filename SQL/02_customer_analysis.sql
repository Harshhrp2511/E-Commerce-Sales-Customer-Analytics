-- E-Commerce Sales & Customer Analytics
-- 02_customer_analysis.sql

SELECT COUNT(DISTINCT customer_unique_id) AS total_customers FROM ecommerce.customers;

SELECT customer_state, COUNT(DISTINCT customer_unique_id) AS customers
FROM ecommerce.customers GROUP BY customer_state ORDER BY customers DESC;

SELECT customer_state, COUNT(DISTINCT customer_unique_id) AS customers
FROM ecommerce.customers GROUP BY customer_state ORDER BY customers DESC LIMIT 10;

SELECT COUNT(*) AS repeat_customers FROM (
    SELECT c.customer_unique_id
    FROM ecommerce.customers c JOIN ecommerce.orders o ON c.customer_id = o.customer_id
    GROUP BY c.customer_unique_id HAVING COUNT(DISTINCT o.order_id) > 1
) AS repeat_customer_list;

WITH customer_order_counts AS (
    SELECT c.customer_unique_id, COUNT(DISTINCT o.order_id) AS order_count
    FROM ecommerce.customers c JOIN ecommerce.orders o ON c.customer_id = o.customer_id
    GROUP BY c.customer_unique_id
)
SELECT COUNT(*) AS total_customers,
       COUNT(*) FILTER (WHERE order_count > 1) AS repeat_customers,
       ROUND(100.0 * COUNT(*) FILTER (WHERE order_count > 1) / NULLIF(COUNT(*), 0), 2) AS repeat_customer_rate
FROM customer_order_counts;

SELECT ROUND(COUNT(DISTINCT o.order_id)::numeric / NULLIF(COUNT(DISTINCT c.customer_unique_id), 0), 2) AS orders_per_customer
FROM ecommerce.orders o JOIN ecommerce.customers c ON o.customer_id = c.customer_id;

SELECT c.customer_state, ROUND(SUM(oi.price), 2) AS total_revenue,
       COUNT(DISTINCT c.customer_unique_id) AS customers,
       ROUND(SUM(oi.price) / NULLIF(COUNT(DISTINCT c.customer_unique_id), 0), 2) AS revenue_per_customer
FROM ecommerce.orders o
JOIN ecommerce.customers c ON o.customer_id = c.customer_id
JOIN ecommerce.order_items oi ON o.order_id = oi.order_id
GROUP BY c.customer_state ORDER BY revenue_per_customer DESC;
