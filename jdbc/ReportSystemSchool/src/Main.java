import dao.ReportDAOImpl;
import models.Course;
import models.CourseTeacher;
import models.Student;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        ReportDAOImpl reportDAO = new ReportDAOImpl();

        int menuChoice;
        do {
            System.out.println("\n1. Show all students");
            System.out.println("2. Show average grade per course");
            System.out.println("3. Show courses and their teacher");
            System.out.println("4. Show students' average grades");
            System.out.println("5. Show top 3 students");
            System.out.println("6. Show all courses with the highest and lowest grades");
            System.out.println("0. Exit");
            menuChoice = readInt(scanner, 0, 6);

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
}