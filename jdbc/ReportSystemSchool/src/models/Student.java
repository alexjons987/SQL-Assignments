package models;

public class Student {
    private final int studentId;
    private final String name;
    private final int age;
    private final String city;
    private float averageGrade;

    public Student(int studentId, String name, int age, String city) {
        this.studentId = studentId;
        this.name = name;
        this.age = age;
        this.city = city;
        this.averageGrade = -1.0f;
    }

    public Student(int studentId, String name, int age, String city, float averageGrade) {
        this.studentId = studentId;
        this.name = name;
        this.age = age;
        this.city = city;
        this.averageGrade = averageGrade;
    }

    public int getStudentId() {
        return this.studentId;
    }

    public String getName() {
        return this.name;
    }

    public int getAge() {
        return this.age;
    }

    public String getCity() {
        return this.city;
    }

    public float getAverageGrade() {
        return this.averageGrade;
    }

    public void setAverageGrade(float averageGrade) {
        this.averageGrade = averageGrade;
    }

    public String toString() {
        return String.format("%d %s %d %s", this.studentId, this.name, this.age, this.city);
    }
}
