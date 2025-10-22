DROP VIEW IF EXISTS customer_analysis;
CREATE VIEW customer_analysis AS
SELECT
    customer_info.customer_id, customer_info.name, customer_info.order_count, SUM(order_total.total_price) AS total_spent
FROM
    customer_info
JOIN
	orders
    ON orders.customer_id = customer_info.customer_id
JOIN
	order_total
    ON order_total.order_id = orders.order_id
GROUP BY customer_info.customer_id, customer_info.name, customer_info.order_count;
    
SELECT * FROM customer_analysis;
