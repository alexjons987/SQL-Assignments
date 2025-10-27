DELIMITER $$

CREATE PROCEDURE add_order(
	IN p_order_id INT,
    IN p_customer_id INT,
    IN p_product_id INT,
    IN p_amount INT
)

BEGIN
	-- Roll back the whole transaction if any statement fails
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		ROLLBACK;
		RESIGNAL;  -- optional: rethrow to the caller
	END;

	START TRANSACTION;

	INSERT INTO orders (order_id, customer_id, order_date) VALUES (p_order_id, p_customer_id, CURRENT_DATE());

	INSERT INTO order_row (order_id, product_id, amount) VALUES (p_order_id, p_product_id, p_amount);

	COMMIT;
END$$

DELIMITER ;

CALL add_order(16, 12, 1, 1);

SELECT * FROM order_row;
SELECT * FROM orders;
