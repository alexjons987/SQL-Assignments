DROP VIEW IF EXISTS returning_customers;
CREATE VIEW returning_customers AS
SELECT
    customers.customer_id, customers.name, COUNT(DISTINCT orders.order_id) AS total_orders
FROM
    customers
JOIN
	orders
    ON orders.customer_id = customers.customer_id
GROUP BY customers.customer_id HAVING COUNT(orders.order_id) > 1;
    
SELECT * FROM returning_customers;
