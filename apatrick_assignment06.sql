/*  Assignment06.sql 
    Andrew Patrick
    CS 150A, Fall 2021 */
    
USE restaurant;

/* Question 01 : Run Describe on orders. Add default of today's 
   date to order_date. Run Describe on orders to verify. */

DESCRIBE orders;

ALTER TABLE orders
    MODIFY order_date DATE NOT NULL
    DEFAULT (CURRENT_DATE());
        
DESCRIBE orders;


/* Question 02 : Run Describe on customers. Add customers_phone with 
   NULL allowed and 11 digits. Run Describe on customers to verify. */
   
DESCRIBE customers;

ALTER TABLE customers
    ADD customers_phone VARCHAR(11);

DESCRIBE customers;


/* Question 03 : Run Describe on customers. Drop customers_phone.
   Run Describe on customers to verify. */
   
DESCRIBE customers;

ALTER TABLE customers
    DROP customers_phone;

DESCRIBE customers;


/* Question 04 : Write the INSERT to add the specified row into 
   the customers table. */
   
INSERT INTO customers
    VALUES (60, 'brian', 'rogers', '820 Bounty Drive', 'Palo Alto',
            'CA', 94342, '01654564898''');
            
   