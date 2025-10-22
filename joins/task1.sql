SELECT
	patients.first_name,
	patients.last_name,
    province_names.province_name
FROM
	patients
INNER JOIN
	province_names
	ON patients.province_id = province_names.province_id    
WHERE
	patients.province_id IS NOT NULL;

-- Even without the WHERE statement, if a patient has a province_id of NULL the JOIN condition is not met, therefore not included.
