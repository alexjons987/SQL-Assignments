DROP VIEW IF EXISTS latest_order;
CREATE VIEW latest_order AS
SELECT
    customers.customer_id, customers.name, MAX(orders.order_date) AS latest_order_date
FROM
    customers
JOIN
	orders
    ON orders.customer_id = customers.customer_id
GROUP BY customers.customer_id;
    
SELECT * FROM latest_order;
