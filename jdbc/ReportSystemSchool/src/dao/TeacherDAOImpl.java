package dao;

import db.Database;
import interfaces.TeacherDAO;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

public class TeacherDAOImpl implements TeacherDAO {
    @Override
    public void addTeacher(String name, String department) {
        String sql = String.format(
                "INSERT INTO teachers (name, department) VALUES (\"%s\", \"%s\")",
                name,
                department
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
