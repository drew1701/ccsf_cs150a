/*  extra10.sql 
    Andrew Patrick
    CS 150A, Fall 2021 */
    
USE residencehalls;

/* Question 01 : List the first and last names of all owners who own a
two-bedroom property. Use the IN operator in your query. */

SELECT first_name, last_name
FROM owners
WHERE owner_num IN
    (SELECT owner_num
     FROM property
     WHERE bdrms = 2);
     
     
/* Question 02 : Repeat Exercise 1, but this time use the
EXISTS operator in your query. */

SELECT first_name, last_name
FROM owners
WHERE EXISTS
    (SELECT *
     FROM property
     WHERE owner_num = owners.owner_num AND bdrms = 2);
     
     
/* Question 03 : List the square footage, owner number, owner last, and
owner first name for each property managed by the Columbia City office. */

SELECT sqr_ft, owner_num, last_name, first_name
FROM
(
    SELECT office_num, sqr_ft, p.owner_num, last_name, first_name
    FROM property p JOIN owners o
        ON p.owner_num = o.owner_num
    WHERE office_num = 1
) t
ORDER BY sqr_ft;


/* Question 04 : List the office number, address, and rent for properties
whose owners live in Washington State or own two-bedroom properties. */

  
     
     
     
     
     
     