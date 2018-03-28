
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
		Userpass VARCHAR(32) NOT NULL
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

	SET @posadmin=CONCAT('UserJobPosID_',uuid());
	SET @posstaff=CONCAT('UserJobPosID_',uuid());
	SET @posbot=CONCAT('UserJobPosID_',uuid());

    INSERT INTO UserJobPosition(UserJobPosID, UserJobName, STSRC, DateIN, UserIN, DateUP, UserUP)
        VALUES (@posadmin,'ADMIN','A',CURRENT_TIMESTAMP,'SYSTEM',NULL,NULL);
    INSERT INTO UserJobPosition(UserJobPosID,UserJobName,STSRC,DateIN,UserIN,DateUP,UserUP)
        VALUES (@posstaff,'STAFF','A',CURRENT_TIMESTAMP,'SYSTEM',NULL,NULL);   
	INSERT INTO UserJobPosition(UserJobPosID,UserJobName,STSRC,DateIN,UserIN,DateUP,UserUP)
        VALUES (@posbot,'BOT','A',CURRENT_TIMESTAMP,'SYSTEM',NULL,NULL);
			

	SET @userprofileidad=CONCAT('UserProfileID_',uuid());
    SET @userloginidad=CONCAT('UserLoginID_',uuid());
     

    INSERT INTO UserProfile(UserProfileID,FirstName,LastName,STSRC,UserIN,DateIN,UserJobPosID,DateUP,UserUP)
        VALUES (@userprofileidad,'Super','User','A','SYSTEM',CURRENT_TIMESTAMP,@posadmin,NULL,NULL);
    
    INSERT INTO UserLogin(UserLoginID,Username,Userpass,STSRC,DateIN,UserIN,DateUP,UserUP,UserProfileID)
        VALUES(@userloginidad,'Super.User','tangowaferchocolate999','A',CURRENT_TIMESTAMP,'SYSTEM',NULL,NULL,@userprofileidad);
		

	DELIMITER $$
	CREATE PROCEDURE WAF_Insert_Register (
		firstnamein VARCHAR(32),
		lastnamein VARCHAR(32), 
		positionin VARCHAR(900), 
		userpassin VARCHAR(32),
		userinin VARCHAR(32))
    BEGIN
	-- ===================================		
	-- Created By: Rizky Gunawan Liga
	-- Created Date: 28 - 03 -2018
	-- Description: Penambahan User
	-- ===================================    
	DECLARE a VARCHAR(20);
    SET @username= CONCAT(firstnamein,'.',lastnamein);
	
    IF EXISTS(SELECT UserLoginID FROM UserLogin WHERE Username=@username) THEN
	        SET a='Username is taken';
    ELSE 
		SET @userloginid=CONCAT('UserLoginID_',uuid());
		SET @userprofileid=CONCAT('UserProfileID_',uuid());        
        INSERT INTO UserProfile(UserProfileID,FirstName,LastName,UserJobPosID,STSRC,DateIN,UserIN,DateUP,UserUP) 
            VALUES(@userprofileid,firstnamein,lastnamein,positionin,'A',CURRENT_TIMESTAMP,userinin,NULL,NULL);
        INSERT INTO UserLogin(UserLoginID,Username,Userpass,UserProfileID,STSRC,DateIN,UserIN,DateUP,UserUP)
            VALUES (@userloginid,@username,userpassin,@userprofileid,'A',CURRENT_TIMESTAMP,userinin,NULL,NULL);
        SET a ='User Registered'; 
    END IF;
	END;
    
   
	

	 
	DELIMITER $$
  CREATE PROCEDURE WAF_Read_Login ( uname VARCHAR(32), upass VARCHAR(32))
    BEGIN
-- ======================================================
-- Created By : Rizky Gunawan Liga   
-- Date Created: 26 March 2018
-- Description: buat show user data/ read data user 
-- ======================================================
    DECLARE b VARCHAR(50);
    IF NOT EXISTS(SELECT * FROM UserLogin WHERE Username=uname AND Userpass=upass) THEN
        SET b='Username Invalid';
    ELSE 
    
    SET @uname=uname;
    SET @upass=upass;
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
    END;
  


     DELIMITER $$
	 CREATE PROCEDURE WAF_Insert_Log    (
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
	 SET @waflogsid=CONCAT('WAF_LogsID_',uuid());    
	 SET @transactionlogid=CONCAT('TransactionLogID_',uuid());    
	 SET @requestid=CONCAT('RequestTransactionLogID_',uuid());    
	 SET @requestheaderid=CONCAT('headersRequestTransactionID_',uuid());    
	 SET @responseid=concat('ResponseTransactionLogID_',uuid());    
	 SET @responseheaderid=CONCAT('headersResponseTransactionLog_',uuid());    
	 SET @producerid=CONCAT('ProducerTransactionLogID_',uuid());    
	 SET @messageid=CONCAT('MessageTransactionLogID_',uuid());    
	 SET @messagelogdetailid=CONCAT('MessageTransactionLogDetailID_',uuid());    
	 SET @tagmessageid=CONCAT('TagsMessageID_',uuid());    
	 
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
     SET @tagmessagedetailid=CONCAT('TagsMessageTransactionDetailLogID_',uuid());    
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
     SET @detailmessageid=CONCAT('DetailMessageTransactionDetailLogID_',uuid());
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
	 END;
	


	DELIMITER $$
	CREATE PROCEDURE WAF_Read_Logs()
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
		END;
	
    DELIMITER $$
    CREATE PROCEDURE WAF_Insert_ServerList (
		userin VARCHAR (32),
		servername VARCHAR (64),
		ip VARCHAR (16),
		portsopen VARCHAR (8),
		domain VARCHAR (32))
        BEGIN 
        /*--=======================================
	--Created By    : Albert Sudirwan
	--Created Date  : 26 March 2018
	--Description   : Penambahan Server List
	--=======================================
    */
        DECLARE a VARCHAR (20);
        
        IF EXISTS (SELECT IP FROM ServerList WHERE IP=ip)
        THEN SET a ='IP Already Exists';
        ELSE
        SET @serverid =CONCAT('ServerID_',uuid());
        INSERT INTO ServerList (ServerID,ServerName,IP,PortsOpen,Domain,Stsrc,UserIn,DateIn,UserUp,Dateup)
        VALUES (@serverid,servername,ip,portsopen,domain,'A',userin,CURRENT_TIMESTAMP,NULL,NULL);
        SET a='Server Registered';
        END IF;
        END;
        
        
	DELIMITER $$
    CREATE PROCEDURE WAF_Read_ServerList ()
	BEGIN
	    /*--=======================================
	--Created By    : Albert Sudirwan
	--Created Date  : 26 March 2018
	--Description   : Menampilkan Server List
	--=======================================
    */
    
       SELECT ServerID,ServerName,IP,PortsOpen,Domain FROM ServerList; 
	END;
    
        
	DELIMITER $$
	CREATE PROCEDURE WAF_Insert_EncryptionType( 
		EncryptionTypeName VARCHAR(1024),
		UserIn VARCHAR(32))
	BEGIN
	-- ===================================================
	-- CREATED BY : RICHARD KHONAN
	-- CREATED DATE : 21 - MARCH -2018
	-- DESCRIPTION : PENAMBAHAN WAF_Insert_EncryptionType
	-- ===================================================

		SET @EncryptionTypeId=CONCAT('EncryptionTypeID_',uuid());
		INSERT INTO EncryptionType(Stsrc,UserIn,DateIn,UserUp,DateUp,EncryptionTypeID,EncryptionTypeName)
			VALUES('A',UserIn,Current_Timestamp,NULL,Null,@EncryptionTypeId,EncryptionTypeName);
	END;


