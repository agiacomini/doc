/*****************************************************************
****                                                          ****
****                  PARTIAL COMMIT TEMPLATE                 ****
****                                                          ****
******************************************************************

SCRIPT NAME      : 50_DML_PROJECTNAME_GROUPPROJECTNAME_GROUPSPROJECTNAME_GROUPSS.sql

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
*****************************************************************/


/******************************************************************
 
 NUMBER OF RECORDS ADDED: 3

*****************************************************************/

SELECT 'ATTENTION This update 3 records !!!' AS ' ';
SELECT 'Press CTRL C to interrupt' AS ' ';

INSERT INTO PROJECTNAME_GROUPS (groupName,description,isAdmin) VALUES ('admin','The group of "administrators" of project',true);
INSERT INTO PROJECTNAME_GROUPS (groupName,description,isAdmin) VALUES ('superUser','The group of "super user" that can manage other users',true);
INSERT INTO PROJECTNAME_GROUPS (groupName,description,isAdmin) VALUES ('user','The group of basic "users" that works on project',false);


SELECT 'REMEMBER to commit, if everything is O.K.' AS ' ';
