DROP VIEW IF EXISTS larger_orders;
CREATE VIEW larger_orders AS
SELECT
	*
FROM
	order_total
WHERE total_price > 10000;
    
SELECT * FROM larger_orders;