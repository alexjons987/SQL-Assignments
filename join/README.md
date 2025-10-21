# Join SQL Assignments
### Sample data for the assignments
```sql
-- Tables
CREATE TABLE patients
(
	patient_id INTEGER AUTO_INCREMENT PRIMARY KEY,
    first_name TEXT,
    last_name TEXT,
    province_id VARCHAR(2)
);

CREATE TABLE province_names
(
	province_id VARCHAR(2) PRIMARY KEY,
    province_name TEXT
);

CREATE TABLE doctors
(
	doctor_id INTEGER AUTO_INCREMENT PRIMARY KEY,
    doctor_name TEXT,
    specialty TEXT
);

CREATE TABLE appointments
(
	appointment_id INTEGER AUTO_INCREMENT PRIMARY KEY,
    patient_id INTEGER NOT NULL,
    doctor_id INTEGER,
    date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Data
INSERT INTO patients (first_name, last_name, province_id)
	VALUES ("Alice", "A.", "ON"),
		   ("Bob", "B.", "QC"),
           ("Charlie", "C.", NULL),
           ("Dede", "D.", "BC");
           
INSERT INTO province_names (province_id, province_name)
	VALUES ("ON", "Ontario"),
		   ("QC", "Quebec"),
           ("BC", "British Columbia"),
           ("AB", "Alberta");
           
INSERT INTO doctors (doctor_name, specialty)
	VALUES ("Dr. Eduardo", "Pediatrics"),
		   ("Dr. Fors", "Surgery"),
           ("Dr. Gilbert", "Cardiology");
           
INSERT INTO appointments (patient_id, doctor_id, date)
	VALUES (1, 1, "2025-05-01"),
		   (2, 3, "2025-05-03"),
           (3, NULL, "2025-05-05");
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