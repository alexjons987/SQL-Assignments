package interfaces;

import models.Course;
import models.CourseTeacher;
import models.Student;

import java.util.List;

public interface ReportDAO {
    // 1. Show all students
    List<Student> getAllStudents();

    // 2. Show average grade per course
    List<Course> getAvgGradePerCourse();
    
    // 3. Show courses and their teacher
    List<CourseTeacher> getAllCourses();
    
    // 4. Show students' average grades
    List<Student> getStudentAvgGrades();
    
    // 5. Show top 3 students
    List<Student> getTopThreeStudents();

    // 6. Show all courses with the highest and lowest grades
    void getAllCoursesMinMaxGrades();
}
