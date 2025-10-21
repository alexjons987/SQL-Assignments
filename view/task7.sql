DROP VIEW IF EXISTS latest_order;
CREATE VIEW latest_order AS
SELECT order_total.name, order_total.order_date, order_total.total_price
FROM order_total
WHERE
	order_total.order_date =
    (
		SELECT MAX(order_date) FROM order_total WHERE name = order_total.name
	);
    
SELECT * FROM latest_order;
