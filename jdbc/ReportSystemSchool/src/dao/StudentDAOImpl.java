package dao;

import db.Database;
import interfaces.StudentDAO;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

public class StudentDAOImpl implements StudentDAO {

    // 1. Add a new student
    @Override
    public void addStudent(String name, int age, String city) {
        if (age < 0) {
            System.out.println("Cannot process negative age.");
            return;
        }

        String sql = String.format(
                "INSERT INTO students (name, age, city) VALUES (\"%s\", %d, \"%s\")",
                name,
                age,
                city
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
