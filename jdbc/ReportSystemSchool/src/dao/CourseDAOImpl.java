package dao;

import db.Database;
import interfaces.CourseDAO;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

public class CourseDAOImpl implements CourseDAO {
    @Override
    public void addCourse(String courseName, int credits) {
        if (credits < 0) {
            System.out.println("Cannot process negative credits.");
            return;
        }

        String sql = String.format(
                "INSERT INTO courses (course_name, credits) VALUES (\"%s\", %d)",
                courseName,
                credits
        );

        try (
                Connection conn = Database.getConnection();
                Statement statement = conn.createStatement();
        ) {
            statement.execute(sql);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void assignTeacherToCourse(int course_id, int teacher_id) {
        String sql = String.format(
                "INSERT INTO course_teachers (course_id, teacher_id) VALUES (%d, %d)",
                course_id,
                teacher_id
        );

        try (
                Connection conn = Database.getConnection();
                Statement statement = conn.createStatement();
        ) {
            statement.execute(sql);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
