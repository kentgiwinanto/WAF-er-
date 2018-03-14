CREATE DATABASE WAFer

USE WAFer
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
    
    use WAFer
    
CREATE TABLE Transactions(
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
	messageID VARCHAR (767),
    STSRC VARCHAR(1),
    DateIN DATETIME,
    UserIN VARCHAR(32),
    DateUP DATETIME,
    UserUP VARCHAR(32),
    FOREIGN KEY (requestID) REFERENCES Requests(requestID) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (responseID) REFERENCES Responses(responseID) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (producerID) REFERENCES Producer(producerID) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (messageID) REFERENCES Messages(messageID) ON UPDATE CASCADE ON DELETE CASCADE
    )
    
CREATE TABLE ReqHeaders(
	reqheader VARCHAR(767) PRIMARY KEY,
	host VARCHAR(767),
	useragent VARCHAR(767),
	cookie VARCHAR(767),
	accept VARCHAR(767),
	acceptlang VARCHAR(767),
	acceptencd VARCHAR(767),
	connection VARCHAR(767),
	pragma VARCHAR(767),
	cachecontrol VARCHAR(767),
	upgrade_insecure_request VARCHAR(767),
	STSRC VARCHAR(1),
    UserIN VARCHAR(32),
	DateIN DATETIME,
    UserUP VARCHAR(32),
    DateUP DATETIME
    )
    
CREATE TABLE Requests (
    requestID VARCHAR(767) Primary Key,
    method VARCHAR(767),
    httpversion VARCHAR(767),
    URI VARCHAR(767),
    reqheader VARCHAR(767),
    FOREIGN KEY (reqheader) REFERENCES ReqHeaders(reqheader) ON UPDATE CASCADE ON DELETE CASCADE,
    STSRC VARCHAR(1),
    UserIN VARCHAR(32),
	DateIN DATETIME,
    UserUP VARCHAR(32),
    DateUP DATETIME
	)
    
CREATE TABLE ResHeaders (
	resheader VARCHAR(767)PRIMARY KEY,
    server VARCHAR(100),
	date VARCHAR(100),
	contentleng VARCHAR(767),
	contenttype VARCHAR(767),
	connection VARCHAR(767),
    STSRC VARCHAR(1),
    UserIN VARCHAR(32),
	DateIN DATETIME,
    UserUP VARCHAR(32),
    DateUP DATETIME
    )
    
CREATE TABLE Responses (
	responseID VARCHAR(767) PRIMARY KEY,
    httpcode VARCHAR(767),
    resheader VARCHAR(767),
    FOREIGN KEY (resheader) REFERENCES ResHeaders(resheader) ON UPDATE CASCADE ON DELETE CASCADE,
    STSRC VARCHAR(1),
    UserIN VARCHAR(32),
	DateIN DATETIME,
    UserUP VARCHAR(32),
    DateUP DATETIME
    )
    
CREATE TABLE Producer (
	producerID VARCHAR(767) PRIMARY KEY,
	modsec VARCHAR(767),
	connector VARCHAR(767),
	secrule_eng VARCHAR(767),
	components VARCHAR(767),
	STSRC VARCHAR(1),
    UserIN VARCHAR(32),
	DateIN DATETIME,
    UserUP VARCHAR(32),
    DateUP DATETIME
	)
    
CREATE TABLE Messages (
	messageID VARCHAR(767)PRIMARY KEY,
	themessages VARCHAR(767),
	msgmatch VARCHAR(767),
    reqheader VARCHAR(767),
	FOREIGN KEY (reqheader) REFERENCES ReqHeaders(reqheader) ON UPDATE CASCADE ON DELETE CASCADE,
	severity VARCHAR(3),
	ver VARCHAR(100),
	rev VARCHAR(100),
	maturity VARCHAR(3),
	accuracy VARCHAR(3),
    STSRC VARCHAR(1),
    UserIN VARCHAR(32),
	DateIN DATETIME,
    UserUP VARCHAR(32),
    DateUP DATETIME
	)
    
CREATE TABLE DetailMessageTag(
	TagID VARCHAR(100),
	messageID VARCHAR(767),
	FOREIGN KEY (messageID) REFERENCES Messages(MessageID) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (TagID) REFERENCES Tag(TagID) ON UPDATE CASCADE ON DELETE CASCADE,
	STSRC VARCHAR(1),
    UserIN VARCHAR(32),
	DateIN DATETIME,
    UserUP VARCHAR(32),
    DateUP DATETIME
    )
    
    DROP TABLE DetailMessageTag
    
CREATE TABLE Tag(
	TagID VARCHAR(100) PRIMARY KEY,
    Tagname VARCHAR(200),
    STSRC VARCHAR(1),
    UserIN VARCHAR(32),
	DateIN DATETIME,
    UserUP VARCHAR(32),
    DateUP DATETIME
	)
    
CREATE TABLE TransactionDetails(
    TransactionID VARCHAR(767),
    messageID VARCHAR(767),
    FOREIGN KEY (TransactionID) REFERENCES Transactions(TransactionID) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (messageID) REFERENCES Messages(messageID) ON UPDATE CASCADE ON DELETE CASCADE,
    STSRC VARCHAR(1),
    UserIN VARCHAR(32),
	DateIN DATETIME,
    UserUP VARCHAR(32),
    DateUP DATETIME
    )

    DROP TABLE TransactionDetails
    
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
    
    DROP PROCEDURE WAF_Insert_Register
    
     

    
    
    
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
    
    DELIMITER $$
    CREATE PROCEDURE WAF_Insert_Log(
    
    
    
    
    
	
    

    
 

    
    
    