/* Some useful commands
Example 1: You can ask which version of MySQL the server it is.*/

SELECT 'Hello World', 90*40;

SELECT VERSION ();

SELECT NOW(); 

SELECT NOW()\g

SELECT 'Hello'; select now() AS "time";

SHOW WARNINGS;

SELECT 5 * 'Hello';

-- Example 2: Display all databases managed by this MySQL server which are accessible to this client.   

HOW DATABASES;

/* Creating Databases
To create a new database, connect to the server using mysql. Then issue a CREATE DATABASE statement that specifies the database name:

CREATE DATABASE [IF NOT EXISTS] db_name; */

-- Example 4: Create a database with the name university.

CREATE DATABASE university;


SHOW DATABASES;

-- Example 5: Display information about how to create a database.


HELP CREATE DATABASE

/* Selecting Databases
The USE statement selects a database to make it the default (current) database for a given session with the server:*/



-- Example 6: In the example below, we will select the university database.

USE university;

SELECT user(), database();



DROP DATABASE db_name;
-- Example 7: Drop the university database.

DROP DATABASE university;


-- Example 8: Display all tables in the university database.

SHOW TABLES;

CREATE TABLE student(
    student_id INT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    reg_year DATE NOT NULL,
    email VARCHAR(50) NOT NULL,
    CONSTRAINT student_pk PRIMARY KEY (student_id),
    CONSTRAINT student_email_uk UNIQUE (email),

);

USE university;

SHOW CREATE TABLE student;


-- Example 9: The DESCRIBE command will show the column names and data types for a table.

DESCRIBE student;

-- Example 10: Fill the STUDENT table from the university database with data.

INSERT INTO student VALUES(720, 'jack','smith', '2012-01-12','jsmith@school.edu');
INSERT INTO student VALUES(730, 'noah', 'audry', '2012-01-01','naudry@school.edu');
INSERT INTO student VALUES(740, 'rhonda','taylor', '2012-09-01','rtaylor@school.edu');
INSERT INTO student VALUES(750, 'robert','ben', '2012-03-01','rben@school.edu');
INSERT INTO student VALUES(760, 'jeanne','ben', '2012-03-01','jben@school.edu');
INSERT INTO student VALUES(770, 'mills','carmen', '2013-04-01','mcarmen@school.edu');



-- Example 10: Display all information in the STUDENT table.

SELECT *
FROM student;