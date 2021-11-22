/* ****************************************************************************/
/*										                                      */
/*										                                      */
/*	Pet-Database Create Tables												  */
/*										                                      */
/*										                                      */
/* ****************************************************************************/

USE pet;

DROP TABLE IF EXISTS pet_3;
DROP TABLE IF EXISTS pet;
DROP TABLE IF EXISTS breed;
DROP TABLE IF EXISTS pet_owner;

CREATE TABLE pet_owner(
    OwnerID INT NOT NULL AUTO_INCREMENT,
    OwnerLastName CHAR(25) NOT NULL,
    OwnerFirstName CHAR(25) NOT NULL,
    OwnerPhone CHAR(12) NULL,
    OwnerEmail VARCHAR(100) NULL,
    CONSTRAINT OWNER_PK PRIMARY KEY (OwnerID)
);

	CREATE TABLE breed(
    BreedName VARCHAR(100) NOT NULL,
    MinWeight NUMERIC(4 , 1 ) NULL,
    MaxWeight NUMERIC(4 , 1 ) NULL,
    AverageLifeExpectancy NUMERIC(4 , 1 ) NULL,
    CONSTRAINT BREED_PK PRIMARY KEY (BreedName)
);

CREATE TABLE pet (
    PetID INT AUTO_INCREMENT NOT NULL,
    PetName CHAR(50) NOT NULL,
    PetType CHAR(25) NOT NULL,
    PetBreed VARCHAR(100) NULL,
    PetDOB DATE NULL,
    OwnerID INT NOT NULL,
    CONSTRAINT PET_PK PRIMARY KEY (PetID),
    CONSTRAINT PET_OWNER_FK FOREIGN KEY (OwnerID)
        REFERENCES PET_OWNER (OwnerID)
        ON DELETE CASCADE
);

CREATE TABLE pet_3 (
    PetID INT AUTO_INCREMENT NOT NULL,
    PetName CHAR(50) NOT NULL,
    PetType CHAR(25) NOT NULL,
    PetBreed VARCHAR(100) NULL,
    PetDOB DATE NULL,
    PetWeight NUMERIC(4 , 1 ) NULL,
    OwnerID INT NOT NULL,
    CONSTRAINT PET_3_PK PRIMARY KEY (PetID),
    CONSTRAINT PET_3_OWNER_FK FOREIGN KEY (OwnerID)
        REFERENCES PET_OWNER (OwnerID)
        ON DELETE CASCADE
);

ALTER TABLE pet
	ADD CONSTRAINT PET_BREED_FK FOREIGN KEY(PetBreed)
		REFERENCES breed(BreedName)
		ON UPDATE CASCADE;

ALTER TABLE PET_3
	ADD CONSTRAINT PET_3_BREED_FK FOREIGN KEY(PetBreed)
		REFERENCES breed(BreedName)
		ON UPDATE CASCADE; 

