SELECT
	patients.first_name,
    patients.last_name,
    appointments.date
FROM
	patients
LEFT JOIN
	appointments
    ON patients.patient_id = appointments.patient_id;
    