
-- mydatabase.testTable
create table testTable
(
	id 		      int not null auto_increment,
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

-- trigger on created column
CREATE TRIGGER insert_creation_trg BEFORE INSERT ON testTable
FOR EACH ROW
SET NEW.created = now();

-- trigger on lastUpdate column
CREATE TRIGGER update_lastUpdate_trg BEFORE UPDATE ON testTable
FOR EACH ROW 
SET NEW.lastUpdate = NOW();

-- storing password
SELECT CHARACTER_LENGTH (MD5('myPassword'));  -- 32
SELECT CHARACTER_LENGTH (SHA1('myPassword')); -- 40
 
SELECT MD5('myPassword');

-- select
SELECT * FROM mydatabase.testtable;

-- inser new 
INSERT INTO testTable (firstName, lastName, passwordField, phone, address) 
VALUES ('andrea', 'giacomini', MD5('1234'), 888-88888,'via Chiesa 4B');

-- select password
SELECT * FROM testTable WHERE userName = 'giacomini' AND passwordField = MD5('1234');

-- update row
-- Edit-->Preferences-->SQL Editor-->Safe Updates (uncheck) update statements witout WHERE condition on KEY FIELD
SET SQL_SAFE_UPDATES = 0;

UPDATE user SET userName = 'agiacomini2' WHERE id = 1;
UPDATE userLogin SET userName = 'agiacomini2' WHERE firstName = 'andrea';



