use WAFer;


CREATE TABLE UserJobPosition(
	STSRC VARCHAR(1),
    DateIN DATETIME,
    UserIN VARCHAR(32),
    DateUP DATETIME,
    UserUP VARCHAR(32),
    UserJobPosID VARCHAR(767) PRIMARY KEY,
    UserJobName VARCHAR(32) NOT NULL    
    );
    
    
    
CREATE TABLE UserProfile(
    STSRC VARCHAR(1),
    DateIN DATETIME,
    UserIN VARCHAR(32),
    DateUP DATETIME,
    UserUP VARCHAR(32),
    UserProfileID VARCHAR(767) PRIMARY KEY,
    FirstName VARCHAR(32) NOT NULL,
    LastName VARCHAR(32) NOT NULL,    
    UserDOB DATETIME NOT NULL,    
    UserJobPosID VARCHAR(767) NOT NULL,
    FOREIGN KEY (UserJobPosID) REFERENCES UserJobPosition(UserJobPosID) ON UPDATE CASCADE ON DELETE CASCADE
);
    


CREATE TABLE UserLogin(
    STSRC VARCHAR(1),
    DateIN DATETIME,
    UserIN VARCHAR(32),
    DateUP DATETIME,
    UserUP VARCHAR(32),
    UserProfileID VARCHAR(767) NOT NULL,    
    FOREIGN KEY (UserProfileID) REFERENCES UserProfile(UserProfileID) ON UPDATE CASCADE ON DELETE CASCADE,
    UserLoginID VARCHAR(767) PRIMARY KEY,
    Username VARCHAR(32) NOT NULL,
    Userpass VARCHAR(32) NOT NULL
    );
    


    

CREATE TABLE SavedEncryptedLog (
    STSRC VARCHAR(1),
    DateIN DATETIME,
    UserIN VARCHAR(32),
    DateUP DATETIME,
    UserUP VARCHAR(32),
    logID VARCHAR(767),
    Daytime DATETIME,
    ServerIP VARCHAR(50),
    MessageEncrypted TEXT,
    EncryptionType VARCHAR(1000),
    EncryptionKey TEXT
    );
    
   
    
    CREATE TABLE MsEncryptionType (
    STSRC  VARCHAR(1),
    DateIN DATETIME,
    UserIN VARCHAR(32),
    DateUP DATETIME,
    UserUP VARCHAR(32),
    EncryptionTypeID VARCHAR(1000),
    EncryptionTypeName VARCHAR(1000)
    );
    
  
    
    SET @userprofileidad:=uuid();
    SET @userloginidad:=uuid();
   
    INSERT INTO UserJobPosition(UserJobPosID, UserJobName, STSRC, DateIN, UserIN, DateUP, UserUP)
        VALUES ('ADMINISTRATOR999','ADMIN','A',CURRENT_TIMESTAMP,'SYSTEM',NULL,NULL);
    INSERT INTO UserJobPosition(UserJobPosID,UserJobName,STSRC,DateIN,UserIN,DateUP,UserUP)
        VALUES ('STAFF13795','STAFF','A',CURRENT_TIMESTAMP,'SYSTEM',NULL,NULL);   
	INSERT INTO UserJobPosition(UserJobPosID,UserJobName,STSRC,DateIN,UserIN,DateUP,UserUP)
        VALUES ('BOT1','BOT','A',CURRENT_TIMESTAMP,'SYSTEM',NULL,NULL);   

    INSERT INTO UserProfile(UserProfileID,FirstName,LastName,UserDOB,STSRC,UserIN,DateIN,UserJobPosID,DateUP,UserUP)
        VALUES (@userprofileidad,'Super','User',CURRENT_TIMESTAMP,'A','SYSTEM',CURRENT_TIMESTAMP,'ADMINISTRATOR999',NULL,NULL);
    
    INSERT INTO UserLogin(UserLoginID,Username,Userpass,STSRC,DateIN,UserIN,DateUP,UserUP,UserProfileID)
        VALUES(@userloginidad,'SAIYAN8989','tangowaferchocolate999','A',CURRENT_TIMESTAMP,'SYSTEM',NULL,NULL,@userprofileidad);

    

    
    DELIMITER $$
    CREATE PROCEDURE WAF_Insert_Register (firstname VARCHAR(32), lastname VARCHAR(32), dob DATE, position VARCHAR(767), username VARCHAR(32), userpass VARCHAR(32))
    BEGIN
    DECLARE a VARCHAR(20);

    IF EXISTS(SELECT UserLoginID FROM UserLogin WHERE Username=username) THEN
        SET a="Username is taken";
    ELSE 
        SET @userloginid=uuid();
        SET @userprofileid=uuid();  
        SET @username= CONCAT(firstname,".",lastname);
        INSERT INTO UserProfile(UserProfileID,FirstName,LastName,UserDOB,UserJobPosID,STSRC,DateIN,UserIN,DateUP,UserUP) 
            VALUES(@userporfileid,firstname,lastname,dob,position,'A',CURRENT_TIMESTAMP,'ADMIN',NULL,NULL);
        INSERT INTO UserLogin(UserLoginID,Username,Userpass,UserProfileID,STSRC,DateIN,UserIN,DateUP,UserUP)
            VALUES (@userloginid,@username,userpass,@userprofileid,'A',CURRENT_TIMESTAMP,'ADMIN',NULL,NULL);
        SET a ="User Registered";
    END IF;
    END;
    

    
     

    
    
    
    DELIMITER $$
    CREATE PROCEDURE WAF_Read_Login ( uname VARCHAR(32), upass VARCHAR(32))
    BEGIN
    DECLARE b VARCHAR(50);
    IF NOT EXISTS(SELECT * FROM UserLogin WHERE Username=uname AND Userpass=upass) THEN
        SET b="Username Invalid";
    ELSE 
        SELECT UserProfile.FirstName AS FirstName, 
        UserProfile.LastName AS LastName, 
        UserProfile.UserProfileID AS UserProfileID, 
        UserProfile.UserJobPosID AS UserJobPosID, 
        UserJobPosition.UserJobName AS JobPositionName
        FROM UserProfile, UserJobPosition, UserLogin WHERE UserLogin.Username=uname AND UserLogin.Userpass=upass;
    END IF;
    END;
    
    
    
    DELIMITER $$
    CREATE PROCEDURE WAF_Update_UserProfile (userprofileidup VARCHAR(767), firstnameup VARCHAR(32), lastnameup VARCHAR(32), udobup DATE, posup VARCHAR(767),stsrcup VARCHAR(1))
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
    END;
    
    
    DELIMITER $$
    CREATE PROCEDURE WAF_Insert_Log (
		ServerIPin VARCHAR(50),
		MessageEncryptedin TEXT,
		EncryptionTypein VARCHAR(1000),
		EncryptionKeyin TEXT,
		STSRCin VARCHAR(1))
    BEGIN
    SET @logidin=uuid();
    INSERT INTO SavedEncryptedLog(STSRC,DateIN,UserIN,DateUP,UserUP,logID,Daytime,ServerIP,MessageEncrypted,EncryptionType,EncryptionKey) 
		VALUES(STSRCin,current_timestamp,'BOT',null,null,@logidin,current_timestamp,ServerIPin,MessageEncryptedin,EncryptionTypein,EncryptionKeyin);
    END;
    
 

