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
    );
    



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
);



CREATE TABLE UserJobPosition(
	UserJobPosID VARCHAR(767) PRIMARY KEY,
    UserJobName VARCHAR(32) NOT NULL,
    STSRC CHAR(1),
    DateIN DATETIME,
    UserIN VARCHAR(32),
    DateUP DATETIME,
    UserUP VARCHAR(32) 
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
    )
    
	TransactionID VARCHAR(767) PRIMARY KEY,
    clientIP VARCHAR(50),
    daytime VARCHAR(767),
    server_id VARCHAR(767),
	client_port VARCHAR(100),
	host_ip VARCHAR(50),
	host_port VARCHAR(50),
	requestID VARCHAR(767),
	responseID VARCHAR(767),
	producerID VARCHAR(767),
	STSRC VARCHAR(1),
    DateIN DATETIME,
    UserIN VARCHAR(32),
    DateUP DATETIME,
    UserUP VARCHAR(32),
    FOREIGN KEY (requestID) REFERENCES Requests(requestID) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (responseID) REFERENCES Responses(responseID) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (producerID) REFERENCES Producer(producerID) ON UPDATE CASCADE ON DELETE CASCADE,
    );
    
   
  
    
    DELIMITER $$
	CREATE PROCEDURE WAF_Insert_AdminUser ()
    BEGIN
    SET @userprofileidad:=uuid();
    SET @userloginidad:=uuid();
	INSERT INTO UserJobPosition(UserJobPosID, UserJobName, STSRC, DateIN, UserIN, DateUP, UserUP)
		VALUES ('ADMINISTRATOR999','ADMIN','A','CURRENT_TIMESTAMP','SYSTEM',NULL,NULL);
	INSERT INTO UserJobPosition(UserJobPosID,UserJobName,STSRC,DateIN,UserIN,DateUP,UserUP)
		VALUES ('STAFF13795','STAFF','A',CURRENT_TIMESTAMP,'SYSTEM',NULL,NULL);   

	INSERT INTO UserProfile(UserProfileID,FirstName,LastName,UserDOB,STSRC,UserIN,DateIN,UserJobPosID,DateUP,UserUP)
		VALUES (@userprofileidad,'Super','User',CURRENT_TIMESTAMP,'A','SYSTEM',CURRENT_TIMESTAMP,'ADMINISTRATOR999',NULL,NULL);
    
	INSERT INTO UserLogin(UserLoginID,Username,Userpass,STSRC,DateIN,UserIN,DateUP,UserUP,UserProfileID)
		VALUES(@userloginidad,'SAIYAN8989','tangowaferchocolate999','A',CURRENT_TIMESTAMP,'SYSTEM',NULL,NULL,@userprofileidad);
    END;
    
    CALL WAF_Insert_AdminUser();
    
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
    CREATE FUNCTION WAF_Read_Login ( uname VARCHAR(32), upass VARCHAR(32))
    RETURNS bit
    BEGIN
    IF EXISTS(SELECT * FROM UserLogin WHERE Username=uname AND Userpass=upass) THEN
		RETURN 1;
	ELSE 
		RETURN 0;
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
    
    CREATE WAF_Update_UserLogin(userloginidup VARCHAR(767), 
    
    
    
    DELIMITER $$
    CREATE PROCEDURE WAF_Delete_User ( userprofileiddel VARCHAR(767))
    BEGIN 
    DELETE FROM UserProfile 
    WHERE UserProfileID = userprofileiddel;
    DELETE FROM UserLogin
    WHERE UserProfileID = userprofileiddel;
    END;
    
    DELIMITER $$
    CREATE PROCEDURE WAF_Insert_Position (posid VARCHAR(767), posname VARCHAR(32))
    BEGIN
    DECLARE q VARCHAR(20);
    IF EXISTS(select * from UserJobPosition WHERE UserJobPosID LIKE posid OR UserJobName LIKE posname)THEN
		SET q="Jobname already registered";
	ELSE  
		INSERT INTO UserJobPosition(UserJobPosID, UserJobName, STSRC, DateIN, UserIN, DateUP, UserUP) 
			VALUES(posid, posname,'A',CURRENT_TIMESTAMP,'ADMIN',NULL,NULL);
	END IF;
    END;
    
    
    DELIMITER $$
    CREATE PROCEDURE WAF_Update_Position (posidup VARCHAR(767), posnameup VARCHAR(32))
    BEGIN
    UPDATE UserJobPosition 
    SET UserJobName=posnameup,
		STSRC=stsrcup,
        DateUP=CURRENT_TIMESTAMP,
        UserUP='ADMIN'
    WHERE UserJobPosID=posidup;
    END;
    
    DELIMITER $$
    CREATE PROCEDURE WAF_Delete_Position (posiddel VARCHAR(767))
    BEGIN
    DELETE FROM UserJobPosition
    WHERE UserJobPosID=posiddel;
    END;

    
      
    DELIMITER $$
    CREATE PROCEDURE WAF_Update_UserLogin (userloginid VARCHAR(767), unameup VARCHAR(32), upassup VARCHAR(32))
    BEGIN
    DECLARE alert VARCHAR(32);
    IF EXISTS (Select UserLoginID FROM UserLogin WHERE Username=unameup) THEN
		SET alert="Username Taken";
	ELSE 
		UPDATE UserLogin 
        SET Username=unameup,
			Userpass=upassup,
            STSRC='A',
            DateUP=CURRENT_TIMESTAMP,
            UserUP='ADMIN'
		WHERE UserLoginID=userloginid;
        SET alert="Update Successful";
	END IF;
    END;
    
