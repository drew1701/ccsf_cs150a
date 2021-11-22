/*  Assignment10.sql 
    Andrew Patrick
    CS 150A, Fall 2021 */
    
USE restaurant;

/* Question 01 : Construct an inline view that lists the last name,
salary, department ID, and maximum salary for each department. */

SELECT s.last_name 'Last Name',
    CONCAT('$', FORMAT(s.salary, 0)) 'Salary',
    s.dept_id 'Dept ID',
    CONCAT('$', FORMAT(d.maxsalary, 0)) 'Dept Max Salary'
FROM staff s,
    (SELECT dept_id, MAX(salary) maxsalary
     FROM staff
     GROUP BY dept_id) d 
WHERE s.dept_id = d.dept_id
ORDER BY last_name;


/* Question 02 : Create a new table called my_departments and add all
columns & all rows to it using a subquery from the departments table. */

-- 02.A Create empty copy of departments table, drop if exists
DROP TABLE IF EXISTS my_departments;
CREATE TABLE my_departments(
    department_id DECIMAL(4,0),
    department_name VARCHAR(30) NOT NULL,
    manager_id DECIMAL(6,0)
);

-- 02.B Add all columns/rows using subquery in Insert
INSERT INTO my_departments
SELECT *
FROM departments;

-- 02.C Do a SELECT statement to confirm column/row data 
SELECT * FROM my_departments;

-- 02.D Enable department_id as primary key
ALTER TABLE my_departments
ADD PRIMARY KEY (department_id);


/* Question 03 : Create a view called view_my_departments that
includes: department_id and department_name. */

-- 03.A Create view of my_departments
CREATE OR REPLACE VIEW view_my_departments AS
SELECT department_id, department_name
FROM my_departments;
    
-- 03.B Add supplied data to my_departments using view_my_departments
INSERT INTO view_my_departments
VALUES
    (105, 'Advertising'),
    (120, 'Custodial'),
    (130, 'Planning');
    

/* Question 04 : Add the Human Resources dept, department_id 220
to my_departments using view_my_departments. */

-- 04.A Add HR Dept
INSERT INTO view_my_departments
VALUES (220, 'Human Resources');

-- 04.B Verify new additions using view_my_departments
SELECT * FROM view_my_departments;


/* Question 05 : Create a view named item_ordered. It consists of the
food item number, item description, price, order number, order date,
quantity, and price for all ordered food items currently on file.
Write and execute the command to create the item_ordered view. */

CREATE OR REPLACE VIEW item_ordered AS
SELECT ol.item_number, fi.description, fi.price price_each,
       ol.order_number, o.order_date, ol.quantity,
       fi.price * ol.quantity quoted_price
FROM order_lines ol  
    JOIN food_items fi 
        ON ol.item_number = fi.item_number
    JOIN orders o
        ON ol.order_number = o.order_number;


/* Question 06 : Write/ execute the command to retrieve the item_number,
description, order number, and quoted price for all orders in the
item_ordered view for food items with prices that exceed $5. */

SELECT item_number, description, order_number, quoted_price
FROM item_ordered
WHERE price_each > 5
ORDER BY item_number, order_number;


/* Question 07 : Create a view named salary_view that returns the
highest salary, lowest salary, average salary, and department name. */

CREATE OR REPLACE VIEW salary_view AS
SELECT MAX(salary) highest_salary,
       MIN(salary) lowest_salary,
       ROUND(AVG(salary), 2) average_salary,
       (SELECT department_name
        FROM departments
        WHERE dept_id = department_id) department_name
FROM staff
WHERE dept_id IS NOT NULL
GROUP BY dept_id;


/* Question 08 : Create a view named dept_managers_view that returns a
listing of department names along with the manager initial and surname
for that department. Test the view by returning all the rows from it.
Make sure no rows can be updated through the view. */

-- 08.A Create view dept_managers_view
CREATE OR REPLACE VIEW dept_managers_view AS
SELECT 
    (SELECT department_name
     FROM departments
     WHERE dept_id = department_id) department_name,
    (SELECT LEFT(first_name, 1)
     FROM staff
     WHERE s.manager_id = staff_id) mgr_intial,
    (SELECT last_name
     FROM staff
     WHERE s.manager_id = staff_id) mgr_surname
FROM staff s
GROUP BY dept_id;

-- 08.B Test view by returning all the rows
SELECT * FROM dept_managers_view;
