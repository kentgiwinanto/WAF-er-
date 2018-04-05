DROP DATABASE WAFer;
CREATE DATABASE WAFer;
use WAFer;


	CREATE TABLE UserJobPosition(
		STSRC VARCHAR(1),
		DateIN DATETIME,
		UserIN VARCHAR(32),
		DateUP DATETIME,
		UserUP VARCHAR(32),
		UserJobPosID VARCHAR(1024)PRIMARY KEY,
		UserJobName VARCHAR(32) NOT NULL    
		);
    
    
    
	CREATE TABLE UserProfile(
		STSRC VARCHAR(1),
		DateIN DATETIME,
		UserIN VARCHAR(32),
		DateUP DATETIME,
		UserUP VARCHAR(32),
		UserProfileID VARCHAR(1024) PRIMARY KEY,
		FirstName VARCHAR(32) NOT NULL,
		LastName VARCHAR(32) NOT NULL,    
		UserJobPosID VARCHAR(1024), 
		FOREIGN KEY (UserJobPosID) REFERENCES UserJobPosition(UserJobPosID) ON UPDATE CASCADE ON DELETE CASCADE
	   );
		



	CREATE TABLE UserLogin(
		STSRC VARCHAR(1),
		DateIN DATETIME,
		UserIN VARCHAR(32),
		DateUP DATETIME,
		UserUP VARCHAR(32),
		UserProfileID VARCHAR(1024) NOT NULL,
		FOREIGN KEY (UserProfileID) REFERENCES UserProfile(UserProfileID) ON UPDATE CASCADE ON DELETE CASCADE,
		UserLoginID VARCHAR(1024) PRIMARY KEY,
		Username VARCHAR(32) NOT NULL,
		Userpass VARCHAR(64) NOT NULL
		);    
        
        CREATE TABLE headersRequestTransactionLog (
		Stsrc VARCHAR (1),
		UserIn VARCHAR (32),
		DateIn DATETIME,
		UserUp VARCHAR (32),
		DateUp DATETIME,
		headersRequestTransactionLogID VARCHAR (1024) PRIMARY KEY,
		Cache_Control VARCHAR (24),
		Origin VARCHAR (64),
		User_agent VARCHAR (128),
		Content_Type VARCHAR (64),
		Content_Length VARCHAR (8),
		Connection VARCHAR (64),
		Host VARCHAR (64),
		Referer VARCHAR (64),
		Accept_encoding VARCHAR (128),
		Cookie VARCHAR (1024));
	
	
	CREATE TABLE RequestTransactionLog (
		Stsrc VARCHAR (1),
		UserIn VARCHAR (32),
		DateIn DATETIME,
		UserUp VARCHAR (32),
		DateUp DATETIME,
		RequestTransactionLogID VARCHAR (1024) PRIMARY KEY,
		Method VARCHAR (4),
		HTTP_Version VARCHAR (3),
		Uri VARCHAR (64),
		headersRequestTransactionLogID VARCHAR (1024),
		FOREIGN KEY (headersRequestTransactionLogID) REFERENCES headersRequestTransactionLog (headersRequestTransactionLogID) ON UPDATE CASCADE ON DELETE CASCADE
		
	);
	
	CREATE TABLE ServerList (
		Stsrc VARCHAR (1),
		UserIn VARCHAR (32),
		DateIn DATETIME,
		UserUp VARCHAR (32),
		DateUp DATETIME,
		ServerID VARCHAR (1024) PRIMARY KEY,
		ServerName VARCHAR (64),
		IP VARCHAR (16),
		PortsOpen VARCHAR (8),
		Domain VARCHAR (32)
	);    
	
	CREATE TABLE HeadersResponseTransactionLog (
		stsrc VARCHAR(1),
		UserIn VARCHAR(32),
		DateIn DATETIME,
		UserUp VARCHAR(32),
		DateUp DATETIME,
		HeadersResponseTransactionLogID VARCHAR(1024) PRIMARY KEY,
		server VARCHAR(64),
		date DATETIME,
		content_length VARCHAR(8),
		content_type VARCHAR(64),
		connection VARCHAR(64)
	);



	CREATE TABLE ResponseTransactionLog (
		stsrc VARCHAR(1),
		UserIn VARCHAR(32),
		DateIn DATETIME,
		UserUp VARCHAR(32),
		DateUp DATETIME,
		ResponseTransactionLogID VARCHAR(1024) PRIMARY KEY,
		HTTP_code VARCHAR(3),
		HeadersResponseTransactionLogID VARCHAR(1024),
        FOREIGN KEY (HeadersResponseTransactionLogID) REFERENCES HeadersResponseTransactionLog(HeadersResponseTransactionLogID) ON UPDATE CASCADE ON DELETE CASCADE
	);
    
	CREATE TABLE EncryptionType
	(
		Stsrc VARCHAR(1),
		UserIn VARCHAR(32),
		DateIn Datetime,
		UserUp VARCHAR(32),
		DateUp Datetime,
		EncryptionTypeID VARCHAR(1024) PRIMARY KEY,
		EncryptionTypeName VARCHAR(1024)
	);

	CREATE TABLE ProducerTransactionLog
	(
		Stsrc VARCHAR(1),
		UserIn VARCHAR(32),
		DateIn Datetime,
		UserUp VARCHAR(32),
		DateUp Datetime,
		ProducerTransactionLogID VARCHAR(1024) PRIMARY KEY,
		ModSecurity VARCHAR(128),
		Connector VARCHAR(128),
		SecRules_engine VARCHAR(128),
		Components VARCHAR(128)
	);

	CREATE TABLE TagsMessageTransactionDetailLog
	(
		Stsrc VARCHAR(1),
		UserIn VARCHAR(32),
		DateIn Datetime,
		UserUp VARCHAR(32),
		DateUp Datetime,
		TagsMessageTransactionDetailLogID VARCHAR(1024) PRIMARY KEY,
		TagsMessageID VARCHAR(1024),
		Message TEXT
	);

	CREATE TABLE DetailMessageTransactionDetailLog
	(
		Stsrc VARCHAR(1),
		UserIn VARCHAR(32),
		DateIn Datetime,
		UserUp VARCHAR(32),
		DateUp Datetime,
		DetailMessageTransactionDetailLogID VARCHAR(1024) PRIMARY KEY,
		DetailMatch VARCHAR(256),
		Reference VARCHAR(256),
		RuleID VARCHAR(512),
		DetailMessageTransactionDetailFile VARCHAR(512),
		LineNumber VARCHAR(16),
		Data VARCHAR(512),
		Severity VARCHAR(512),
		ver VARCHAR(16),
		rev VARCHAR(16),
		TagsMessageTransactionDetailLogID VARCHAR(1024),
		FOREIGN KEY (TagsMessageTransactionDetailLogID) REFERENCES TagsMessageTransactionDetailLog(TagsMessageTransactionDetailLogID) ON UPDATE CASCADE ON DELETE CASCADE,
		Maturity VARCHAR(8),
		Accuracy VARCHAR(8)
	);

	CREATE TABLE MessageTransactionLogDetail
	(
		Stsrc VARCHAR(1),
		UserIn VARCHAR(32),
		DateIn Datetime,
		UserUp VARCHAR(32),
		DateUp Datetime,
		MessageTransactionLogDetailID VARCHAR(1024) PRIMARY KEY,
		MessageTransactionLog VARCHAR(1024),
		DetailMessageTransactionDetailLogID VARCHAR(1024),
		FOREIGN KEY (DetailMessageTransactionDetailLogID) REFERENCES DetailMessageTransactionDetailLog(DetailMessageTransactionDetailLogID) ON UPDATE CASCADE ON DELETE CASCADE
	);

	CREATE TABLE MessageTransactionLog
	(
		Stsrc VARCHAR(1),
		UserIn VARCHAR(32),
		DateIn Datetime,
		UserUp VARCHAR(32),
		DateUp Datetime,
		MessageTransactionLogID VARCHAR(1024) PRIMARY KEY,
		MessageTransactionLogDetailID VARCHAR(1024),
		FOREIGN KEY (MessageTransactionLogDetailID) REFERENCES MessageTransactionLogDetail(MessageTransactionLogDetailID) ON UPDATE CASCADE ON DELETE CASCADE
	);

	
	CREATE TABLE TransactionLog (
		Stsrc VARCHAR (1),
		UserIn VARCHAR (32),
		DateIn DATETIME,
		UserUp VARCHAR (32),
		DateUp DATETIME,
		TransactionLogID VARCHAR (1024) PRIMARY KEY,
		LogId VARCHAR (64),
		TimeStamp DATETIME,
		Host_IP VARCHAR (24),
		Host_Port VARCHAR (6),
		Client_Port VARCHAR (6),
		RequestTransactionLogID VARCHAR (1024),
		FOREIGN KEY (RequestTransactionLogID) REFERENCES RequestTransactionLog (RequestTransactionLogID) ON UPDATE CASCADE ON DELETE CASCADE,
		ResponseTransactionLogID VARCHAR (1024),
		FOREIGN KEY (ResponseTransactionLogID) REFERENCES ResponseTransactionLog (ResponseTransactionLogID) ON UPDATE CASCADE ON DELETE CASCADE,
		ProducerTransactionLogID VARCHAR (1024),
		FOREIGN KEY (ProducerTransactionLogID) REFERENCES ProducerTransactionLog (ProducerTransactionLogID) ON UPDATE CASCADE ON DELETE CASCADE,
		MessageTransactionLogID VARCHAR (1024),
		FOREIGN KEY (MessageTransactionLogID) REFERENCES MessageTransactionLog (MessageTransactionLogID) ON UPDATE CASCADE ON DELETE CASCADE
			);
	
	
	
	CREATE TABLE WAF_Logs (
		Stsrc VARCHAR (1),
		UserIn VARCHAR (32),
		DateIn DATETIME,
		UserUp VARCHAR (32),
		DateUp DATETIME,
		WAF_LogsID VARCHAR (1024) PRIMARY KEY,
		TimeStampLog DATETIME,
		ServerID VARCHAR (1024),
		FOREIGN KEY (ServerID) REFERENCES ServerList(ServerID) ON UPDATE CASCADE ON DELETE CASCADE,
		LogFile TEXT,
		EncryptionTypeID VARCHAR (1024),
		FOREIGN KEY (EncryptionTypeID) REFERENCES EncryptionType (EncryptionTypeID) ON UPDATE CASCADE ON DELETE CASCADE,
		EncryptionKey TEXT,
		TransactionLogID VARCHAR (1024),
		FOREIGN KEY (TransactionLogID) REFERENCES TransactionLog (TransactionLogID) ON UPDATE CASCADE ON DELETE CASCADE
	);
    
		CREATE TABLE Config
	(
		Stsrc VARCHAR(1),
		UserIn VARCHAR(32),
		DateIn Datetime,
		UserUp VARCHAR(32),
		DateUp Datetime,
		ConfigID VARCHAR(1024) PRIMARY KEY,
		ConfigName VARCHAR(64),
		Description TEXT,
		Syntax VARCHAR(1024),
		DefaultValue VARCHAR(32),
		Scope VARCHAR(32),
		Version VARCHAR(32)
	);

	CREATE TABLE Variable
	(
		Stsrc VARCHAR(1),
		UserIn VARCHAR(32),
		DateIn Datetime,
		UserUp VARCHAR(32),
		DateUp Datetime,
		VariableID VARCHAR(1024) PRIMARY KEY,
		VariableName VARCHAR(64),
		Description TEXT
	);

	CREATE TABLE SecRules
	(
		Stsrc VARCHAR(1),
		UserIn VARCHAR(32),
		DateIn Datetime,
		UserUp VARCHAR(32),
		DateUp Datetime,
		SecrulesID VARCHAR(1024) PRIMARY KEY,
		SecrulesName VARCHAR(512),
		VariableID VARCHAR(1024),
		FOREIGN KEY (VariableID) REFERENCES Variable(VariableID) ON UPDATE CASCADE ON DELETE CASCADE    
	);

	SET @posadmin=CONCAT('UserJobPosID_',Substring(uuid(),1,13));
	SET @posstaff=CONCAT('UserJobPosID_',Substring(uuid(),1,13));
	SET @posbot=CONCAT('UserJobPosID_',Substring(uuid(),1,13));

    INSERT INTO UserJobPosition(UserJobPosID, UserJobName, STSRC, DateIN, UserIN, DateUP, UserUP)
        VALUES (@posadmin,'ADMIN','A',CURRENT_TIMESTAMP,'SYSTEM',NULL,NULL);
    INSERT INTO UserJobPosition(UserJobPosID,UserJobName,STSRC,DateIN,UserIN,DateUP,UserUP)
        VALUES (@posstaff,'STAFF','A',CURRENT_TIMESTAMP,'SYSTEM',NULL,NULL);   
	INSERT INTO UserJobPosition(UserJobPosID,UserJobName,STSRC,DateIN,UserIN,DateUP,UserUP)
        VALUES (@posbot,'BOT','A',CURRENT_TIMESTAMP,'SYSTEM',NULL,NULL);
			

	SET @userprofileidad=CONCAT('UserProfileID_',Substring(uuid(),1,13));
    SET @userloginidad=CONCAT('UserLoginID_',Substring(uuid(),1,13));
     

    INSERT INTO UserProfile(UserProfileID,FirstName,LastName,STSRC,UserIN,DateIN,UserJobPosID,DateUP,UserUP)
        VALUES (@userprofileidad,'Super','User','A','SYSTEM',CURRENT_TIMESTAMP,@posadmin,NULL,NULL);
    
    INSERT INTO UserLogin(UserLoginID,Username,Userpass,STSRC,DateIN,UserIN,DateUP,UserUP,UserProfileID)
        VALUES(@userloginidad,'Super.User',SHA2('tangowaferchocolate999',256),'A',CURRENT_TIMESTAMP,'SYSTEM',NULL,NULL,@userprofileidad);
		

DELIMITER $$
CREATE PROCEDURE `WAF_Insert_Register`(
		firstnamein VARCHAR(32),
		lastnamein VARCHAR(32), 
		positionin VARCHAR(900), 
		userpassin VARCHAR(32),
		userinin VARCHAR(32))
BEGIN
	-- ===================================		
	-- Created By: Rizky Gunawan Liga
	-- Created Date: 04 - 04 - 2018
	-- Description: Penambahan User
	-- ===================================    
	DECLARE a VARCHAR(20);
    SET @username= CONCAT(firstnamein,'.',lastnamein);
    SET @userpass= SHA2(CONCAT(@username,userpassin),256);
    
	
    IF EXISTS(SELECT UserLoginID FROM UserLogin WHERE Username=@username) THEN
	        SET a='Username is taken';
    ELSE 
		SET @userloginid=CONCAT('UserLoginID_',Substring(uuid(),1,13));
		SET @userprofileid=CONCAT('UserProfileID_',Substring(uuid(),1,13));        
        INSERT INTO UserProfile(UserProfileID,FirstName,LastName,UserJobPosID,STSRC,DateIN,UserIN,DateUP,UserUP) 
            VALUES(@userprofileid,firstnamein,lastnamein,positionin,'A',CURRENT_TIMESTAMP,userinin,NULL,NULL);
        INSERT INTO UserLogin(UserLoginID,Username,Userpass,UserProfileID,STSRC,DateIN,UserIN,DateUP,UserUP)
            VALUES (@userloginid,@username,@userpass,@userprofileid,'A',CURRENT_TIMESTAMP,userinin,NULL,NULL);
        SET a ='User Registered'; 
    END IF;
	END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `WAF_Read_Login`( uname VARCHAR(32), upass VARCHAR(32))
BEGIN
-- ======================================================
-- Created By : Rizky Gunawan Liga   
-- Date Created: 04 April 2018
-- Description: buat show user data/ read data user 
-- ======================================================
    DECLARE b VARCHAR(50);
	SET @uname=uname;
    SET @upass=SHA2(CONCAT(@uname,upass),256);
    IF NOT EXISTS(SELECT * FROM UserLogin WHERE Username=@uname AND Userpass=@upass) THEN
        SET b='Username or Password Invalid';
    ELSE     
        SELECT a.FirstName, 
        a.LastName, 
        a.UserProfileID, 
        a.UserJobPosID, 
        b.UserJobName
        FROM UserProfile a
        JOIN UserJobPosition b ON a.UserJobPosID=b.UserJobPosID
        JOIN UserLogin c ON c.UserProfileID=a.UserProfileID
        WHERE c.Username=@uname AND c.Userpass=@upass;
    END IF;
    END$$
DELIMITER ;
  


     DELIMITER $$
	 CREATE PROCEDURE `WAF_Insert_Log`    (
	 EncryptionTypeIDin VARCHAR(1024),    
	 ServerIDin VARCHAR(1024),    
	 userinin VARCHAR(32),
     xmlstring VARCHAR(65531)
	   )   
	 BEGIN    
-- ================================================
-- Created By: Rizky Khonan Kentgi
-- Date Created: 27 - 03 - 2018
-- Description: SP untuk MASUKIN LOG DARI XML
-- ================================================
     SET @xmlstring=xmlstring;  
	 SET @waflogsid=CONCAT('WAF_LogsID_',Substring(uuid(),1,13));    
	 SET @transactionlogid=CONCAT('TransactionLogID_',Substring(uuid(),1,13));    
	 SET @requestid=CONCAT('RequestTransactionLogID_',Substring(uuid(),1,13));    
	 SET @requestheaderid=CONCAT('headersRequestTransactionID_',Substring(uuid(),1,13));    
	 SET @responseid=concat('ResponseTransactionLogID_',Substring(uuid(),1,13));    
	 SET @responseheaderid=CONCAT('headersResponseTransactionLog_',Substring(uuid(),1,13));    
	 SET @producerid=CONCAT('ProducerTransactionLogID_',Substring(uuid(),1,13));    
	 SET @messageid=CONCAT('MessageTransactionLogID_',Substring(uuid(),1,13));    
	 SET @messagelogdetailid=CONCAT('MessageTransactionLogDetailID_',Substring(uuid(),1,13));    
	 SET @tagmessageid=CONCAT('TagsMessageID_',Substring(uuid(),1,13));    
	 
	 INSERT INTO ProducerTransactionLog(    
	 Stsrc,    
	 UserIn,    
	 DateIn,    
	 UserUp,    
	 DateUp,    
	 ProducerTransactionLogID,    
	 ModSecurity,    
	 Connector,    
	 SecRules_engine,    
	 Components)    
	 SELECT 'A',@userin,CURRENT_TIMESTAMP,null,null,@producerid,    
	 ExtractValue(@xmlstring,'//XML/Producer[1]/ModSecurity') as 'ModSecurity',    
	 ExtractValue(@xmlstring,'//XML/Producer[1]/Connector') as 'Connector',     
	 ExtractValue(@xmlstring,'//XML/Producer[1]/SecRules_engine') as 'SecRules_engine',   
	 ExtractValue(@xmlstring,'//XML/Producer[1]/Components') as 'Components';  
	 
     
	 INSERT INTO headersRequestTransactionLog(    
	 Stsrc,    
	 UserIn,    
	 DateIn,    
	 UserUp,    
	 DateUp,    
	 headersRequestTransactionLogID,    
	 Cache_Control,    
	 Origin,    
	 User_agent,    
	 Content_Type,    
	 Content_Length,    
	 Connection,    
	 Host,    
	 Referer,    
	 Accept_encoding,    
	 Cookie    
	 )    
	 SELECT 'A',@userin,CURRENT_TIMESTAMP,null,null,@requestheaderid,    
	 Extractvalue(@xmlstring,'//XML/RequestDetails[1]/Cache_Control') as 'Cache_Control',    
	 Extractvalue(@xmlstring,'//XML/RequestDetails[1]/Origin') as 'Origin',    
	 Extractvalue(@xmlstring,'//XML/RequestDetails[1]/User_Agent') as 'User_agent',    
	 ExtractValue(@xmlstring,'//XML/RequestDetails[1]/Content_Type') as 'Content_Type',    
	 ExtractValue(@xmlstring,'//XML/RequestDetails[1]/Content_Length') as 'Content_Length',    
	 ExtractValue(@xmlstring,'//XML/RequestDetails[1]/Connection') as 'Connection',    
	 ExtractValue(@xmlstring,'//XML/RequestDetails[1]/Host') as 'Host',    
	 ExtractValue(@xmlstring,'//XML/RequestDetails[1]/Referer') as 'Referer',    
	 ExtractValue(@xmlstring,'//XML/RequestDetails[1]/Accept_encoding') as 'Accept_encoding',    
	 ExtractValue(@xmlstring,'//XML/RequestDetails[1]/Cookie') as 'Cookie' ;  
	     
     
	 INSERT INTO RequestTransactionLog(    
	 Stsrc,    
	 UserIn,    
	 DateIn,    
	 RequestTransactionLogID,    
	 Method,    
	 HTTP_Version,    
	 Uri,    
	 headersRequestTransactionLogID    
	 )    
	 SELECT     
	 'A',    
	 @userin,    
	 current_timestamp,    
	 @requestid,    
	 ExtractValue(@xmlstring,'//XML/RequestLog[1]/Method') as 'Method',    
	 ExtractValue(@xmlstring,'//XML/RequestLog[1]/HTTP_Version') as 'HTTP_Version',    
	 ExtractValue(@xmlstring,'//XML/RequestLog[1]/Uri') as 'Uri',    
	 @requestheaderid;    
	    
     
    
	 INSERT INTO HeadersResponseTransactionLog(    
	 stsrc,    
	 UserIn,    
	 DateIn,    
	 UserUp,    
	 DateUp,    
	 HeadersResponseTransactionLogID,    
	 server,    
	 date,    
	 content_length,    
	 content_type,    
	 connection    
	 )    
	 SELECT 'A',@userin,CURRENT_TIMESTAMP,null,null,@responseheaderid,    
	  ExtractValue(@xmlstring,'//XML/ResponseDetails[1]/Server') as 'Server',    
	  ExtractValue(@xmlstring,'//XML/ResponseDetails[1]/Date') as 'Date',    
	  ExtractValue(@xmlstring,'//XML/ResponseDetails[1]/Content_Length') as 'Content_Length',    
	  ExtractValue(@xmlstring,'//XML/ResponseDetails[1]/Content_Type') as 'Content_Type',    
	  ExtractValue(@xmlstring,'//XML/ResponseDetails[1]/Connection') as 'Connection';    
	  
    
     
	 INSERT INTO ResponseTransactionLog(    
	 stsrc,    
	 UserIn,    
	 DateIn,    
	 UserUp,    
	 DateUp,    
	 ResponseTransactionLogID,    
	 HTTP_code,    
	 HeadersResponseTransactionLogID    
	 )    
	 SELECT     
	 'A',    
	 @userin,    
	 current_timestamp,    
	 null,    
	 null,    
	 @responseid,    
	 ExtractValue(@xmlstring,'//XML/ResponseLog[1]/HTTP_code') as HTTP_code,    
	 @responseheaderid;    
	  
     
     SET @COUNTTAG = (SELECT EXTRACTVALUE(@xmlstring,'COUNT(//XML/DetailMessage[1]/Tags[1]/elements)'));
     SET @i=1;
     WHILE (@i <= @COUNTTAG) DO
     SET @tagmessagedetailid=CONCAT('TagsMessageTransactionDetailLogID_',Substring(uuid(),1,13));    
     INSERT INTO TagsMessageTransactionDetailLog(    
	 Stsrc,    
	 UserIn,    
	 DateIn,    
	 UserUp,    
	 DateUp,    
	 TagsMessageTransactionDetailLogID,    
	 TagsMessageID,    
	 Message    
	 )
	 SELECT     
	 'A',    
	 @userin,    
	 current_timestamp,    
	 null,    
	 null,    
	 @tagmessagedetailid,    
	 @tagmessageid,    
	 ExtractValue(@xmlstring,CONCAT('//XML/DetailMessage[1]/Tags[1]/elements[',@i,']')) as 'Message';
     SET @i=@i+1;
     END WHILE;
     
     
     
     SET @COUNTMES = (SELECT EXTRACTVALUE(@xmlstring,'COUNT(//XML/DetailMessage)'));
     SET @j:=1;
     WHILE(@j <= @COUNTMES)DO
     SET @detailmessageid=CONCAT('DetailMessageTransactionDetailLogID_',Substring(uuid(),1,13));
     	 INSERT INTO DetailMessageTransactionDetailLog(    
	 Stsrc,    
	 UserIn,    
	 DateIn,    
	 UserUp,    
	 DateUp,    
	 DetailMessageTransactionDetailLogID,    
	 DetailMatch,    
	 Reference,    
	 RuleID,    
	 DetailMessageTransactionDetailFile,    
	 LineNumber,    
	 Data,    
	 Severity,    
	 ver,    
	 rev,    
	 TagsMessageTransactionDetailLogID,    
	 Maturity,    
	 Accuracy    
	 )    
	 SELECT     
	 'A',    
	 @userin,    
	 current_timestamp,    
	 null,    
	 null,    
	 @detailmessageid,    
	 ExtractValue(@xmlstring,CONCAT('//XML/DetailMessage[',@j,']/Match')) as 'Match',    
	 ExtractValue(@xmlstring,CONCAT('//XML/DetailMessage[',@j,']/Reference'))as 'Reference',    
	 ExtractValue(@xmlstring,CONCAT('//XML/DetailMessage[',@j,']/RuleID'))as 'RuleID',    
	 ExtractValue(@xmlstring,CONCAT('//XML/DetailMessage[',@j,']/File'))as 'DetailMessageTransactionDetailFile',    
	 ExtractValue(@xmlstring,CONCAT('//XML/DetailMessage[',@j,']/LineNumber'))as 'LineNumber',    
	 ExtractValue(@xmlstring,CONCAT('//XML/DetailMessage[',@j,']/Data'))as 'Data',    
	 ExtractValue(@xmlstring,CONCAT('//XML/DetailMessage[',@j,']/Severity'))as 'Severity',    
	 ExtractValue(@xmlstring,CONCAT('//XML/DetailMessage[',@j,']/ver'))as 'ver',    
	 ExtractValue(@xmlstring,CONCAT('//XML/DetailMessage[',@j,']/rev'))as 'rev',    
	 @tagmessagedetailid,    
	 ExtractValue(@xmlstring,CONCAT('//XML/DetailMessage[',@j,']/Maturity'))as 'Maturity',    
	 ExtractValue(@xmlstring,CONCAT('//XML/DetailMessage[',@j,']/Accuracy'))as 'Accuracy';
	 SET @j= @j+1;
     END WHILE;
     
	 INSERT INTO MessageTransactionLogDetail(    
	 Stsrc,    
	 UserIn,    
	 DateIn,    
	 MessageTransactionLogDetailID,    
	 MessageTransactionLog,    
	 DetailMessageTransactionDetailLogID    
	 )    
	 SELECT     
	 'A',    
	 @userin,    
	 current_timestamp,    
	 @messagelogdetailid,    
	 ExtractValue(@xmlstring,'//XML/MessageName[1]/Message') as 'Message',    
	 @detailmessageid;
    
     
	 INSERT INTO MessageTransactionLog(    
	 Stsrc,    
	 UserIn,    
	 DateIn,    
	 MessageTransactionLogID,    
	 MessageTransactionLogDetailID    
	 )    
	 VALUES (    
	 'A',    
	 @userin,    
	 current_timestamp,    
	 @messageid,    
	 @messagelogdetailid    
	 );    
     
     

    
	 INSERT INTO TransactionLog(    
	 Stsrc,    
	 UserIn,    
	 DateIn,    
	 TransactionLogID,    
	 TimeStamp,    
	 Host_IP,    
	 Host_Port,    
	 Client_Port,    
	 RequestTransactionLogID,    
	 ResponseTransactionLogID,    
	 ProducerTransactionLogID,    
	 MessageTransactionLogID,    
	 LogID    
	 )    
	 SELECT     
	 'A',    
	 @userin,    
	 CURRENT_TIMESTAMP,    
	 @transactionlogid,    
	 ExtractValue(@xmlstring,'//XML/TransactionLog[1]/TimeStamp') as 'TimeStamp',    
	 ExtractValue(@xmlstring,'//XML/TransactionLog[1]/Host_IP')as 'Host_IP',    
	 ExtractValue(@xmlstring,'//XML/TransactionLog[1]/Host_Port')as 'Host_Port',    
	 ExtractValue(@xmlstring,'//XML/TransactionLog[1]/Client_Port')as 'Client_Port',    
	 @requestid,    
	 @responseid,    
	 @producerid,    
	 @messageid,    
	 ExtractValue(@xmlstring,'//XML/TransactionLog[1]/LogID')as 'LogID';    
      
	 INSERT INTO WAF_Logs(    
	 Stsrc,    
	 UserIn,    
	 DateIn,    
	 UserUp,    
	 DateUp,    
	 WAF_LogsID,    
	 TimeStampLog,    
	 ServerID,    
	 LogFile,    
	 EncryptionTypeID,    
	 EncryptionKey,    
	 TransactionLogID    
	 )    
	 SELECT     
	 'A',    
	 @userin,    
	 CURRENT_TIMESTAMP,    
	 null,    
	 null,    
	 @waflogsid,    
	 ExtractValue(@xmlstring,'//XML/WAF_Logs[1]/TimeStampLog')as 'TimeStampLog',    
	 @ServerID,    
	 ExtractValue(@xmlstring,'//XML/WAF_Logs[1]/AllMessages')as 'LogFile',    
	 @EncryptionTypeID,    
	 ExtractValue(@xmlstring,'//XML/WAF_Logs[1]/EncryptionKey')as 'EncryptionKey',    
	 @transactionlogid;  
	 END$$
     DELIMITER;
	


	DELIMITER $$
	CREATE PROCEDURE `WAF_Read_Logs`()
	BEGIN
-- ============================================================
-- Created By: Rizky Gunawan Liga
-- Date Created: 23-03-2018
-- Description: Create procedure untuk baca Log dr smua table
-- ============================================================
	SELECT 
		a.WAF_LogsID,
		a.TimeStampLog,
		a.LogFile,
		a.EncryptionKey,
		b.ServerName,
		d.EncryptionTypeName,
		c.TimeStamp,
		c.Host_IP,
		c.Host_Port,
		c.LogID,
		e.Method,
		e.HTTP_Version,
		e.Uri,
		i.Cache_Control,
		i.Origin,
		i.User_agent,
		i.Content_Type,
		i.Content_Length,
		i.Connection,
		i.Host,
		i.Referer,
		i.Accept_encoding,
		i.Cookie,
		f.HTTP_code,
		j.server,
		j.date,
		j.content_length,
		j.content_type,
		j.connection,
		g.ModSecurity,
		g.Connector,
		g.SecRules_engine,
		g.Components,
		k.MessageTransactionLog,
		l.DetailMatch,
		l.Reference,
		l.RuleID,
		l.DetailMessageTransactionDetailFile as 'File',
		l.LineNumber,
		l.Data,
		l.Severity,
		l.ver,
		l.rev,
		m.TagsMessageID,
		m.Message,
		l.Maturity,
		l.Accuracy
	FROM
		WAF_Logs a
		JOIN ServerList b ON a.ServerID=b.ServerID
		JOIN TransactionLog c ON a.TransactionLogID=c.TransactionLogID
		JOIN EncryptionType d ON a.EncryptionTypeID=d.EncryptionTypeID
		JOIN RequestTransactionLog e ON c.RequestTransactionLogID=e.RequestTransactionLogID
		JOIN ResponseTransactionLog f ON c.ResponseTransactionLogID=f.ResponseTransactionLogID
		JOIN ProducerTransactionLog g ON c.ProducerTransactionLogID=g.ProducerTransactionLogID
		JOIN MessageTransactionLog h ON c.MessageTransactionLogID=h.MessageTransactionLogID
		JOIN headersRequestTransactionLog i ON i.headersRequestTransactionLogID=e.headersRequestTransactionLogID
		JOIN HeadersResponseTransactionLog j ON j.HeadersResponseTransactionLogID=f.HeadersResponseTransactionLogID
		JOIN MessageTransactionLogDetail k ON k.MessageTransactionLogDetailID=h.MessageTransactionLogDetailID
		JOIN DetailMessageTransactionDetailLog l ON  l.DetailMessageTransactionDetailLogID=k.DetailMessageTransactionDetailLogID
		JOIN TagsMessageTransactionDetailLog m ON m.TagsMessageTransactionDetailLogID=l.TagsMessageTransactionDetailLogID;
		END$$;
		DELIMITER;
        
    DELIMITER $$
    CREATE PROCEDURE `WAF_Insert_ServerList` (
		userinin VARCHAR (32),
		servernamein VARCHAR (64),
		ipin VARCHAR (16),
		portsopenin VARCHAR (8),
		domainin VARCHAR (32))
        BEGIN 
        /*--=======================================
	--Created By    : Albert Sudirwan
	--Created Date  : 26 March 2018
	--Description   : Penambahan Server List
	--=======================================
    */
        DECLARE a VARCHAR (20);
        
        IF EXISTS (SELECT IP FROM ServerList WHERE IP=ipin)
        THEN SET a ='IP Already Exists';
        ELSE
        SET @serverid =CONCAT('ServerID_',Substring(uuid(),1,13));
        INSERT INTO ServerList (ServerID,ServerName,IP,PortsOpen,Domain,Stsrc,UserIn,DateIn,UserUp,Dateup)
        VALUES (@serverid,servernamein,ipin,portsopenin,domainin,'A',userin,CURRENT_TIMESTAMP,NULL,NULL);
        SET a='Server Registered';
        END IF;
        END$$
        DELIMITER;
        
        
	DELIMITER $$
    CREATE PROCEDURE `WAF_Read_ServerList` ()
	BEGIN
	    /*--=======================================
	--Created By    : Albert Sudirwan
	--Created Date  : 26 March 2018
	--Description   : Menampilkan Server List
	--=======================================
    */
    
       SELECT ServerID,ServerName,IP,PortsOpen,Domain FROM ServerList; 
	END$$
    DELIMITER;
    
        
	DELIMITER $$
	CREATE PROCEDURE `WAF_Insert_EncryptionType`( 
		EncryptionTypeNamein VARCHAR(1024),
		UserIn VARCHAR(32))
	BEGIN
	-- ===================================================
	-- CREATED BY : RICHARD KHONAN
	-- CREATED DATE : 21 - MARCH -2018
	-- DESCRIPTION : PENAMBAHAN WAF_Insert_EncryptionType
	-- ===================================================

		SET @EncryptionTypeId=CONCAT('EncryptionTypeID_',Substring(uuid(),1,13));
		INSERT INTO EncryptionType(Stsrc,UserIn,DateIn,UserUp,DateUp,EncryptionTypeID,EncryptionTypeName)
			VALUES('A',UserIn,Current_Timestamp,NULL,Null,@EncryptionTypeId,EncryptionTypeNamein);
	END$$
    DELIMITER;
    

    DELIMITER $$
	CREATE PROCEDURE `WAF_Insert_Config`(
		userinin VARCHAR(32),
		confignamein VARCHAR(64),
		descriptionin TEXT,
		syntaxin VARCHAR(1024),
		defaultvaluein VARCHAR(32),
		scopein VARCHAR(32),
		versionin VARCHAR(32))
	BEGIN
	-- ================================
	-- AUTHOR       : RICHARD KHONAN
	-- CREATED DATE : 29 MARCH 2018
	-- DESCRIPTION  : PENAMBAHAN CONFIG
	-- ================================
    SET @configid = CONCAT('ConfigID_',Substring(uuid(),1,13));
    INSERT INTO Config (Stsrc,UserIn,DateIn,ConfigID,ConfigName,Description,Syntax,DefaultValue,Scope,Version)
        SELECT * FROM(SELECT 'A',userinin,CURRENT_TIMESTAMP,@configid,confignamein,descriptionin,syntaxin,defaultvaluein,scopein,versionin)AS TMP WHERE NOT EXISTS(SELECT ConfigName FROM Config WHERE ConfigName=confignamein)LIMIT 1;
    END$$
    DELIMITER ;


	DELIMITER $$
	CREATE PROCEDURE `WAF_Insert_SecRules`
	(
		userinin VARCHAR(32),
		secrulesnamein VARCHAR(64),
		variablenamein VARCHAR(64)
	)
	BEGIN
	-- ==================================
	-- AUTHOR 		: RICHARD KHONAN
	-- CREATED DATE : 29 MARCH 2018
	-- DESCRIPTION 	: PENAMBAHAN SECRULES
	-- ==================================
		SET @secrulesid=CONCAT('SecRulesID_',Substring(uuid(),1,13));
		SET @variableid= (SELECT VariableID FROM Variable WHERE VariableName=variablenamein);
		INSERT INTO SecRules (Stsrc,UserIn,DateIn,SecRulesID,SecRulesName,VariableID)
		SELECT * FROM (SELECT 'A',userinin,CURRENT_TIMESTAMP,@secrulesid,secrulesnamein,@variableid) as temp WHERE NOT EXISTS(SELECT SecRulesName FROM SecRules WHERE SecRulesName=secrulesnamein)LIMIT 1;
	END $$
	DELIMITER ;

	DELIMITER $$
	CREATE PROCEDURE `WAF_Insert_Variable`(
		userin VARCHAR(32),
		variablenamein VARCHAR(64),
		descriptionin TEXT
	)
	BEGIN
	-- ==================================
	-- AUTHOR       : RICHARD KHONAN
	-- CREATED DATE : 29 MARCH 2018
	-- DESCRIPTION  : PENAMBAHAN VARIABLE
	-- ==================================

		SET @variableid=CONCAT('VariableID_',Substring(uuid(),1,13));
		INSERT INTO Variable (Stsrc,UserIn,DateIn,VariableID,VariableName,Description)
			SELECT * FROM(SELECT 'A',userin,CURRENT_TIMESTAMP,@variableid,variablenamein,descriptionin)AS tmp WHERE NOT EXISTS(SELECT VariableName FROM Variable WHERE VariableName=variablenamein)LIMIT 1;
	 
	END$$
	DELIMITER ;

		
	DELIMITER $$
	CREATE PROCEDURE `WAF_Read_Config`()
	BEGIN
	-- =================================
	-- AUTHOR 		: RICHARD KHONAN
	-- CREATED DATE : 29 MARCH 2018
	-- DESCRIPTION 	: MENAMPILKAN CONFIG
	-- =================================
		SELECT ConfigID,ConfigName,Description,Syntax,DefaultValue,Scope,Version FROM Config;
	END $$
	DELIMITER ;


	DELIMITER $$
	CREATE PROCEDURE `WAF_Read_Variable`()
	BEGIN
	-- ===================================
	-- AUTHOR 		: RICHARD KHONAN
	-- CREATED DATE : 29 MARCH 2018
	-- DESCRIPTION 	: MENAMPILKAN VARIABLE
	-- ===================================
		SELECT VariableID,VariableName,Description FROM Variable;
	END $$
	DELIMITER ;

	DELIMITER $$
	CREATE PROCEDURE `WAF_Read_SecRules`()
	BEGIN
	-- ===================================
	-- AUTHOR 		: RICHARD KHONAN
	-- CREATED DATE : 29 MARCH 2018
	-- DESCRIPTION 	: MENAMPILKAN SECRULES
	-- ===================================
		SELECT SecRulesID,SecRulesName FROM SecRules;
	END $$
	DELIMITER ;
    
	
    
    
	CALL WAF_Insert_Variable('Admin','ARGS','ARGS is a collection and can be used on its own (means all arguments including the POST Payload), with a static parameter (matches arguments with that name), or with a regular expression (matches all arguments with name that matches the regular expression). To look at only the query string or body arguments, see the ARGS_GET and ARGS_POST collections.');
	CALL WAF_Insert_Variable('Admin','ARGS_Combined_Size','Contains the combined size of all request parameters. Files are excluded from the calculation. This variable can be useful, for example, to create a rule to ensure that the total size of the argument data is below a certain threshold.');
	CALL WAF_Insert_Variable('Admin','ARGS_GET','ARGS_GET is similar to ARGS, but contains only query string parameters.');
	CALL WAF_Insert_Variable('Admin','ARGS_GET_NAMES','ARGS_GET_NAMES is similar to ARGS_NAMES, but contains only the names of query string parameters.');
	CALL WAF_Insert_Variable('Admin','ARGS_NAMES','Contains all request parameter names. You can search for specific parameter names that you want to inspect. In a positive policy scenario, you can also whitelist (using an inverted rule with the exclamation mark) only the authorized argument names. This example rule allows only two argument names: p and a:');
	CALL WAF_Insert_Variable('Admin','ARGS_POST','ARGS_POST is similar to ARGS, but only contains arguments from the POST body.');
	CALL WAF_Insert_Variable('Admin','ARGS_POST_NAMES','ARGS_POST_NAMES is similar to ARGS_NAMES, but contains only the names of request body parameters.');
	CALL WAF_Insert_Variable('Admin','AUTH_TYPE','This variable holds the authentication method used to validate a user, if any of the methods built into HTTP are used. In a reverse-proxy deployment, this information will not be available if the authentication is handled in the backend web server.');
	CALL WAF_Insert_Variable('Admin','DURATION','Contains the number of milliseconds elapsed since the beginning of the current transaction. Available starting with 2.6.0.

	Note : Starting with ModSecurity 2.7.0 the time is microseconds.');
	CALL WAF_Insert_Variable('Admin','ENV','Collection that provides access to environment variables set by ModSecurity or other server modules. Requires a single parameter to specify the name of the desired variable.
	Note : Use setenv to set environment variables to be accessed by Apache.');
	CALL WAF_Insert_Variable('Admin','FILES','Contains a collection of original file names (as they were called on the remote user’s filesys- tem). Available only on inspected multipart/form-data requests.
	Note : Only available if files were extracted from the request body.');
	CALL WAF_Insert_Variable('Admin','FILES_COMBINED_SIZE','Contains the total size of the files transported in request body. Available only on inspected multipart/form-data requests.');
	CALL WAF_Insert_Variable('Admin','FILES_NAMES','Contains a list of form fields that were used for file upload. Available only on inspected multipart/form-data requests.');
	CALL WAF_Insert_Variable('Admin','FULL_REQUEST','Contains the complete request: Request line, Request headers and Request body (if any). The last available only if SecRequestBodyAccess was set to On. Note that all properties of SecRequestBodyAccess will be respected here, such as: SecRequestBodyLimit.');
	CALL WAF_Insert_Variable('Admin','FULL_REQUEST_LENGTH','Represents the amount of bytes that FULL_REQUEST may use.');
	CALL WAF_Insert_Variable('Admin','FILES_SIZES','Contains a list of individual file sizes. Useful for implementing a size limitation on individual uploaded files. Available only on inspected multipart/form-data requests.');
	CALL WAF_Insert_Variable('Admin','FILES_TMPNAMES','Contains a list of temporary files’ names on the disk. Useful when used together with @inspectFile. Available only on inspected multipart/form-data requests.');
	CALL WAF_Insert_Variable('Admin','FILES_TMP_CONTENT','Contains a key-value set where value is the content of the file which was uploaded. Useful when used together with @fuzzyHash.
	Note : Available on version 2.9.0-RC1+
	Note II : SecUploadKeepFiles should be set to On in order to have this collection filled.');
	CALL WAF_Insert_Variable('Admin','GEO','GEO is a collection populated by the results of the last @geoLookup operator. The collection can be used to match geographical fields looked from an IP address or hostname.

	Available since ModSecurity 2.5.0.');
	CALL WAF_Insert_Variable('Admin','HIGHEST_SEVERITY','This variable holds the highest severity of any rules that have matched so far. Severities are numeric values and thus can be used with comparison operators such as @lt, and so on. A value of 255 indicates that no severity has been set.');
	CALL WAF_Insert_Variable('Admin','INBOUND_DATA_ERROR','This variable will be set to 1 when the request body size is above the setting configured by SecRequestBodyLimit directive. Your policies should always contain a rule to check this variable. Depending on the rate of false positives and your default policy you should decide whether to block or just warn when the rule is triggered.');
	CALL WAF_Insert_Variable('Admin','MATCHED_VAR','This variable holds the value of the most-recently matched variable. It is similar to the TX:0, but it is automatically supported by all operators and there is no need to specify the capture action.Note : Be aware that this variable holds data for the last operator match. This means that if there are more than one matches, only the last one will be populated. Use MATCHED_VARS variable if you want all matches.');
	CALL WAF_Insert_Variable('Admin','MATCHED_VARS','Similar to MATCHED_VAR except that it is a collection of all matches for the current operator check.');
	CALL WAF_Insert_Variable('Admin','MATCHED_VAR_NAME','This variable holds the full name of the variable that was matched against.');
	CALL WAF_Insert_Variable('Admin','MATCHED_VARS_NAMES','Similar to MATCHED_VAR_NAME except that it is a collection of all matches for the current operator check.');
	CALL WAF_Insert_Variable('Admin','MODSEC_BUILD','This variable holds the ModSecurity build number. This variable is intended to be used to check the build number prior to using a feature that is available only in a certain build.');
	CALL WAF_Insert_Variable('Admin','MULTIPART_CRLF_LF_LINES','This flag variable will be set to 1 whenever a multi-part request uses mixed line terminators. The multipart/form-data RFC requires CRLF sequence to be used to terminate lines. Since some client implementations use only LF to terminate lines you might want to allow them to proceed under certain circumstances (if you want to do this you will need to stop using MULTIPART_STRICT_ERROR and check each multi-part flag variable individually, avoiding MULTIPART_LF_LINE). However, mixing CRLF and LF line terminators is dangerous as it can allow for evasion. Therefore, in such cases, you will have to add a check for MULTIPART_CRLF_LF_LINES.');
	CALL WAF_Insert_Variable('Admin','MULTIPART_FILENAME','This variable contains the multipart data from field FILENAME.');
	CALL WAF_Insert_Variable('Admin','MULTIPART_NAME','This variable contains the multipart data from field NAME.');
	CALL WAF_Insert_Variable('Admin','MULTIPART_STRICT_ERROR','MULTIPART_STRICT_ERROR will be set to 1 when any of the following variables is also set to 1: REQBODY_PROCESSOR_ERROR, MULTIPART_BOUNDARY_QUOTED, MULTIPART_BOUNDARY_WHITESPACE, MULTIPART_DATA_BEFORE, MULTIPART_DATA_AFTER, MULTIPART_HEADER_FOLDING, MULTIPART_LF_LINE, MULTIPART_MISSING_SEMICOLON MULTIPART_INVALID_QUOTING MULTIPART_INVALID_HEADER_FOLDING MULTIPART_FILE_LIMIT_EXCEEDED. Each of these variables covers one unusual (although sometimes legal) aspect of the request body in multipart/form-data format. Your policies should always contain a rule to check either this variable (easier) or one or more individual variables (if you know exactly what you want to accomplish). Depending on the rate of false positives and your default policy you should decide whether to block or just warn when the rule is triggered.');
	CALL WAF_Insert_Variable('Admin','MULTIPART_UNMATCHED_BOUNDARY','Set to 1 when, during the parsing phase of a multipart/request-body, ModSecurity encounters what feels like a boundary but it is not. Such an event may occur when evasion of ModSecurity is attempted.');
	CALL WAF_Insert_Variable('Admin','OUTBOUND_DATA_ERROR','This variable will be set to 1 when the response body size is above the setting configured by SecResponseBodyLimit directive. Your policies should always contain a rule to check this variable. Depending on the rate of false positives and your default policy you should decide whether to block or just warn when the rule is triggered.');
	CALL WAF_Insert_Variable('Admin','PATH_INFO','Contains the extra request URI information, also known as path info. (For example, in the URI /index.php/123, /123 is the path info.) Available only in embedded deployments.');
	CALL WAF_Insert_Variable('Admin','PERF_ALL','This special variable contains a string that’s a combination of all other performance variables, arranged in the same order in which they appear in the Stopwatch2 audit log header. It’s intended for use in custom Apache logs');
	CALL WAF_Insert_Variable('Admin','PERF_COMBINED','Contains the time, in microseconds, spent in ModSecurity during the current transaction. The value in this variable is arrived to by adding all the performance variables except PERF_SREAD (the time spent reading from persistent storage is already included in the phase measurements).');
	CALL WAF_Insert_Variable('Admin','PERF_GC','Contains the time, in microseconds, spent performing garbage collection.');
	CALL WAF_Insert_Variable('Admin','PERF_LOGGING','Contains the time, in microseconds, spent in audit logging. This value is known only after the handling of a transaction is finalized, which means that it can only be logged using mod_log_config and the %{VARNAME}M syntax.');
	CALL WAF_Insert_Variable('Admin','PERF_PHASE1','Contains the time, in microseconds, spent processing phase 1.');
	CALL WAF_Insert_Variable('Admin','PERF_PHASE2','Contains the time, in microseconds, spent processing phase 2.');
	CALL WAF_Insert_Variable('Admin','PERF_PHASE3','Contains the time, in microseconds, spent processing phase 3.');
	CALL WAF_Insert_Variable('Admin','PERF_PHASE4','Contains the time, in microseconds, spent processing phase 4.');
	CALL WAF_Insert_Variable('Admin','PERF_PHASE5','Contains the time, in microseconds, spent processing phase 5.');
	CALL WAF_Insert_Variable('Admin','PERF_RULES','PERF_RULES is a collection, that is populated with the rules hitting the performance threshold defined with SecRulePerfTime. The collection contains the time, in microseconds, spent processing the individual rule. The various items in the collection can be accessed via the rule id.');
	CALL WAF_Insert_Variable('Admin','PERF_SREAD','Contains the time, in microseconds, spent reading from persistent storage.');
	CALL WAF_Insert_Variable('Admin','PERF_SWRITE','Contains the time, in microseconds, spent writing to persistent storage.');
	CALL WAF_Insert_Variable('Admin','QUERY_STRING','Contains the query string part of a request URI. The value in QUERY_STRING is always provided raw, without URL decoding taking place.');
	CALL WAF_Insert_Variable('Admin','REMOTE_ADDR','This variable holds the IP address of the remote client.');
	CALL WAF_Insert_Variable('Admin','REMOTE_HOST','If the Apache directive HostnameLookups is set to On, then this variable will hold the remote hostname resolved through DNS. If the directive is set to Off, this variable it will hold the remote IP address (same as REMOTE_ADDR). Possible uses for this variable would be to deny known bad client hosts or network blocks, or conversely, to allow in authorized hosts.');
	CALL WAF_Insert_Variable('Admin','REMOTE_PORT','This variable holds information on the source port that the client used when initiating the connection to our web server.');
	CALL WAF_Insert_Variable('Admin','REMOTE_USER','This variable holds the username of the authenticated user. If there are no password access controls in place (Basic or Digest authentication), then this variable will be empty.');
	CALL WAF_Insert_Variable('Admin','REQBODY_ERROR','Contains the status of the request body processor used for request body parsing. The values can be 0 (no error) or 1 (error). This variable will be set by request body processors (typically the multipart/request-data parser, JSON or the XML parser) when they fail to do their work.');
	CALL WAF_Insert_Variable('Admin','REQBODY_ERROR_MSG','If there’s been an error during request body parsing, the variable will contain the following error message:

	SecRule REQBODY_ERROR_MSG "failed to parse" "id:40"');
	CALL WAF_Insert_Variable('Admin','REQBODY_PROCESSOR','Contains the name of the currently used request body processor. The possible values are URLENCODED, MULTIPART, and XML.');
	CALL WAF_Insert_Variable('Admin','REQUEST_BASENAME','This variable holds just the filename part of REQUEST_FILENAME (e.g., index.php).');
	CALL WAF_Insert_Variable('Admin','REQUEST_BODY','Holds the raw request body.');
	CALL WAF_Insert_Variable('Admin','REQUEST_BODY_LENGTH','Contains the number of bytes read from a request body.');
	CALL WAF_Insert_Variable('Admin','REQUEST_COOKIES','This variable is a collection of all of request cookies (values only).');
	CALL WAF_Insert_Variable('Admin','REQUEST_COOKIES_NAMES','This variable is a collection of the names of all request cookies.');
	CALL WAF_Insert_Variable('Admin','REQUEST_FILENAME','This variable holds the relative request URL without the query string part (e.g., /index.php). ');
	CALL WAF_Insert_Variable('Admin','REQUEST_HEADERS','This variable can be used as either a collection of all of the request headers or can be used to inspect selected headers (by using the REQUEST_HEADERS:Header-Name syntax).');
	CALL WAF_Insert_Variable('Admin','REQUEST_HEADERS_NAMES','This variable is a collection of the names of all of the request headers.');
	CALL WAF_Insert_Variable('Admin','REQUEST_LINE','This variable holds the complete request line sent to the server (including the request method and HTTP version information).');
	CALL WAF_Insert_Variable('Admin','REQUEST_METHOD','This variable holds the request method used in the transaction.');
	CALL WAF_Insert_Variable('Admin','REQUEST_PROTOCOL','This variable holds the request protocol version information.');
	CALL WAF_Insert_Variable('Admin','REQUEST_URI','This variable holds the full request URL including the query string data (e.g., /index.php? p=X).');
	CALL WAF_Insert_Variable('Admin','REQUEST_URI_RAW','Same as REQUEST_URI but will contain the domain name if it was provided on the request line (e.g., http://www.example.com/index.php?p=X).');
	CALL WAF_Insert_Variable('Admin','RESPONSE_BODY','This variable holds the data for the response body, but only when response body buffering is enabled.');
	CALL WAF_Insert_Variable('Admin','RESPONSE_CONTENT_LENGTH','Response body length in bytes. Can be available starting with phase 3, but it does not have to be (as the length of response body is not always known in advance). If the size is not known, this variable will contain a zero. If RESPONSE_CONTENT_LENGTH contains a zero in phase 5 that means the actual size of the response body was 0. The value of this variable can change between phases if the body is modified. For example, in embedded mode, mod_deflate can compress the response body between phases 4 and 5.');
	CALL WAF_Insert_Variable('Admin','RESPONSE_CONTENT_TYPE','Response content type. Available only starting with phase 3. The value available in this variable is taken directly from the internal structures of Apache, which means that it may contain the information that is not yet available in response headers. In embedded deployments, you should always refer to this variable, rather than to RESPONSE_HEADERS:Content-Type. ');
	CALL WAF_Insert_Variable('Admin','RESPONSE_HEADERS','This variable refers to response headers, in the same way as REQUEST_HEADERS does to request headers.');
	CALL WAF_Insert_Variable('Admin','RESPONSE_HEADERS_NAMES','This variable is a collection of the response header names.');
	CALL WAF_Insert_Variable('Admin','RESPONSE_PROTOCOL','This variable holds the HTTP response protocol information.');
	CALL WAF_Insert_Variable('Admin','RESPONSE_STATUS','This variable holds the HTTP response status code. This variable may not work as expected in embedded mode, as Apache sometimes handles certain requests differently, and without invoking ModSecurity (all other modules).');
	CALL WAF_Insert_Variable('Admin','RULE','This is a special collection that provides access to the id, rev, severity, logdata, and msg fields of the rule that triggered the action. It can be used to refer to only the same rule in which it resides.');
	CALL WAF_Insert_Variable('Admin','SCRIPT_BASENAME','This variable holds just the local filename part of SCRIPT_FILENAME.');
	CALL WAF_Insert_Variable('Admin','SCRIPT_FILENAME','This variable holds the full internal path to the script that will be used to serve the request.');
	CALL WAF_Insert_Variable('Admin','SCRIPT_GID','This variable holds the numerical identifier of the group owner of the script.');
	CALL WAF_Insert_Variable('Admin','SCRIPT_GROUPNAME','This variable holds the name of the group owner of the script.');
	CALL WAF_Insert_Variable('Admin','SCRIPT_MODE','This variable holds the script’s permissions mode data (e.g., 644).');
	CALL WAF_Insert_Variable('Admin','SCRIPT_UID','This variable holds the numerical identifier of the owner of the script.');
	CALL WAF_Insert_Variable('Admin','SCRIPT_USERNAME','This variable holds the username of the owner of the script.');
	CALL WAF_Insert_Variable('Admin','SDBM_DELETE_ERROR','This variable is set to 1 when APR fails to delete SDBM entries.');
	CALL WAF_Insert_Variable('Admin','SERVER_ADDR','This variable contains the IP address of the server.');
	CALL WAF_Insert_Variable('Admin','SERVER_NAME','This variable contains the transaction’s hostname or IP address, taken from the request itself (which means that, in principle, it should not be trusted).');
	CALL WAF_Insert_Variable('Admin','SERVER_PORT','This variable contains the local port that the web server (or reverse proxy) is listening on.');
	CALL WAF_Insert_Variable('Admin','SESSION','This variable is a collection that contains session information. It becomes available only after setsid is executed.');
	CALL WAF_Insert_Variable('Admin','SESSIONID','his variable contains the value set with setsid. See SESSION (above) for a complete example.');
	CALL WAF_Insert_Variable('Admin','STATUS_LINE','This variable holds the full status line sent by the server (including the request method and HTTP version information).');
	CALL WAF_Insert_Variable('Admin','STREAM_INPUT_BODY','This variable give access to the raw request body content.');
	CALL WAF_Insert_Variable('Admin','STREAM_OUTPUT_BODY','This variable give access to the raw response body content.');
	CALL WAF_Insert_Variable('Admin','TIME','This variable holds a formatted string representing the time (hour:minute:second).');
	CALL WAF_Insert_Variable('Admin','TIME_DAY','This variable holds the current date (1–31).');
	CALL WAF_Insert_Variable('Admin','TIME_EPOCH','This variable holds the time in seconds since 1970.');
	CALL WAF_Insert_Variable('Admin','TIME_HOUR','This variable holds the current hour value (0–23).');
	CALL WAF_Insert_Variable('Admin','TIME_MIN','This variable holds the current minute value (0–59).');
	CALL WAF_Insert_Variable('Admin','TIME_MON','This variable holds the current month value (0–11).');
	CALL WAF_Insert_Variable('Admin','TIME_SEC','This variable holds the current second value (0–59).');
	CALL WAF_Insert_Variable('Admin','TIME_WDAY','This variable holds the current weekday value (0–6).');
	CALL WAF_Insert_Variable('Admin','TIME_YEAR','This variable holds the current four-digit year value. ');
	CALL WAF_Insert_Variable('Admin','TX','This is the transient transaction collection, which is used to store pieces of data, create a transaction anomaly score, and so on. The variables placed into this collection are available only until the transaction is complete.');
	CALL WAF_Insert_Variable('Admin','UNIQUE_ID','This variable holds the data created by mod_unique_id http://httpd.apache.org/docs/2.2/mod/mod_unique_id.html. This module provides a magic token for each request which is guaranteed to be unique across "all" requests under very specific conditions.');
	CALL WAF_Insert_Variable('Admin','URLENCODED_ERROR','This variable is created when an invalid URL encoding is encountered during the parsing of a query string (on every request) or during the parsing of an application/x-www-form-urlencoded request body (only on the requests that use the URLENCODED request body processor).');
	CALL WAF_Insert_Variable('Admin','USERID','This variable contains the value set with setuid.');
	CALL WAF_Insert_Variable('Admin','USERAGENT_IP','This variable is created when running modsecurity with apache2.4 and will contains the client ip address set by mod_remoteip in proxied connections.');
	CALL WAF_Insert_Variable('Admin','WEBAPPID','This variable contains the current application name, which is set in configuration using SecWebAppId.');
	CALL WAF_Insert_Variable('Admin','WEBSERVER_ERROR_LOG','Contains zero or more error messages produced by the web server. This variable is best accessed from phase 5 (logging).');
	CALL WAF_Insert_Variable('Admin','XML','Special collection used to interact with the XML parser. It can be used standalone as a target for the validateDTD and validateSchema operator. Otherwise, it must contain a valid XPath expression, which will then be evaluated against a previously parsed XML DOM tree.');
	CALL WAF_Insert_Config('Admin','SecAction','Unconditionally processes the action list it receives as the first and only parameter. The syntax of the parameter is identical to that of the third parameter of SecRule.','SecAction "action1,action2,action3,...“','','Any','2.0.0');
	CALL WAF_Insert_Config('Admin','SecArgumentSeparator','Specifies which character to use as the separator for application/x-www-form- urlencoded content.','SecArgumentSeparator character','&','Main(< 2.7.0), Any(2.7.0)','2.0.0');
	CALL WAF_Insert_Config('Admin','SecAuditEngine','Configures the audit logging engine.','SecAuditEngine RelevantOnly','Off','Any','2.0.0');
	CALL WAF_Insert_Config('Admin','SecAuditLog','Defines the path to the main audit log file (serial logging format) or the concurrent logging index file (concurrent logging format). When used in combination with mlogc (only possible with concurrent logging), this directive defines the mlogc location and command line.','SecAuditLog /path/to/audit.log','','Any','2.0.0');
	CALL WAF_Insert_Config('Admin','SecAuditLog2','Defines the path to the secondary audit log index file when concurrent logging is enabled. See SecAuditLog for more details.','SecAuditLog2 /path/to/audit.log','','Any','2.1.2');
	CALL WAF_Insert_Config('Admin','SecAuditLogDirMode','Configures the mode (permissions) of any directories created for the concurrent audit logs, using an octal mode value as parameter (as used in chmod).','SecAuditLogDirMode octal_mode|"default"','0600','Any','2.5.10');
	CALL WAF_Insert_Config('Admin','SecAuditLogFormat','Select the output format of the AuditLogs. The format can be either the native AuditLogs format or JSON.','SecAuditLogFormat JSON|Native','Native','Any','2.9.1');
	CALL WAF_Insert_Config('Admin','SecAuditLogFileMode',' Configures the mode (permissions) of any files created for concurrent audit logs using an octal mode (as used in chmod). See SecAuditLogDirMode for controlling the mode of created audit log directories.','SecAuditLogFileMode octal_mode|"default"','0600','Any','2.5.10');
	CALL WAF_Insert_Config('Admin','SecAuditLogParts','Defines which parts of each transaction are going to be recorded in the audit log. Each part is assigned a single letter; when a letter appears in the list then the equivalent part will be recorded. See below for the list of all parts.','SecAuditLogParts PARTLETTERS','ABCFHZ Note','Any','2.0.0');
	CALL WAF_Insert_Config('Admin','SecAuditLogRelevantStatus','Configures which response status code is to be considered relevant for the purpose of audit logging.	','SecAuditLogRelevantStatus REGEX','','Any','2.0.0');
	CALL WAF_Insert_Config('Admin','SecAuditLogStorageDir','Configures the directory where concurrent audit log entries are to be stored.','SecAuditLogStorageDir /path/to/storage/dir','','Any','2.0.0');
	CALL WAF_Insert_Config('Admin','SecAuditLogType','Configures the type of audit logging mechanism to be used.','SecAuditLogType Serial|Concurrent|HTTPS','','Any','2.0.0');
	CALL WAF_Insert_Config('Admin','SecCacheTransformations','Controls the caching of transformations, which may speed up the processing of complex rule sets. Caching is off by default starting with 2.5.6, when it was deprecated and downgraded back to experimental.','SecCacheTransformations On|Off [options]','','Any','2.5.0; deprecated in 2.5.6.');
	CALL WAF_Insert_Config('Admin','SecChrootDir','Configures the directory path that will be used to jail the web server process.','SecChrootDir /path/to/chroot/dir','','Main','2.0.0-2.9.x');
	CALL WAF_Insert_Config('Admin','SecCollectionTimeout','Specifies the collections timeout. Default is 3600 seconds.','SecCollectionTimeout seconds','3600','Any','2.6.3-2.9.x');
	CALL WAF_Insert_Config('Admin','SecComponentSignature','Appends component signature to the ModSecurity signature.','SecComponentSignature "COMPONENT_NAME/X.Y.Z (COMMENT)"','','Main','2.5.0-3.x');
	CALL WAF_Insert_Config('Admin','SecConnEngine','Configures the connections engine. This directive affect the directives: SecConnReadStateLimit and SecConnWriteStateLimit.','SecConnEngine On|Off|DetectionOnly','','Any','2.8.0-2.9.x');
	CALL WAF_Insert_Config('Admin','SecContentInjection','Enables content injection using actions append and prepend.','SecContentInjection On|Off','','Any','2.5.0-2.9.x');
	CALL WAF_Insert_Config('Admin','SecCookieFormat','Selects the cookie format that will be used in the current configuration context.','SecCookieFormat 0|1','','Any','2.0.0-2.9.x');
	CALL WAF_Insert_Config('Admin','SecCookieV0Separator','Specifies which character to use as the separator for cookie v0 content.','SecCookieV0Separator character','','Any','2.7.0-2.9.x');
	CALL WAF_Insert_Config('Admin','SecDataDir','Path where persistent data (e.g., IP address data, session data, and so on) is to be stored.','SecDataDir /path/to/dir','','Main','2.0.0-2.9.x');
	CALL WAF_Insert_Config('Admin','SecDebugLog','Path to the ModSecurity debug log file.','SecDebugLog /path/to/modsec-debug.log','','Any','2.0.0');
	CALL WAF_Insert_Config('Admin','SecDebugLogLevel','Configures the verboseness of the debug log data.','SecDebugLogLevel 0|1|2|3|4|5|6|7|8|9','','Any','2.0.0');
	CALL WAF_Insert_Config('Admin','SecDefaultAction','Defines the default list of actions, which will be inherited by the rules in the same configuration context.','SecDefaultAction "action1,action2,action3“','phase:2,log,auditlog,pass','Any','2.0.0');
	CALL WAF_Insert_Config('Admin','SecDisableBackendCompression','Disables backend compression while leaving the frontend compression enabled.','SecDisableBackendCompression On|Off','Off','Any','2.6.0-2.9.x');
	CALL WAF_Insert_Config('Admin','SecHashEngine','Configures the hash engine.','SecHashEngine On|Off','Off','Any','2.7.1-2.9.x');
	CALL WAF_Insert_Config('Admin','SecHashKey','Define the key that will be used by HMAC.','SecHashKey rand|TEXT KeyOnly|SessionID|RemoteIP','','Any','2.7.1-2.9.x');
	CALL WAF_Insert_Config('Admin','SecHashParam','Define the parameter name that will receive the MAC hash.','SecHashParam TEXT','','Any','2.7.1-2.9.x');
	CALL WAF_Insert_Config('Admin','SecHashMethodRx','Configures what kind of HTML data the hash engine should sign based on regular expression.','SecHashMethodRx TYPE REGEX','','Any','2.7.1-2.9.x');
	CALL WAF_Insert_Config('Admin','SecHashMethodPm','Configures what kind of HTML data the hash engine should sign based on string search algoritm.','SecHashMethodPm TYPE "string1 string2 string3..."','','Any',' 2.7.1-2.9.x');
	CALL WAF_Insert_Config('Admin','SecGeoLookupDb','Defines the path to the database that will be used for geolocation lookups.','SecGeoLookupDb /path/to/db','','Any','2.5.0');
	CALL WAF_Insert_Config('Admin','SecGsbLookupDb','Defines the path to the database that will be used for Google Safe Browsing (GSB) lookups.','SecGsbLookupDb /path/to/db','','Any','2.6.0');
	CALL WAF_Insert_Config('Admin','SecGuardianLog','Configures an external program that will receive the information about every transaction via piped logging.','SecGuardianLog |/path/to/httpd-guardian','','Main','2.0.0-2.9.x');
	CALL WAF_Insert_Config('Admin','SecHttpBlKey','Configures the user registered Honeypot Project HTTP BL API Key to use with @rbl.','SecHttpBlKey [12 char access key]','','Main','2.7.0');
	CALL WAF_Insert_Config('Admin','SecInterceptOnError','Configures how to respond when rule processing fails.','SecInterceptOnError On|Off','','Main','2.6-2.9.x');
	CALL WAF_Insert_Config('Admin','SecMarker','Adds a fixed rule marker that can be used as a target in a skipAfter action. A SecMarker directive essentially creates a rule that does nothing and whose only purpose is to carry the given ID','SecMarker ID|TEXT','','Any','2.5.0-3.x');
	CALL WAF_Insert_Config('Admin','SecPcreMatchLimit','Sets the match limit in the PCRE library.','SecPcreMatchLimit value','1500','Main','2.5.12-2.9.x');
	CALL WAF_Insert_Config('Admin','SecPcreMatchLimitRecursion','Sets the match limit recursion in the PCRE library.','SecPcreMatchLimitRecursion value','1500','Main','2.5.12-2.9.x');
	CALL WAF_Insert_Config('Admin','SecPdfProtect','Enables the PDF XSS protection functionality.','SecPdfProtect On|Off','','Any','2.5.0; removed from trunk');
	CALL WAF_Insert_Config('Admin','SecPdfProtectMethod','Configure desired protection method to be used when requests for PDF files are detected.','SecPdfProtectMethod method','TokenRedirection','Any','2.5.0; removed from trunk');
	CALL WAF_Insert_Config('Admin','SecPdfProtectSecret','Defines the secret that will be used to construct one-time tokens.','SecPdfProtectSecret secret','','Any','2.5.0; removed from trunk');
	CALL WAF_Insert_Config('Admin','SecPdfProtectTimeout','Defines the token timeout.','SecPdfProtectTimeout timeout','10','Any','2.5.0; removed from trunk');
	CALL WAF_Insert_Config('Admin','SecPdfProtectTokenName','Defines the name of the token.','SecPdfProtectTokenName name','PDFTOKEN','Any','2.5.0; removed from trunk');
	CALL WAF_Insert_Config('Admin','SecReadStateLimit','Establishes a per-IP address limit of how many connections are allowed to be in SERVER_BUSY_READ state.','SecReadStateLimit LIMIT','0 (no limit)','Main','2.5.13, DEPRECATED as of v2.8.0.');
	CALL WAF_Insert_Config('Admin','SecConnReadStateLimit','Establishes a per-IP address limit of how many connections are allowed to be in SERVER_BUSY_READ state.','SecConnReadStateLimit LIMIT OPTIONAL_IP_MATCH_OPERATOR','0 (no limit)','Main','v2.8.0-2.9.x (Apache only)');
	CALL WAF_Insert_Config('Admin','SecSensorId','Define a sensor ID that will be present into log part H.','SecSensorId TEXT','','Main','2.7.0-2.9.x');
	CALL WAF_Insert_Config('Admin','SecWriteStateLimit','Establishes a per-IP address limit of how many connections are allowed to be in SERVER_BUSY_WRITE state.','SecWriteStateLimit LIMIT','0 (no limit)','Main','2.6.0, DEPRECATED as of v2.8.0.');
	CALL WAF_Insert_Config('Admin','SecConnWriteStateLimit','Establishes a per-IP address limit of how many connections are allowed to be in SERVER_BUSY_WRITE state.','SecConnWriteStateLimit LIMIT OPTIONAL_IP_MATCH_OPERATOR','0 (no limit)','Main','2.6.0-2.9.x (Apache only)');
	CALL WAF_Insert_Config('Admin','SecRemoteRules','Load rules from a given file hosted on a HTTPS site.','SecRemoteRules [crypto] key https://url','','Any',' 2.9.0-RC1+');
	CALL WAF_Insert_Config('Admin','SecRemoteRulesFailAction','Action that will be taken if SecRemoteRules specify an URL that ModSecurity was not able to download.','SecRemoteRulesFailAction Abort|Warn','','Any','2.9.0-RC1+');
	CALL WAF_Insert_Config('Admin','SecRequestBodyAccess','Configures whether request bodies will be buffered and processed by ModSecurity.','SecRequestBodyAccess On|Off','','Any','2.0.0');
	CALL WAF_Insert_Config('Admin','SecRequestBodyInMemoryLimit','Configures the maximum request body size that ModSecurity will store in memory.','SecRequestBodyInMemoryLimit LIMIT_IN_BYTES','131072 (128 KB)','Any','2.0.0-2.9.x');
	CALL WAF_Insert_Config('Admin','SecRequestBodyLimit','Configures the maximum request body size ModSecurity will accept for buffering.','SecRequestBodyLimit LIMIT_IN_BYTES','134217728 (131072 KB)','Any','2.0.0');
	CALL WAF_Insert_Config('Admin','SecRequestBodyNoFilesLimit','Configures the maximum request body size ModSecurity will accept for buffering, excluding the size of any files being transported in the request.','SecRequestBodyNoFilesLimit NUMBER_IN_BYTES','1048576 (1 MB)','Any','2.5.0');
	CALL WAF_Insert_Config('Admin','SecRequestBodyLimitAction','Controls what happens once a request body limit, configured with SecRequestBodyLimit, is encountered','SecRequestBodyLimitAction Reject|ProcessPartial','','Any','2.6.0');
	CALL WAF_Insert_Config('Admin','SecResponseBodyLimit','Configures the maximum response body size that will be accepted for buffering.','SecResponseBodyLimit LIMIT_IN_BYTES','524288 (512 KB)','Any','2.0.0');
	CALL WAF_Insert_Config('Admin','SecResponseBodyLimitAction','Controls what happens once a response body limit, configured with SecResponseBodyLimit, is encountered.','SecResponseBodyLimitAction Reject|ProcessPartial','','Any','2.5.0');
	CALL WAF_Insert_Config('Admin','SecResponseBodyMimeType','Configures which MIME types are to be considered for response body buffering.','SecResponseBodyMimeType MIMETYPE MIMETYPE ...','text/plain text/html','Any','2.0.0');
	CALL WAF_Insert_Config('Admin','SecResponseBodyMimeTypesClear','Clears the list of MIME types considered for response body buffering, allowing you to start populating the list from scratch.','SecResponseBodyMimeTypesClear','','Any','2.0.0-2.9.x');
	CALL WAF_Insert_Config('Admin','SecResponseBodyAccess','Configures whether response bodies are to be buffered.','SecResponseBodyAccess On|Off','Off','Any','2.0.0');
	CALL WAF_Insert_Config('Admin','SecRule','Creates a rule that will analyze the selected variables using the selected operator.','SecRule VARIABLES OPERATOR [ACTIONS]','','Any','2.0.0');
	CALL WAF_Insert_Config('Admin','SecRuleInheritance','Configures whether the current context will inherit the rules from the parent context.','SecRuleInheritance On|Off','On','Any','2.0.0-2.9.x');
	CALL WAF_Insert_Config('Admin','SecRuleEngine','Configures the rules engine.','SecRuleEngine On|Off|DetectionOnly','Off','Any','2.0.0');
	CALL WAF_Insert_Config('Admin','SecRulePerfTime','Set a performance threshold for rules. Rules that spend at least the time defined will be logged into audit log Part H as Rules-Performance-Info in the format id=usec, comma separated.','SecRulePerfTime USECS','','Any','2.7-2.9.x');
	CALL WAF_Insert_Config('Admin','SecRuleRemoveById','Removes the matching rules from the current configuration context.','SecRuleRemoveById ID ID RANGE ...','','Any','2.0.0 - 3.x');
	CALL WAF_Insert_Config('Admin','SecRuleRemoveByMsg','Removes the matching rules from the current configuration context. ','SecRuleRemoveByMsg REGEX','','Any','2.0.0-3.x');
	CALL WAF_Insert_Config('Admin','SecRuleRemoveByTag','Removes the matching rules from the current configuration context.','SecRuleRemoveByTag REGEX','','Any','2.6-3.x');
	CALL WAF_Insert_Config('Admin','SecRuleScript','This directive creates a special rule that executes a Lua script to decide whether to match or not.','SecRuleScript /path/to/script.lua [ACTIONS]','','Any','2.5.0-3.x');
	CALL WAF_Insert_Config('Admin','SecRuleUpdateActionById','Updates the action list of the specified rule.','SecRuleUpdateActionById RULEID[:offset] ACTIONLIST','','Any','2.6.0-2.9.x');
	CALL WAF_Insert_Config('Admin','SecRuleUpdateTargetById','Updates the target (variable) list of the specified rule.','SecRuleUpdateTargetById RULEID TARGET1[,TARGET2,TARGET3] REPLACED_TARGET','','Any','2.6-3.x');
	CALL WAF_Insert_Config('Admin','SecRuleUpdateTargetByMsg','Updates the target (variable) list of the specified rule by rule message.','SecRuleUpdateTargetByMsg TEXT TARGET1[,TARGET2,TARGET3] REPLACED_TARGET','','Any','2.7-3.x');
	CALL WAF_Insert_Config('Admin','SecRuleUpdateTargetByTag','Updates the target (variable) list of the specified rule by rule tag.','SecRuleUpdateTargetByTag TEXT TARGET1[,TARGET2,TARGET3] REPLACED_TARGET','','Any','2.7-3.x');
	CALL WAF_Insert_Config('Admin','SecServerSignature','Instructs ModSecurity to change the data presented in the "Server:" response header token.','SecServerSignature "WEB SERVER SOFTWARE"','','Main','2.0.0-2.9.x');
	CALL WAF_Insert_Config('Admin','SecStatusEngine','Controls Status Reporting functionality. Uses DNS-based reporting to send software version information to the ModSecurity Project team.','SecStatusEngine On|Off','Off','Any','2.8.0-2.9.x');
	CALL WAF_Insert_Config('Admin','SecStreamInBodyInspection','Configures the ability to use stream inspection for inbound request data in a re-allocable buffer. For security reasons we are still buffering the stream.','SecStreamInBodyInspection On|Off','Off','Any','2.6.0-2.9.x');
	CALL WAF_Insert_Config('Admin','SecStreamOutBodyInspection','Configures the ability to use stream inspection for outbound request data in a re-allocable buffer. For security reasons we are still buffering the stream.','SecStreamOutBodyInspection On|Of','Off','Any','2.6.0-2.9.x');
	CALL WAF_Insert_Config('Admin','SecTmpDir','Configures the directory where temporary files will be created.','SecTmpDir /path/to/dir','','Any','2.0.0-2.9.x');
	CALL WAF_Insert_Config('Admin','SecUnicodeMapFile','Defines the path to the file that will be used by the urlDecodeUni transformation function to map Unicode code points during normalization and specifies the Code Point to use.','SecUnicodeMapFile unicode.mapping 20127','','Any','2.6.1-2.9.x');
	CALL WAF_Insert_Config('Admin','SecUnicodeCodePage','Defines which Unicode code point will be used by the urlDecodeUni transformation function during normalization.','SecUnicodeCodePage XXXXX','','Any','2.6.1 - DEPRECATED');
	CALL WAF_Insert_Config('Admin','SecUploadDir','Configures the directory where intercepted files will be stored.','SecUploadDir /path/to/dir','','Any','2.0.0-3.x');
	CALL WAF_Insert_Config('Admin','SecUploadFileLimit','Configures the maximum number of file uploads processed in a multipart POST.','SecUploadFileLimit number','','Any','2.5.12-3.x');
	CALL WAF_Insert_Config('Admin','SecUploadFileMode','Configures the mode (permissions) of any uploaded files using an octal mode (as used in chmod).','SecUploadFileMode octal_mode|"default"','','Any','2.16');
	CALL WAF_Insert_Config('Admin','SecUploadKeepFiles','Configures whether or not the intercepted files will be kept after transaction is processed.','SecUploadKeepFiles On|Off|RelevantOnly','','Any','2.0.0');
	CALL WAF_Insert_Config('Admin','SecWebAppId','Creates an application namespace, allowing for separate persistent session and user storage.','SecWebAppId "NAME"','default','Any','2.0.0-3.x');
	CALL WAF_Insert_Config('Admin','SecXmlExternalEntity','Enable or Disable the loading process of xml external entity. Loading external entity without correct verifying process can lead to a security issue.','SecXmlExternalEntity On|Off','default is Off','Any','2.7.3');

			
				

