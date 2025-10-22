START TRANSACTION;

INSERT INTO orders (order_id, customer_id, order_date) VALUES  (15, 12, '2025-10-22');
INSERT INTO order_row (order_id, product_id, amount) VALUES  (15, 60, 400);

ROLLBACK;

SELECT	* FROM orders;
