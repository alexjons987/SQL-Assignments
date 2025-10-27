public class Student {
    private final int studentId;
    private final String name;
    private final int age;
    private final String city;

    public Student(int studentId, String name, int age, String city) {
        this.studentId = studentId;
        this.name = name;
        this.age = age;
        this.city = city;
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

    public String toString() {
        return String.format("%d %s %d %s", this.studentId, this.name, this.age, this.city);
    }
}
