-- DML statement conosciuti anche come CRUD (Create, Read, Update e Delete)
-- sono statement che manipolano i dati all'interno del database senza toccare
-- la struttura delle tabelle

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

-- select
SELECT * FROM mydatabase.userLogin;

-- insert new 
INSERT INTO userLogin (firstName, lastName, userName, userPassword) 
VALUES ('andrea', 'giacomini', 'agiacomini', MD5('1234'));

SELECT * FROM userLogin WHERE userName = 'agiacomini' AND userPassword = MD5('1234');

UPDATE user SET userName = 'agiacomini2' WHERE id = 1;
UPDATE userLogin SET userName = 'agiacomini2' WHERE firstName = 'andrea';

ALTER TABLE userLogin ADD userGroupIdNew int;

-- aggiunge una chiave esterna alla tabella
ALTER TABLE userLogin 
ADD FOREIGN KEY (userGroupIddddd) REFERENCES userGroup(id);

-- aggiunge una chiave esterna alla tabella ed aggiunge un nuome riconoscitivo al vincolo appena creato
ALTER TABLE userLogin
ADD CONSTRAINT FK_userGroupId
FOREIGN KEY (userGroupId) REFERENCES userGroup(id);

-- aggiunge una chiave esterna alla tabella già esistente
-- associa un nome riconoscitivo al vincolo
-- e aggiunge un valore di dafault 0 alle righe già presenti in tabella e per le quali non era 
-- stato ancra dato un valore 
ALTER TABLE userLogin ADD userGroupIdNewTest SMALLINT UNSIGNED NOT NULL DEFAULT 0,
ADD CONSTRAINT FK_userGroupIdNew
FOREIGN KEY (userGroupId) REFERENCES userGroup(id);

-- cancella un vincolo dalla tabella
ALTER TABLE userLogin 
DROP FOREIGN KEY userlogin_ibfk_1;

-- elimina una colonna dalla tabella
ALTER TABLE userLogin
DROP COLUMN userGroupId;

-- Oracle
Select * From all_constraints;

select constraint_name,
       table_schema,
       table_name
from   information_schema.table_constraints
where  constraint_schema = 'mydatabases';