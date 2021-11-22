/*  Assignment03.sql 
    Andrew Patrick
    CS 150A, Fall 2021 */
    
USE restaurant;

/* Query 01 : List the food item number & description of all food
   items starting with 's'. use column alias */

SELECT item_number AS 'item id',
       description AS 'item name'
FROM food_items
WHERE description LIKE "s%";


/* Query 02 : Use IN operator to list food item number and description
   of items where desc is Hamburger or Chicken McNuggets. */

SELECT item_number, description
FROM food_items
WHERE description IN ('hamburger','Chicken McNuggets');


/* Query 03 : Show item_number, price and description for all food
   items where p is 2nd letter and c is 4th. Sort by
   item_number descending. */

SELECT item_number, description, price
FROM food_items
WHERE description LIKE "_p_c%"
ORDER BY item_number DESC;


/* Query 04 : List item_number and description of each food item
   that is not in item number 81. */

SELECT item_number, description
FROM food_items
WHERE item_number != 81;


/* Query 05 : List food item number and description of all food items
   that are in item_number 82,83 and description contains
   the word 'chicken' */

SELECT item_number, description
FROM food_items
WHERE item_number IN (82, 83) 
      AND description LIKE "%chicken%";


/* Query 06 : Display the first name, last name, salary of all 
   restaurant staff where salary between 1k & 3k monthly */

SELECT first_name, last_name, salary
FROM staff
WHERE salary BETWEEN 1000 AND 3000;


/* Query 07 : List last name of staff who have e and n in last name. */

SELECT last_name
FROM staff
WHERE last_name LIKE "%e%" AND last_name LIKE "%n%";


/* Query 08 : Show last name of staff where salary is over 4k
   and job_ID is not s_mgr. */

SELECT last_name
FROM staff
WHERE salary > 4000 AND job_id != 's_mgr';


/* Query 09 : Display staff last names where name starts with R 
   and containes both a and e. */

SELECT last_name
FROM staff
WHERE last_name LIKE "r%"
      AND last_name LIKE "%a%"
      AND last_name LIKE "%e%";


/* Query 10 : Show first name, last name, salary for staff where 
   first name starts with s and salary is not 3400, 3000, or 6000. */

SELECT first_name, last_name, salary
FROM staff
WHERE salary NOT IN (3000, 3400, 6000)
      AND first_name LIKE "s%";


/* Query 11 : List customer's last name, first name, customer number 
   where customer number is between 15 and 25. */

SELECT last_name, first_name, customer_id
FROM customers
WHERE customer_id BETWEEN 15 AND 25;
