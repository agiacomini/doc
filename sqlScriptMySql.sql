-- mydatabase.testTable
create table userGroup
(
	id 		         int not null auto_increment,
    userGroupName    varchar(80) NULL,
    userGroupRole 	 varchar(80) NULL,
    created 	 datetime default current_timestamp,
    lastUpdate   datetime on update current_timestamp,
    primary key  (id)
);

-- test MD5 encyption 
SELECT MD5('secretPassword');

-- rappresenta i campi della tabella
DESCRIBE userLogin;

-- drop/canella definitivamente la tabella dal database, i suoi indici e vincoli. 
-- Vengono rimossi i dati e allo stesso momento anche la struttura della tabella
DROP TABLE user;
commit;

 -- cancella la riga
DELETE FROM user
WHERE firstName = 'nome';

-- elimina le righe della tabella
TRUNCATE TABLE user;

-- trigger on created column
CREATE TRIGGER insert_creation_trg BEFORE INSERT ON testTable
FOR EACH ROW
SET NEW.created = now();

-- trigger on lastUpdate column
CREATE TRIGGER update_lastUpdate_trg BEFORE UPDATE ON testTable
FOR EACH ROW 
SET NEW.lastUpdate = NOW();

-- In mySQL does not exist "CREATE OR REPLACE TRIGGER" paradigma, so the best practice is to lock the table
-- drop the old trigger and add the new one while the table is locked
LOCK TABLE userGroup WRITE;
DROP TRIGGER IF EXISTS insert_creation_trg;

DELIMITER |
CREATE TRIGGER userGroup_IU_TRG BEFORE INSERT ON userGroup
FOR EACH ROW
BEGIN

	DECLARE vUser VARCHAR(30) DEFAULT 0;
    
    SELECT current_user() INTO vUser;
    
	SET NEW.created = NOW();
    SET NEW.lastUpdate = SYSDATE();
    SET NEW.createdBy = vUser;
    SET NEW.lastUpdateBy = vUser;
    
	-- SET NEW.lastUpdate = NOW();
    -- SET NEW.lastUpdateBy = TMPVAR;
    
END;
|

-- DELIMITER //
UNLOCK TABLE userGroup;