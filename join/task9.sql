SELECT
	patients.first_name,
    patients.last_name,
    patients.province_id,
    province_names.province_name
FROM
	(
        patients
        INNER JOIN province_names
        ON patients.province_id = province_names.province_id
    )
WHERE province_names.province_name LIKE "Ontario";
