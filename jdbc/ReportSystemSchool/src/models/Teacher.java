package models;

public class Teacher {
    private final int teacherId;
    private final String name;
    private final String department;

    public Teacher(int teacherId, String name, String department) {
        this.teacherId = teacherId;
        this.name = name;
        this.department = department;
    }

    public int getTeacherId() {
        return this.teacherId;
    }

    public String getName() {
        return this.name;
    }

    public String getDepartment() {
        return this.department;
    }
}
