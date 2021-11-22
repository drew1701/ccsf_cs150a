/* SQL Examples: Stored Program */

CREATE DATABASE mydb;

USE mydb;

CREATE TABLE mytable(col1 INT, col2 INT);

INSERT INTO mytable 
VALUES (5,5);

/* Example 1: To begin with, let’s see a simple example of a stored procedure, one that doesn’t use either arguments or return values. */
use company; 
DELIMITER //

CREATE PROCEDURE count_employees() 
   BEGIN
      SELECT COUNT(ssn) FROM employee; 
   END//
DELIMITER; 

/* Example 2: The CALL command to invoke a stored procedure. */
CALL count_employees();

/* Example 3: A stored procedure to create and drop a table. */
use mydb;
DELIMITER // 

CREATE PROCEDURE create_log_table()
   BEGIN
      CREATE TABLE log(record_id INT NOT NULL
      AUTO_INCREMENT PRIMARY KEY, Message TEXT); 
   END//

CREATE PROCEDURE remove_log_table()
   BEGIN 
	  DROP TABLE log; 
   END//
   
DELIMITER; 

CALL create_log_table();

SHOW TABLES;
CALL remove_log_table; 
SHOW TABLES;

DECLARE count INT DEFAULT 0;

/* Example 4: Declare a numeric and an alphanumeric variable. */
DECLARE num1 DECIMAL(7,2);
DECLARE alpha1 VARCHAR(20);

/* Example 5: Declare two integer variables. */
DECLARE number1, number2 INT;

/* Example 6: Adding a default expression gives variables an initial value. */
DELIMITER //
CREATE PROCEDURE decl()
   BEGIN 
      DECLARE count INT;
   END//
DELIMITER;

/* Example 7: Adding a default expression gives variables an initial value. */
DELIMITER // 
CREATE PROCEDURE decl1()
   BEGIN
      DECLARE count, retval, x INT;
   END//

DELIMITER;
/* Example 8: Adding a default expression gives variables an initial value. */
DELIMITER // 
CREATE PROCEDURE decl2()
   BEGIN 
      DECLARE count INT DEFAULT 0;
   END//
DELIMITER; 

/* Example 9: Adding a default expression gives variables an initial value. */
DELIMITER // 
CREATE PROCEDURE add_one()
  BEGIN DECLARE count INT DEFAULT 99; 
     SELECT (count+1);
  END//

DELIMITER; 
CALL add_one();

/* Example 11: Example with two DECLARE statements. */
CREATE PROCEDURE proc2()
  BEGIN
    DECLARE a INT;
    DECLARE b INT;
    SET a = 5;
    SET b = 9;
    SELECT a, b;
  END;
CALL proc2;

E/* xample 12:  */
USE mydb;
DELIMITER //

CREATE PROCEDURE proc3()
 BEGIN
   DECLARE variable1 INT;
   SET variable1 = 5;
   IF variable1 = 0 THEN
      INSERT INTO mytable VALUES(17, 18);
   END IF;
   IF variable1 = 5 THEN
      UPDATE mytable SET col1 = col1 + 1;
   ELSE
      UPDATE mytable SET col1 = col1 + 2;
   END IF;
 END; //
 
DELIMITER; 

SELECT * 
FROM mytable;

call proc3();

SELECT * 
FROM mytable;

/* Example 13: */
Use mydb;
DELIMITER //
CREATE PROCEDURE proc4()
   BEGIN
      DECLARE variable1 INT;
      SET variable1 = 10;
      CASE variable1
         WHEN 10 THEN INSERT INTO mytable VALUES (10, 10);    
         WHEN 11 THEN INSERT INTO mytable VALUES (11, 11);
         ELSE INSERT INTO mytable VALUES (12,12);
      END CASE;
   END; //

DELIMITER; 
call proc4();

SELECT * 
FROM mytable;
 
/* Example 14: */
USE mydb;
DELIMITER // 
CREATE PROCEDURE proc5()
   BEGIN
      DECLARE v INT;
      SET v = 0;
      WHILE v < 6 DO
         INSERT INTO mytable VALUES (v, v+1);
         SET v = v + 1;
       END WHILE;
    END; //
DELIMITER;
CALL proc5();

SELECT *
FROM mytable;

/* Example 15: drop the procedure dec1. */
DROP PROCEDURE decl();

/* Example 16:  */
mysql>DELIMITER //
CREATE PROCEDURE test1()
   BEGIN
     DECLARE max_salary DECIMAL(9,2);
     DECLARE min_salary DECIMAL(9,2);
     DECLARE percent_difference DECIMAL(9,4);
     DECLARE count_ssn INT;
  
     SELECT MAX(salary), MIN(salary), COUNT(ssn)
     INTO max_salary, min_salary, count_ssn
     FROM employee;
     SELECT max_salary, min_salary, count_ssn;
   END//

CALL test1();

/* Example 17: */
DELIMITER //
CREATE PROCEDURE test2()
 BEGIN
   DECLARE max_salary DECIMAL(9,2);
   DECLARE min_salary DECIMAL(9,2);
   DECLARE percent_difference DECIMAL(9,4);
   DECLARE count_ssn INT;
    
   SELECT MAX(salary), MIN(salary), COUNT(ssn)
   INTO max_salary, min_salary,count_ssn
   FROM employee;
   SET percent_difference =(max_salary- min_salary)/min_salary * 100;

   SELECT CONCAT('$', max_salary) AS 'Maximum Salary', 
       CONCAT('$', min_salary) AS 'Minimum Salary', 
       CONCAT('%', ROUND(percent_difference, 2)) AS 'Percent    
       difference', count_ssn AS 'Number of employees';
  END//
DELIMITER;
CALL test2();

/* Example 18: */
DELIMITER //
CREATE PROCEDURE test3()
  BEGIN
     DECLARE i INT DEFAULT 1;
     DECLARE s VARCHAR(400) DEFAULT '';
     WHILE i < 8 DO
         SET s = CONCAT(s, 'i=', i, ' | ');
         SET i = i + 1;
     END WHILE;
     SELECT s AS message;
   END//

DELIMITER;
CALL test3();

/* Example 19: */
CREATE PROCEDURE company_tables()
   SELECT TABLE_NAME 
   FROM INFORMATION_SCHEMA.TABLES 
   WHERE TABLE_SCHEMA = 'company'
   ORDER BY TABLE_NAME;
CALL company_tables();

/* Example 20: */
DELIMITER //
CREATE PROCEDURE show_times()
    BEGIN 
      SELECT CURRENT_TIMESTAMP AS 'Local Time';
      SELECT UTC_TIMESTAMP AS 'UTC Time'; 
    END//

	DELIMITER ;
CALL show_times();

DELIMITER ;
CALL show_times();

/* Example 21: */
DELIMITER //
CREATE PROCEDURE show_born_in_year(p_year INT) 
   BEGIN
     SELECT fname, lname, bdate 
     FROM employee WHERE YEAR(bdate) = p_year;
   END//

DELIMITER ;
CALL show_born_in_year(1958);














