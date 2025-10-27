import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class ReportDAOImpl implements ReportDAO {
    // 1. Show all students
    public List<Student> showAllStudents() {
        String sqlQuery = "SELECT * FROM students";

        try (
                Connection conn = Database.getConnection();
                Statement statement = conn.createStatement();
                ResultSet rs = statement.executeQuery(sqlQuery)
        ) {
            List<Student> students = new ArrayList<>();

            while (rs.next()) {
                students.add(
                        new Student(
                                rs.getInt("student_id"),
                                rs.getString("name"),
                                rs.getInt("age"),
                                rs.getString("city")
                        )
                );
            }

            return students;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    // 2. Show average grade per course
    public void showAvgGradePerCourse() {

    }

    // 3. Show courses and their teacher
    public void showAllCourses() {

    }

    // 4. Show students' average grades
    public void showStudentAvgGrades() {

    }

    // 5. Show top 3 students
    public void showTopThreeStudents() {

    }

    // 6. Show all courses with the highest and lowest grades
    public void showAllCoursesMinMaxGrades() {

    }
}
