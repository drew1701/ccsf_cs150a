/* SQL Examples: Joining Data from Multiple Tables

/* Example 1: Execute the following query. */
USE company;
SELECT * 
FROM department 
CROSS JOIN project;

/* Example 2: Display the name of each employee who has a dependent with the same first name as the employee.  */
SELECT e.fname, e.lname
FROM employee e, dependent d
WHERE e.ssn = d.essn 
AND e.fname = d.dependent_name;

/*Example 3: Display the department number, the first name, and lase name of all employees who 
work for the ‘Software’ department.
*/
SELECT fname,lname , e.dno
FROM employee e, department d
WHERE e.dno = d.dnumber
AND (dname='Software');

/* Example 4: Execute the following query: */
SELECT d.dnumber, dname
FROM department d
JOIN project p ON d.dnumber = p.dnum
ORDER BY d.dnumber;

/* Example 5: For every project, list the project number, the controlling department number, and the 
department manager's last name, and birthdate.
*/
SELECT pnumber, d.dnumber, bdate
FROM project p, department d, employee e
WHERE p.dnum = d.dnumber
AND d.mgrssn = e.ssn;

/*Example 6: Display a list of employees and the projects they are working on, ordered by department and 
within each department, ordered alphabetically by last name and first name.
*/
SELECT d.dname,lname,fname, pname
FROM department d,project p ,works_on a,employee e
WHERE d.dnumber = p.dnum 
AND p.pnumber = a.pno
AND a.essn = e.ssn 
ORDER by dname,lname,fname;

/* Example 7: Write a query that performs a join of the department, and dept_locations tables by writing: */ 
SELECT dname, dlocation
FROM department
JOIN dept_locations
USING(dnumber);

/* Example 8: For each employee, display the employee's name and the name of his or her dependents.  */
SELECT d.dname,lname,fname, pname
FROM department d,project p ,works_on a,employee e
WHERE d.dnumber = p.dnum 
AND p.pnumber = a.pno
AND a.essn = e.ssn 
ORDER by dname,lname,fname;

/* Example 9: For each employee, retrieve the employee's name and name of their immediate supervisor.  */
SELECT e.fname, e.lname, s.fname, s.lname
FROM employee e , employee s
WHERE e.superssn = s.ssn;

/* Example 10: This example performs right join of the department and project tables and returns selected 
attributes: (departments with and without projects).
*/
SELECT dname, d.dnumber, pname, p.dnum
FROM project p 
RIGHT JOIN department d ON d.dnumber = p.dnum;

/* Example 11: The following example performs left join of the department and project tables and 
returns selected attributes: (departments with and without projects).
*/
SELECT dname, d.dnumber, pname ,p.dnum
FROM department d
LEFT JOIN project p ON d.dnumber = p.dnum;

/* Example 12: Display the name of the supervisor for employee’s SSN “111111100”. */
SELECT e.lname 'employee', e.fname, s.lname 'supervisor'
FROM employee e 
JOIN employee s ON (e.ssn = s.superssn)
WHERE e.ssn = 111111100;

/* Example 13: Display the department name, the name, and address of all employees who do not work for 
the ‘Research’ department.
*/
SELECT dname, fname,lname
FROM employee e 
JOIN department d ON e.dno= d.dnumber 
WHERE (dname<>'Research');

/* Example 14: Display all employee names and their department names.*/
SELECT lname, fname, dname
FROM employee e 
JOIN department d ON e.dno = d.dnumber;

/* Example 15: Find all employees’ full names (lastname, firstname format) with salary, and
supervisor’s name with salary.
*/
SELECT concat(e.lname, " ", e.fname) AS name
, e.salary ,s.lname, s.fname, s.salary
FROM employee e 
JOIN employee s ON  e.superssn = s.ssn;

/* Example 16: Find all employees in the ‘software’ department.*/
SELECT lname, fname, dname
FROM employee e, department d
WHERE e.dno = d.dnumber
AND d.dname = 'software';

/* Example 17: Display the last name and department name for employees with ‘a’ (lowercase) in their last name.*/
SELECT lname, dname
FROM employee e JOIN department d
ON e.dno = d.dnumber
WHERE lname LIKE '%a%';


/* Example 18: Who are the employees assigned for each project? Display project number, project name, and department number. Display the employee’s last name and first name.*/
SELECT p.pnumber, pname,  p.dnum, E.ssn, lname,fname
FROM employee  AS e JOIN works_on AS a ON a.essn=e.ssn
JOIN project AS p ON a.pno = p.pnumber;

/* Example 19: Who are the employees assigned for each project? Display project number, project name, department number, and department name.
 Display the employee’s last name and first name. Sort by project number in ascending order.  */

SELECT p.pnumber, pname, d.dname, e.ssn, lname, fname
FROM employee AS e
JOIN works_on AS a ON a.essn=e.ssn
JOIN project AS p ON a.pno = p.pnumber
JOIN department AS d  ON p.dnum = d.dnumber
ORDER BY P.pnumber;

/* Example 20: Who are the employees assigned for the projects run by the Research department? Display project number, project name, department number, and department name. 
Display employee’s last name and first name. Sort by project number in ascending order.*/


SELECT P.pnumber, pname, D.dname,  E.ssn, lname, fname
FROM employee  AS e
JOIN works_on AS a ON a.essn = e.ssn
JOIN project AS p ON a.pno = p.pnumber
JOIN department AS d ON p.dnum= d.dnumber
WHERE dname = 'research'
ORDER BY p.pnumber;

/* Example 21: Write a SQL statement that displays CourseNumber, Course, CourseDate, CustomerNumber, CustomerLastName, CustomerFirstName, and Phone. */
SELECT co.CourseNumber, Course, CourseDate, cu.CustomerNumber
 ,CustomerLastName, CustomerFirstName, Phone
FROM course AS co
JOIN enrollment AS e ON CO.CourseNumber = e.CourseNumber
JOIN customer CU ON e.CustomerNumber = cu.CustomerNumber;

/* Example 22: Write a SQL statement that displays CourseNumber, Course, CustomerNumber, CustomerLastName, Phone, Fee, AmountPaid, and the calculated column (Fee—AmountPaid) renamed as AmountOwed. */
SELECT co.CourseNumber, Course, cu.CustomerNumber
,CustomerLastName,Phone, Fee,AmountPaid, (Fee - AmountPaid) AS AmountOwed
FROM course AS co
JOIN enrollment AS e ON co.CourseNumber = e.CourseNumber
JOIN customer AS cu ON e.CustomerNumber = cu.CustomerNumber;

/* Example 23: Write a SQL query to list all students and courses they are registered for. 
Include, in this order, CustomerNumber, CustomerLastName, CustomerFirstName, Phone, CourseNumber, and AmountPaid.*/
SELECT cu.CustomerNumber, CustomerLastName, CustomerFirstName
 ,Phone, co.CourseNumber, AmountPaid
FROM customer AS cu
JOIN enrollment AS en ON cu.CustomerNumber = en.CustomerNumber
JOIN course AS co ON en.CourseNumber = co.CourseNumber;

/* Example 24: Write an SQL query to list all students registered in Adv. Pastels starting on October 1, 2015. 
Include in this order, Course, CourseDate, CustomerLastName, CustomerFirstName, Phone, Fee, and AmountPaid. Use a join. */

SELECT Course, CourseDate, CustomerLastName, CustomerFirstName
,Phone, Fee, AmountPaid
FROM customer AS cu
JOIN enrollment AS en ON cu.CustomerNumber = en.CustomerNumber
JOIN course AS co ON En.CourseNumber = co.CourseNumber
WHERE Course = 'Adv Pastels' AND CourseDate = '2015-10-01'

/* ********************************************************************* */

/* SQL Examples: Combining Table Expressions */

/* Example 1: List project numbers for all projects that involve an employee whose last name is 'wong’ as a worker or as a manager of the department who controls the project. */
(SELECT p.pname
 FROM   project p, department d, employee e
 WHERE  p.dnum= d.dnumber
 AND d.mgrssn=e.ssn and e.lname='wong')
UNION 
 (SELECT p.pname
  FROM   project p, works_on a, employee e
  WHERE  p.pnumber= a.pno
  AND a.essn = e.ssn and e.lname = 'wong');
  
(SELECT p.pname
 FROM   project p, department d,employee e
 WHERE  p.dnum = d.dnumber 
 AND d.mgrssn=e.ssn and e.lname='wong')
UNION ALL
 (SELECT p.pname
  FROM   project p, works_on a, employee e
  WHERE  p.pnumber= a.pno
  AND a.essn = e.ssn and e.lname = 'wong');

/* Example 2: Make a list of all project numbers for projects that involve an employee whose last name is ‘James’, either as a worker or as a manager of the department that controls the project. */
(SELECT DISTINCT 'Manager' AS James, p.pnumber   
 FROM project p
 JOIN department d ON p.dnum = d.dnumber 
 JOIN employee e ON d.mgrssn = e.ssn  
 WHERE e.lname = 'James')
UNION 
 (SELECT DISTINCT 'Worker' As James, p.pnumber
  FROM project p
  JOIN works_on a ON p.pnumber= a.pno
  JOIN employee e ON a.essn = e.ssn
  WHERE e.lname = 'James');
  
/* Example 3: This example returns all the rows from the department and employee tables; even if these rows do not have matching columns in the other table.  */
(SELECT d.dname As department_name, d.dnumber AS d_department_number
 ,e.dno AS e_department_number, e.lname 
 FROM department d 
 LEFT JOIN employee e ON (d.dnumber = e.dno)) 
UNION 
 (SELECT d.dname As department_name, d.dnumber AS d_department_number
  ,e.dno AS e_department_number,e.lname 
  FROM department d 
  RIGHT JOIN employee e ON (d.dnumber = e.dno))  


