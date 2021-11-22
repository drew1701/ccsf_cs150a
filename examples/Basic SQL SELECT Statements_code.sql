/* Example 1: Display the details of all departments in the Company database.
*/

SELECT * 
FROM department;

/* Example 2: View the names of all departments in the company database type the following: */


SELECT dname 
FROM department;

/* Example 3: In this example, you are selecting specific columns from a single table. */


SELECT dnumber, mgrssn 
FROM department;

/* Example 4:  Type in the following example of the SELECT statement. */


SELECT mgrssn AS 'MANAGER SSN'  
FROM department;

/* Example 5: Type in the following example of the SELECT statement. */


SELECT DISTINCT dnum 
FROM project;

/* Example 6: The first six rows from the EMPLOYEE table are the only rows that MySQL returned. 
*/

SELECT fname, lname 
FROM employee 
LIMIT 6;

/* Example 7: Limit with a skip. This also gives us ten rows, but it skips the first five rows before it sends us the ten rows. It returns rows 6,7,8,…, 15. */


SELECT fname, lname 
FROM employee 
LIMIT 5,10;

/* Example 8: To randomly select a row or set of rows from a table, use ORDER BY RAND() in conjunction with LIMIT. */


SELECT dependent_name
FROM dependent
ORDER BY  RAND()  
LIMIT  1;

/* Example 9: To randomly select a row or set of rows from a table, use ORDER BY RAND() in conjunction with LIMIT. */


SELECT dependent_name
FROM dependent
ORDER BY  RAND() 
LIMIT  3;

/* Example 10: Type in the following example of the SELECT statement.  */


SELECT fname, lname
FROM employee
WHERE dno = 5;
/* Example 11: If you want to list all employees whose name appears earlier alphabetically than (is less than) 'M', use the following statement:*/


SELECT lname
FROM employee
WHERE lname < 'M';

/* Example 12: The following SQL statement selects all departments from the DEPARTMENT table,  sorted by the "dname" column.*/


SELECT *
FROM department
ORDER BY dname;

/* Example 13: The following SQL statement selects all departments from the DEPARTMENT table, sorted descending by the "dname" column.
*/

SELECT dname, dnumber
FROM department
ORDER BY dname DESC;

/* Example 14: The following SQL statement selects all employees from the EMPLOYEE table, sorted by the "sex" and the "salary" column.
*/

SELECT fname, sex, salary 
FROM employee 
ORDER BY sex, salary;


/* Example 15: The following SQL statement selects all employees from the EMPLOYEE table, sorted by the "gender" and the "salary" column in descending order.
*/

SELECT fname, sex, salary 
FROM employee 
ORDER BY sex, salary DESC;
 

/* Example 16: In the following query, the first name and salary columns are retrieved from the EMPLOYEE table. The number 200 is added to the value in the salary column to form the expression 
salary + 200.
*/

SELECT fname, salary + 200 Total 
FROM employee;


/* Example 17: Using a calculated column. */

SELECT fname, salary + salary * 0.10 AS salaries
FROM employee;
 

/* Example 18: Using a calculated value as a sort key. */

SELECT fname, salary * 1.10
FROM employee
ORDER BY (salary * 1.10)
LIMIT 10;

/* Example 19 : You can sort by a column alias. Since this alias includes spaces, it must be quoted.
*/


SELECT CONCAT(fname, ' ', lname) AS 'employee Name'
FROM employee
LIMIT 10;

/* Example 20: You can concatenate values of different data types. You can sort by a column alias. Since 
this alias includes spaces, it must be quoted and you must use the back tick.
*/


SELECT concat('SSN: ', ssn, ' ' ,fname, '   was born on ,', bdate), lname as 'last name'
FROM employee
ORDER BY `last name`
LIMIT 10;

/* Example 21: Display the birthdate and address of the employee(s) whose first name is John.

*/

FROM employee 
WHERE fname = 'John';

/* Example 22: Display all employee SSNs.*/

SELECT ssn
FROM employee;
/* Example 23: Display the salary of every employee. */

SELECT salary
FROM employee; 


/* Example 24: MySQL allows you to sort by the column number. This is often considered poor 
style as it is easy to rearrange the column in the SELECT clause and forget to adjust the ORDER BY clause. 
This will sort by the pname values.
*/

SELECT pname, pnumber, dnum
FROM project
ORDER BY 1;

/* Example 25: Which projects are in the PROJECT table? Show all information for each project. */

SELECT * 
FROM project;