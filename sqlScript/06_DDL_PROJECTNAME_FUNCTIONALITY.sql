/*****************************************************************
****                                                          ****
****                  PARTIAL COMMIT TEMPLATE                 ****
****                                                          ****
******************************************************************

SCRIPT NAME      : 06_DDL_PROJECTNAME_FUNCTIONALITY.sql

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

CREATE TABLE PROJECTNAME_FUNCTIONALITY (
    id 		  	  		INT NOT NULL AUTO_INCREMENT UNIQUE,
    description   		VARCHAR(80) NULL,
	functionalityName 	VARCHAR(50) NULL,
    created 	  		DATETIME DEFAULT CURRENT_TIMESTAMP,
	createdBy	  		VARCHAR(30),
    lastUpdate 	  		DATETIME ON UPDATE CURRENT_TIMESTAMP,
	lastUpdateBy  		VARCHAR(30),
    PRIMARY KEY   		(id)
);

DELIMITER |
CREATE TRIGGER PROJECTNAME_FUNCTIONALITY_IU_TRG 
BEFORE INSERT ON PROJECTNAME_FUNCTIONALITY
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

DESCRIBE PROJECTNAME_FUNCTIONALITY;
