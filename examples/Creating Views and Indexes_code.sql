/* SQL Examples: Creating Views and indexes

/* Consider the clerk who needs to access all data in the employee relation, except salary. 
The clerk should not be authorized to access the employee relation. A view relation employee can be 
made available to the clerk, with the view deﬁned as follows:
*/
CREATE or REPLACE view employee_info AS
SELECT first_name, last_name, ssn
FROM employee;

SELECT * 
FROM employee_info;

DESCRIBE employee_info;

/* Example 2: Consider the following view, dept_summary, defined on the Company database.*/
CREATE VIEW dept_summary (D, C, Total_s, Average_s)
AS SELECT  dept_number, COUNT(*), SUM(salary), AVG(salary)
FROM employee 
GROUP BY dept_number
HAVING dept_number > 5;

SELECT * 
FROM dept_summary;

/* Example 3*/
CREATE VIEW dept_salary (Name,  MinSalary,MaxSalary,AvgSalary)  
AS SELECT d.Dept_name, MIN(e.Salary), MAX(e.Salary), AVG(e.Salary)
FROM employee e 
JOIN department d ON (e.dept_number = d.dept_number) 
GROUP BY d.dept_name;

/* Example 4*/
SELECT d, c
FROM dept_summary 
WHERE total_s > 100000;

SELECT  d, average_s
FROM  dept_summary
WHERE C > (SELECT C FROM dept_summary WHERE D = 8);

/* Example 5 */
CREATE VIEW departments_total_salary (dept_number, total_salary)
AS SELECT dept_number, sum(salary)
FROM employee
WHERE dept_number > 4 
GROUP by dept_number;

SELECT *
FROM departments_total_salary;

/* Example 6 */
CREATE or replace view employee_info_first AS
SELECT *
FROM employee_info
WHERE first_name LIKE 'J%';

SELECT * 
FROM employee_info_first;

/* Example 7: Suppose the view employee_info, which we saw earlier, is made available to a clerk. Since we allow a view name to appear wherever a relation name is allowed, the clerk can write: */
INSERT INTO employee_info
VALUES('John', 'Green', '111231100');

INSERT INTO employee_info (first_name, last_name, ssn)
VALUES ('John', 'Green', '111231100');

/* Example 8: An update statement that use a view to update the base table. */
UPDATE employee_info
SET last_name = 'Alex'
WHERE ssn = '999887777';

SELECT *
FROM employee_info 
WHERE ssn = '999887777';

/* Example 9 */
CREATE TABLE table1 (i INT); 
INSERT INTO table1 (i) 
VALUES(1),(2),(3); 

CREATE VIEW view1 
AS SELECT i
FROM table1;

SELECT i 
FROM view1; 

INSERT INTO view1(i) 
VALUES(4);

SELECT * 
FROM table1;

DELETE 
FROM view1
WHERE i < 3;

SELECT * 
FROM table1;

SELECT i 
FROM view1;

UPDATE view1 SET i = i + 1;

SELECT i 
FROM view1; 

/* Example 10: The following view EMP employee who work in department number 6 using the WITH CHECK OPTION clause. This clause ensures that INSERTs and UPDATEs cannot be performed on any rows that the view has not selected.  */
CREATE VIEW EMP 
AS SELECT * FROM employee
WHERE dept_number = 6 WITH CHECK OPTION;

UPDATE EMP
SET dept_number = 5
WHERE ssn = '111111101';

DROP VIEW employee_info;

/* Example 11: A statement that drops the view DROP VIEW employee_info.*/
DROP VIEW employee_info;

SELECT * 
FROM employee_info;

/* Example 12: If you want to see the names of tables and views- distinguishing the two, use 
information_schema.tables.
*/
SELECT table_schema, table_name, table_type
FROM information_schema.tables
WHERE table_schema = "company";

/* Example 13: */
CREATE VIEW assignment1 AS
SELECT first_name, last_name, hours
FROM employee e,  project p, assignment a
WHERE ssn = emp_ssn 
AND p.project_number  = a.project_number;

SELECT * 
FROM assignment1;

/* Example 14: */
CREATE VIEW  dept_info(dept_name, No_of_empls, Total_sal) AS
SELECT dept_name, count(*), SUM(Salary)
FROM department d, employee e
WHERE d. dept_number = e.dept_number
Group by dept_name ;

SELECT * 
FROM dept_info;

/* Example 15: Write a SELECT statement to create an index named i_employee_lase_name index on the attribute last name of the relation employee.*/
CREATE INDEX i_employee_last_name 
ON employee(last_name);

SELECT last_name 
FROM employee;

/* Example 16: Drop the index i_employee_last_name.*/
ALTER TABLE employee 
DROP INDEX i_employee_last_name;




