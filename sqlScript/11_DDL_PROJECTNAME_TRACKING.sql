/*****************************************************************
****                                                          ****
****                  PARTIAL COMMIT TEMPLATE                 ****
****                                                          ****
******************************************************************

SCRIPT NAME      : 11_DDL_PROJECTNAME_TRACKING.sql

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

CREATE TABLE PROJECTNAME_TRACKING (
    trackingId 	   			INT NOT NULL AUTO_INCREMENT UNIQUE,
    trackingName   			VARCHAR(80),
    trackingDescription 	VARCHAR(200),
	
    created 	  			DATETIME DEFAULT CURRENT_TIMESTAMP,
	createdBy	  			VARCHAR(30),
    lastUpdate 	  			DATETIME ON UPDATE CURRENT_TIMESTAMP,
	lastUpdateBy  			VARCHAR(30),
	
    PRIMARY KEY  (trackingId)
);

DELIMITER |
CREATE TRIGGER PROJECTNAME_TRACKING_IU_TRG 
BEFORE INSERT ON PROJECTNAME_TRACKING
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

DESCRIBE PROJECTNAME_TRACKING;
