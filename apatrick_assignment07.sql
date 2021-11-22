/*  Assignment07.sql 
    Andrew Patrick
    CS 150A, Fall 2021 */
    
USE restaurant;

/* Question 01 : For each order, display the order ID and order date
   along with the customer ID, first name, and last name of the
   customer for which the order was created. */

SELECT order_number, order_date, customer_id, first_name, last_name
FROM orders
JOIN customers ON cust_id = customer_id
ORDER BY order_number;


/* Question 02 : For each order placed on 04/24/2020, write a SQL
   statement that lists the order number, customer ID, first name,
   and last name of the customer for which the order was created. */

SELECT order_number, customer_id, first_name, last_name
FROM orders
JOIN customers ON cust_id = customer_id
    AND order_date = '2020-04-24'
ORDER BY order_number;
    
    
/* Question 03 : For each order, list the item number, order date,
   order ID, quantity ordered, and price for each food item. */

SELECT o.order_number, o.order_date, ol.item_number, ol.quantity, fi.price
FROM orders o
JOIN order_lines ol ON o.order_number = ol.order_number
JOIN food_items fi ON ol.item_number = fi.item_number
ORDER BY order_number, item_number;


/* Question 04 : For each order, list the food item number, order date,
   order number, and description for each item. Order the rows by
   category and then by order number. */

SELECT o.order_number, o.order_date, ol.item_number, fi.description
FROM orders o
JOIN order_lines ol ON o.order_number = ol.order_number
JOIN food_items fi ON ol.item_number = fi.item_number
ORDER BY category_id, order_number;


/* Question 05 : List the order number and order date for each order that
   contains the food item description 'Chicken Sandwich'. */

SELECT o.order_number, o.order_date
FROM orders o
JOIN order_lines ol ON o.order_number = ol.order_number
JOIN food_items fi ON ol.item_number = fi.item_number
WHERE fi.description = 'Chicken Sandwich'
ORDER BY order_number;


/* Question 06 : List the order number and order date for each order 
   created for Philip Dennis but that does not contain the
   food item description 'Shack Burger'. */

SELECT DISTINCT o.order_number, o.order_date
FROM orders o
JOIN order_lines ol ON o.order_number = ol.order_number
JOIN food_items fi ON ol.item_number = fi.item_number
JOIN customers c ON o.cust_id = c.customer_id
WHERE c.first_name = 'Philip'
    AND c.last_name = 'Dennis'
    AND fi.description != 'Shack Burger'
ORDER BY order_number;
    

/* Question 08 : Return the first name, last name, and department name
   for all employees incl those not assigned to a department. */

SELECT first_name, last_name, department_id
FROM staff
LEFT JOIN departments ON dept_id = department_id
ORDER BY first_name;


/* Question 09 : Show all shift descriptions and shift assignment
   dates, even if no date assigned for each shift description. */

SELECT description, shift_assign_date
FROM shifts
LEFT JOIN shift_assignments USING (code)
ORDER BY description DESC;


/* Question 10 : Show customers and orders, a customer must be included
   even if the customer has had no orders. */

SELECT customer_id, last_name, order_date
FROM customers
LEFT JOIN orders ON customer_id = cust_id
ORDER BY customer_id, order_date;


/* Question 11 : Show all employee last names, department IDs, and
   department names, even if they are not assigned to a department. */

SELECT last_name, dept_id, department_name
FROM staff
LEFT JOIN departments ON dept_id = department_id
ORDER BY last_name;






