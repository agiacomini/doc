/*****************************************************************
****                                                          ****
****                  PARTIAL COMMIT TEMPLATE                 ****
****                                                          ****
******************************************************************

SCRIPT NAME      : 51_DML_PROJECTNAME_USER.sql

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
 
 NUMBER OF RECORDS ADDED: 2

*****************************************************************/


SELECT 'ATTENTION This update 2 records !!!' AS ' ';
SELECT 'Press CTRL C to interrupt' AS ' ';

INSERT INTO PROJECTNAME_USER (firstName,lastName,userName,userPassword,enabled,idUserGroup,eMail) 
VALUES ('andrea','giacomini','agiacomini',MD5('123'),true, (SELECT id FROM project_user_group Where groupName = 'admin'),'andr3a.giacomini@gmail.com');

INSERT INTO PROJECTNAME_USER (firstName,lastName,userName,userPassword,enabled,idUserGroup,eMail) 
VALUES ('mario','rossi','mrossi',MD5('123'),true, (SELECT id FROM project_user_group Where groupName = 'superUser'),'mario.rossi@gmail.com');


SELECT 'REMEMBER to commit, if everything is O.K.' AS ' ';
