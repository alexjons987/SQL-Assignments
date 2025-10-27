## SchoolDB Reporting System
### Goal
Create a **Java program** that uses **JDBC** to retrieve information from the database `school_db` and present various **reports** in the console.

The program should be object-oriented and contain:
* An **interface (ReportDAO)** with all report methods
* A **class (ReportDAOImpl)** that implements the interface
* **Model classes** (`Student`, `Course`, `Teacher`) to represent table rows
* A **main class (`Main`)** with a menu where the user selects a report

---

### 1. Show all students
* List all students with **id, name, age and city**.
* Sort alphabetically by name.

---

### 2. Show average grade per course
* Show each course with **course name** and **average grade** (rounded to 2 decimal places).
* Sort by highest to lowest average.

---

### 3. Show courses and their teachers
* Show all courses with associated **teachers**.
* Sort by course name.

---

### 4. Show students' average grades
* Show each student and their **average grade** across all courses.
* Also show those without grades (with NULL or text “No grades”).

---

### 5. Show top 3 students
* List the 3 students with the **highest average grade**.

---

### 6. Show all courses with the highest and lowest grades
* For each course: show **course name**, **highest** and **lowest** grade given.