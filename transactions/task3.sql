START TRANSACTION;

-- Wrong amount
UPDATE products SET price = 999 WHERE product_id = 4;
INSERT INTO orders (order_id, customer_id, order_date) VALUES  (12, 12, '2025-10-22');
INSERT INTO order_row (order_id, product_id, amount) VALUES  (12, 4, 400);

SELECT * FROM products;
SELECT * FROM orders;
SELECT * FROM order_row;

ROLLBACK;

-- Correct amount
UPDATE products SET price = 999 WHERE product_id = 4;
INSERT INTO orders (order_id, customer_id, order_date) VALUES  (12, 12, '2025-10-22');
INSERT INTO order_row (order_id, product_id, amount) VALUES  (12, 4, 1);

SELECT * FROM products;
SELECT * FROM orders;
SELECT * FROM order_row;

COMMIT;
