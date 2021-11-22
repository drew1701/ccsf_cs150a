/* SQL Examples: Database Stored Procedures and Functions */

/* Example 1: The following procedure illustrates the use of input parameters by defining a stored procedure that accepts a numeric department identifier and returns the corresponding department name. */
DELIMITER // 
CREATE PROCEDURE get_department_name(IN did INT)
BEGIN	
    SELECT dname FROM department WHERE dnumber = did; 
END//
DELIMITER;
CALL get_department_name(2);


CALL get_departmentt_name(5);

/* Example 2: Here’s an example, which uses a stored procedure to insert a new dependent record. */
DELIMITER //
CREATE PROCEDURE add_dependent(in sn CHAR(9),in name VARCHAR(15)
                               , in gen CHAR, in bdate DATE
                               , in relationship VARCHAR(8))
   BEGIN
      INSERT INTO dependent VALUES (sn, name, gen, bdate, relationship);
      SELECT * FROM dependent WHERE dependent_name = 'Alica';
   END//
DELIMITER;
CALL add_dependent('123456789','Alica','F', '1960-12-31','Spouse'); 

/* Example 3: Here’s a revision of the previous example, which stores the department name in an output parameter instead of displaying it. */
DELIMITER // 
CREATE PROCEDURE get_department_name1(IN did INT, OUT dname VARCHAR(25)) 
   BEGIN
      SELECT dname INTO dname
      FROM department 
      WHERE dnumber = did;
   END//
CALL get_department_name1(10, @var); 
SELECT @var; 

/* Example 4: Here’s a revision of the previous example, which stores the airport name in an output parameter instead of displaying it.*/
DELIMITER // 
CREATE PROCEDURE get_department_name2(IN did INT)
   BEGIN
     SELECT dname INTO @dname
     FROM department WHERE dnumber = did; 
   END//
DELIMITER; 

CALL get_department_name2(8); 

SELECT @dname;
/* Example 5: Here’s a simple example, which demonstrates this. */
DELIMITER // 
CREATE PROCEDURE add_one(INOUT num INT)
   BEGIN
     SELECT (num+1) INTO num;
   END//
DELIMITER; 
SET @a = 9; 
CALL add_one(@a);
SELECT @a;

DELIMITER //
CREATE PROCEDURE count_employees(OUT e_male INT, OUT e_female INT) 
   BEGIN
     SET e_male = (SELECT COUNT(*) 
                   FROM employee WHERE sex = 'M');
     SET e_female = (SELECT COUNT(*) 
                     FROM employee WHERE sex = 'F');     
   END//
CALL count_employees(@male_count, @female_count); 
SELECT @male_count, @female_count; 

/* Example 6: A stored function which returns a formatted version of the current date. */
DELIMITER // 
CREATE FUNCTION today()
   RETURNS VARCHAR(255) 
    BEGIN
        RETURN DATE_FORMAT(NOW(), '%D %M %Y'); 
    END//
SELECT today(); 

/* Example 7: The RetrieveSalary function retrieves the employee salary for a specific employee into the variable named v_salary and then returns the value of that variable. */
DELIMITER //
CREATE FUNCTION RetrieveSalary()
    RETURNS decimal(10,2)
    BEGIN 
        Declare v_salary decimal(10,2);
        SELECT salary INTO v_salary 
        FROM employee 
        WHERE ssn = '666666600';
     RETURN v_salary;
     END //
DELIMITER;
SELECT RetrieveSalary();

DROP FUNCTION RetrieveSalary;

/* Example 8: To remove a stored function, use the DROP FUNCTION command with the function name as argument. */
DROP FUNCTION today(); 

/* Example 9:  */
SHOW CREATE FUNCTION today;


SHOW FUNCTION STATUS 
       WHERE Db ='company';

/* Example 10: */
DELIMITER //
CREATE FUNCTION what_is_today()
   RETURNS VARCHAR(255) 
   BEGIN
      DECLARE message VARCHAR(255);
      IF DAYOFWEEK(NOW()) BETWEEN 2 AND 6 THEN
         SET message = 'Today is a weekday';
       END IF;
    RETURN message; 
    END//
DELIMITER;
SELECT what_is_today(); 


/* Example 11: Consider the next example, which returns different messages on weekdays and weekends. */
DELIMITER // 
CREATE FUNCTION what_is_today1()
  RETURNS VARCHAR(255) 
  BEGIN
	DECLARE message VARCHAR(255);
            IF DAYOFWEEK(NOW()) BETWEEN 2 AND 6 THEN 
                 SET message = 'Today is a weekday';
     ELSE SET message = 'Saturday or Sunday';
		END IF;
	     RETURN message;
       END//
	   
DELIMITER;
SELECT what_is_today1(); 

/* Example 12: */
DELIMITER // 
CREATE FUNCTION todays_child() 
   RETURNS VARCHAR(255) 
   BEGIN
      DECLARE message VARCHAR(255); 
      IF DAYOFWEEK(NOW()) = 2 THEN
         SET message = 'child is fair of face.'; 
      ELSEIF DAYOFWEEK(NOW()) = 3 THEN
         SET message = 'child is full of grace.'; 
      ELSEIF DAYOFWEEK(NOW()) = 4 THEN
         SET message = 'child is full of woe.'; 
      ELSEIF DAYOFWEEK(NOW()) = 5 THEN
         SET message = 'child has far to go.'; 
      ELSEIF DAYOFWEEK(NOW()) = 6 THEN
         SET message = 'child is loving and giving.'; 
      ELSEIF DAYOFWEEK(NOW()) = 7 THEN 
         SET message = 'child is loving and giving. ';
      ELSE
         SET message = 'child is bonny. ';
     END IF;
   RETURN message; 
   END//
DELIMITER ;

SELECT todays_child();

/* Example 13: */
DELIMITER //
CREATE FUNCTION get_department_number( dept_name_param VARCHAR(50))
    RETURNS INT
    BEGIN
       DECLARE dept_number_var INT;
       SELECT dnumber
       INTO dept_number_var
       FROM department
       WHERE dname = dept_name_param;
   RETURN(dept_number_var);
   END//
DELIMITER;
SELECT get_department_number('Research')//

/* mple 14: The following example creates a function that takes an integer-valued parameter representing a year. The function uses a subquery to determine how many employees were born in that year and returns the count.*/
DELIMITER //
CREATE FUNCTION count_born_in_year(p_year INT)
   RETURNS INT 
    BEGIN 
      DECLARE number_var INT;
      SELECT COUNT(*)INTO number_var
      FROM employee WHERE YEAR(birth_date) = p_year; 
      RETURN (number_var);
    END//
DELIMITER;
SELECT count_born_in_year(1963);

/* Example 15: */
ALTER TABLE employee ENGINE=INNODB; 
ALTER TABLE department ENGINE=INNODB; 
ALTER TABLE project ENGINE=INNODB; 


START TRANSACTION; 

INSERT INTO department 
       VALUES('Human Resources', 10, '453453453','1988-8-18');
SELECT COUNT(dnumber) 
FROM department
WHERE dnumber = 10;


ROLLBACK; 
SELECT COUNT(dnumber)
FROM department;

COMMIT;









