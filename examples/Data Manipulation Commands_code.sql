/* SQL Examples: Data Manipulation Commands_examples

Example 1: Enter the following row of data into the Department table using the following SQL insert 
commands:
*/
INSERT INTO department (dname, dnumber, mgrssn,mgrstartdate)    
VALUES ('Human Resources', 10, 222222201, '1970/1/1');

SELECT * 
FROM department;

/* Example 2: Enter the following corresponding rows of data into the EMPLOYEE table using the 
following SQL insert commands:
*/
INSERT INTO employee
VALUES ('Jason','S', 'Dan','534111102', '1970/1/1','2323 Foster city CA','M', 50000,'111111100', 9);

SELECT fname, lname 
FROM employee 
WHERE dno = 9;

/* Example 3: The following SQL statement will insert a new row.*/
INSERT INTO project(pname, pnumber, plocation, dnum)
VALUES ('Producttype', 100, 'Houston', 6);

SELECT *  
FROM project 
WHERE dnum = 6;

/* Example 4: This is a single statement with one semicolon at the end, and the separate row expressions are separated by commas..*/
INSERT INTO employee 
VALUES ('James','b','Borg','888665557','1927/11/10','450 Stone, Houston, TX','M',55000,NULL,NULL)
       ,('Alex', 'l', 'Freed','444444406','1950/10/09','4333 Pillsbury, Milwaukee, WI','M',89000,NULL,NULL)
       ,('John', 'M', 'James','555555509','1975/6/30','7676 Bloomington ,Sacramento, CA','M',81000,NULL,NULL);

/* Example 5: : Create a separate table in which the name, SSN, and telephone number of each employee in department number 8 are recorded. */
CREATE TABLE ssn_employee (
fname VARCHAR(15) NOT NULL,
lname VARCHAR(15) NOT NULL,
ssn CHAR(9),
PRIMARY KEY (ssn))ENGINE=INNODB;

INSERT INTO ssn_employee (fname ,lname ,ssn)
SELECT fname ,lname ,ssn 
FROM employee
WHERE dnumber = 8;

/* After this INSERT statement, the contents of the new table look like this*/
SELECT * 
FROM ssn_employee;

/* Example 7: We can use the following SQL syntax. In that case, we want to update the other columns.*/
INSERT INTO department 
VALUES('InfoSystems', 9, '123456789','1990-8-18')
ON DUPLICATE KEY UPDATE
dname  = 'Information System';

SELECT * 
FROM department;

/* Example 8: If you want to increase the salary of each employee in the sales department by 10%. You 
would type: */
SELECT salary
FROM employee 
WHERE dno = 9;

UPDATE employee
SET SALARY = SALARY * 1.10
WHERE dno = 9;

SELECT salary
FROM employee 
WHERE dno = 9;

/* Example 9: Enter the following SQL UPDATE command to update the salary for a specific employee.
mysql> UPDATE employee */
UPDATE employee
SET SALARY = 10000
WHERE ssn = 111111100;

SELECT ssn, salary
FROM employee;

/* Example 10: Remove the employee whose SSN is ‘11111110'.*/
DELETE FROM employee 
WHERE ssn = '11111110';

/* Example 11: Delete all rows from the DEPENDENT table.*/
DELETE 
FROM dependent;

SELECT * 
FROM dependent;

/* Example 12:  Write an SQL statement to add three new rows to the PET_OWNER table. 
Assume that OwnerID is a surrogate key and that the DBMS will provide a value for it. Assume, 
however, that you have only LastName, FirstName, and Phone and that therefore Email is NULL.
*/

INSERT INTO pet_owner (OwnerLastName, OwnerFirstName, OwnerPhone)
 VALUES ('Mayberry', 'Jenny','555-454-1243');
INSERT INTO pet_owner (OwnerLastName, OwnerFirstName, OwnerPhone)
 VALUES ('Roberts', 'Ken','555-454-2354');
INSERT INTO pet_owner (OwnerLastName, OwnerFirstName, OwnerPhone)
 VALUES ('Taylor', 'Sam','555-454-3365');

/* Example 13: Write an SQL statement to change the value of Std. Poodle in BreedName of PET_3 to 
Poodle, Std.
 */
/* show current contents of tables 	*/
SELECT * 
FROM BREED;

SELECT * 
FROM pet_3;

UPDATE breed
SET BreedName = 'Poodle, Std.'
WHERE BreedName = 'Std. Poodle';

/* Show revised contents of tables  */
SELECT *
FROM breed;
SELECT * 
FROM PET_3;

/* Example 14: Write an SQL statement to add a PetWeight column like the one in PET_3 to the PET 
table, given that this column is NULL. Again, assume that PetWeight is Numeric(4,1).
 */
ALTER TABLE pet
ADD PetWeight DECIMAL(4,1) NULL;

SELECT * 
FROM pet;

/* Example 15:  Write an SQL statement to delete all rows of pets of type Anteater.  .  */
DELETE
FROM pet
WHERE PetType = 'Anteater';

/* Example 16: Write SQL statements to insert data into the PetWeight column.  */
SELECT PetID, PetWeight
FROM pet_3;

UPDATE pet
SET PetWeight = 25.5
WHERE PetID = 1;
UPDATE pet
SET PetWeight = 10.5
WHERE PetID = 2;
UPDATE pet
SET PetWeight = 28.5
WHERE PetID = 3;
UPDATE pet
SET PetWeight = 20.0
WHERE PetID = 4;
UPDATE pet
SET PetWeight = 9.5
WHERE PetID = 5;
UPDATE pet
SET PetWeight = 9.5
WHERE PetID = 6;
UPDATE pet
SET PetWeight = 25.0
WHERE PetID = 7;

SELECT * 
FROM pet;

/* Example 17: Write SQL statements to add a PetWeight column like the one in PET_3 to the PET 
table, given that this column is NOT NULL. Again, assume that PetWeight is Numeric(4,1).
 */
ALTER TABLE pet 
MODIFY COLUMN PetWeight Decimal(4,1) NOT NULL;