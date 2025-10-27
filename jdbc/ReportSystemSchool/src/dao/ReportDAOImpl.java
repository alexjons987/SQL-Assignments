package dao;

import db.Database;
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

        try (
                Connection conn = Database.getConnection();
                Statement statement = conn.createStatement();
                ResultSet rs = statement.executeQuery(sqlQuery)
        ) {
            List<Course> courses = new ArrayList<>();

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
            return courses;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    // 3. Show courses and their teacher
    public List<CourseTeacher> getAllCourses() {
        String sqlQuery = """
                SELECT
                	course_name, teachers.name
                FROM
                	courses
                JOIN
                	course_teachers
                    ON course_teachers.course_id = courses.course_id
                JOIN
                	teachers
                    ON teachers.teacher_id = course_teachers.teacher_id
                ORDER BY course_name ASC;
                """;

        try (
                Connection conn = Database.getConnection();
                Statement statement = conn.createStatement();
                ResultSet rs = statement.executeQuery(sqlQuery)
        ) {
            List<CourseTeacher> courseTeachers = new ArrayList<>();

            while (rs.next()) {
                courseTeachers.add(
                        new CourseTeacher(
                                rs.getString("course_name"),
                                rs.getString("teachers.name")
                        )
                );
            }
            return courseTeachers;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
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

        try (
                Connection conn = Database.getConnection();
                Statement statement = conn.createStatement();
                ResultSet rs = statement.executeQuery(sqlQuery)
        ) {
            List<Student> students = new ArrayList<>();

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

            return students;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
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

        try (
                Connection conn = Database.getConnection();
                Statement statement = conn.createStatement();
                ResultSet rs = statement.executeQuery(sqlQuery)
        ) {
            List<Student> students = new ArrayList<>();

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

            return students;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    // 6. Show all courses with the highest and lowest grades
    public void showAllCoursesMinMaxGrades() {

    }
}
