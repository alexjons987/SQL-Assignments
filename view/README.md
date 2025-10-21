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
    medlem_since DATE
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
    orderdatum DATE,
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
INSERT INTO customers (name, city, medlem_since)
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
INSERT INTO orders (customer_id, orderdatum)
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

-- === order_row ===
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

### Task 1 – INNER JOIN: Patient and Province
1. Display the patient's first name, last name and the full name of the province.
2. Use `INNER JOIN` between the tables `patients` and `province_names`.
3. The result should only display patients who have a valid `province_id`.

---

### Task 2 – LEFT JOIN: Display all patients
1. Display all patients even if they do not have a province associated with them.
2. Use `LEFT JOIN` between `patients` and `province_names`.
3. If the patient does not have a province, the `province_name` column should be `NULL`.

---

### Task 3 – RIGHT JOIN: Display all provinces
1. Display all provinces and matching patients.
2. Use `RIGHT JOIN` between `patients` and `province_names`.
3. If a province has no patients, the patient's name should be `NULL`.

---

### Task 4 – FULL JOIN (simulated in MySQL)
1. MySQL does NOT have `FULL JOIN`, so use `UNION`.
2. Combine the results of a `LEFT JOIN` and a `RIGHT JOIN`.
3. Show **all patients and all provinces** – even those without a match.

---

### Task 5 – INNER JOIN: Patient and Appointment
1. Show the patient’s **first name**, **last name**, and the **date** of their appointment.
2. Use `INNER JOIN` between `patients` and `appointments`.
3. Show only patients who actually have an appointment.

---

### Task 6 – LEFT JOIN: Patients without an appointment
1. Show **all patients**, even those without an appointment.
2. Use `LEFT JOIN` between `patients` and `appointments`.
3. If the patient has no appointment, the `date` column should be `NULL`.

---

### Task 7 – RIGHT JOIN: Doctors and patients
1. Show **all doctors** and the patients they have appointments with.
2. Use `RIGHT JOIN` between `appointments` and `doctors`.
3. Use `LEFT JOIN` between `appointments` and `patients`.
4. If the doctor has no appointments, the patient’s name should be `NULL`.
5. Show the columns: `doctor_name`, `patient_first_name`, `patient_last_name`.

---

### Task 8 – FULL JOIN: All patients and all doctors
1. Show all patients and all doctors (even if they don’t have appointments).
2. Use `UNION` to combine `LEFT JOIN`s and `RIGHT JOIN`s.
3. Show the columns: `patient_name`, `doctor_name`, `date`.

---

### Task 9 – JOIN with WHERE condition
1. Show all patients who **live in Ontario**.
2. Use `INNER JOIN` between `patients` and `province_names`.
3. Filter with `WHERE province_name = "Ontario"`.
4. Show the columns: `first_name`, `last_name`, `province_name`.

---

### Task 10 – Multiple JOINs (3 tables)
1. Show the **patient name**, **doctor name** and **date** of appointment.
2. Use `INNER JOIN` between `appointments`, `patients` and `doctors`.
3. Sort the results by date (from earliest to latest).
4. Show the columns: `first_name`, `last_name`, `doctor_name`, `date`.