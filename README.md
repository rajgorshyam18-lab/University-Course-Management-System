🎓 University Course Management System

«A practical MySQL project for managing university students, courses, instructors, departments and enrollments using core and advanced SQL concepts.»

---

📌 Project Overview

The University Course Management System is a relational database project developed using MySQL 8.0+.

It organizes university information into connected tables and demonstrates how SQL can be used to create, manage, retrieve, analyze and transform data.

The project contains 5 related tables and 16 SQL queries covering important database concepts from basic CRUD operations to window functions and conditional logic.

---

🎯 Objectives

- 🗄️ Design a structured relational database.
- 📝 Perform CRUD operations on all tables.
- 🔗 Work with table relationships using joins.
- 📊 Analyze data using aggregate functions.
- 🔍 Use subqueries for advanced filtering.
- 📅 Work with dates and extract useful information.
- ✂️ Manipulate text using string functions.
- 📈 Calculate running totals using window functions.
- 🏷️ Categorize students using "CASE".

---

🗂️ Database Design

The system contains five main tables:

Table| Description| Key Information
🎓 Students| Stores student details| StudentID, Name, Email, BirthDate, EnrollmentDate
📚 Courses| Stores course information| CourseID, CourseName, DepartmentID, Credits
👨‍🏫 Instructors| Stores instructor details| InstructorID, Name, Email, DepartmentID, Salary
📝 Enrollments| Connects students and courses| EnrollmentID, StudentID, CourseID, EnrollmentDate
🏢 Departments| Stores department information| DepartmentID, DepartmentName

🔗 Table Relationships

Departments
   │
   ├──────────► Courses
   │
   └──────────► Instructors

Students ─────► Enrollments ◄───── Courses

Primary keys uniquely identify records, while foreign keys connect related tables and maintain data integrity.

---

🔍 SQL Concepts Demonstrated

📝 CRUD Operations

Insert, retrieve, update and delete records across all five tables.

🔗 Joins

- "INNER JOIN"
- "LEFT JOIN"

Used to retrieve students, courses and department-related information.

📊 Aggregate Functions

- "COUNT()"
- "AVG()"
- "MAX()"
- "SUM()"

Used for student counts, average credits, maximum salary and running totals.

🔍 Subqueries

Used to find students enrolled in courses meeting specific conditions.

📅 Date Functions

- "YEAR()"
- "CURDATE()"
- "DATE_SUB()"

Used for enrollment-year extraction and Senior/Junior classification.

✂️ String Function

- "CONCAT()"

Used to create complete instructor names.

📈 Window Function

- "SUM() OVER()"

Used to calculate a running total of enrolled students.

🏷️ CASE Expression

Used to classify students as:

Senior or Junior

based on their enrollment date.

---

📋 Queries Included

#| Query| Concept
1| CRUD Operations| INSERT / SELECT / UPDATE / DELETE
2| Students enrolled after 2022| Date Filtering
3| Mathematics courses| JOIN + LIMIT
4| Courses with more than 5 students| GROUP BY + HAVING
5| Students in both courses| Subqueries
6| Students in either course| JOIN + IN
7| Average course credits| AVG
8| Maximum CS instructor salary| MAX + JOIN
9| Students per department| LEFT JOIN + COUNT
10| Students and courses| INNER JOIN
11| All students and courses| LEFT JOIN
12| Students in large courses| Subquery
13| Enrollment year| YEAR()
14| Instructor full names| CONCAT()
15| Running enrollment total| Window Function
16| Senior / Junior students| CASE

«💡 Note: Queries 2, 4, 5 and 12 may return Empty Set with the original sample data. This is expected because the provided data does not satisfy those conditions.»

---

🛠️ Technologies Used

Technology| Purpose
🐬 MySQL 8.0+| Database & SQL
🖥️ MySQL Workbench| Query execution
🐙 GitHub| Project hosting

---

▶️ How to Run

1. Clone or download this repository.
2. Open MySQL Workbench.
3. Open "Final_Project.sql".
4. Execute the complete script.
5. Review the output of each query.

The script automatically creates the "UniversityDB" database and required tables.

---

📋 Assumptions

1. The Instructors table in the assignment has no Salary field, but Query 8 needs it. A "Salary" column was added to the Instructors table.
2. Only the sample data from the assignment is used. Because of this, Queries 2, 4, 5 and 12 return an empty result.
3. In Query 1, extra rows are inserted for the CRUD demo and deleted at the end, so the sample data stays the same.
4. "After 2022" in Query 2 means the enrollment year is greater than 2022.
5. In Query 16, a student is 'Senior' if the enrollment date is more than 4 years before the current date. Otherwise the student is 'Junior'.
6. Query 15 shows the number of students per course and the running total.
7. MySQL 8.0 or higher is needed for window functions.

---

📁 Project Structure

University-Course-Management-System/
│
├── 📄 Final_Project.sql
│   └── Database, tables, sample data & 16 queries
│
└── 📄 README.md
    └── Project documentation

---

📚 What I Learned

Through this project, I practiced:

Database Design → CRUD → Joins → Aggregation → Subqueries → Date Functions → String Functions → Window Functions → CASE

The project helped me understand how individual SQL concepts work together to solve practical database problems.

«The goal is not just to write SQL, but to understand the data and ask the right question.»

---

👨‍💻 Author

Shyam Gor

SQL & Data Analytics Student

Building practical skills through hands-on database and data analysis projects.

---

⭐ Project Summary

| 
Project| University Course Management System
Database| MySQL 8.0+
Tables| 5
Queries| 16
Author| Shyam Gor
Main Topics| CRUD • Joins • Subqueries • Aggregation • Date & String Functions • Window Functions • CASE

---

⭐ Thank you for reviewing my project!
