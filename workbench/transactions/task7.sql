START TRANSACTION;

UPDATE products SET price = 9999 WHERE product_id = 4;
INSERT INTO orders (order_id, customer_id, order_date) VALUES  (13, 12, '2025-10-22');
INSERT INTO order_row (order_id, product_id, amount) VALUES  (13, 4, 400);

SELECT * FROM products;
SELECT
	customers.customer_id, name, order_date, orders.order_id AS order_id, order_row.order_id AS order_row_id, product_id, amount
FROM
	orders
JOIN
	customers
    ON customers.customer_id = orders.customer_id
JOIN
	order_row
    ON order_row.order_id = orders.order_id;

ROLLBACK;

SELECT * FROM products;
SELECT
	customers.customer_id, name, order_date, orders.order_id AS order_id, order_row.order_id AS order_row_id, product_id, amount
FROM
	orders
JOIN
	customers
    ON customers.customer_id = orders.customer_id
JOIN
	order_row
    ON order_row.order_id = orders.order_id;
