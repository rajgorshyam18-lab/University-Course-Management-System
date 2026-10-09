 ==========================================================
   PROJECT  : University Course Management System
   DATABASE : MySQL 
   TABLES   : Students, Courses, Instructors,
              Enrollments, Departments
 ==========================================================


 
  ====== PART A : DATABASE AND TABLES ======
 

DROP DATABASE IF EXISTS UniversityDB;
CREATE DATABASE UniversityDB;
USE UniversityDB;

CREATE TABLE Departments (
  DepartmentID   INT PRIMARY KEY,
  DepartmentName VARCHAR(50)
);

CREATE TABLE Students (
  StudentID      INT PRIMARY KEY,
  FirstName      VARCHAR(50),
  LastName       VARCHAR(50),
  Email          VARCHAR(100),
  BirthDate      DATE,
  EnrollmentDate DATE
);

CREATE TABLE Courses (
  CourseID     INT PRIMARY KEY,
  CourseName   VARCHAR(100),
  DepartmentID INT,
  Credits      INT,
  FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

CREATE TABLE Instructors (
  InstructorID INT PRIMARY KEY,
  FirstName    VARCHAR(50),
  LastName     VARCHAR(50),
  Email        VARCHAR(100),
  DepartmentID INT,
  Salary       DECIMAL(10,2),
  FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

CREATE TABLE Enrollments (
  EnrollmentID   INT PRIMARY KEY,
  StudentID      INT,
  CourseID       INT,
  EnrollmentDate DATE,
  FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
  FOREIGN KEY (CourseID)  REFERENCES Courses(CourseID)
);


 
  ====== PART B : SAMPLE DATA ======
 

INSERT INTO Departments VALUES
(1, 'Computer Science'),
(2, 'Mathematics');

INSERT INTO Students VALUES
(1, 'John', 'Doe',   'john.doe@email.com',   '2000-01-15', '2022-08-01'),
(2, 'Jane', 'Smith', 'jane.smith@email.com', '1999-05-25', '2021-08-01');

INSERT INTO Courses VALUES
(101, 'Introduction to SQL', 1, 3),
(102, 'Data Structures',     2, 4);

INSERT INTO Instructors VALUES
(1, 'Alice', 'Johnson', 'alice.johnson@univ.com', 1, 50000.00),
(2, 'Bob',   'Lee',     'bob.lee@univ.com',       2, 45000.00);

INSERT INTO Enrollments VALUES
(1, 1, 101, '2022-08-01'),
(2, 2, 102, '2021-08-01');


 
  ===== PART C : QUERIES AND OUTPUTS =====
 


 ==========================================================
   QUERY 1 : CRUD OPERATIONS ON ALL TABLES
 ==========================================================

 - 1.1 CREATE (INSERT) -

INSERT INTO Departments VALUES (3, 'Physics');
INSERT INTO Instructors VALUES (3, 'Carol', 'White', 'carol.white@univ.com', 3, 40000.00);
INSERT INTO Students    VALUES (3, 'Mike', 'Brown', 'mike.brown@email.com', '2001-03-10', '2023-08-01');
INSERT INTO Courses     VALUES (103, 'Physics Basics', 3, 3);
INSERT INTO Enrollments VALUES (3, 3, 103, '2023-08-01');

 - 1.2 READ (SELECT) -

SELECT * FROM Departments;

 OUTPUT:
+--------------+------------------+
| DepartmentID | DepartmentName   |
+--------------+------------------+
|            1 | Computer Science |
|            2 | Mathematics      |
|            3 | Physics          |
+--------------+------------------+
3 rows in set (0.088 sec)


SELECT * FROM Instructors;

 OUTPUT:
+--------------+-----------+----------+------------------------+--------------+----------+
| InstructorID | FirstName | LastName | Email                  | DepartmentID | Salary   |
+--------------+-----------+----------+------------------------+--------------+----------+
|            1 | Alice     | Johnson  | alice.johnson@univ.com |            1 | 50000.00 |
|            2 | Bob       | Lee      | bob.lee@univ.com       |            2 | 45000.00 |
|            3 | Carol     | White    | carol.white@univ.com   |            3 | 40000.00 |
+--------------+-----------+----------+------------------------+--------------+----------+
3 rows in set (0.044 sec)


SELECT * FROM Students;

 OUTPUT:
+-----------+-----------+----------+----------------------+------------+----------------+
| StudentID | FirstName | LastName | Email                | BirthDate  | EnrollmentDate |
+-----------+-----------+----------+----------------------+------------+----------------+
|         1 | John      | Doe      | john.doe@email.com   | 2000-01-15 | 2022-08-01     |
|         2 | Jane      | Smith    | jane.smith@email.com | 1999-05-25 | 2021-08-01     |
|         3 | Mike      | Brown    | mike.brown@email.com | 2001-03-10 | 2023-08-01     |
+-----------+-----------+----------+----------------------+------------+----------------+
3 rows in set (0.035 sec)


SELECT * FROM Courses;

 OUTPUT:
+----------+---------------------+--------------+---------+
| CourseID | CourseName          | DepartmentID | Credits |
+----------+---------------------+--------------+---------+
|      101 | Introduction to SQL |            1 |       3 |
|      102 | Data Structures     |            2 |       4 |
|      103 | Physics Basics      |            3 |       3 |
+----------+---------------------+--------------+---------+
3 rows in set (0.039 sec)


SELECT * FROM Enrollments;

 OUTPUT:
+--------------+-----------+----------+----------------+
| EnrollmentID | StudentID | CourseID | EnrollmentDate |
+--------------+-----------+----------+----------------+
|            1 |         1 |      101 | 2022-08-01     |
|            2 |         2 |      102 | 2021-08-01     |
|            3 |         3 |      103 | 2023-08-01     |
+--------------+-----------+----------+----------------+
3 rows in set (0.035 sec)


 - 1.3 UPDATE -

UPDATE Departments SET DepartmentName = 'Applied Physics'  WHERE DepartmentID = 3;
UPDATE Instructors SET Salary = 42000.00                   WHERE InstructorID = 3;
UPDATE Students    SET Email = 'mike.b@email.com'          WHERE StudentID = 3;
UPDATE Courses     SET Credits = 4                         WHERE CourseID = 103;
UPDATE Enrollments SET EnrollmentDate = '2023-08-05'       WHERE EnrollmentID = 3;

SELECT * FROM Departments WHERE DepartmentID = 3;

 OUTPUT:
+--------------+-----------------+
| DepartmentID | DepartmentName  |
+--------------+-----------------+
|            3 | Applied Physics |
+--------------+-----------------+
1 row in set (0.007 sec)


SELECT * FROM Instructors WHERE InstructorID = 3;

 OUTPUT:
+--------------+-----------+----------+----------------------+--------------+----------+
| InstructorID | FirstName | LastName | Email                | DepartmentID | Salary   |
+--------------+-----------+----------+----------------------+--------------+----------+
|            3 | Carol     | White    | carol.white@univ.com |            3 | 42000.00 |
+--------------+-----------+----------+----------------------+--------------+----------+
1 row in set (0.035 sec)


SELECT * FROM Students WHERE StudentID = 3;

 OUTPUT:
+-----------+-----------+----------+------------------+------------+----------------+
| StudentID | FirstName | LastName | Email            | BirthDate  | EnrollmentDate |
+-----------+-----------+----------+------------------+------------+----------------+
|         3 | Mike      | Brown    | mike.b@email.com | 2001-03-10 | 2023-08-01     |
+-----------+-----------+----------+------------------+------------+----------------+
1 row in set (0.007 sec)


SELECT * FROM Courses WHERE CourseID = 103;

 OUTPUT:
+----------+----------------+--------------+---------+
| CourseID | CourseName     | DepartmentID | Credits |
+----------+----------------+--------------+---------+
|      103 | Physics Basics |            3 |       4 |
+----------+----------------+--------------+---------+
1 row in set (0.039 sec)


SELECT * FROM Enrollments WHERE EnrollmentID = 3;

 OUTPUT:
+--------------+-----------+----------+----------------+
| EnrollmentID | StudentID | CourseID | EnrollmentDate |
+--------------+-----------+----------+----------------+
|            3 |         3 |      103 | 2023-08-05     |
+--------------+-----------+----------+----------------+
1 row in set (0.006 sec)



 - 1.4 DELETE (child tables first, parent tables last) -

DELETE FROM Enrollments WHERE EnrollmentID = 3;
DELETE FROM Courses     WHERE CourseID = 103;
DELETE FROM Students    WHERE StudentID = 3;
DELETE FROM Instructors WHERE InstructorID = 3;
DELETE FROM Departments WHERE DepartmentID = 3;

SELECT * FROM Departments;

 OUTPUT:
 mysql> SELECT * FROM Departments;
+--------------+------------------+
| DepartmentID | DepartmentName   |
+--------------+------------------+
|            1 | Computer Science |
|            2 | Mathematics      |
+--------------+------------------+
2 rows in set (0.005 sec)



SELECT * FROM Courses;

 OUTPUT:
+----------+---------------------+--------------+---------+
| CourseID | CourseName          | DepartmentID | Credits |
+----------+---------------------+--------------+---------+
|      101 | Introduction to SQL |            1 |       3 |
|      102 | Data Structures     |            2 |       4 |
+----------+---------------------+--------------+---------+
2 rows in set (0.005 sec)




 ==========================================================
   QUERY 2 : STUDENTS WHO ENROLLED AFTER 2022
 ==========================================================

SELECT StudentID, FirstName, LastName, EnrollmentDate
FROM Students
WHERE YEAR(EnrollmentDate) > 2022;

 OUTPUT:
Empty set (0.008 sec)



 ==========================================================
   QUERY 3 : MATHEMATICS COURSES (LIMIT 5)
 ==========================================================

SELECT c.CourseID, c.CourseName, c.Credits
FROM Courses c
INNER JOIN Departments d ON c.DepartmentID = d.DepartmentID
WHERE d.DepartmentName = 'Mathematics'
LIMIT 5;

 OUTPUT:
+----------+-----------------+---------+
| CourseID | CourseName      | Credits |
+----------+-----------------+---------+
|      102 | Data Structures |       4 |
+----------+-----------------+---------+
1 row in set (0.150 sec)



 ==========================================================
   QUERY 4 : COURSES WITH MORE THAN 5 STUDENTS
 ==========================================================

SELECT c.CourseID, c.CourseName,
       COUNT(e.StudentID) AS TotalStudents
FROM Courses c
INNER JOIN Enrollments e ON c.CourseID = e.CourseID
GROUP BY c.CourseID, c.CourseName
HAVING COUNT(e.StudentID) > 5;

 OUTPUT:
Empty set (0.180 sec)




 ==========================================================
   QUERY 5 : STUDENTS ENROLLED IN BOTH COURSES
             (Introduction to SQL AND Data Structures)
 ==========================================================

SELECT s.StudentID, s.FirstName, s.LastName
FROM Students s
WHERE s.StudentID IN (
  SELECT e.StudentID
  FROM Enrollments e
  INNER JOIN Courses c ON e.CourseID = c.CourseID
  WHERE c.CourseName = 'Introduction to SQL'
)
AND s.StudentID IN (
  SELECT e.StudentID
  FROM Enrollments e
  INNER JOIN Courses c ON e.CourseID = c.CourseID
  WHERE c.CourseName = 'Data Structures'
);

 OUTPUT:
Empty set (0.165 sec)



 ==========================================================
   QUERY 6 : STUDENTS ENROLLED IN EITHER COURSE
             (Introduction to SQL OR Data Structures)
 ==========================================================

SELECT DISTINCT s.StudentID, s.FirstName, s.LastName
FROM Students s
INNER JOIN Enrollments e ON s.StudentID = e.StudentID
INNER JOIN Courses c     ON e.CourseID  = c.CourseID
WHERE c.CourseName IN ('Introduction to SQL', 'Data Structures')
ORDER BY s.StudentID;

 OUTPUT:
+-----------+-----------+----------+
| StudentID | FirstName | LastName |
+-----------+-----------+----------+
|         1 | John      | Doe      |
|         2 | Jane      | Smith    |
+-----------+-----------+----------+
2 rows in set (0.105 sec)



 ==========================================================
   QUERY 7 : AVERAGE CREDITS OF ALL COURSES
 ==========================================================

SELECT AVG(Credits) AS AverageCredits
FROM Courses;

 OUTPUT:
+----------------+
| AverageCredits |
+----------------+
|         3.5000 |
+----------------+
1 row in set (0.059 sec)



 ==========================================================
   QUERY 8 : MAXIMUM SALARY OF INSTRUCTORS
             IN THE COMPUTER SCIENCE DEPARTMENT
 ==========================================================

SELECT MAX(i.Salary) AS MaxSalary
FROM Instructors i
INNER JOIN Departments d ON i.DepartmentID = d.DepartmentID
WHERE d.DepartmentName = 'Computer Science';

 OUTPUT:
+-----------+
| MaxSalary |
+-----------+
|  50000.00 |
+-----------+
1 row in set (0.058 sec)



 ==========================================================
   QUERY 9 : NUMBER OF STUDENTS IN EACH DEPARTMENT
 ==========================================================

SELECT d.DepartmentName,
       COUNT(DISTINCT e.StudentID) AS TotalStudents
FROM Departments d
LEFT JOIN Courses c     ON d.DepartmentID = c.DepartmentID
LEFT JOIN Enrollments e ON c.CourseID     = e.CourseID
GROUP BY d.DepartmentID, d.DepartmentName;

 OUTPUT:
+------------------+---------------+
| DepartmentName   | TotalStudents |
+------------------+---------------+
| Computer Science |             1 |
| Mathematics      |             1 |
+------------------+---------------+
2 rows in set (0.062 sec)




 ==========================================================
   QUERY 10 : INNER JOIN
              (Students and their courses)
 ==========================================================

SELECT s.StudentID, s.FirstName, s.LastName,
       c.CourseID, c.CourseName
FROM Students s
INNER JOIN Enrollments e ON s.StudentID = e.StudentID
INNER JOIN Courses c     ON e.CourseID  = c.CourseID
ORDER BY s.StudentID;

 OUTPUT:
+-----------+-----------+----------+----------+---------------------+
| StudentID | FirstName | LastName | CourseID | CourseName          |
+-----------+-----------+----------+----------+---------------------+
|         1 | John      | Doe      |      101 | Introduction to SQL |
|         2 | Jane      | Smith    |      102 | Data Structures     |
+-----------+-----------+----------+----------+---------------------+
2 rows in set (0.055 sec)



 ==========================================================
   QUERY 11 : LEFT JOIN
              (All students and their courses, if any)
 ==========================================================

SELECT s.StudentID, s.FirstName, s.LastName,
       c.CourseID, c.CourseName
FROM Students s
LEFT JOIN Enrollments e ON s.StudentID = e.StudentID
LEFT JOIN Courses c     ON e.CourseID  = c.CourseID
ORDER BY s.StudentID;

 OUTPUT:
+-----------+-----------+----------+----------+---------------------+
| StudentID | FirstName | LastName | CourseID | CourseName          |
+-----------+-----------+----------+----------+---------------------+
|         1 | John      | Doe      |      101 | Introduction to SQL |
|         2 | Jane      | Smith    |      102 | Data Structures     |
+-----------+-----------+----------+----------+---------------------+
2 rows in set (0.042 sec)



 ==========================================================
   QUERY 12 : SUBQUERY
              (Students in courses with more than 10 students)
 ==========================================================

SELECT StudentID, FirstName, LastName
FROM Students
WHERE StudentID IN (
  SELECT StudentID
  FROM Enrollments
  WHERE CourseID IN (
    SELECT CourseID
    FROM Enrollments
    GROUP BY CourseID
    HAVING COUNT(StudentID) > 10
  )
);

 OUTPUT:
Empty set (0.096 sec)



 ==========================================================
   QUERY 13 : EXTRACT YEAR FROM ENROLLMENT DATE
 ==========================================================

SELECT StudentID, FirstName, EnrollmentDate,
       YEAR(EnrollmentDate) AS EnrollmentYear
FROM Students;

 OUTPUT:
+-----------+-----------+----------------+----------------+
| StudentID | FirstName | EnrollmentDate | EnrollmentYear |
+-----------+-----------+----------------+----------------+
|         1 | John      | 2022-08-01     |           2022 |
|         2 | Jane      | 2021-08-01     |           2021 |
+-----------+-----------+----------------+----------------+
2 rows in set (0.008 sec)




 ==========================================================
   QUERY 14 : CONCATENATE INSTRUCTOR FIRST AND LAST NAME
 ==========================================================

SELECT InstructorID,
       CONCAT(FirstName, ' ', LastName) AS FullName
FROM Instructors;

 OUTPUT:
+--------------+---------------+
| InstructorID | FullName      |
+--------------+---------------+
|            1 | Alice Johnson |
|            2 | Bob Lee       |
+--------------+---------------+
2 rows in set (0.051 sec)



 ==========================================================
   QUERY 15 : RUNNING TOTAL OF STUDENTS ENROLLED IN COURSES
 ==========================================================

SELECT c.CourseID, c.CourseName,
       COUNT(e.StudentID) AS StudentsEnrolled,
       SUM(COUNT(e.StudentID)) OVER (ORDER BY c.CourseID) AS RunningTotal
FROM Courses c
LEFT JOIN Enrollments e ON c.CourseID = e.CourseID
GROUP BY c.CourseID, c.CourseName;

 OUTPUT:
+----------+---------------------+------------------+--------------+
| CourseID | CourseName          | StudentsEnrolled | RunningTotal |
+----------+---------------------+------------------+--------------+
|      101 | Introduction to SQL |                1 |            1 |
|      102 | Data Structures     |                1 |            2 |
+----------+---------------------+------------------+--------------+
2 rows in set (0.071 sec)




 ==========================================================
   QUERY 16 : LABEL STUDENTS AS 'Senior' OR 'Junior' (CASE)
              More than 4 years from today = Senior
 ==========================================================

SELECT StudentID, FirstName, EnrollmentDate,
  CASE
    WHEN EnrollmentDate < DATE_SUB(CURDATE(), INTERVAL 4 YEAR) THEN 'Senior'
    ELSE 'Junior'
  END AS StudentLabel
FROM Students;

 OUTPUT:
+-----------+-----------+----------------+--------------+
| StudentID | FirstName | EnrollmentDate | StudentLabel |
+-----------+-----------+----------------+--------------+
|         1 | John      | 2022-08-01     | Senior       |
|         2 | Jane      | 2021-08-01     | Senior       |
+-----------+-----------+----------------+--------------+
2 rows in set (0.048 sec)



 ==========================================================
   END OF PROJECT
 ==========================================================