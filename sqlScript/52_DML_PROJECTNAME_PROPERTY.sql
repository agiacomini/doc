/*****************************************************************
****                                                          ****
****                  PARTIAL COMMIT TEMPLATE                 ****
****                                                          ****
******************************************************************

SCRIPT NAME      : 52_DML_PROJECTNAME_PROPERTY.sql

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
 
 NUMBER OF RECORDS ADDED: 5

*****************************************************************/


SELECT 'ATTENTION This update 5 records !!!' AS ' ';
SELECT 'Press CTRL C to interrupt' AS ' ';

INSERT INTO PROJECTNAME_PROPERTY (NAME,VALUE,TYPE,DESCRIPTION) VALUES ('priorityToSync10','10','priorityToSyncType','Define the priority assign to element');
INSERT INTO PROJECTNAME_PROPERTY (NAME,VALUE,TYPE,DESCRIPTION) VALUES ('priorityToSync20','20','priorityToSyncType','Define the priority assign to element');

INSERT INTO PROJECTNAME_PROPERTY (NAME,VALUE,TYPE,DESCRIPTION,CODE) VALUES ('trunkTypeFixed','Fixed','typeOfTrunk','Define the type assign to Trunk','F');
INSERT INTO PROJECTNAME_PROPERTY (NAME,VALUE,TYPE,DESCRIPTION,CODE) VALUES ('trunkTypeMobile','Mobile','typeOfTrunk','Define the type assign to Trunk','M');
INSERT INTO PROJECTNAME_PROPERTY (NAME,VALUE,TYPE,DESCRIPTION,CODE) VALUES ('trunkTypeFixedAndMobile','Fixed+Mobile','typeOfTrunk','Define the type assign to Trunk','FM');


SELECT 'REMEMBER to commit, if everything is O.K.' AS ' ';
