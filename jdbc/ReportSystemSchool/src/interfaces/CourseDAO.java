package interfaces;

public interface CourseDAO {
    void addCourse(String courseName, int credits);
    void assignTeacherToCourse(int course_id, int teacher_id);
}
