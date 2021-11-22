/*  Assignment08.sql 
    Andrew Patrick
    CS 150A, Fall 2021 */
    
USE restaurant;

/* Question 01 : Write a SELECT statement that finds the average salary
   for (IFR) employees whose manager ID is 200. */

SELECT AVG(salary) AS Average
FROM staff
WHERE manager_id = 200;


/* Question 02 : Write a SELECT statement that finds the lowest salary,
   the last name who is first in an alphabetical list of employees, and
   the last name who is last of an alphabetical list of employees.
   Select only employees who are in departments 30 or 60. */

SELECT MIN(salary) AS 'Lowest Salary',
       MIN(last_name) AS 'Alphabetically First',
       MAX(last_name) AS 'Alphabetically Last'
FROM staff
WHERE dept_id IN (30, 60);


/* Question 03 : Write a SELECT statement that shows the most recent
   hire date of any IFR employee. */

SELECT MAX(hire_date) AS 'Most Recent Hire Date'
FROM staff;


/* Question 04 : Write a SQL statement that creates a list including
   each employee's first name concatenated to a space as well as the
   employee's last name, and the salary of all employees whose last name
   contains the string 'ar'. */

SELECT CONCAT_WS(' ', first_name, last_name) AS 'Employee Name',
       salary AS Salary
FROM staff
WHERE last_name LIKE "%ar%"
ORDER BY salary;


/* Question 05 : Write a SQL statement that lists the item number and
   item description for all items. The item descriptions should appear
   in uppercase letters. */

SELECT item_number, UPPER(description) AS item_desc
FROM food_items
ORDER BY item_number;


/* Question 06 : IFR is running a promotion that is valid for up to 20
   days after an order is placed. Write a SQL statement that lists the
   order ID, customer ID, first name, and last name. The promotion date
   is 20 days after the order was placed. */

SELECT order_number, customer_id, first_name, last_name, order_date,
       DATE_ADD(order_date, INTERVAL 20 DAY) AS promotion_date
FROM orders
JOIN customers ON cust_id = customer_id
ORDER BY order_number;


/* Question 07 : List the last names and birthdays of IFR employees.
   Convert the birth dates to character data. */

SELECT last_name, DATE_FORMAT(birthdate, '%W %M %d %Y') AS Birthday
FROM staff
ORDER BY last_name;


/* Question 08 : Layla Justin is an employee who has received a $2,000
   raise. Display their first name, last name, current salary, and new
   salary. Display both salaries with a $ and two decimal places. Label
   the new salary column AS New Salary. */

SELECT first_name, last_name,
       CONCAT('$', FORMAT(salary, 2)) AS 'Current Salary',
       CONCAT('$', FORMAT(salary + 2000, 2)) AS 'New Salary'       
FROM staff
WHERE first_name = 'Layla' AND last_name = 'Justin';


/* Question 09 : Create a report listing the first and last names and
   numeric month of hire for all employees in the staff table. */

SELECT CONCAT_WS(' ', first_name, last_name) AS Name,
       MONTH(hire_date) AS 'Anniversary Month'
FROM staff
ORDER BY MONTH(hire_date), first_name;


/* Question 10 : Write a SELECT statement that displays the item number
   and the number of orders placed for each item. Show the results in
   decreasing order and label result column NumOrder. */

SELECT item_number, SUM(quantity) AS NumOrders
FROM order_lines  
GROUP BY item_number
ORDER BY NumOrders DESC, item_number DESC;


/* Question 11 : Write a SQL statement that creates a list of monthly
   salaries from the staff table where the salary is between $700 and
   $3,000. The salaries should be formatted to include a $-sign and
   have two decimal points like: $9999.99. */

SELECT staff_id, CONCAT('$', salary) AS 'monthly salary'
FROM staff
WHERE salary BETWEEN 700 AND 3000
ORDER BY staff_id;
