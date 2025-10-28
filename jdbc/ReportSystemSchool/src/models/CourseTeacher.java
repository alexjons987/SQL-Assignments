package models;

public class CourseTeacher {
    private final int courseId;
    private final String courseName;
    private final String teacherName;

    public CourseTeacher(int courseId, String courseName, String teacherName) {
        this.courseId = courseId;
        this.courseName = courseName;
        this.teacherName = teacherName;
    }

    public int getCourseId() {
        return this.courseId;
    }

    public String getCourseName() {
        return this.courseName;
    }

    public String getTeacherName() {
        return this.teacherName;
    }

    public String toString() {
        return String.format("%d. %s - %s", this.courseId, this.courseName, this.teacherName);
    }
}
