-- MySQL Snippets: Andrew Patrick

-- Windows Run command, enter in cmd prompt
cd C:\Program Files\MySQL\MySQL Server 8.0\bin
mysql -u root –p --force --comments –vvv
 "--force" "--comments" "-vvv" (if using shortcut)

-- Windows path to output file
"c:/users/drew/google drive/active/cs150a/my_scripts/apatrick_assignmentX.txt"
"c:\users\drew\google drive\active\cs150a\my_scripts\apatrick_assignmentX.txt"
c:/150a

-- Using tee command to create output file 
mysql> tee path-to/yourname_assignment1.txt

-- Run the assignment script
mysql> source path-to\yourname_assignment1.sql

-- End tee command
mysql> notee

/*  AssignmentXX.sql 
    Andrew Patrick
    CS 150A, Fall 2021 */
    
USE foo;

/* Question 0X : Description */

SELECT
FROM
WHERE
ORDER BY


-- Column-level constraint syntax:
column [CONSTRAINT constraint_name] constraint_type,

-- Table-level constraint syntax:
column,...
[CONSTRAINT constraint_name] constraint_type
(column, ...),

/* Order of Evaluation
A query is evaluated conceptually by first applying the FROM clause (to
identify all tables involved in the query), followed by the WHERE clause
to select and join tuples, and then
 GROUP BY and HAVING.
Followed by SELECT then ORDER BY.
*/

A WHERE clause cannot contain aggregate functions.
A HAVING clause can contain aggregate functions.

Syntax of a SELECT statement with GROUP BY:
SELECT *|columnlist
FROM tablelist
[WHERE search_condition]
[GROUP BY columnname, columnname...]
[HAVING group condition]
[ORDER BY order_by_list]




