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
