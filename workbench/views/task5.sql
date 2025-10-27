DROP VIEW IF EXISTS top_products;
CREATE VIEW top_products AS
SELECT
	products.name, SUM(order_row.amount) AS total_sales_count
FROM
	products
JOIN
	order_row
    ON order_row.product_id = products.product_id
GROUP BY products.name ORDER BY total_sales_count DESC LIMIT 5;
    
SELECT * FROM top_products;