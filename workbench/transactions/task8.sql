START TRANSACTION;

SAVEPOINT PRECUSTOMER;
INSERT INTO customers (name, city, member_since) VALUES ("Jorko", "Prague", "2025-10-22");

SAVEPOINT PREORDER;
INSERT INTO orders (order_id, customer_id, order_date) VALUES  (14, 14, '2025-10-22');
INSERT INTO order_row (order_id, product_id, amount) VALUES  (14, 3, 1);

COMMIT;

SELECT * FROM customers;
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
