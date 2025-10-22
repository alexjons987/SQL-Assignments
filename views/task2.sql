DROP VIEW IF EXISTS order_total;
CREATE VIEW order_total AS
SELECT
	orders.order_id, customers.name, orders.order_date, SUM(price * amount) AS total_price
FROM
	orders
JOIN
	customers
    ON orders.customer_id = customers.customer_id
JOIN
	order_row
    ON order_row.order_id = orders.order_id
JOIN
	products
    ON products.product_id = order_row.product_id
GROUP BY orders.order_id;
    
SELECT * FROM order_total;