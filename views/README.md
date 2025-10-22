# View SQL Assignments
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
INSERT INTO customers (name, city, member_since)
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
INSERT INTO products (name, category, price)
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
INSERT INTO orders (customer_id, order_date)
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
INSERT INTO order_row (order_id, product_id, amount)
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

### Task 1 – Simple view (customer_info)
Create a view customer_info that shows the customer's name, city, and how many orders each customer has made.

Use LEFT JOIN between CUSTOMERS and ORDERS and COUNT(order_id).

Also show customers with 0 orders.

---

### Task 2 – View with total order value (order_total)
Create a view order_total that shows order_id, customer's name, order date and the total order value (price * quantity).

Use JOIN between ORDERS, ORDER_LINE and PRODUCTS and GROUP BY order_id.

---

### Task 3 – View based on another view
Create a view large_orders that shows only those orders from order_total where the total value exceeds 10,000 SEK.

---

### Task 4 – View with categorical sales (category_statistics)
Create a view category_statistics that shows each product category with total sales and average product price.

Use GROUP BY category.

---

### Task 5 – View for best-selling products (top_products)
Create a view top_products that displays product name and total number of sold units, sorted descending.

Limit the result to the top 5 with LIMIT 5.

---

### Task 6 – View that combines multiple views
Create a view customer_analysis that combines customer_info and order_total to display the customer's total order count and total amount spent.

Tip: use a subquery or join on customer_id.

---

### Task 7 – View with latest purchase (last_order)
Create a view last_order that displays each customer's latest order date and order value.

Use a subquery to retrieve MAX(order_date) per customer.

---

### Task 8 – View with average value per customer (customer_average)
Create a view customer_average that displays the customer's name, number of orders, and average order value.

Use a JOIN between CUSTOMERS, ORDERS, ORDER_LINES, and PRODUCTS.

Filter with HAVING COUNT(order_id) > 0.

---

### Task 9 – View with returning customers (returning_customers)
Create a view returning_customers that shows all customers who have placed more than 2 orders.

Use GROUP BY customer_id and HAVING COUNT(order_id) > 2.

---

### Task 10 – View for reporting (sales report)
Create a view sales report that shows:
* customer name,
* city,
* number of orders,
* total spent,
* average order value.

Use a combination of SUM, COUNT and AVG in a GROUP BY.

Sort the result by total spent in descending order.
