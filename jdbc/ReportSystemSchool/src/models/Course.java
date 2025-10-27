package models;

public class Course {
    private final int courseId;
    private final String courseName;
    private final int credits;
    private final float averageGrade;

    public Course(int courseId, String courseName, int credits, float averageGrade) {
        this.courseId = courseId;
        this.courseName = courseName;
        this.credits = credits;
        this.averageGrade = averageGrade;
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

    public float getAverageGrade() {
        return this.averageGrade;
    }

    public String toString() {
        return String.format("%d %s %d %.2f", this.courseId, this.courseName, this.credits, this.averageGrade);
    }
}
