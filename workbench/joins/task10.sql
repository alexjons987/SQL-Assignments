SELECT
	patients.first_name,
    patients.last_name,
    doctors.doctor_name,
    appointments.date
FROM
	appointments
INNER JOIN patients ON appointments.patient_id = patients.patient_id
INNER JOIN doctors ON appointments.doctor_id = doctors.doctor_id;
