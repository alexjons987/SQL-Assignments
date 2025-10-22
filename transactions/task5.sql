START TRANSACTION;

SELECT * FROM products;

UPDATE products SET price = (price * 1.10) WHERE category = "Household";

COMMIT;

SELECT * FROM products;
