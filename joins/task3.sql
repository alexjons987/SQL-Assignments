SELECT
	province_names.province_name,
    patients.first_name,
	patients.last_name
FROM
	patients
RIGHT JOIN
	province_names
	ON patients.province_id = province_names.province_id;
	