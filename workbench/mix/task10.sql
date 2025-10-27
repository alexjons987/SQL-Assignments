DROP PROCEDURE IF EXISTS increase_grades_db_systems;
DELIMITER $$

CREATE PROCEDURE increase_grades_db_systems()
BEGIN
    START TRANSACTION;

    UPDATE enrollments
    SET grade = grade + 0.5
    WHERE course_id = (
        SELECT course_id FROM courses WHERE course_name = 'Database Systems'
    )
    AND grade < 9;

    COMMIT;
END$$

DELIMITER ;