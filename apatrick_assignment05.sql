/*  Assignment05.sql 
    Andrew Patrick
    CS 150A, Fall 2021 */
    
USE restaurant;

/* Question 01 : Create the computer and computer_staff tables,
   drop any existing versions of the tables first. */

DROP TABLE IF EXISTS computer_staff;
DROP TABLE IF EXISTS computer;

CREATE TABLE computer (
    serial_number INT NOT NULL,
    make VARCHAR(10) NOT NULL,
    model VARCHAR(25) NOT NULL,
    process_type VARCHAR(20) NOT NULL,
    speed DECIMAL(3,2) NOT NULL,
    main_memory VARCHAR(14) NOT NULL,
    disk_size VARCHAR(14) NOT NULL
);

CREATE TABLE computer_staff (
    serial_number INT NOT NULL,
    staff_id DECIMAL(5,0) NOT NULL,
    date_assigned DATE NOT NULL
);


/* Question 02 : Specify the primary key constraints. */
   
ALTER TABLE computer
    ADD PRIMARY KEY (serial_number);
    
ALTER TABLE computer_staff
    ADD PRIMARY KEY (staff_id);
    
    
/* Question 03 : Code the specified foreign key constraints on 
   the two new tables. */
   
ALTER TABLE computer_staff
    ADD CONSTRAINT computer_staff_fk_computer
        FOREIGN KEY (serial_number)
        REFERENCES computer (serial_number)
        ON DELETE CASCADE;
        
ALTER TABLE computer_staff
    ADD CONSTRAINT computer_staff_fk_staff
        FOREIGN KEY (staff_id)
        REFERENCES staff (staff_id);


/* Question 04 : Run the provided script to populate the tables. */

\. c:/150a/insert_data_computer.sql


/* Question 05 : Execute SELECT * statements to verify input. */

SELECT * FROM computer;
SELECT * FROM computer_staff;


/* Question 06 : Display serial number and model of all computers. */

SELECT serial_number, model
FROM computer
ORDER BY serial_number;


