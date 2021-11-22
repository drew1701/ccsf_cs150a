/* SQL Examples: Subqueries

/* Find all employees whose salary is greater than or equal to the average salary. Write the following query: */
SELECT ssn, fname, lname, salary
FROM employee
WHERE SALARY >= (SELECT AVG(salary)
                 FROM employee);

/* Example 2: Find details of those employees whose salary is greater than the average salary 
for all employees. Output salary in descending order.
*/
SELECT fname, lname, salary
FROM employee
WHERE salary > (SELECT AVG(salary)
                FROM employee)
ORDER BY salary DESC;

/* Example 3: Display the last name and salary of every employee who reports to Wong.*/
SELECT lname, salary
FROM employee
WHERE superssn = (SELECT ssn
                  FROM employee
                  WHERE lname = 'Wong');

/* Example 4: Find the names of all employees whose salary is greater than at least one employee 
in the department number 7.
*/
SELECT fname, lname, salary
FROM employee 
WHERE  SALARY > SOME (SELECT SALARY
                      FROM employee 
					  WHERE dno = 7);
					 
/* Example 5: Find all employee names whose salary is greater than all employees in department number 6. */
SELECT fname, lname, salary
FROM employee
WHERE SALARY > ALL (SELECT salary
                    FROM employee
                    WHERE dno = 6);
					
/* Example 6: Find all departments along with the number of employees in each department.*/
SELECT dname
 ,( SELECT COUNT(*) 
    FROM employee
    WHERE department.dnumber = employee.dno
  ) AS num_employees 
FROM department;


/* Example 7: Retrieve the name of each employee who has a dependent with the same first name or same gender as the employee.  */
SELECT e.fname, e.lname
FROM employee e
WHERE e.ssn IN (SELECT essn
                FROM dependent
                WHERE  e.fname = dependent_name OR e.sex = sex);
				 
/* Example 8: For each department that has less than five employees, retrieve the number of its 
employees who are making more than $40,000. 
 */
SELECT d.dname, count(*) As “Number of Employees”
FROM department d 
JOIN employee e ON (d.dnumber = e.dno)
AND salary > 40000 
AND e.dno IN (SELECT dno
              FROM employee
              GROUP BY dno 
              HAVING count(*) < 5);
       
/* Example 9: Retrieve the names of employees who do not work on any project.  */
SELECT lname, fname
FROM employee
WHERE ssn NOT IN (SELECT empssn
                  FROM works_on);

/* Example 10: : Find the average employees’ salaries of those departments where the average salary is 
less than $42,000.
*/
SELECT AVG_SALARY
FROM (SELECT dno, AVG(SALARY) AS AVG_SALARY
      FROM employee
      GROUP BY dno) empl
WHERE AVG_SALARY < 42000;

/* Example 11: Display the names of managers who have at least one dependent.*/
SELECT fname,lname
FROM employee
WHERE EXISTS (SELECT * 
              FROM department
              WHERE ssn = mgrssn)
AND EXISTS (SELECT * 
            FROM dependent
            WHERE ssn = essn);	 
/* Example 12: Retrieve the names of employees who have no dependents.*/
SELECT fname, lname
FROM employee
WHERE NOT EXISTS( SELECT *
                 FROM dependent
                 WHERE ssn = essn);

/* Example 13: */
UPDATE employee b
SET b.salary = (SELECT AVG(e.salary) FROM employee e)
WHERE b.ssn = 111111100;

/* Example 14: The following DELETE statement removes the employee whose salary is greater than 
the average salary returned by a subquery.
*/
DELETE FROM employee 
WHERE salary > (SELECT AVG(salary)
                FROM employee);	
/* Example 15: Display employee Kate King’s department name.*/
SELECT dname
FROM department
WHERE dnumber = (SELECT dno
                 FROM employee
                 WHERE lname = 'king'
                 AND fname = 'kate');
					 
/* Example 16: Find employees with minimum salary in their own department with the use of correlated 
subquery.
*/
SELECT Lname, fname, salary, dno
FROM employee e
WHERE Salary = (SELECT MIN(salary)
                FROM employee
                WHERE dno = e.dno
                GROUP BY dno);

/* Example 17: Which department has more employees than department 5?*/
SELECT dno, COUNT(*)
FROM employee
GROUP BY dno
HAVING COUNT(*) > (SELECT COUNT(*)
                   FROM employee
                   WHERE dno = 5);
									 
/* Example 18: Retrieve all employee names who have two or more dependents. */
SELECT lname,fname     
FROM employee     
WHERE(SELECT count(*) 
      FROM dependent 
      WHERE ssn = essn) >= 2;
	  
/* Example 19: Retrieve the names of all employees who work in the department that has the 
employee with the highest salary among all employees.
*/
SELECT lname 
FROM employee 
WHERE dno = (SELECT dno
             FROM employee 
             WHERE salary = (SELECT MAX(salary) 
                             FROM employee));

/* Example 20: Retrieve the names of employees who make at least $10,000 more than the employee who is paid the least in the company.

*/
SELECT lname
FROM employee
WHERE salary >= 10000 + (SELECT MIN(salary)
                         FROM employee);

/* Example 21:Write a query to display the last names of the employees who earn less than the verage salary in their departments. */
SELECT lname
FROM employee o
WHERE o.salary < (SELECT AVG(i.salary)
                  FROM employee i
                  WHERE i.dno = o.dno);