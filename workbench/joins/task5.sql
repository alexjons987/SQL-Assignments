SELECT
	patients.first_name,
    patients.last_name,
    appointments.date
FROM
	patients
INNER JOIN
	appointments
    ON patients.patient_id = appointments.patient_id;
    