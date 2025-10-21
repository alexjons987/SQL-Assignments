SELECT
	patients.first_name,
	patients.last_name,
    doctors.doctor_name,
    appointments.date
FROM
	appointments
LEFT JOIN
	patients
	ON appointments.patient_id = patients.patient_id
LEFT JOIN
	doctors
    ON appointments.doctor_id = doctors.doctor_id
UNION
SELECT
	patients.first_name,
	patients.last_name,
    doctors.doctor_name,
    appointments.date
FROM
	appointments
RIGHT JOIN
	doctors
	ON appointments.doctor_id = doctors.doctor_id
LEFT JOIN
	patients
    ON appointments.patient_id = patients.patient_id;
