DROP VIEW IF EXISTS customer_average;
CREATE VIEW customer_average AS
SELECT
    customers.customer_id, customers.name, COUNT(DISTINCT orders.order_id) AS total_orders, SUM(order_row.amount * price) / COUNT(DISTINCT orders.order_id) AS avg_order_cost
FROM
    customers
JOIN
	orders
    ON orders.customer_id = customers.customer_id
JOIN
	order_row
    ON order_row.order_id = orders.order_id
JOIN
	products
	ON products.product_id = order_row.product_id
GROUP BY customers.customer_id HAVING COUNT(orders.order_id) > 0;
    
SELECT * FROM customer_average;
