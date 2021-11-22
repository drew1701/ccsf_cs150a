/* SQL Examples: Group Functions

/* Example 1: Display the total number of employees in the company.*/
SELECT count(*) AS no_of_employees
FROM employee;

/* Example 2: Count the number of distinct salary values in the database.*/
SELECT MIN(SALARY),max(SALARY)
FROM employee;

/* Example 3: The following query displays the average salary..*/
SELECT AVG(SALARY)
FROM employee;

/* Example 4: Display the sum of the salaries of all employees.*/
SELECT SUM(SALARY) 
FROM employee;

/* Example 5: Find the sum of the salaries of all employees, the maximum salary, the minimum salary, and the average salary.*/
SELECT SUM(salary) AS sum_salary, MAX(salary) AS max_salary
       ,MIN(salary) AS min_salary, AVG(salary) AS avg_salary
FROM employee;

/* Example 6: TThe following query displays the minimum and maximum salary of all departments.
Notice that the query groups only by the department number, as no aggregate function is applied to 
this attribute in the SELECT statement.
*/
SELECT d.dname, MIN( salary ) , MAX( salary )
FROM employee e, department d
WHERE e.dno = d.dnumber
GROUP BY e.dno;

/* Example 7: For each department, retrieve the department name, the number of employees in the 
department, and their average salary. Write this query as follows:
*/
SELECT e.dno,count(*) AS no_of_employees
              ,avg(salary) AS average_salary
FROM employee e, department d
WHERE e.dno = d.dnumber 
GROUP BY e.dno;

/* Example 8: For each project, list the project name and the total hours per week (by all employees) 
spent on that project.
*/
SELECT p.pname, SUM(hours)
FROM project p, works_on a
WHERE p.pnumber = a.pno
GROUP BY p.pname;

/* Example 9: FFor each department, retrieve the gender, the number of employees in the company, and employee 
average salary.
*/
SELECT sex, COUNT(*), AVG(Salary)
FROM employee  
GROUP BY sex;

/* Example 10: For each project, retrieve the project number, the project name, and the number of employees 
from department 5 who work on the project.
*/
SELECT p.pnumber, p.pname, COUNT(*)
FROM   project p, works_on a, employee e
WHERE  p.pnumber = a.pno AND e.ssn = a.essn AND  
       p.dnum=5
GROUP BY  p.pnumber, p.pname;

/* Example 11: Display the list of all departments, with the total number of employees in each department.  */
SELECT d.dname, count(e.ssn)
FROM department d
JOIN employee e ON (d.dnumber = e.dno)
GROUP by d.dname;

/* Example 12: : For each project on which more than two employees work, retrieve the project number, project name, and the number of employees who work on the project.*/
SELECT p.pnumber, p.pname, count(*)AS no_of_employees
FROM   project p,works_on a
WHERE  p.pnumber = a.pno
GROUP BY p.pnumber,p.pname
HAVING count(*)>2;

/* Example 13: Display the total number of dependents for each employee with at least two dependents.  */
SELECT essn, COUNT(*)
FROM dependent
GROUP BY essn 
HAVING COUNT(*) >= 2;

/*Example 14: Display average employee salary by department. 
Do not include departments with an average salary less than or equal to $50,000. */
SELECT dno, AVG(Salary)
FROM employee	
GROUP BY dno
HAVING AVG(salary) <= 50000;

/* Example 15: How many projects are being run by the Research Department? Be sure to assign 
an appropriate column name to the computed results.
 */
SELECT COUNT(*) AS NumberOfResearchDeptProjects
FROM project JOIN department On (dnumber = dnum)
WHERE dname ='Research';

/* Example 16: What is the total MaxHours of projects being run by the Research Department? Be sure to assign an appropriate column name to the computed results. */
SELECT SUM(hours) AS TotalMaxHoursForReserchDeptProjects
FROM department JOIN project ON (dnumber = dnum)
JOIN works_on ON (pnumber = pno)
WHERE dname ='Research';

/* Example 17:How many projects are being run by ech department? Be sure to display each department name and to assign an appropriate column name to the computed results.  */ 
SELECT dname, COUNT(*) AS NumberOfDeptProjects 
FROM PROJECT JOIN department ON(dnumber = dnum) 

/* Example 18: Write a SQL statement that shows each type (that is, dog or cat) and the number of each 
type (that is, how many dogs and how many cats) in the database.
*/

SELECT PetType, COUNT(PetType) AS NumberOfPets
FROM PET
GROUP BY PetType;

/* Example 19: Write a SQL statement to display each Breed of dog and the number of each Breed in the 
database.

 */

SELECT  PetBreed, COUNT(PetBreed) AS NumberOfDogs  
FROM  PET_3 
WHERE  PetType = 'Dog' 
GROUP BY PetBreed;

/* Example 20: Write a SQL statement to group the data by PetBreed and display the average Weight per 
breed.
*/
SELECT PetBreed, AVG(PetWeight) AS AvgBreedWeight
FROM pet_3
GROUP BY PetBreed;

/* Example 21: Write a SQL statement to group the data by PetBreed and display the average Weight per 
breed. Consider only breeds for which two or more pets are included in the database.
 */
SELECT PetBreed, AVG(PetWeight) AS AvgBreedWeight
FROM pet_3
GROUP BY PetBreed
HAVING count(*) > 1;




