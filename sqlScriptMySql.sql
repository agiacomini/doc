-- DML statement conosciuti anche come CRUD (Create, Read, Update e Delete)
-- sono statement che manipolano i dati all'interno del database senza toccare
-- la struttura delle tabelle

-- mydatabase.testTable
create table userLogin
(
	id 		     int not null auto_increment,
    firstName    varchar(80) NULL,
    lastName 	 varchar(80) NULL,
    userName     varchar(30), 
    userPassword varchar(32),
    created 	 datetime default current_timestamp,
    lastUpdate   datetime on update current_timestamp,
    primary key  (id)
);

-- test MD5 encyption 
SELECT MD5('secretPassword');

-- rappresenta i campi della tabella
DESCRIBE user;

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



