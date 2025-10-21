SELECT
	doctors.doctor_name,
    patients.first_name,
    patients.last_name
FROM
	appointments
RIGHT JOIN
	doctors
    ON appointments.doctor_id = doctors.doctor_id
LEFT JOIN
	patients
    ON appointments.patient_id = patients.patient_id;
