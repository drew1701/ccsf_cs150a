/* SQL Examples: Basic SQL SELECT Statements (Continued) */

/* Example 1: Display the SSN, first name, and salary of all employees with the salary is greater than 
50000.
 */
SELECT fname, ssn, salary
FROM employee
WHERE salary > 50000;

/* Example 2: Execute the following query which produces a list of all rows in which the project name is 
alphabetically less than 'MU,' (Because the ASCII code value of the letter B is greater than the value of 
the letter A, it follows that A is less than B).
.*/
SELECT pname
FROM project
WHERE pname < 'MU';
Display the birthdate and addresses of the employee whose name is 'John Smith.'/* Example 3: Display the birthdate and addresses of the employee whose name is 'John Smith'. */
SELECT bdate, address
FROM employee
WHERE fname='John' 
AND lname='Smith';

/* Example 4: Display the project name and project number all projects where department number = 5 OR department number = 6. */
SELECT pnumber, pname
FROM project
WHERE dnum = 5 OR dnum = 6;

/* Example 5: If you want to see a listing of all rows for which department number is not 5, the 
query will look like. */
SELECT dname, dnumber
FROM department
WHERE NOT (dnumber = 5);

/* Example 6: Display the names of all employees who do not have supervisors.  */
SELECT fname, ssn
FROM employee
WHERE superssn IS NULL;

/* Example 7: Display the name and salary of all employees who have salaries between $50000.00 and 
$70000.00, use the following command. */
SELECT fname, lname, salary
FROM employee
WHERE SALARY BETWEEN 50000.00 AND 70000.00;

/*  Example 8: TDisplay the name and salary of all employees who have salaries below $30,000 
or above $70,000.  */
SELECT lname 'LastName', fname 'FirstName', salary 'Salary'
FROM employee
WHERE Salary BETWEEN 20000 AND 30000
OR Salary BETWEEN 40000 AND 50000
ORDER BY Salary;

/* Example 9: Display the name and salary of all employees in department 5 whose salary is between 
$30,000 and $40,000. */
SELECT fname, lname , salary
FROM employee
WHERE dno=5 AND (salary BETWEEN 30000 AND 40000);

/* Example 10: The next query will display rows for employees that have an annual salary that fall within 
one of the two specified salaries ranges.  
 */
SELECT lname 'LastName', fname 'FirstName', Salary 'Salary'
FROM employee
WHERE Salary NOT BETWEEN 30000 AND 70000
ORDER BY Salary;

/* Example 11: The following query retrieves the social security numbers of all employees who work on 
project numbers 1, 2, or 3. */
SELECT DISTINCT essn
FROM works_on
WHERE pno IN (1 , 2, 3);

/* Example 12: Write a query to display the name of all employees who are working in department 
number 6 or 7. 
 */
SELECT fname, lname, dno
FROM employee
WHERE dno IN (6,7);

/* Example 13: EEnter the following query which finds all employees rows whose first names 
begin with the letter E.
 */
SELECT fname
FROM employee
WHERE fname LIKE 'E%';

/* Example 14: Find the names of all projects whose location name includes the substring ‘ac.' */
SELECT pname, plocation
FROM project
WHERE plocation LIKE '%ac%';

/* Example 15: Retrieve all employees whose address is in Houston, Texas. */
SELECT fname,lname, address
FROM   employee
WHERE  address LIKE '%Houston, TX%';

/* Example 16: MySQL is not case specific on text comparisons.   */
SELECT fname,lname
FROM employee
WHERE lname = 'KING';

/* Example 17: Test date values using the default date format; enclose the date literal in single quotes. */
SELECT fname, lname, bdate
FROM employee
WHERE bdate = '1966-01-14' ;

/* Example 18: Test date values using the default date format; enclose the date literal in single quotes. */
SELECT fname, lname, bdate
FROM employee
WHERE bdate = cast('1966-01-14' as date) ; 

/* Example 19: Using a row equality test.  */
SELECT SSN, fname, lname
FROM employee 
WHERE row(ssn, fname, lname) = row('999887777', 'Alicia', 'Zelaya');

/* Example 20: This will match birth dates in the year 1968- but we get a warning. */
SELECT fname, ssn, bdate
FROM  employee
WHERE bdate LIKE '1968%'


/* Example 21: This actually uses the format for the date to pick out the month 1.*/
SELECT fname, ssn, bdate
FROM  employee
WHERE bdate LIKE '%-01-%'


