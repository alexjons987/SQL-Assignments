DROP VIEW IF EXISTS category_statistics;
CREATE VIEW category_statistics AS
SELECT
	products.category, AVG(products.price) AS avg_category_price, SUM(order_row.amount * price) AS total_sales_price
FROM
	products
JOIN
	order_row
    ON order_row.product_id = products.product_id
GROUP BY products.category;
    
SELECT * FROM category_statistics;