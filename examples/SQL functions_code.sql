/* SQL Examples: SQL Functions

/* Example 1: Enter the following query and examine how the date is displayed.  */
SELECT DISTINCT(bdate)
FROM employee 
 WHERE dno = 7;

/* Example 2: Enter the following query to display today’s date and time. Notice that in MySQL the 
functions are called using the SELECT statement but no FROM clause is needed.
*/
SELECT CURRENT_DATE(), CURRENT_TIME();

/* Example 3: TThe following example calculates the number of days between the1st January 2008 and the 
25th December 2008.
*/
SELECT DATEDIFF('2008-12-25','2008-01-01');

/* Example 4: The following query adds 11 months to the date 1st January 2008 to display a new date of 1st 
December 2008. 
*/
SELECT ADDDATE('2008-01-01', INTERVAL 11 MONTH );

/* Example 5: Search for month, day, and year integers.*/
SELECT essn, dependent_name, bdate 
FROM dependent
WHERE MONTH(bdate) = 4 
AND DAYOFMONTH(bdate) = 4 
AND YEAR(bdate) = 1997;

/* Example 6: Search for a formatted date.*/
SELECT fname, lname, DATE_FORMAT(bdate, '%m-%d-%Y')  
FROM employee
WHERE DATE_FORMAT(bdate, '%m-%d-%Y') = '07-31-1977';

/* Example 7: ABS returns the absolute value of the argument. */
SELECT ABS(12),  ABS(-12), ABS(0),  ABS(45.34);

/* Example 8: POWER(a, b),  is used to calculate  a raised to the b power ; POW is an alias for Power.*/

SELECT POWER(3, 2), POWER(10, 3), POWER(4.5, 3.2), POWER(10, -3);

/* Example 9:The following query illustrates the CONCAT function. It lists all employees first and last 
names concatenated together.
 */
SELECT CONCAT (fname, ' ' , lname) AS NAME
FROM employee 
WHERE dno = 4;

/* Example 10: The following example lists the first three characters of all the employees’ first name.  */
SELECT ssn, SUBSTR(fname,1,3) 
FROM employee 
WHERE dno = 6;
  
/* Example 11:  The following query lists all employee last names in all capital letters and all first names in all lowercase letters. */
SELECT CONCAT(UPPER(lname), LOWER(fname)) AS NAME 
FROM employee;

/* Example 12: The following example lists all of the dependents’ names and the length of their names, 
   ordered by the descended dependent_name length. */
SELECT dependent_name, LENGTH(dependent_name) AS NAMESIZE 
FROM dependent 
ORDER BY NAMESIZE DESC;

/* Example 13: CAST()*/
SELECT cast(123.567 as char);

/* Example 14: CAST()*/
SELECT cast('absdsdsr' as char(2));

/* Example 15:  CONVERT()*/
SELECT convert(123.567 , char);

/* Example 16: For each employee, display the SSN followed by the null value.*/
SELECT ssn, CAST(NULL AS CHAR)
FROM employee;

/* Example 17:Get the odd SSNs from the EMPLOYEE table.*/
SELECT ssn
FROM employee
WHERE ssn & 1;

/* Example 18: */
SELECT Format(1234.5678, 3)

/* Example 19: */
SELECT Format(1234.5678, 0);

/* Example 20:  */
SELECT Format(1234.5678, 8);

/* Example 21: Create the user variable SSNNO and initialize it with the value 111111100.*/
SET @SSNNO = 444444400;
SELECT @SSNNO;

/* Example 22:  */
SET @FNAME = (SELECT fname
              FROM employee 
			  WHERE SSN =444444400  );
SELECT @FNAME;

/* Example 23:  Get the SSN, the sex, and the first name of each employee that was born before 1960. The gender must be printed as 'Female' or 'Male'. */
SELECT SSN, CASE sex
            WHEN 'F' THEN 'Female'
            ELSE 'Male' END AS sex, fname 
FROM  employee
WHERE year(bdate)< 1960;

/* Example 24:  For each employee, find the SSN, the year in which he or she that was born, and the employee’s age group.*/
SELECT SSN, bdate,
     CASE
       WHEN year(bdate) < 1960 THEN 'Managers'
       WHEN year(bdate) < 1970 THEN 'Seniors'
       ELSE 'not Classified' END AS AGE_GROUP
 FROM employee
 ORDER BY bdate;





