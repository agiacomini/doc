/*****************************************************************
****                                                          ****
****                  PARTIAL COMMIT TEMPLATE                 ****
****                                                          ****
******************************************************************

SCRIPT NAME      : 03_DDL_PROJECT_PROPERTY.sql

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

CREATE TABLE PROJECT_PROPERTY (
    id 		  	   INT NOT NULL AUTO_INCREMENT UNIQUE,
    name 	       VARCHAR(80),
    value          VARCHAR(80),
    type           VARCHAR(32),
    description    VARCHAR(200),
	code           VARCHAR(32),
    created 	  DATETIME DEFAULT CURRENT_TIMESTAMP,
	createdBy	  VARCHAR(30),
    lastUpdate 	  DATETIME ON UPDATE CURRENT_TIMESTAMP,
	lastUpdateBy  VARCHAR(30),
    PRIMARY KEY  (id)
);

DELIMITER |
CREATE TRIGGER PROJECT_PROPERTY_IU_TRG 
BEFORE INSERT ON PROJECT_PROPERTY
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

DESCRIBE PROJECT_PROPERTY;
