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
                    List<Student> students = reportDAO.showAllStudents();
                    students.forEach(System.out::println);
                    break;
                case 2:
                    reportDAO.showAvgGradePerCourse();
                    break;
                case 3:
                    reportDAO.showAllCourses();
                    break;
                case 4:
                    reportDAO.showStudentAvgGrades();
                    break;
                case 5:
                    reportDAO.showTopThreeStudents();
                    break;
                case 6:
                    reportDAO.showAllCoursesMinMaxGrades();
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