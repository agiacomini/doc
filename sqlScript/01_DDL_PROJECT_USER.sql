-- REM $Id$

-- /*****************************************************************
-- ****                                                          ****
-- ****                  PARTIAL COMMIT TEMPLATE                 ****
-- ****                                                          ****
-- ******************************************************************

-- SCRIPT NAME      : 01_DDL_PROJECT_USER.sql

-- AUTHOR           : 

-- RESPONSIBLE      :

-- SG/ST            : 
  
-- BUG/OTHER        : 
  
-- SYSTEM           : 

-- MODULE           :

-- VERSION          : 1.0

-- DESCRIPTION      : 

-- CONSTRAINT       :

-- WARNING          :

-- DATABASE         : mydatabase

-- SCHEMA           : mydatabase
         
-- *****************************************************************
-- *****************************************************************/

-- set time on
-- set timing on
-- set echo on
-- set linesize 132
-- set head off
-- set scan on
-- set serveroutput on 
-- set define '&'
-- set term on
-- set feed on

-- remember to change AAAnnnnn with the real script name

-- spool 01_DDL_PROJECT_USER.log

-- SELECT global_name ||'  ' || TO_CHAR(SYSDATE, 'YYYY/MM/DD HH24:MI:SS')
-- FROM global_name;

-- SELECT USERNAME from user_users;

-- PROMPT "ATTENTION a table will be created!!!"
-- PROMPT "Press CTRL C to interrupt"

-- SELECT '&Continue' 
-- FROM dual;

CREATE TABLE project_user (
    id 		  	  INT NOT NULL AUTO_INCREMENT UNIQUE,
    firstName 	  VARCHAR(80) NULL,
    lastName 	  VARCHAR(80) NULL,
    passwordField VARCHAR(32),
    phone 		  INT,
    address 	  VARCHAR(200),
    foreignKeyId  INT NOT NULL,
    created 	  DATETIME DEFAULT CURRENT_TIMESTAMP,
	createdBy	  VARCHAR(30),
    lastUpdate 	  DATETIME ON UPDATE CURRENT_TIMESTAMP,
	lastUpdateBy  VARCHAR(30),
    PRIMARY KEY  (id)
);

CREATE TRIGGER PROJECT_USER_IU_TRG 
BEFORE INSERT ON project_user
FOR EACH ROW
	BEGIN

		DECLARE vUser VARCHAR(30);
		
		SELECT SUBSTRING_INDEX(USER(), '@', -1) INTO vUser;
		
		SET NEW.created = NOW();
		SET NEW.lastUpdate = NOW();
		SET NEW.createdBy = vUser;
		SET NEW.lastUpdateBy = vUser;
		
	END;   

DESCRIBE PROJECT_USER;
  
spool off

