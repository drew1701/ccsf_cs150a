/*  Assignment1.sql 
    Andrew Patrick
    CS 150A, Fall 2021 */
 
CREATE DATABASE IF NOT EXISTS university;

USE university;

/* drop the table */

DROP TABLE IF EXISTS  student;



/* Query 1 */

CREATE TABLE student(
    student_id INT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    reg_year DATE NOT NULL,
    email VARCHAR(50) NOT NULL,
    CONSTRAINT student_pk PRIMARY KEY (student_id),
    CONSTRAINT student_email_uk UNIQUE (email)

);


/* Query 2 */

INSERT INTO student VALUES(720, 'jack','smith', '2012-01-12','jsmith@school.edu');
INSERT INTO student VALUES(730, 'noah', 'audry', '2012-01-01','naudry@school.edu');
INSERT INTO student VALUES(740, 'rhonda','taylor', '2012-09-01','rtaylor@school.edu');
INSERT INTO student VALUES(750, 'robert','ben', '2012-03-01','rben@school.edu');
INSERT INTO student VALUES(760, 'jeanne','ben', '2012-03-01','jben@school.edu');
INSERT INTO student VALUES(770, 'mills','carmen', '2013-04-01','mcarmen@school.edu');


/* Query 3 */

DESCRIBE student;

/* Query 4 */

SELECT * 
FROM student;




