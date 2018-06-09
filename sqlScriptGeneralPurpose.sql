
-- mydatabase.testTable
create table testTable
(
	id 		      int not null auto_increment unique,
    firstName     varchar(80) NULL,
    lastName 	  varchar(80) NULL,
    passwordField varchar(32),
    phone 		  int, 
    address 	  varchar(200),
    foreignKeyId  int not null,
    created 	  datetime default current_timestamp,
    lastUpdate    datetime on update current_timestamp,
    primary key   (id),
    foreign key   (foreignKeyId) references userGroup
);

-- rappresenta i campi della tabella
DESCRIBE testTable;

-- drop/canella
DROP TABLE testTable;

-- trigger on "created" column
CREATE TRIGGER insert_creation_trg BEFORE INSERT ON testTable
FOR EACH ROW
SET NEW.created = now();

-- trigger on "lastUpdate" column
CREATE TRIGGER update_lastUpdate_trg BEFORE UPDATE ON testTable
FOR EACH ROW 
SET NEW.lastUpdate = NOW();

-- storing password with cryptography
SELECT CHARACTER_LENGTH (MD5('myPassword'));  -- 32
SELECT CHARACTER_LENGTH (SHA1('myPassword')); -- 40
 
SELECT MD5('myPassword');

-- select
SELECT * FROM mydatabase.testtable;

-- inser new row
INSERT INTO testTable (firstName, lastName, passwordField, phone, address) 
VALUES ('andrea', 'giacomini', MD5('1234'), 888-88888,'via Chiesa 4B');

-- select by "userName" and "password"
SELECT * FROM testTable WHERE userName = 'giacomini' AND passwordField = MD5('1234');

-- update row values
-- Edit-->Preferences-->SQL Editor-->Safe Updates (uncheck) update statements witout WHERE condition on KEY FIELD
SET SQL_SAFE_UPDATES = 0;

UPDATE testTable SET firstName = 'agiacomini2' WHERE id = 1;
UPDATE testTable SET firstName = 'agiacomini2' WHERE firstName = 'andrea';

/* --------------------------------------------------------------------------------------------------------
	ALTER TABLE (DDL - Data Description Language) 
   -------------------------------------------------------------------------------------------------------- */

-- update table schema, add new column
ALTER TABLE testTable ADD newColumn int;

-- update table schema, delete column from table
ALTER TABLE userLogin
DROP COLUMN userGroupId;

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

/* -------------------------------------------------------------------------------------------- */
