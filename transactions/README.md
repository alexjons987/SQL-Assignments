# Transaction SQL Assignments
### Sample data for the assignments
```sql
DROP DATABASE IF EXISTS store_system;
CREATE DATABASE store_system;
USE store_system;

CREATE TABLE customers
(
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    city VARCHAR(50),
    member_since DATE
);

CREATE TABLE products
(
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    price DECIMAL(10,2) NOT NULL
);

CREATE TABLE orders
(
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_row
(
    order_id INT,
    product_id INT,
    amount INT,
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

USE store_system;
-- === CUSTOMERS ===
`INSERT` INTO customers (name, city, member_since)
    VALUES  ('Anna Svensson', 'Stockholm', '2021-03-15'),
            ('Erik Johansson', 'Gothenburg', '2020-08-22'),
            ('Maria Lind', 'Malmö', '2022-01-10'),
            ('Johan Karlsson', 'Uppsala', '2019-11-05'),
            ('Sara Nilsson', 'Västerås', '2023-05-18'),
            ('Lars Andersson', 'Örebro', '2021-09-12'),
            ('Emma Persson', 'Stockholm', '2020-02-03'),
            -- Customers without orders
            ('Oskar Berg', 'Luleå', '2024-02-10'),
            ('Helena Ek', 'Sundsvall', '2024-04-03'),
            ('Tomas Pettersson', 'Kalmar', '2023-09-28');

-- === PRODUCTS ===
`INSERT` INTO products (name, category, price)
    VALUES  ('Laptop 15"', 'Electronics', 9999.00),
            ('Smartphone', 'Electronics', 7499.00),
            ('Headphones', 'Electronics', 1299.00),
            ('Coffee maker', 'Household', 799.00),
            ('Vacuum cleaner', 'Household', 1599.00),
            ('Shirt', 'Clothes', 399.00),
            ('Jeans', 'Clothes', 699.00),
            ('Jackry', 'Clothes', 1199.00),
            ('Kitchen knife set', 'Household', 499.00),
            ('TV 55"', 'Electronics', 6999.00);

-- === ORDERS ===
`INSERT` INTO orders (customer_id, order_date)
    VALUES  (1, '2023-11-20'),
            (2, '2023-11-21'),
            (3, '2023-11-22'),
            (1, '2024-01-10'),
            (4, '2024-02-05'),
            (5, '2024-03-01'),
            (6, '2024-04-15'),
            (7, '2024-05-09'),
            (3, '2024-06-20'),
            (2, '2024-07-04');

-- === ORDER ROW ===
`INSERT` INTO order_row (order_id, product_id, amount)
    VALUES  (1, 1, 1),
            (1, 3, 2),
            (2, 2, 1),
            (2, 5, 1),
            (2, 9, 3),
            (3, 3, 1),
            (3, 4, 1),
            (3, 6, 2),
            (4, 10, 1),
            (4, 7, 2),
            (5, 5, 1),
            (5, 4, 1),
            (6, 8, 1),
            (6, 6, 1),
            (7, 2, 1),
            (7, 3, 1),
            (8, 1, 1),
            (8, 9, 2),
            (9, 4, 2),
            (9, 7, 1),
            (10, 10, 1),
            (10, 6, 3);
```

---

### Task 1 – A simple transaction
Create a transaction that adds a new customer to the `customers` table.

If `INSERT` succeeds, `COMMIT`.

If it fails, `ROLLBACK`.

Tip: Use `START TRANSACTION`, `INSERT INTO`, `COMMIT`, and `ROLLBACK`.

---

### Task 2 – Two steps in the same transaction
Add a new order to `orders` and the corresponding rows in `order_row`.

Both should either be saved or rolled back if something goes wrong.

Tip: Try creating an error (e.g. invalid `product_id`) and see that `ROLLBACK` removes everything.

---

### Task 3 – Simulate errors
Create a transaction that attempts to:
1. Update a product price in products.
2. Add a new order that uses the product.

If the price update succeeds but the `INSERT` into the order fails → roll back both.

---

### Task 4 – Use `SAVEPOINT`
Create a transaction where you:
1. Insert a new customer.
2. Sets a `SAVEPOINT`.
3. Insert a new order.
4. `ROLLBACK TO SAVEPOINT` so that only the order is deleted, but the customer remains.

Finish with `COMMIT`.

---

### Task 5 – Increase prices within a category
Create a transaction that increases the price of all products in the "Clothing" category by 10%.

Use `START TRANSACTION`, UPDATE, and `COMMIT`.

If you want to undo the change – use `ROLLBACK`.

---

### Task 6 – Partial `ROLLBACK` with `SAVEPOINT`
Create a transaction that:
1. Increases the price of all products in the "Household" category by 5%.
2. Sets a `SAVEPOINT`.
3. Increases the price of all products in "Electronics" by 10%.
4. Undoes only step 3 with `ROLLBACK TO SAVEPOINT`.
5. Saves the household change with `COMMIT`.

---

### Task 7 – Two steps in the same transaction
Create a transaction that in the same block:
1. Updates the price of a product.
2. Adds a new order to the `orders` table.

Both steps should either be saved or rolled back together.

---

### Task 8 – Create customer and order at the same time
Create a transaction that:
1. Adds a new customer to `customers`.
2. Creates a new order for that customer in `orders`.

If any step fails, nothing should be saved.

---

### Task 9 – Test `ROLLBACK` on error
Create a transaction that attempts to add an order and an order row.

Use an invalid `product_id` in the order line to create an error.

See how MySQL automatically aborts and how you can roll back with `ROLLBACK`.

---

### Task 10 – Procedure with transaction
Create a stored procedure that:
1. Starts a transaction.
2. Adds a new order to `orders`.
3. Adds a row to `order_row`.
4. Ends with `COMMIT`.

The procedure should be able to be run with parameters for customer, product and quantity.
