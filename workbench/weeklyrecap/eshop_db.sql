-- =============================
-- Create database
-- =============================
DROP DATABASE IF EXISTS eshop_db;
CREATE DATABASE eshop_db;
USE eshop_db;

-- =============================
-- TABLE: customers
-- =============================
CREATE TABLE customers
(
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    country VARCHAR(50),
    created_at DATE
);

-- =============================
-- TABLE: products
-- =============================
CREATE TABLE products
(
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2),
    stock INT
);

-- =============================
-- TABLE: orders
-- =============================
CREATE TABLE orders 
(
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    order_date DATE,
    status VARCHAR(20),
    total_amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- =============================
-- TABLE: order_items
-- =============================
CREATE TABLE order_items
(
    order_item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    product_id INT,
    quantity INT,
    unit_price DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- =============================
-- TABLE: payments
-- =============================
CREATE TABLE payments
(
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    payment_date DATE,
    payment_method VARCHAR(30),
    amount DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

-- =============================
-- CUSTOMERS
-- =============================
INSERT INTO customers (first_name, last_name, email, country, created_at)
    VALUES  ('Anna', 'Lind', 'anna.lind@example.com', 'Sweden', '2024-03-01'),
            ('Johan', 'Eriksson', 'johan.eriksson@example.com', 'Sweden', '2024-04-10'),
            ('Maria', 'Berg', 'maria.berg@example.com', 'Norway', '2024-02-15'),
            ('Lars', 'Hansen', 'lars.hansen@example.com', 'Denmark', '2024-01-20'),
            ('Emma', 'Olsen', 'emma.olsen@example.com', 'Finland', '2024-05-05');

-- =============================
-- PRODUCTS
-- =============================
INSERT INTO products (product_name, category, price, stock)
    VALUES  ('Wireless Mouse', 'Electronics', 25.99, 120),
            ('Mechanical Keyboard', 'Electronics', 79.50, 75),
            ('Office Chair', 'Furniture', 199.00, 30),
            ('Coffee Mug', 'Home', 9.99, 200),
            ('Monitor 27-inch', 'Electronics', 249.00, 40);
            
-- =============================
-- ORDERS
-- =============================
INSERT INTO orders (customer_id, order_date, status, total_amount)
    VALUES  (1, '2024-05-15', 'Paid', 104.99),
            (2, '2024-06-01', 'Paid', 249.00),
            (3, '2024-06-10', 'Pending', 79.50),
            (1, '2024-06-15', 'Paid', 25.99);

-- =============================
-- ORDER ITEMS
-- =============================
INSERT INTO order_items (order_id, product_id, quantity, unit_price)
    VALUES  (1, 1, 1, 25.99),
            (1, 4, 3, 9.99),
            (2, 5, 1, 249.00),
            (3, 2, 1, 79.50),
            (4, 1, 1, 25.99);

-- =============================
-- PAYMENTS
-- =============================
INSERT INTO payments (order_id, payment_date, payment_method, amount)
    VALUES  (1, '2024-05-16', 'Credit Card', 104.99),
            (2, '2024-06-02', 'PayPal', 249.00),
            (4, '2024-06-16', 'Bank Transfer', 25.99);
