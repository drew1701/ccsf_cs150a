--SQL Midterm question 41

/* Question 41.1 : Write a SQL statement that will display the student
   number (studentno), first name (fname), and last name (lname) for all
   students who are female (F) in the table named students. */

SELECT studento, fname, lname
FROM students
WHERE sex = "F";


/* Question 41.2 : Write a SQL statement that will display the student
   number (studentno) of any student who has a PE major in the table named
   students. Title the studentno column Student Number. */
   
SELECT studentno AS "Student Number"
FROM students
WHERE major = "PE";


/* Question 41.3 : Write a SQL statement that lists all information about
   all male students in the table named students. */
   
SELECT *
FROM students
WHERE sex = "M";
