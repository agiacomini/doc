-- DML (Date Manipulating Language) statement conosciuti anche come CRUD:
--
-- 		Operazione		SQL
--
-- 		Create 			INSERT
-- 		Read			SELECT (DQL - Data Query Language)
-- 		Update			UPDATE
-- 		Delete(Destroy)	DELETE
--
-- sono statement che manipolano i dati all'interno del database senza toccare
-- la struttura delle tabelle

-- mydatabase.testTable
CREATE TABLE testTable (
    id 		  	  INT NOT NULL AUTO_INCREMENT UNIQUE,
    firstName 	  VARCHAR(80) NULL,
    lastName 	  VARCHAR(80) NULL,
    passwordField VARCHAR(32),
    phone 		  INT,
    booleanValue  BOOLEAN,
    address 	  VARCHAR(200),
    foreignKeyId  INT NOT NULL,
    created 	  DATETIME DEFAULT CURRENT_TIMESTAMP,
    createdBy	  VARCHAR(30),
    lastUpdate 	  DATETIME ON UPDATE CURRENT_TIMESTAMP,
    lastUpdateBy  VARCHAR(30),
    PRIMARY KEY (id),
    FOREIGN KEY (foreignKeyId)
	REFERENCES userGroup(id)
);

-- rappresenta i campi della tabella
DESCRIBE testTable;

-- drop/canella from db
DROP TABLE testTable;

-- cancel the content of table
TRUNCATE TABLE testTable;

/* --------------------------------------------------------------------------------------------------------
	TRIGGER
   -------------------------------------------------------------------------------------------------------- */

-- trigger on "created" column
CREATE TRIGGER insert_creation_trg BEFORE INSERT ON testTable
FOR EACH ROW
SET NEW.created = now();

-- trigger on "lastUpdate" column
CREATE TRIGGER update_lastUpdate_trg BEFORE UPDATE ON testTable
FOR EACH ROW 
SET NEW.lastUpdate = NOW();

DELIMITER |
CREATE TRIGGER user_domain_IU_TRG 
BEFORE INSERT ON user_domain
FOR EACH ROW
	BEGIN

		DECLARE vUser VARCHAR(30);
		
		-- SELECT SUBSTRING_INDEX(USER(), '@', -1) INTO vUser;  -- localhost
        SELECT USER() INTO vUser;							    -- root@localhost
		
		SET NEW.created = NOW();
		SET NEW.lastUpdate = NOW();
		SET NEW.createdBy = vUser;
		SET NEW.lastUpdateBy = vUser;
		
	END;
    
|

/* -------------------------------------------------------------------------------------------------------- */


/* --------------------------------------------------------------------------------------------------------
	SELECT
   -------------------------------------------------------------------------------------------------------- */

-- storing password with cryptography
SELECT CHARACTER_LENGTH (MD5('myPassword'));  -- 32 
SELECT CHARACTER_LENGTH (SHA1('myPassword')); -- 40 
 
SELECT MD5('myPassword');

-- select
SELECT * FROM mydatabase.testtable;

-- select by "userName" and "password"
SELECT * FROM testTable WHERE userName = 'giacomini' AND passwordField = MD5('1234');

SELECT * FROM testTable WHERE UPPER(lastName) in ( UPPER('giacomini') );

/* -------------------------------------------------------------------------------------------------------- */


-- DDL (Data Definition Language)
-- 
-- 		Operazioni SQL
-- 
-- 			-Create Domain
-- 			-Drop Domain
-- 
-- 			-Create Schema
-- 			-Drop Schema
-- 
-- 			-Create Database
-- 			-Alter Database
-- 			-Drop Database
-- 	
-- 			-Create Table
-- 			-Alter Table
-- 			-Drop Table
-- 			-Rename
--
-- 			-Create Index
-- 			-Drop Index
/* --------------------------------------------------------------------------------------------------------
	ALTER TABLE
   -------------------------------------------------------------------------------------------------------- */

-- update table schema, add new column
ALTER TABLE testTable 
ADD newColumn int;

-- update table schema, delete column from table
ALTER TABLE testTable
DROP COLUMN userGroupId;

-- update table schema, change data type of column in a table
ALTER TABLE testTable
MODIFY COLUMN firstName int;

-- update table schema, rename a column
ALTER TABLE testTable
CHANGE COLUMN old_column_name new_column_name data_type;

-- update table schema, add new FK on table
ALTER TABLE testTable 
ADD FOREIGN KEY (column_identifying) REFERENCES table_identifying(id);

-- update table schema, add new FK on table and add a identifying name for the FK
ALTER TABLE testTable
ADD CONSTRAINT FK_constraintName -- identifying name
FOREIGN KEY (column_identifying) REFERENCES table_identifying(id);

-- update table schema, add new FK on table and add a identifying name for the FK
-- moreover insert a default value for that row without values
ALTER TABLE testTable ADD userGroupIdNewTest SMALLINT UNSIGNED NOT NULL DEFAULT 0,
ADD CONSTRAINT FK_constraintName -- identifying name
FOREIGN KEY (column_identifying) REFERENCES table_identifying(id);

-- delete constraint from table
ALTER TABLE testTable 
DROP FOREIGN KEY FK_constraintName;

/* -------------------------------------------------------------------------------------------- */


/* --------------------------------------------------------------------------------------------------------
	UPDATE TABLE (DML - Data Manipulating Language) 
   -------------------------------------------------------------------------------------------------------- */

-- inser new row
INSERT INTO user_domain (firstName, lastName, passwordField, phone, address) 
VALUES ('beppe', 'falco', MD5('1234'), '+393280680074','via Bicocca 4');

-- update row values
-- Edit-->Preferences-->SQL Editor-->Safe Updates (uncheck) update statements witout WHERE condition on KEY FIELD
SET SQL_SAFE_UPDATES = 0;

UPDATE testTable SET firstName = 'agiacomini2' WHERE id = 1;
UPDATE testTable SET firstName = 'agiacomini2' WHERE firstName = 'andrea';

UPDATE user_domain SET phone = '+3932808888' WHERE firstName = 'beppe';

UPDATE user_domain SET firstName = 'luchino' WHERE firstName = 'luca??????';

-- replace the vale '-88000', in "phone" field, with the new value "+393388166712" 
UPDATE testTable 
SET phone = REPLACE(phone,'-88000','+393388166712'), 
	lastName = REPLACE(lastName,'giacomini','Giacomini')
WHERE address = 'via Chiesa 4B';

-- replace the values (with regex) when find the following value (+39|+35|+85) 
UPDATE testTable SET phone = REGEXP_REPLACE(phone,'+39|+35|+85','+33')					 
WHERE (model LIKE '%Plugln%' OR model LIKE '%PLUGIN%' OR model LIKE '%plugin%' OR model LIKE '%Plugin%')
AND model NOT IN ('AWN MR4 IN-OUT Plugin');

-- Left Padded string
UPDATE testTable
SET lastName = lpad(lastName,10,'*')
WHERE id IN (3,4);

-- Righr Padded string
UPDATE testTable
SET lastName = rpad(lastName,10,'*')
WHERE id IN (3,4);

/* -------------------------------------------------------------------------------------------- */


/* ----------------------------------------------------------------------------------------------
	QUERY DI SISTEMA, DI USO GENERALE
   ---------------------------------------------------------------------------------------------*/

-- visualizza tutti i vincoli/constraints delle tabella del db specificato
SELECT constraint_name,
       table_schema,
       table_name
FROM   information_schema.table_constraints
WHERE  constraint_schema = 'mydatabase';
-- WHERE  table_schema = 'mydatabase';
-- WHERE  table_name = 'userLogin';

SELECT *
FROM   information_schema.table_constraints
WHERE  constraint_schema = 'mydatabase';

-- view the system date, like '2018-06-10 10:38:11'
SELECT SYSDATE();
SELECT NOW();

-- view the user logged, like 'root@localhost'
SELECT CURRENT_USER();
-- find username of person performing INSERT into table
SELECT USER();

SELECT @@hostname;
SHOW VARIABLES WHERE Variable_name LIKE '%host%';

select host from information_schema.processlist;

SHOW processlist;

-- delivers the "remote_host" e.g. "localhost" 
SELECT SUBSTRING_INDEX(USER(), '@', -1);

-- delivers the user-name e.g. "myuser"
SELECT SUBSTRING_INDEX(USER(), '@', 1);

/* -------------------------------------------------------------------------------------------- */
