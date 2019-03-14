/*****************************************************************
****                                                          ****
****                  PARTIAL COMMIT TEMPLATE                 ****
****                                                          ****
******************************************************************

SCRIPT NAME      : 04_DDL_PROJECTNAME_USER_PROFILE.sql

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

CREATE TABLE PROJECTNAME_USER_PROFILE (
    id 		  	  INT NOT NULL AUTO_INCREMENT UNIQUE,
    profileId 	  INT NOT NULL,
	projectUserId INT NOT NULL,
	
    created 	  DATETIME DEFAULT CURRENT_TIMESTAMP,
	createdBy	  VARCHAR(30),
    lastUpdate 	  DATETIME ON UPDATE CURRENT_TIMESTAMP,
	lastUpdateBy  VARCHAR(30),
	
    PRIMARY KEY   (id),
	FOREIGN KEY   (profileId) REFERENCES profile(id),
	FOREIGN KEY   (projectUserId) REFERENCES project_user(id)
);

DELIMITER |
CREATE TRIGGER PROJECTNAME_USER_PROFILE_IU_TRG 
BEFORE INSERT ON PROJECTNAME_USER_PROFILE
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

DESCRIBE PROJECTNAME_USER_PROFILE;
