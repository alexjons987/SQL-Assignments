START TRANSACTION;

SELECT * FROM products;

UPDATE products SET price = (price * 1.05) WHERE category = "Household";

SAVEPOINT POSTHOUSEHOLDFIVE;

UPDATE products SET price = (price * 1.05) WHERE category = "Electronics";

ROLLBACK TO POSTHOUSEHOLDFIVE;

COMMIT;

SELECT * FROM products;
