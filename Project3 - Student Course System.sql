-- This project for solidifyting SQL skills
-- https://quickref.me/mysql
-- used 'Database Client extention

--

--! Initialize
CREATE DATABASE SchoolDB;
USE SchoolDB;



-- generate example data
CREATE TABLE Students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    date_of_birth DATE NOT NULL,
    email VARCHAR(100) NOT NULL
);

CREATE TABLE Courses (
    course_id INT PRIMARY KEY AUTO_INCREMENT,
    course_name VARCHAR(100) NOT NULL,
    discription VARCHAR(300) NOT NULL,
    credits INT NOT NULL
);

CREATE TABLE Enrollments (
    enrollment_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    enrolment_date DATE NOT NULL,
    grade INT,
    FOREIGN KEY (student_id) REFERENCES Students (student_id),
    FOREIGN KEY (course_id) REFERENCES Courses (course_id)
);





--! Insert Example data into the tables

INSERT INTO Students (
    first_name,
    last_name,
    date_of_birth,
    email
)
VALUES
    ("Will", "Smith", "2002-03-05", "JackSmith@gmail.com"),
    ("Bill", "Goggins", "1999-06-06", "Goggins.Bill@gmail.com"),
    ("John", "Jones", "1980-12-25", "UFC.Best@gmail.com"),
    ("Black", "Jack", "1970-01-01", "JackBlackMail@gmail.com");



INSERT INTO Courses (
    course_name,
    discription,
    credits
)
VALUES
    ("Maths", "Number manipulation and understanding", 30),
    ("Bio-Science", "Understanding nature", 20),
    ("ComputerScience", "Using and understanding the capabilities of computers", 20),
    ("Art", "Expressing and appreciating the art of the world", 20);



INSERT INTO Enrollments (
    student_id,
    course_id,
    enrolment_date,
    grade
)
VALUES  -- wanted to do it sourced from last name entrys
    ((SELECT student_id FROM Students WHERE last_name = 'Smith'), (SELECT course_id FROM Courses WHERE course_name = 'Maths'), "2014-03-03", 5),
    ((SELECT student_id FROM Students WHERE last_name = 'Smith'), (SELECT course_id FROM Courses WHERE course_name = 'ComputerScience'), "2014-03-03", 5),
    ((SELECT student_id FROM Students WHERE last_name = 'Jones'), (SELECT course_id FROM Courses WHERE course_name = 'Maths'), "2016-03-05", 2),
    ((SELECT student_id FROM Students WHERE last_name = 'Goggins'), (SELECT course_id FROM Courses WHERE course_name = 'Art'), "2018-07-01", 4),
    ((SELECT student_id FROM Students WHERE last_name = 'Jack'), (SELECT course_id FROM Courses WHERE course_name = 'Bio-Science'), "2010-09-10", 8)
    -- (3, 1, "2016-03-05", 2)    <-  could do this instead
    -- (students can have multiple subjects)







--! Manipulate Data / Queries

--* Show Data Tables
SELECT * From Students;
SELECT * From Courses;
SELECT * From Enrollments;


--* Update a grade for a students course
UPDATE Enrollments
SET grade = 12
WHERE student_id = (SELECT student_id FROM Students WHERE last_name = 'Smith') 
    AND course_id = (SELECT course_id FROM Courses WHERE course_name = 'ComputerScience');




--* View for student and subject grades
CREATE VIEW Student1_Grades AS
SELECT s.first_name, s.last_name, c.course_name, e.grade    
FROM Students s                                         -- sets s for student
JOIN  Enrollments e ON s.student_id = e.student_id      -- sets e for Enrollments
JOIN Courses c ON e.course_id = c.course_id;            -- sets c for Courses

SELECT * FROM Student1_Grades;          -- see 'view' table

-- delete 'view'
DROP VIEW Student1_Grades;




--* Procedure to enrol student

DELIMITER $$
CREATE PROCEDURE Enrol(IN student_lastName VARCHAR(100), coursename_ VARCHAR(100))
BEGIN
    INSERT INTO enrollments(
    student_id,
    course_id,
    enrolment_date,
    grade)
VALUES     (   
    (SELECT student_id FROM Students WHERE last_name = student_lastName),   -- get student id form the  the students name
    (SELECT course_id FROM Courses WHERE course_name = coursename_),
    CURDATE(),
    NULL            -- do null
    );

END$$
DELIMITER ;


-- calling it:
CALL Enrol("Smith", "Art");





--* CASE Statement 
-- Create a temporary table with a column reacting to other data in the table, Similar to conditional statements
SELECT s.first_name, s.last_name, c.course_name, e.grade,
       CASE
           WHEN e.grade > 8 THEN 'Super Pass'
           WHEN e.grade BETWEEN 4 AND 8 THEN 'Pass' --(inclusive)
           ELSE 'Not Pass'
       END AS GradeResult             -- set result of case as new table column called grade pass
From Enrollments e
JOIN Students s ON e.student_id = s.student_id
JOIN Courses c ON e.course_id = c.course_id;       




--! Clear Data From Tables


-- disable foreign key checks before truncating
SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE Students;
TRUNCATE TABLE Courses;
TRUNCATE TABLE Enrollments;
-- Enable foreign key checks after truncating
SET FOREIGN_KEY_CHECKS = 1;


DELETE FROM Students;
DELETE FROM Courses;
DELETE FROM Enrollments;