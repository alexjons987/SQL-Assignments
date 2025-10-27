import java.util.List;

public interface ReportDAO {
    // 1. Show all students
    List<Student> getAllStudents();

    // 2. Show average grade per course
    void showAvgGradePerCourse();
    
    // 3. Show courses and their teacher
    void showAllCourses();
    
    // 4. Show students' average grades
    void showStudentAvgGrades();
    
    // 5. Show top 3 students
    void showTopThreeStudents();

    // 6. Show all courses with the highest and lowest grades
    void showAllCoursesMinMaxGrades();
}
