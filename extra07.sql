/*  extra07.sql 
    Andrew Patrick
    CS 150A, Fall 2021 */
    
USE residencehalls;

/* Question 01 : For all property, list mngmnt office number, address,
   monthly rent, owner number, owner’s first & last name */

SELECT p.office_num, p.address, p.monthly_rent, p.owner_num,
       o.last_name, o.first_name
FROM property p
INNER JOIN owners o ON p.owner_num = o.owner_num;


/* Question 02 : For all service request, list property ID, management
   office number, address, estimated hours, spent hours, owner number,
   and owner’s last name */

SELECT sr.property_id, sr.office_id, p.address, sr.est_hours,
       sr.spent_hours, o.owner_num, o.last_name
FROM service_request sr
INNER JOIN property p ON sr.property_id = p.property_id;
INNER JOIN owners o ON p.owner_num = o.owner_num;


/* Question 03 : List the property IDs of any pair of properties
   that have the same number of bedrooms. */

SELECT p1.property_id, p2.property_id
FROM property p1 JOIN property p2
    ON p1.bdrms = p2.bdrms
    AND p1.property_id != p2.property_id
ORDER BY p1.property_id, p2.property_id;


/* Question 04 : List address, sq footage, owner number, service ID,
   estimated hours, and spent hours for each service request where 
   category number is 4. */

SELECT p.address, p.sqr_ft, p.owner_num, 
       sr.service_id, sr.est_hours, sr.spent_hours
FROM service_request sr
INNER JOIN property p ON sr.property_id = p.property_id
WHERE sr.category_number = 4;


/* Question 05 : Repeat Query 4, but this time be sure each property
   is included regardless of whether the property currently has any
   service requests for category 4. */

SELECT p.address, p.sqr_ft, p.owner_num, 
       sr.service_id, sr.est_hours, sr.spent_hours
FROM service_request sr
INNER JOIN property p ON sr.property_id = p.property_id;
