/* *****************************************************************************/
/*										                            	        */
/*											                                    */
/*  pet-Database Data								                            */
/*											                                    */
/* ******************************************************************************/

USE pet;

/* ****   PET_OWNER DATA   *****************************************************/

INSERT INTO pet_owner VALUES( 
    NULL,'Downs', 'Marsha', '555-537-8765', 'Marsha.Downs@somewhere.com');
INSERT INTO pet_owner VALUES(
    NULL,'James', 'Richard', '555-537-7654', 'Richard.James@somewhere.com');
INSERT INTO pet_owner VALUES( 
    NULL,'Frier', 'Liz', '555-537-6543', 'Liz.Frier@somewhere.com');
INSERT INTO pet_owner (OwnerID, OwnerLastName, OwnerFirstName, OwnerEmail) VALUES
    (NULL, 'Trent', 'Miles', 'Miles.Trent@somewhere.com');



/* ****   BREED DATA   ***********************************************************/

INSERT INTO breed VALUES('Std. Poodle', 22.5, 30.0, 18);
INSERT INTO breed VALUES('Cashmere', 10.0, 15.0, 12);
INSERT INTO breed VALUES('Collie Mix', 17.5, 25.0, 18);
INSERT INTO breed VALUES('Border Collie', 15.0, 22.5, 20);
INSERT INTO breed(BreedName) VALUES('Unknown');



/* ****   PET DATA   *************************************************************/

INSERT INTO pet VALUES(
    NULL,'King', 'Dog', 'Std. Poodle', '2011-02-27', 1);
    
INSERT INTO pet VALUES(
    NULL,'Teddy', 'Cat', 'Cashmere', '2012-02-01', 2);
INSERT INTO pet VALUES(
    NULL,'Fido', 'Dog', 'Std. Poodle', '2010-07-17', 1);
INSERT INTO pet VALUES(
    NULL,'AJ', 'Dog', 'Collie Mix', '2011-05-05', 3);
INSERT INTO pet VALUES(
    NULL,'Cedro', 'Cat', 'Unknown', '2009-06-06', 2);

INSERT INTO pet (PetID, PetName, PetType, PetBreed, OwnerID) VALUES(
	NULL, 'Wooley', 'Cat', 'Unknown', 2);

INSERT INTO pet VALUES(
    NULL,'Buster', 'Dog', 'Border Collie', '2008-12-11', 4);
    


/* ****   PET_3 DATA   ***********************************************************/

INSERT INTO pet_3 VALUES(
    NULL,'King', 'Dog', 'Std. Poodle', '2011-02-27', 25.5, 1);
    
INSERT INTO pet_3 VALUES(
    NULL,'Teddy', 'Cat', 'Cashmere', '2012-02-01', 10.5, 2);
INSERT INTO pet_3 VALUES(
    NULL,'Fido', 'Dog', 'Std. Poodle', '2010-07-17', 28.5, 1);
INSERT INTO pet_3 VALUES(
    NULL,'AJ', 'Dog', 'Collie Mix', '2011-05-05', 20.0, 3);
INSERT INTO pet_3 VALUES(
    NULL,'Cedro', 'Cat', 'Unknown', '2009-06-06', 9.5, 2);

INSERT INTO pet_3 (petID, PetName, PetType, PetBreed, PetWeight, OwnerID)
  VALUES(NULL, 'Wooley', 'Cat', 'Unknown', 9.5, 2);

INSERT INTO pet_3 VALUES(
    NULL,'Buster', 'Dog', 'Border Collie', '2008-12-11', 25.0, 4);
    