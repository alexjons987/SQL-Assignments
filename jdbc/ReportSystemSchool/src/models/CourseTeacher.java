package models;

public class CourseTeacher {
    private final String courseName;
    private final String teacherName;

    public CourseTeacher(String courseName, String teacherName) {
        this.courseName = courseName;
        this.teacherName = teacherName;
    }

    public String getCourseName() {
        return this.courseName;
    }

    public String getTeacherName() {
        return this.teacherName;
    }

    public String toString() {
        return String.format("%s - %s", this.courseName, this.teacherName);
    }
}
