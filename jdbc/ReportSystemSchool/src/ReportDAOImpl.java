import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class ReportDAOImpl implements ReportDAO {
    // 1. Show all students
    public List<Student> getAllStudents() {
        String sqlQuery = "SELECT * FROM students ORDER BY name ASC";

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
        String sqlQuery = """
                SELECT
                	course_name, AVG(grade) AS avg_grade
                FROM
                	courses
                JOIN
                	enrollments
                    ON enrollments.course_id = courses.course_id
                GROUP BY course_name ORDER BY avg_grade DESC;
                """;

        try (
                Connection conn = Database.getConnection();
                Statement statement = conn.createStatement();
                ResultSet rs = statement.executeQuery(sqlQuery)
        ) {
            System.out.println("course_name | avg_grade");
            while (rs.next()) {
                System.out.printf("%s | %.2f%n", rs.getString("course_name"), rs.getFloat("avg_grade"));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
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
