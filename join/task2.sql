SELECT
	patients.first_name,
	patients.last_name,
    province_names.province_name
FROM
	patients
LEFT JOIN
	province_names
	ON patients.province_id = province_names.province_id;
	