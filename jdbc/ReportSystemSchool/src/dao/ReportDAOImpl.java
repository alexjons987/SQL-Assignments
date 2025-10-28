package dao;

import db.Database;
import interfaces.ReportDAO;
import models.Course;
import models.CourseTeacher;
import models.Student;

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
    public List<Course> getAvgGradePerCourse() {
        String sqlQuery = """
                SELECT
                	courses.course_id, courses.course_name, credits, AVG(grade) AS avg_grade
                FROM
                	courses
                JOIN
                	enrollments
                    ON enrollments.course_id = courses.course_id
                GROUP BY course_id, course_name ORDER BY avg_grade DESC;
                """;

        List<Course> courses = new ArrayList<>();
        try (
                Connection conn = Database.getConnection();
                Statement statement = conn.createStatement();
                ResultSet rs = statement.executeQuery(sqlQuery)
        ) {

            while (rs.next()) {
                courses.add(
                        new Course(
                                rs.getInt("courses.course_id"),
                                rs.getString("courses.course_name"),
                                rs.getInt("credits"),
                                rs.getFloat("avg_grade")
                        )
                );
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return courses;
    }

    // 3. Show courses and their teacher
    public List<CourseTeacher> getAllCourses() {
        String sqlQuery = """
                SELECT
                	courses.course_id, course_name, teachers.name
                FROM
                	courses
                LEFT JOIN
                	course_teachers
                	ON course_teachers.course_id = courses.course_id
                LEFT JOIN
                	teachers
                	ON teachers.teacher_id = course_teachers.teacher_id
                ORDER BY course_name ASC;
                """;

        List<CourseTeacher> courseTeachers = new ArrayList<>();
        try (
                Connection conn = Database.getConnection();
                Statement statement = conn.createStatement();
                ResultSet rs = statement.executeQuery(sqlQuery)
        ) {

            while (rs.next()) {
                courseTeachers.add(
                        new CourseTeacher(
                                rs.getString("course_name"),
                                rs.getString("teachers.name")
                        )
                );
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return courseTeachers;
    }

    // 4. Show students' average grades
    public List<Student> getStudentAvgGrades() {
        String sqlQuery = """
                SELECT
                	students.student_id, students.name, students.age, students.city, AVG(enrollments.grade) AS avg_grade
                FROM
                	students
                JOIN
                	enrollments
                	ON enrollments.student_id = students.student_id
                GROUP BY students.student_id;
                """;

        List<Student> students = new ArrayList<>();
        try (
                Connection conn = Database.getConnection();
                Statement statement = conn.createStatement();
                ResultSet rs = statement.executeQuery(sqlQuery)
        ) {

            while (rs.next()) {
                students.add(
                        new Student(
                                rs.getInt("students.student_id"),
                                rs.getString("students.name"),
                                rs.getInt("students.age"),
                                rs.getString("students.city"),
                                rs.getFloat("avg_grade")
                        )
                );
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return students;
    }

    // 5. Show top 3 students
    public List<Student> getTopThreeStudents() {
        String sqlQuery = """
                SELECT
                	students.student_id, students.name, students.age, students.city, AVG(enrollments.grade) AS avg_grade
                FROM
                	students
                JOIN
                	enrollments
                	ON enrollments.student_id = students.student_id
                GROUP BY students.student_id ORDER BY avg_grade DESC LIMIT 3;
                """;

        List<Student> students = new ArrayList<>();
        try (
                Connection conn = Database.getConnection();
                Statement statement = conn.createStatement();
                ResultSet rs = statement.executeQuery(sqlQuery)
        ) {


            while (rs.next()) {
                students.add(
                        new Student(
                                rs.getInt("students.student_id"),
                                rs.getString("students.name"),
                                rs.getInt("students.age"),
                                rs.getString("students.city"),
                                rs.getFloat("avg_grade")
                        )
                );
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return students;
    }

    // 6. Show all courses with the highest and lowest grades
    public void getAllCoursesMinMaxGrades() {
        System.out.println("[NOT IMPLEMENTED]");
    }
}
