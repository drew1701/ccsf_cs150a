/* SQL Examples: MySQL TRIGGER */

/* Example 1 */
CREATE TABLE account (acct_num INT, amount DECIMAL(10,2));
CREATE TRIGGER ins_sum 
BEFORE INSERT ON account
FOR EACH ROW SET @sum = @sum + NEW.amount;

/* Example 2 */
INSERT INTO account 
VALUES(137,14.98),(141,1937.50),(97,-100.00);

/* Example 3 */
DROP TRIGGER test.ins_sum

/* Example 4 
The following trigger definition defines another BEFORE INSERT trigger for  the account table */
CREATE TRIGGER ins_transaction BEFORE INSERT ON account
FOR EACH ROW PRECEDES ins_sum
SET
@deposits = @deposits + IF(NEW.amount>0,NEW.amount,0),
@withdrawals = @withdrawals + IF(NEW.amount<0,-NEW.amount,0);


/* Example 5 */
delimiter //
CREATE TRIGGER upd_check BEFORE UPDATE ON account
FOR EACH ROW
    BEGIN
       IF NEW.amount < 0 THEN
          SET NEW.amount = 0;
       ELSEIF NEW.amount > 100 THEN
       SET NEW.amount = 100;
       END IF;
 END;//
/* Example 6 */
CREATE TABLE test1(a1 INT);
CREATE TABLE test2(a2 INT);
CREATE TABLE test3(a3 INT NOT NULL AUTO_INCREMENT PRIMARY KEY);
 CREATE TABLE test4(
       a4 INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
       b4 INT DEFAULT 0);
delimiter |
CREATE TRIGGER testref BEFORE INSERT ON test1
  FOR EACH ROW
  BEGIN
    INSERT INTO test2 SET a2 = NEW.a1;
    DELETE FROM test3 WHERE a3 = NEW.a1;
    UPDATE test4 SET b4 = b4 + 1 WHERE a4 = NEW.a1;
  END;
|
delimiter ;
INSERT INTO test3 (a3) VALUES
  (NULL), (NULL), (NULL), (NULL), (NULL),
  (NULL), (NULL), (NULL), (NULL), (NULL);

INSERT INTO test4 (a4) VALUES
  (0), (0), (0), (0), (0), (0), (0), (0), (0), (0);
  
/* Example 7: Suppose that you insert the following values into table test1 as shown here: */
INSERT INTO test1 VALUES (1), (3), (1), (7), (1), (8), (4), (4);
SELECT * 
FROM test1;

/* Example 8 */
DELIMITER //
CREATE TRIGGER project_before_update
BEFORE UPDATE ON project
FOR EACH ROW 
    BEGIN
     SET NEW.plocation = UPPER(NEW.plocation);
    END//

/* Example 9: An UPDATE statement that fires the trigger
Some inserts. There is no trigger in effect, and I can insert the correct value for the full name column or */
UPDATE project
SET plocation = 'Jackson'
WHERE pnumber  = 3;

/* SELECT statement that shows the new row */
SELECT pname, pnumber, plocation
FROM project
WHERE pnumber = 3

/* Example 10: Create a trigger named products_before_insert that inserts the current date for the date_added column of the PRODUCT table 
if the value for that column is null. Test this trigger with an appropriate INSERT statement. */
DROP TRIGGER IF EXISTS products_before_insert;

ELIMITER //

CREATE TRIGGER products_before_insert
BEFORE INSERT ON product
FOR EACH ROW
    BEGIN  
       SET NEW.date_added = NOW();
    END//
DELIMITER ;

-- Test
INSERT INTO product
       (product_id, category_id, product_code, product_name, description, 
              list_price, discount_percent, vendor_id)
VALUES (27543, 11, 'Guitar','Gretsch G5122 Double Cutaway Hollowbody', '', 
               999.99, 30.00, 2);
-- Check
SELECT product_id, product_name, date_added 
FROM product;

/* Example 11: Create a table named Products_Audit. This table should have all columns of the PRODUCT table, except the description column and vendor_id column. 
Also, it should have an audit_id column for its primary key, and the date_added column should be changed to date_updated.
Create a trigger named products_after_update. 
This trigger should insert the old data about the product into the Products_Audit table after the row is updated. 
Then, test this trigger with an appropriate UPDATE statement. */
DROP TABLE IF EXISTS products_audit;

CREATE TABLE products_audit (
  audit_id           INT            PRIMARY KEY AUTO_INCREMENT,
  product_id         INT            NOT NULL,
  category_id        INT            NOT NULL,
  product_code       VARCHAR(10)    NOT NULL,
  product_name       VARCHAR(255)   NOT NULL,
  list_price         DECIMAL(10,2)  NOT NULL,
  discount_percent   DECIMAL(10,2)  NOT NULL      DEFAULT 0.00,
  date_updated       DATETIME                     DEFAULT NULL
);

DROP TRIGGER IF EXISTS products_after_update;

DELIMITER //

CREATE TRIGGER products_after_update
    AFTER UPDATE ON product
      FOR EACH ROW
    BEGIN
      INSERT INTO products_audit VALUES
     (DEFAULT, OLD.product_id, OLD.category_id, OLD.product_code, OLD.product_name, 
     OLD.list_price, OLD.discount_percent, NOW());
    END//

DELIMITER ;
-- test
UPDATE product
SET discount_percent = .35
WHERE product_id = 1234;

-- check
SELECT * 
FROM products_audit;
-- clean up
UPDATE product
SET discount_percent = .20
WHERE product_id = 1234;
