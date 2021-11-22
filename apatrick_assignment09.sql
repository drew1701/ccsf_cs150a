/*  Assignment09.sql 
    Andrew Patrick
    CS 150A, Fall 2021 */
    
USE restaurant;

/* Question 01 : What are the names of the International Foods
Restaurant employees whose salaries are greater than that of employees
whose ID is 125? Use a subquery. */

SELECT last_name, first_name, salary
FROM staff
WHERE salary >
    (SELECT salary
     FROM staff
     WHERE staff_id = 125)
ORDER BY last_name;


/* Question 02 : What are the names of the International Foods
Restaurant employees whose staff job ID is not the same as
Nicolas Patrick? Use a subquery. */

SELECT first_name, last_name, job_id
FROM staff
WHERE job_id <>
    (SELECT job_id
     FROM staff
     WHERE first_name = 'Nicolas' AND last_name = 'Patrick')
ORDER BY first_name;


/* Question 03 : Which employees have the same department ID as the
IT department? Use a subquery. */

SELECT first_name, last_name
FROM staff
WHERE dept_id =
    (SELECT department_id
     FROM departments
     WHERE department_name = 'IT')
ORDER BY first_name;


/* Question 04 : Write a query that returns all employees whose salary
is greater than that of Lane (last_name) and are in the same department
as Zayn (last_name). Use a subquery. */

SELECT staff_id, first_name, last_name, email
FROM staff
WHERE salary >
    (SELECT salary
     FROM staff
     WHERE last_name = 'Lane')
AND dept_id =
    (SELECT dept_id
     FROM staff
     WHERE last_name = 'Zayn')
ORDER BY first_name;


/* Question 05 : Write a query that returns all employees who have
the same job ID as Emilia Nasir and were hired after Baylor Collin.
Use a subquery. */

SELECT staff_id, first_name, last_name, salary, dept_id
FROM staff
WHERE job_id =
    (SELECT job_id
     FROM staff
     WHERE first_name = 'Emilia' AND last_name = 'Nasir')
AND hire_date >
    (SELECT hire_date
     FROM staff
     WHERE first_name = 'Baylor' AND last_name = 'Collin')
ORDER BY first_name;


/* Question 06 : What is the job ID for International Foods Restaurant
jobs that have a salary greater than those of any S_Cook job ID?
Use a subquery. */

SELECT DISTINCT job_id, dept_id
FROM staff
WHERE salary > ALL
    (SELECT salary
     FROM staff
     WHERE job_id = 'S_Cook')
ORDER BY dept_id;


/* Question 07 : Write a query that returns a list of department IDs
and average salaries where the department’s average salary is greater
than Marcus Jeremy’s salary. Use a subquery. */

SELECT dept_id, ROUND(AVG(salary), 2) AS Average
FROM staff
GROUP BY dept_id
HAVING AVG(salary) >
    (SELECT salary
     FROM staff
     WHERE first_name = 'Baylor' AND last_name = 'Collin')
ORDER BY dept_id;


/* Question 08 : Write a query that returns a list of department IDs
with employees whose minimum salary is greater than the lowest salary
of employees whose department ID is not equal to 50. Use a subquery. */

SELECT dept_id, MIN(salary) AS 'minimum salary'
FROM staff
GROUP BY dept_id
HAVING MIN(salary) > ANY
    (SELECT salary
     FROM staff
     WHERE dept_id <> 50)
ORDER BY dept_id;


/* Question 09 : Find the last names of all employees whose salaries are
the same as the minimum salary for any department. Use a subquery. */

SELECT last_name, first_name
FROM staff 
WHERE salary IN
    (SELECT MIN(salary)
     FROM staff
     GROUP BY dept_id)
ORDER BY last_name;


/* Question 10 : The goal of the following query is to display the
minimum salary for each department that is less than the lowest salary
of the employees in department 30. The subquery doesn't execute because
it has five errors. Find and correct them. Then, run the query. */

/* Original query : with errors
SELECT dept_id, MIN(salary) As "minimum salary"
FROM staff
WHERE MIN(salary)
HAVING MIN(salary) >
GROUP BY dept_id
SELECT MIN(salary)
WHERE dept_id < 30; */

-- Fixed query
SELECT dept_id, MIN(salary) As "minimum salary"
FROM staff
GROUP BY dept_id
HAVING MIN(salary) <
    (SELECT MIN(salary)
     FROM staff 
     WHERE dept_id = 30
     GROUP BY dept_id);
     
     
/* Question 11 : Write a non-pair-wise subquery that lists last_name,
first_name, department_id, and manager_id for all employees with the
same department_ id and manager_id as employee 745. Use a subquery. */

SELECT last_name, first_name, dept_id, manager_id
FROM staff
WHERE dept_id =
    (SELECT dept_id
     FROM staff
     WHERE staff_id = 745)
AND manager_id =
    (SELECT manager_id
     FROM staff
     WHERE staff_id = 745)
ORDER BY last_name;


/* Question 12 : Write a SQL statement that uses the IN operator to
find the customer ID, first name, and last name of each customer who
made an order on 05/09/2020. Use a subquery. */

SELECT customer_id, first_name, last_name
FROM customers
WHERE customer_id IN
    (SELECT cust_id
     FROM orders
     WHERE order_date = '2020-05-09')
ORDER BY customer_id;


/* Question 13 : Write a SQL statement that displays the order ID and
order date for each order created for the customer Evita Hodcroft.
Use a subquery. */

SELECT order_number, order_date
FROM orders
WHERE cust_id IN
    (SELECT customer_id
     FROM customers
     WHERE first_name = 'Evita' AND last_name = 'Hodcroft')
ORDER BY order_number;


/* Question 14 : Write a SQL statement that lists the highest earners
for each department. Include the last name, department ID, and the
salary for each employee. */

SELECT last_name, dept_id, CONCAT('$', FORMAT(salary, 2)) AS salary
FROM staff
WHERE salary IN
    (SELECT MAX(salary)
     FROM staff
     GROUP BY dept_id)
ORDER BY dept_id;
