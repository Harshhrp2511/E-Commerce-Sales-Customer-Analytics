-- E-Commerce Sales & Customer Analytics
-- 01_data_quality_checks.sql
-- PostgreSQL data-quality checks

SELECT customer_id, COUNT(*) AS duplicate_count FROM ecommerce.customers GROUP BY customer_id HAVING COUNT(*) > 1 ORDER BY duplicate_count DESC;
SELECT order_id, COUNT(*) AS duplicate_count FROM ecommerce.orders GROUP BY order_id HAVING COUNT(*) > 1 ORDER BY duplicate_count DESC;
SELECT order_id, order_item_id, COUNT(*) AS duplicate_count FROM ecommerce.order_items GROUP BY order_id, order_item_id HAVING COUNT(*) > 1 ORDER BY duplicate_count DESC;

SELECT COUNT(*) AS missing_customer_id FROM ecommerce.customers WHERE customer_id IS NULL;
SELECT COUNT(*) AS missing_customer_unique_id FROM ecommerce.customers WHERE customer_unique_id IS NULL;
SELECT COUNT(*) AS missing_order_id FROM ecommerce.orders WHERE order_id IS NULL;
SELECT COUNT(*) AS missing_customer_id FROM ecommerce.orders WHERE customer_id IS NULL;
SELECT COUNT(*) AS missing_product_id FROM ecommerce.order_items WHERE product_id IS NULL;
SELECT COUNT(*) AS missing_purchase_timestamp FROM ecommerce.orders WHERE order_purchase_timestamp IS NULL;

SELECT 'customers' AS table_name, COUNT(*) AS row_count FROM ecommerce.customers
UNION ALL SELECT 'orders', COUNT(*) FROM ecommerce.orders
UNION ALL SELECT 'order_items', COUNT(*) FROM ecommerce.order_items
UNION ALL SELECT 'products', COUNT(*) FROM ecommerce.products;
