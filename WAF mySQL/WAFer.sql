CREATE DATABASE WAFer

CREATE TABLE UserLogin(
	STSRC CHAR(1),
    DateIN DATETIME,
    UserIN VARCHAR(32),
    DateUP DATETIME,
    UserUP VARCHAR(32),
    UserProfileID VARCHAR(767) NOT NULL,    
    FOREIGN KEY (UserProfileID) REFERENCES UserProfile(UserProfileID) ON UPDATE CASCADE ON DELETE CASCADE,
    UserLoginID VARCHAR(767) PRIMARY KEY,
    Username VARCHAR(32) NOT NULL,
    Userpass VARCHAR(32) NOT NULL
    )
    


CREATE TABLE UserProfile(
	UserProfileID VARCHAR(767) PRIMARY KEY,
    FirstName VARCHAR(32) NOT NULL,
    LastName VARCHAR(32) NOT NULL,    
    UserDOB DATE NOT NULL,
    STSRC CHAR(1),
    DateIN DATETIME,
    UserIN VARCHAR(32),
    DateUP DATETIME,
    UserUP VARCHAR(32),
    UserJobPosID VARCHAR(767) NOT NULL,
    FOREIGN KEY (UserJobPosID) REFERENCES UserJobPosition(UserJobPosID) ON UPDATE CASCADE ON DELETE CASCADE
)



CREATE TABLE UserJobPosition(
	UserJobPosID VARCHAR(767) PRIMARY KEY,
    UserJobName VARCHAR(32) NOT NULL,
    STSRC CHAR(1),
    DateIN DATETIME,
    UserIN VARCHAR(32),
    DateUP DATETIME,
    UserUP VARCHAR(32) 
    )
    
       
INSERT INTO UserJobPosition(UserJobPosID,UserJobName,STSRC,DateIN,UserIN,DateUP,UserUP)
    VALUES ('USER','ADMIN','A',CURRENT_TIMESTAMP,'SYSTEM',NULL,NULL)
    
INSERT INTO UserProfile(UserProfileID,FirstName,LastName,UserDOB,STSRC,UserIN,DateIN,UserJobPosID,DateUP,UserUP)
    VALUES (uuid(),'Super','User',CURRENT_TIMESTAMP,'A','SYSTEM',CURRENT_TIMESTAMP,'ADMINISTRATOR999',CURRENT_TIMESTAMP,'SYSTEM')
    
INSERT INTO UserLogin(UserLoginID,Username,Userpass,STSRC,DateIN,UserIN,DateUP,UserUP,UserProfileID)
	VALUES(uuid(),'SAIYAN8989','tangowaferchocolate999','A',CURRENT_TIMESTAMP,'SYSTEM',CURRENT_TIMESTAMP,'SYSTEM','148faf6b-22ba-11e8-bd24-1cb72c959c01')
    
    
    SELECT * FROM UserJobPosition# UserProfile  UserLogin
    
   UPDATE UserJobPosition SET DateUP = NULL WHERE UserJobPosID='ADMINISTRATOR999'
    
 
    
    
    DELIMITER $$
    CREATE PROCEDURE WAF_Insert_Register (firstname VARCHAR(32), lastname VARCHAR(32), dob DATE, position VARCHAR(767), username VARCHAR(32), userpass VARCHAR(32))
    BEGIN
    DECLARE a VARCHAR(20);
    IF EXISTS(SELECT UserLoginID FROM UserLogin WHERE Username=username) THEN
		SET a="Username is taken";
	ELSE 
		INSERT INTO UserLogin(Username,Userpass,STSRC,DateIN,UserIN,DateUP,UserUP)
			VALUES (username,userpass,'A',CURRENT_TIMESTAMP,'ADMIN',NULL,NULL);
            
        INSERT INTO UserProfile(FirstName,LastName,UserDOB,UserJobPosID,STSRC,DateIN,UserIN,DateUP,UserUP) 
			VALUES(firstname,lastname,dob,position,'A',CURRENT_TIMESTAMP,'ADMIN',NULL,NULL);
        SET a ="User Registered";
	END IF;
    END
    
    
    DELIMITER $$
    CREATE FUNCTION WAF_Read_Login ( uname VARCHAR(32), upass VARCHAR(32))
    RETURNS bit
    BEGIN
    IF EXISTS(SELECT * FROM UserLogin WHERE Username=uname AND Userpass=@userpass) THEN
		RETURN 1;
	ELSE 
		RETURN 0;
	END IF;
    END
    
    DELIMITER $$
    
    CREATE PROCEDURE WAF_Update_User (userprofileidup VARCHAR(767), firstnameup VARCHAR(32), lastnameup VARCHAR(32), udobup DATE, posup VARCHAR(767),stsrcup VARCHAR(1))
	BEGIN 
    UPDATE UserProfile
    SET FirstName=firstnameup ,
		LastName=lastnameup,
        UserDOB=udobup,
        UserJobPosID=posup,
        STSRC=stsrcup,
        DateUP=CURRENT_TIMESTAMP,
        UserUP='ADMIN'
    WHERE 
		UserProfileID = userprofileidup;
        END
    
    DELIMITER $$
    CREATE PROCEDURE WAF_Delete_User ( userprofileiddel VARCHAR(767))
    BEGIN 
    DELETE FROM UserProfile 
    WHERE UserProfileID = userprofileiddel;
    DELETE FROM UserLogin
    WHERE UserProfileID = userprofileiddel;
    END
    
   

    
    
    