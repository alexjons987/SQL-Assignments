public class Course {
    private final int courseId;
    private final String courseName;
    private final int credits;

    public Course(int courseId, String courseName, int credits) {
        this.courseId = courseId;
        this.courseName = courseName;
        this.credits = credits;
    }

    public int getCourseId() {
        return this.courseId;
    }

    public String getCourseName() {
        return this.courseName;
    }

    public int getCredits() {
        return this.credits;
    }
}
