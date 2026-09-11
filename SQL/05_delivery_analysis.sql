-- E-Commerce Sales & Customer Analytics
-- 05_delivery_analysis.sql

SELECT ROUND(AVG(EXTRACT(EPOCH FROM (order_delivered_customer_date - order_purchase_timestamp)) / 86400), 2) AS average_delivery_days
FROM ecommerce.orders
WHERE order_delivered_customer_date IS NOT NULL AND order_purchase_timestamp IS NOT NULL;

SELECT ROUND(100.0 * SUM(CASE WHEN order_delivered_customer_date > order_estimated_delivery_date THEN 1 ELSE 0 END) / NULLIF(COUNT(*), 0), 2) AS late_delivery_rate
FROM ecommerce.orders
WHERE order_delivered_customer_date IS NOT NULL AND order_estimated_delivery_date IS NOT NULL;

SELECT ROUND(AVG(EXTRACT(EPOCH FROM (order_delivered_customer_date - order_estimated_delivery_date)) / 86400), 2) AS average_delay_days
FROM ecommerce.orders
WHERE order_delivered_customer_date IS NOT NULL AND order_estimated_delivery_date IS NOT NULL
  AND order_delivered_customer_date > order_estimated_delivery_date;

SELECT c.customer_state,
       ROUND(AVG(EXTRACT(EPOCH FROM (o.order_delivered_customer_date - o.order_purchase_timestamp)) / 86400), 2) AS average_delivery_days,
       ROUND(100.0 * SUM(CASE WHEN o.order_delivered_customer_date > o.order_estimated_delivery_date THEN 1 ELSE 0 END) / NULLIF(COUNT(*), 0), 2) AS late_delivery_rate,
       COUNT(DISTINCT o.order_id) AS total_orders
FROM ecommerce.orders o JOIN ecommerce.customers c ON o.customer_id = c.customer_id
WHERE o.order_delivered_customer_date IS NOT NULL AND o.order_purchase_timestamp IS NOT NULL
  AND o.order_estimated_delivery_date IS NOT NULL
GROUP BY c.customer_state ORDER BY average_delivery_days DESC;

SELECT order_status, COUNT(DISTINCT order_id) AS total_orders,
       ROUND(100.0 * COUNT(DISTINCT order_id) / SUM(COUNT(DISTINCT order_id)) OVER (), 2) AS percentage
FROM ecommerce.orders GROUP BY order_status ORDER BY total_orders DESC;
