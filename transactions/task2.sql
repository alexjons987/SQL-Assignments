START TRANSACTION;

-- Wrong product id
INSERT INTO orders (order_id, customer_id, order_date) VALUES  (11, 12, '2025-10-21');
INSERT INTO order_row (order_id, product_id, amount) VALUES  (11, 2, 1);

ROLLBACK;

-- Correct product id
INSERT INTO orders (order_id, customer_id, order_date) VALUES  (11, 12, '2025-10-21');
INSERT INTO order_row (order_id, product_id, amount) VALUES  (11, 3, 1);

COMMIT;

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