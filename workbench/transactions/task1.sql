START TRANSACTION;

INSERT INTO customers (name, city, member_since) VALUES (111222333, "Nowhere", "2045-10-22");
SELECT * FROM customers; -- After bad insert

ROLLBACK;
SELECT * FROM customers; -- Check after rollback

INSERT INTO customers (name, city, member_since) VALUES ("Alexander", "Stockholm", "2025-10-22");

COMMIT;
SELECT * FROM customers; -- Check after commit
