/*****************************************************************
****                                                          ****
****                  PARTIAL COMMIT TEMPLATE                 ****
****                                                          ****
******************************************************************

SCRIPT NAME      : 05_DDL_PROJECTNAME_USER_PROFILE.sql

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
    userprofile_id 		  	  INT NOT NULL AUTO_INCREMENT UNIQUE,
    user_id 	  INT NOT NULL,
	profile_id INT NOT NULL,
	
    created 	  DATETIME DEFAULT CURRENT_TIMESTAMP,
	createdBy	  VARCHAR(30),
    lastUpdate 	  DATETIME ON UPDATE CURRENT_TIMESTAMP,
	lastUpdateBy  VARCHAR(30),
	
    PRIMARY KEY   (userprofile_id),
	
	CONSTRAINT fk_userprofile_user FOREIGN KEY (user_id) REFERENCES PROJECTNAME_USER (id),
	CONSTRAINT fk_userprofile_profile FOREIGN KEY (profile_id) REFERENCES PROJECTNAME_PROFILE (id)
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
