/*****************************************************************
****                                                          ****
****                  PARTIAL COMMIT TEMPLATE                 ****
****                                                          ****
******************************************************************

SCRIPT NAME      : 01_DDL_PROJECT_USER_GROUP.sql

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

CREATE TABLE PROJECT_USER_GROUP (
    id 		  	  INT NOT NULL AUTO_INCREMENT UNIQUE,
    groupName 	  VARCHAR(50) NULL,
    description	  VARCHAR(80) NULL,
    created 	  DATETIME DEFAULT CURRENT_TIMESTAMP,
	createdBy	  VARCHAR(30),
    lastUpdate 	  DATETIME ON UPDATE CURRENT_TIMESTAMP,
	lastUpdateBy  VARCHAR(30),
    PRIMARY KEY  (id)
);

DELIMITER |
CREATE TRIGGER PROJECT_USER_GROUP_IU_TRG 
BEFORE INSERT ON PROJECT_USER_GROUP
FOR EACH ROW
	BEGIN

		DECLARE vUser VARCHAR(30);
		
		SELECT SUBSTRING_INDEX(USER(), '@', -1) INTO vUser;
		
		SET NEW.created = NOW();
		SET NEW.lastUpdate = NOW();
		SET NEW.createdBy = vUser;
		SET NEW.lastUpdateBy = vUser;
		
	END;   
|

DESCRIBE PROJECT_USER_GROUP;
