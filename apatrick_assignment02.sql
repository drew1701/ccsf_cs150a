/*  Assignment2.sql 
    Andrew Patrick
    CS 150A, Fall 2021 */
    
USE restaurant;

/* Query 1 : List the food item number, description,
   and price for all food items. */

SELECT item_number, description, price
FROM food_items;


/* Query 2 : List all details of all items, order the
   output by food item number within price */

SELECT *
FROM food_items
ORDER BY price, item_number;


/* Query 3 : List all rows and columns of the orders table. */

SELECT *
FROM orders;


/* Query 4 : List the order number for each order placed by
   customer ID 30 on 07/03/2020. */

SELECT *
FROM orders
WHERE cust_id = 30 AND order_date = '2020-07-03';


/* Query 5 : Display the order number and date of all orders
   that were placed before 05/28/2020, use aliases. */

SELECT order_number AS "order number",
       order_date AS "order date"
FROM orders
WHERE order_date < '2020-05-28';


/* Query 6 : Display the unique customer IDs from the
   orders table for each customer who has placed an
   order with the restaurant. */

SELECT DISTINCT cust_id
FROM orders;


/* Query 7 : Returns all customer’s last names and addresses. */

SELECT last_name, address, city, state, zip
FROM customers;


/* Query 8 : Display the customer ID, first name, last name,
   and phone number of each customer. */

SELECT customer_id, first_name, last_name, phone_number
FROM customers;


/* Query 9 : Display the customer ID, first name, and last
   name for all customers who live in San Francisco. */

SELECT customer_id, first_name, last_name
FROM customers
WHERE city = "San Francisco";


/* Query 10 : Display the last name, first name, ID,
   and phone number from the customers table
   where customer_id is 36. */

SELECT last_name, first_name, customer_id, phone_number
FROM customers
WHERE customer_id = 36;