/*  extracredit05.sql 
    Andrew Patrick
    CS 150A, Fall 2021 */
    
USE residencehalls;
DROP TABLE IF EXISTS large_property;

-- Bullet 01
CREATE TABLE large_property (
    office_num INTEGER NOT NULL,
    address VARCHAR(100) NOT NULL,
    bdrms INTEGER,
    floors INTEGER NOT NULL,
    monthly_rent INTEGER,
    owner_num CHAR(5) NOT NULL
);


-- Bullet 02
INSERT INTO large_property
SELECT office_num, address, bdrms, floors, monthly_rent, owner_num
FROM property
WHERE sqr_ft > 1500;


-- Bullet 03
UPDATE large_property
SET monthly_rent = monthly_rent + 150
WHERE monthly_rent > 0;


-- Bullet 04
UPDATE large_property
SET monthly_rent = monthly_rent * .99
WHERE monthly_rent > 1750;


-- Bullet 05
INSERT INTO large_property
VALUES (1, '2643 lugsi dr.', 3, 2, 775, 'ma111');


-- Bullet 06
DELETE FROM large_property
WHERE owner_num = 'bi109';


-- Bullet 07
UPDATE large_property
SET bdrms = NULL
WHERE address = '105 north illinois rd.';


-- Bullet 08
ALTER TABLE large_property
ADD occupied CHAR(1);

UPDATE large_property
SET occupied = 'y';


-- Bullet 09
UPDATE large_property
SET occupied = 'n'
WHERE owner_num = 'ko104';


-- Bullet 10
ALTER TABLE large_property
MODIFY monthly_rent INTEGER NOT NULL;


-- Bullet 11
DROP TABLE IF EXISTS large_property;
