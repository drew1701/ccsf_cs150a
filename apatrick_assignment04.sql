/*  Assignment04.sql 
    Andrew Patrick
    CS 150A, Fall 2021 */
    
USE restaurant;

/* Question 01 : Write CREATE TABLE for global_locations,
   define constraints at column level */

-- 01.A Execute CREATE TABLE, use single statement
CREATE TABLE global_locations (
    id INT PRIMARY KEY,
    loc_name VARCHAR(20),
    address VARCHAR(20),
    city VARCHAR(20),
    zip_postal_code VARCHAR(20),
    phone VARCHAR(15),
    email VARCHAR(15) UNIQUE,
    manager_id INT,
    emergency_contact VARCHAR(20)
) ENGINE = INNODB;
    
-- 01.B Execute DESCRIBE
DESCRIBE global_locations;


/* Question 02 : RE-Write CREATE TABLE for global_locations,
   define UNIQUE at table level. Do Not Execute */

/* Do Not Execute this statement   
CREATE TABLE global_locations (
    id INT PRIMARY KEY,
    loc_name VARCHAR(20),
    address VARCHAR(20),
    city VARCHAR(20),
    zip_postal_code VARCHAR(20),
    phone VARCHAR(15),
    email VARCHAR(15),
    manager_id INT,
    emergency_contact VARCHAR(20),
    CONSTRAINT email_uk UNIQUE (email)
) ENGINE = INNODB;
*/


/* Question 03 : Alter global_locations to add date_opened column */

ALTER TABLE global_locations
ADD date_opened DATE;


/* Question 04 : Show column names & data types for global_locations */

DESCRIBE global_locations;


/* Question 05 : Delete date_opened column from global_locations */

ALTER TABLE global_locations
DROP date_opened;


/* Question 06 : Rename the global_locations table as 
   global_locations_backup */
   
RENAME TABLE global_locations TO global_locations_backup;


/* Question 07 : Write syntax to create animals table using 
   the supplied column information */
   
CREATE TABLE animals (
    animal_id INT,
    name VARCHAR(25),
    license_tag_number INT,
    admit_date DATE NOT NULL,
    adoption_id INT,
    vaccination_date DATE NOT NULL,
    CONSTRAINT animals_pk PRIMARY KEY (animal_id),
    CONSTRAINT license_tag_number_uk UNIQUE (license_tag_number)
) ENGINE = INNODB; 


/* Question 08 : Enter one row into the table.
   Execute a SELECT * to verify input. */
   
-- 08.A Enter one row
INSERT INTO animals(animal_id, name, license_tag_number, admit_date, adoption_id, vaccination_date)
VALUES (101, 'Spot', 35540, '2004-10-10', 205, '2004-10-12');

-- 08.B Execute SELECT * to verify input
SELECT * FROM animals;


/* Question 09 : Display names of the tables in your database. */

SHOW TABLES;


/* Question 10 : Remove the global_locations_backup table.
   Display names of the tables in your database. */
   
-- 10.A Remove _backup table 
DROP TABLE IF EXISTS global_locations_backup;

-- 10.B Display names of tables in your database 
SHOW TABLES;