/*****************************************************************
****                                                          ****
****                  PARTIAL COMMIT TEMPLATE                 ****
****                                                          ****
******************************************************************

SCRIPT NAME      : 04_DDL_PROJECTNAME_USER_GROUP.sql

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

CREATE TABLE PROJECTNAME_USER_GROUP (
	usergroup_id INT AUTO_INCREMENT PRIMARY KEY,
	user_id INT NOT NULL,
    group_id INT NOT NULL,
    
    created 	  DATETIME DEFAULT CURRENT_TIMESTAMP,
	createdBy	  VARCHAR(30),
    lastUpdate 	  DATETIME ON UPDATE CURRENT_TIMESTAMP,
	lastUpdateBy  VARCHAR(30),
    
    CONSTRAINT fk_usergroup_user FOREIGN KEY (user_id) REFERENCES PROJECTNAME_USER (id),
    CONSTRAINT fk_usergroup_group FOREIGN KEY (group_id) REFERENCES PROJECTNAME_GROUPS (id),
    CONSTRAINT usergroup_unique UNIQUE (user_id, group_id)
);

DELIMITER |
CREATE TRIGGER PROJECTNAME_USERGROUP_IU_TRG 
BEFORE INSERT ON PROJECTNAME_USER_GROUP
FOR EACH ROW
	BEGIN

		DECLARE vUser VARCHAR(30);
		
		
		SELECT USER() INTO vUser;
		
		SET NEW.created = NOW();
		SET NEW.lastUpdate = NOW();
		SET NEW.createdBy = vUser;
		SET NEW.lastUpdateBy = vUser;
		
	END;
|

DESCRIBE PROJECTNAME_USER;
