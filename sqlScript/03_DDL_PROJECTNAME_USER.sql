/*****************************************************************
****                                                          ****
****                  PARTIAL COMMIT TEMPLATE                 ****
****                                                          ****
******************************************************************

SCRIPT NAME      : 03_DDL_PROJECTNAME_USER.sql

AUTHOR           : 

RESPONSIBLE      : 

SG/ST            : 
  
BUG/OTHER        : 
  
SYSTEM           : 

MODULE           :

VERSION          : 1.0

DESCRIPTION      : 

CONSTRAINT       :

WARNING          :

DATABASE         : mydatabase

SCHEMA           : mydatabase
         
*****************************************************************
**************************************************************** */

CREATE TABLE PROJECTNAME_USER (
    id 		  	  			INT NOT NULL AUTO_INCREMENT UNIQUE,
    firstName 	  			VARCHAR(80) NULL,
    lastName 	  			VARCHAR(80) NULL,
    userName 	  			VARCHAR(80) NULL,
    userPassword  			VARCHAR(32),
	enabled 				BOOLEAN,
    phone 		  			INT,
    eMail   	  			VARCHAR(200),
	
    created 	  			DATETIME DEFAULT CURRENT_TIMESTAMP,
	createdBy	  			VARCHAR(30),
    lastUpdate 	  			DATETIME ON UPDATE CURRENT_TIMESTAMP,
	lastUpdateBy  			VARCHAR(30),
	
    PRIMARY KEY  			(id)
);

DELIMITER |
CREATE TRIGGER PROJECTNAME_USER_IU_TRG 
BEFORE INSERT ON PROJECTNAME_USER
FOR EACH ROW
	BEGIN

		DECLARE vUser VARCHAR(30);
		
		-- SELECT SUBSTRING_INDEX(USER(), '@', -1) INTO vUser;  -- localhost
		SELECT USER() INTO vUser;								-- root@localhost
		
		SET NEW.created = NOW();
		SET NEW.lastUpdate = NOW();
		SET NEW.createdBy = vUser;
		SET NEW.lastUpdateBy = vUser;
		
	END;
|

DESCRIBE PROJECTNAME_USER;
