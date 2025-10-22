DROP VIEW IF EXISTS customer_info;
CREATE VIEW customer_info AS
SELECT
	customers.customer_id, customers.name, customers.city, COUNT(order_id) AS order_count
FROM
	customers
LEFT JOIN
	orders
    ON orders.customer_id = customers.customer_id
GROUP BY customers.customer_id;
    
SELECT * FROM customer_info;