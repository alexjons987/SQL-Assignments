# CRUD SQL Assignments
### Task 1 – Create the Courses table
Create a table called courses with the following columns:
* `course_id` (`integer`, `auto_increment`, `primary key`)
* `course_name` (`text`)
* `teacher` (`text`)
* `score` (`integer`)

(You should get an empty table with column headings.)

---

### Task 2 – Add data (INSERT)
1. Add at least **4 courses**
2. Show all courses where the **course name starts with the letter "M"**
3. Show all courses where the **teacher's name contains the letter "a"**
```
coursename  teacher score
Mathematics Lisa    100
English     Erik    90
Sports      Anna    50
Programming Johan   150
```

---

### Task 3 – Update data (UPDATE)
1. **English** gets a new teacher: **Karin**
2. **Programming** should now give **200 points** instead of 150
3. Change the score to **100** for all courses where the teacher's name contains **"a"**
4. Change teacher **Erik** to **Karin** in the **English** course

---

### Task 4 – Delete data
1. The course **Sports** should be deleted.
2. Check that it no longer exists.

---

### Task 5 – Combine INSERT, UPDATE, DELETE, SELECT and WHERE
1. Add the course **“History”**, teacher **David**, points **80**
2. Change all courses with **less than 100 points** to **100 points**
3. Delete all courses where the teacher is named **Lisa**
4. Show **all courses with 100 points**