import dao.CourseDAOImpl;
import dao.ReportDAOImpl;
import dao.StudentDAOImpl;
import dao.TeacherDAOImpl;
import models.Course;
import models.CourseTeacher;
import models.Student;

import java.util.List;
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        ReportDAOImpl reportDAO = new ReportDAOImpl();
        StudentDAOImpl studentDAO = new StudentDAOImpl();
        CourseDAOImpl courseDAO = new CourseDAOImpl();
        TeacherDAOImpl teacherDAO = new TeacherDAOImpl();

        int menuChoice;
        do {
            System.out.println("\n1. Show all students");
            System.out.println("2. Show average grade per course");
            System.out.println("3. Show courses and their teacher");
            System.out.println("4. Show students' average grades");
            System.out.println("5. Show top 3 students");
            System.out.println("6. Show all courses with the highest and lowest grades");
            System.out.println("7. Add student");
            System.out.println("8. Add course");
            System.out.println("0. Exit");
            menuChoice = readInt(scanner, 0, 16);

            switch (menuChoice) {
                case 1:
                    System.out.println("- All students -");
                    List<Student> students = reportDAO.getAllStudents();
                    students.forEach(System.out::println);
                    break;
                case 2:
                    System.out.println("- Average grade (per course) -");
                    List<Course> courses = reportDAO.getAvgGradePerCourse();
                    for (Course course : courses) {
                        System.out.printf("%s %.2f%n", course.getCourseName(), course.getAverageGrade());
                    }
                    break;
                case 3:
                    System.out.println("- All courses -");
                    List<CourseTeacher> courseTeachers = reportDAO.getAllCourses();
                    courseTeachers.forEach(System.out::println);
                    break;
                case 4:
                    System.out.println("- Students' average grades -");
                    List<Student> studentAverages = reportDAO.getStudentAvgGrades();
                    for (Student studentAvg : studentAverages) {
                        if (studentAvg.getAverageGrade() == -1.0f) {
                            System.out.printf("%s %s", studentAvg.getName(), "No grades");
                        } else {
                            System.out.printf("%s %.2f%n", studentAvg.getName(), studentAvg.getAverageGrade());
                        }
                    }
                    break;
                case 5:
                    System.out.println("- Top performing students -");
                    List<Student> studentTopAverages = reportDAO.getTopThreeStudents();
                    for (Student studentAvg : studentTopAverages) {
                        if (studentAvg.getAverageGrade() == -1.0f) {
                            System.out.printf("%s %s", studentAvg.getName(), "No grades");
                        } else {
                            System.out.printf("%s %.2f%n", studentAvg.getName(), studentAvg.getAverageGrade());
                        }
                    }
                    break;
                case 6:
                    System.out.println("- Highest/Lowest grade per course -");
                    break;
                case 7:
                    System.out.println("- Add a student -");
                    System.out.println("Enter student name");
                    String studentName = readString(scanner, false);
                    System.out.println("Enter student age");
                    int studentAge = readInt(scanner, -100, 100);
                    System.out.println("Enter student city");
                    String studentCity = readString(scanner, false);
                    studentDAO.addStudent(studentName, studentAge, studentCity);
                    break;
                case 8:
                    System.out.println("- Add a course -");
                    System.out.println("Enter course name");
                    String courseName = readString(scanner, false);
                    System.out.println("Enter course credits");
                    int courseCredits = readInt(scanner, -100, 100);
                    courseDAO.addCourse(courseName, courseCredits);
                    break;
                case 9:
                    System.out.println("- Add a teacher -");
                    System.out.println("Enter teacher name");
                    String teacherName = readString(scanner, false);
                    System.out.println("Enter department");
                    String teacherDepartment = readString(scanner, false);
                    teacherDAO.addTeacher(teacherName, teacherDepartment);
                    break;
                case 10:
                    System.out.println("- Assign teacher to course -");
                    reportDAO.getAllCourses();
                    System.out.println("Pick a course ID");
                    int courseId = scanner.nextInt();
                    reportDAO.getAllTeachers();
                    System.out.println("Pick a teacher ID");
                    int teacherId = scanner.nextInt();
                    courseDAO.assignTeacherToCourse(courseId, teacherId);
                    break;
                case 11:
                    System.out.println("- Update student city -");
                    break;
                case 12:
                    System.out.println("- Update course credits -");
                    break;
                case 13:
                    System.out.println("- Update student name -");
                    break;
                case 14:
                    System.out.println("- Delete student -");
                    break;
                case 15:
                    System.out.println("- Delete course -");
                    break;
                case 16:
                    System.out.println("- Remove teacher from course -");
                    break;
            }
        } while (menuChoice != 0);
        System.out.println("Goodbye!");
    }

    private static int readInt(Scanner sc, int min, int max) {
        while (true) {
            System.out.print("> ");
            String userInput = sc.nextLine().trim();
            try {
                int choice = Integer.parseInt(userInput);
                if (choice >= min && choice <= max)
                    return choice;
            } catch (NumberFormatException ignored) {
            }
            System.out.printf("Please enter a number %d - %d.%n", min, max);
        }
    }

    private static String readString(Scanner sc, boolean allowEmptyInput) {
        while (true) {
            System.out.print("> ");
            String userInput = sc.nextLine().trim();
            try {
                if (!allowEmptyInput && userInput.isEmpty()) {
                    throw new Exception("User input was empty when not allowed.");
                } else {
                    return userInput;
                }
            } catch (Exception ignored) {}
            System.out.println("Input cannot be empty.");
        }
    }
}