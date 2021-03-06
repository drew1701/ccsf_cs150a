/*  Project_Part2.sql 
    Andrew Patrick
    CS 150A, Fall 2021 */
    
use university;

-- Source the provided insert data script.
\. c:/150a/insert_data_university_database.sql

-- Begin Queries: Final Project Part 2

/* Question 01 : Display the data inserted in the tables created for
the University database. */

SELECT * FROM academic_session;
SELECT * FROM department;
SELECT * FROM parent_info;
SELECT * FROM student;
SELECT * FROM course;
SELECT * FROM faculty;
SELECT * FROM exam_type;
SELECT * FROM exam;
SELECT * FROM exam_result;
SELECT * FROM student_att;
SELECT * FROM student_course;
SELECT * FROM faculty_course;
SELECT * FROM faculty_login;


/* Question 02 : Display the different courses offered by the
departments in the school. */

SELECT course_id, course_name, dept_name
FROM course JOIN department
    ON course.dept_id = department.dept_id
ORDER BY course_id;


/* Question 03 : Display the courses offered in the Fall session. */

SELECT course_name, session_name
FROM course JOIN academic_session
    ON course.session_id = academic_session.session_id
WHERE session_name = 'fall session';


/* Question 04 : Display the course details, the department that offers
the courses and students who have enrolled for those courses. */

SELECT c.course_name, sc.student_id, d.dept_name
FROM course c
    JOIN student_course sc ON c.course_id = sc.course_id
    JOIN department d ON c.dept_id = d.dept_id
ORDER BY c.course_id;


/* Question 05 : Display the names of the courses, the department that
offers those courses, and students who have enrolled for those
courses for department 20. */

SELECT c.course_name, sc.student_id, d.dept_name
FROM course c
    JOIN student_course sc ON c.course_id = sc.course_id
    JOIN department d ON c.dept_id = d.dept_id
WHERE c.dept_id = 20
ORDER BY c.course_id;


/* Question 06 : Display the details of the exam grades obtained by
students who have taken courses with ID in the range of 190 to 192. */

SELECT c.course_id, course_name, exam_grade, exam_id
FROM course c JOIN exam_result er
    ON c.course_id = er.course_id
WHERE c.course_id IN (190, 191, 192)
ORDER BY c.course_id;


/* Question 07 : Retrieve the rows from the EXAM_RESULT table, even
if there are no matching records in the COURSE table. */

SELECT student_id, exam_grade, er.course_id, course_name
FROM exam_result er LEFT JOIN course c
    ON er.course_id = c.course_id
ORDER BY student_id, er.course_id;


/* Question 08 : Retrieve the exam grade obtained by each student
for every exam attempted. */


SELECT exam_id, exam_grade,
       CONCAT_WS(' ', first_name, last_name) AS 'Student Name'
FROM exam_result er JOIN student s
    ON er.student_id = s.student_id
ORDER BY exam_id, exam_grade DESC;


/* Question 09 : Write a query to check if a student is eligible to
take exams based on the number of class days attended. */

SELECT student_id, num_work_days, exam_eligibility
FROM student_att
WHERE exam_eligibility = 'y'
ORDER BY student_id;


/* Question 10 : The faculty of the different Departments realized that
the exam grades entered in the EXAM_RESULT were showing an increased
value of 5 points for each entry. Display the exam grades with
5 points subtracted from the marks obtained by each student. */

SELECT student_id, course_id, exam_id,
       exam_grade - 5 AS 'corrected grade'
FROM exam_result;
