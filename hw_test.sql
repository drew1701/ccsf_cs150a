use restaurant;

SELECT order_number, order_date, customer_id, first_name, last_name
FROM orders
JOIN customers ON cust_id = customer_id
ORDER BY order_number;

SELECT order_number, customer_id, first_name, last_name
FROM orders
JOIN customers ON cust_id = customer_id
    AND order_date = '2020-04-24'
ORDER BY order_number;

SELECT o.order_number, o.order_date, ol.item_number, ol.quantity, fi.price
FROM orders o
JOIN order_lines ol ON o.order_number = ol.order_number
JOIN food_items fi ON ol.item_number = fi.item_number
ORDER BY order_number, item_number;

SELECT o.order_number, o.order_date, ol.item_number, fi.description
FROM orders o
JOIN order_lines ol ON o.order_number = ol.order_number
JOIN food_items fi ON ol.item_number = fi.item_number
ORDER BY category_id, order_number;

SELECT o.order_number, o.order_date
FROM orders o
JOIN order_lines ol ON o.order_number = ol.order_number
JOIN food_items fi ON ol.item_number = fi.item_number
WHERE fi.description = 'Chicken Sandwich';

SELECT DISTINCT o.order_number, o.order_date
FROM orders o
JOIN order_lines ol ON o.order_number = ol.order_number
JOIN food_items fi ON ol.item_number = fi.item_number
JOIN customers c ON o.cust_id = c.customer_id
WHERE c.first_name = 'Philip'
    AND c.last_name = 'Dennis'
    AND fi.description != 'Shack Burger';

INSERT INTO   staff(staff_id, first_name, last_name, email,  birthdate , salary, overtime_rate, training, job_id, manager_id, dept_id, hire_date) 
VALUES (999, 'Foo', 'Bar', 'foo@bar.it', STR_TO_DATE('1988-07-14', '%Y-%m-%d'), 3437, 2, 'Record Keeping', 'S_ACCOUNT', 200, NULL, STR_TO_DATE('2002-06-17', '%Y-%m-%d'));

SELECT first_name, last_name, department_id
FROM staff
LEFT JOIN departments ON dept_id = department_id
ORDER BY department_id, first_name;

SELECT description, shift_assign_date
FROM shifts
LEFT JOIN shift_assignments USING (code)
ORDER BY description DESC;

SELECT customer_id, last_name, order_date
FROM customers
LEFT JOIN orders ON customer_id = cust_id;

SELECT last_name, dept_id, department_name
FROM staff
LEFT JOIN departments ON dept_id = department_id
ORDER BY last_name;

select products;

SELECT p.pnumber, p.pname, COUNT(*)
FROM project p
JOIN works_on a ON p.pnumber = a.pno
JOIN employee e ON (e.ssn = a.essn)
WHERE p.dnum = 5
GROUP BY p.pnumber, p.pname;

SELECT MIN(salary)      
FROM staff
WHERE dept_id IN (30, 60);

SELECT MIN(salary) AS 'lowest salary',
       MIN(last_name) AS 'alphabetically first',
       MAX(last_name) AS 'alphabetically last'
FROM staff
WHERE dept_id IN (30, 60);

select * from staff;

SELECT MAX(hire_date) AS 'Most Recent Hire Date'
FROM staff;

SELECT CONCAT_WS(' ', first_name, last_name) AS 'Employee Name',
       salary AS Salary
FROM staff
WHERE last_name LIKE "%ar%"
ORDER BY salary;

SELECT item_number, UPPER(description) AS item_desc
FROM food_items
ORDER BY item_number;

SELECT order_number, customer_id, first_name, last_name, order_date,
       DATE_ADD(order_date, INTERVAL 20 DAY) AS promotion_date
FROM orders
JOIN customers ON cust_id = customer_id
ORDER BY order_number;

SELECT last_name, DATE_FORMAT(birthdate, '%W %M %d %Y') AS Birthday
FROM staff
ORDER BY last_name;

SELECT first_name, last_name,
       CONCAT('$', FORMAT(salary, 2)) AS 'Current Salary',
       CONCAT('$', FORMAT(salary + 2000, 2)) AS 'New Salary'       
FROM staff
WHERE first_name = 'Layla' AND last_name = 'Justin';

SELECT CONCAT_WS(' ', first_name, last_name) AS Name,
       MONTH(hire_date) AS 'AnniversaryMonth'
FROM staff
ORDER BY month(hire_date), first_name;

SELECT item_number, SUM(quantity) AS NumOrders
FROM order_lines  
GROUP BY item_number
ORDER BY NumOrders DESC;

SELECT staff_id, CONCAT('$', salary) AS 'monthly salary'
FROM staff
WHERE salary BETWEEN 700 AND 3000
ORDER BY staff_id;

use residencehalls;

SELECT first_name AS 'First Name', last_name AS 'Last Name'
FROM owners
WHERE owner_num IN
    (SELECT owner_num
     FROM property
     WHERE bdrms = 2);
     
SELECT first_name, last_name
FROM owners
WHERE EXISTS
    (SELECT *
     FROM property
     WHERE owner_num = owners.owner_num AND bdrms = 2);
     
SELECT sqr_ft, owner_num, last_name, first_name
FROM property p
WHERE owner_num =
    (SELECT owner_num
     FROM owners o
     WHERE o.owner_num = p.owner_num)
AND office_num =
    (SELECT office_num
     FROM office
     WHERE office_num = 1);
     
WITH summary AS
(
    SELECT sqr_ft, p.owner_num, last_name, first_name
    FROM property p JOIN owners o
        ON p.owner_num = o.owner_num
)
SELECT summary.sqr_ft, summary.owner_num, summary.last_name,
       summary.first_name
FROM summary
WHERE office_num =
    (SELECT office_num
     FROM property
     WHERE office_num = 1);
     
WITH summary AS
(
    SELECT office_num, sqr_ft, p.owner_num, last_name, first_name
    FROM property p JOIN owners o
        ON p.owner_num = o.owner_num
	WHERE office_num = 1
)
SELECT summary.sqr_ft, summary.owner_num, summary.last_name,
       summary.first_name
FROM summary;     
     
SELECT sqr_ft, owner_num, last_name, first_name
FROM
(
    SELECT office_num, sqr_ft, p.owner_num, last_name, first_name
    FROM property p JOIN owners o
        ON p.owner_num = o.owner_num
    WHERE office_num = 1
) t
ORDER BY sqr_ft;     

SELECT last_name, first_name, salary
FROM staff
WHERE salary >
    (SELECT salary
     FROM staff
     WHERE staff_id = 125)
ORDER BY last_name;

SELECT first_name, last_name, job_id
FROM staff
WHERE job_id <>
    (SELECT job_id
     FROM staff
     WHERE first_name = 'Nicolas' AND last_name = 'Patrick')
ORDER BY first_name;

SELECT first_name, last_name
FROM staff
WHERE dept_id =
    (SELECT department_id
     FROM departments
     WHERE department_name = 'IT')
ORDER BY first_name;

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

SELECT DISTINCT job_id, dept_id
FROM staff
WHERE salary > ALL
    (SELECT salary
     FROM staff
     WHERE job_id = 'S_Cook')
ORDER BY dept_id;
     

SELECT dept_id, ROUND(AVG(salary), 2) AS Average
FROM staff
GROUP BY dept_id
HAVING AVG(salary) >
    (SELECT salary
     FROM staff
     WHERE first_name = 'Baylor' AND last_name = 'Collin')
ORDER BY dept_id;

SELECT dept_id, MIN(salary) AS 'minimum salary'
FROM staff
GROUP BY dept_id
HAVING MIN(salary) > ANY
    (SELECT salary
     FROM staff
     WHERE dept_id <> 50)
ORDER BY dept_id;

/* fix this code
SELECT dept_id, MIN(salary) As "minimum salary"
FROM staff
WHERE MIN(salary)
HAVING MIN(salary) >
GROUP BY dept_id
SELECT MIN(salary)
WHERE dept_id < 30; */

-- my fix
SELECT dept_id, MIN(salary) As "minimum salary"
FROM staff
GROUP BY dept_id
HAVING MIN(salary) <
    (SELECT MIN(salary)
     FROM staff 
     WHERE dept_id = 30
     GROUP BY dept_id);

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

SELECT customer_id, first_name, last_name
FROM customers
WHERE customer_id IN
    (SELECT cust_id
     FROM orders
     WHERE order_date = '2020-05-09')
ORDER BY customer_id;

SELECT order_number, order_date
FROM orders
WHERE cust_id IN
    (SELECT customer_id
     FROM customers
     WHERE first_name = 'Evita' AND last_name = 'Hodcroft')
ORDER BY order_number;


SELECT last_name, dept_id, CONCAT('$', FORMAT(salary, 2)) AS salary
FROM staff
WHERE salary IN
    (SELECT MAX(salary)
     FROM staff
     GROUP BY dept_id)
ORDER BY dept_id;


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


DROP TABLE IF EXISTS my_departments;
CREATE TABLE my_departments(
    department_id DECIMAL(4,0),
    department_name VARCHAR(30) NOT NULL,
    manager_id DECIMAL(6,0)
);
INSERT INTO my_departments
SELECT *
FROM departments;
ALTER TABLE my_departments
ADD PRIMARY KEY (department_id);


CREATE OR REPLACE VIEW view_my_departments
AS SELECT department_id, department_name
   FROM my_departments;
INSERT INTO view_my_departments(department_id, department_name)
VALUES
    (105, 'Advertising'),
    (120, 'Custodial'),
    (130, 'Planning');
INSERT INTO view_my_departments
VALUES (220, 'Human Resources');


CREATE OR REPLACE VIEW item_ordered AS
SELECT ol.item_number, fi.description, fi.price price_each,
       ol.order_number, o.order_date, ol.quantity,
       fi.price * ol.quantity quoted_price
FROM order_lines ol  
    JOIN food_items fi 
        ON ol.item_number = fi.item_number
    JOIN orders o
        ON ol.order_number = o.order_number;
Select * from item_ordered;

SELECT item_number, description, order_number, quoted_price
FROM item_ordered
WHERE price_each > 5
ORDER BY item_number, order_number;


CREATE OR REPLACE VIEW salary_view AS
SELECT MAX(salary) highest_salary,
       MIN(salary) lowest_salary,
       ROUND(AVG(salary), 2) average_salary,
       (SELECT department_name FROM departments
        WHERE dept_id = department_id) department_name
FROM staff
-- WHERE dept_id IS NOT NULL
GROUP BY dept_id;
Select * from salary_view order by department_name;


CREATE VIEW dept_managers_view AS
SELECT 
    (SELECT department_name
     FROM departments
     WHERE dept_id = department_id) department_name,
    LEFT(first_name, 1) mgr_intial,
    last_name surname
FROM staff
GROUP BY dept_id;
select * from dept_managers_view;

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



