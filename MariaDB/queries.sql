------------------------------------------------------------------


/* get TelldusActionType_Id */
SET @TelldusActionType_Id = (SELECT Id FROM TelldusActionTypes WHERE ActionTypeOption='TurnOn');


/* get TelldusActionValueType_Id */
SET @TelldusActionValueType_Id = (SELECT Id FROM TelldusActionValueTypes WHERE Name='Effect_W');

/* get TelldusActionValue_Id */
INSERT INTO TelldusActionValues(ActionValue, FK_TelldusActionValueType_Id) VALUES ('50',@TelldusActionValueType_Id) 
	ON DUPLICATE KEY UPDATE Id = LAST_INSERT_ID(Id);
SET @TelldusActionValue_Id = LAST_INSERT_ID();



/* get TelldusUnit_Id */
SET @TelldusUnit_Id = (SELECT Id FROM TelldusUnits WHERE Name='A1');


/* get TelldusAction_Id */
INSERT INTO TelldusActions ( Active, CronExpression, FK_ZWaveGatewayTellsticZnetLiteVer2_Id, FK_TelldusActionType_Id, FK_TelldusActionValue_Id, FK_TelldusUnit_Id) VALUES ('1', IFNULL('EXEMPEL PÅ CRON',''),'1', @TelldusActionType_Id, @TelldusActionValue_Id, @TelldusUnit_Id) ON DUPLICATE KEY UPDATE Id = LAST_INSERT_ID(Id);
SET @TelldusAction_Id = LAST_INSERT_ID();


/* register performed TelldusAction */
INSERT INTO TelldusActionsPerformed(PerformedTime, FK_TelldusAction_Id) VALUES (UNIX_TIMESTAMP(),@TelldusAction_Id);
SET @LastTelldusActionPerformed_Id = LAST_INSERT_ID();

*******************
DROP procedure IF EXISTS RegisterPerformedTelldusAction;
DROP procedure IF EXISTS GetInsertedTelldusAction;
DROP procedure IF EXISTS RegisterPerformedMediaAction;
DROP procedure IF EXISTS GetInsertedMediaAction;

DELIMITER $$
CREATE PROCEDURE GetInsertedTelldusAction ( 
	IN p_Active BIT,
	IN p_CronExpression VARCHAR(30),
	IN p_ZWaveGatewayTellsticZnetLiteVer2Id INT,
	IN p_TelldusActionTypeOption VARCHAR(255),
	IN p_TelldusActionValueTypeName VARCHAR(20),
	IN p_TelldusActionValue VARCHAR(255),
	IN p_TelldusUnitName VARCHAR(255),
	OUT idOut INT)
BEGIN
	/* Inserts an Action and returns Id for the inserted row. If an identical Action already is exists, its Id is returned. There are no optional parameters. Use empty strings. */
	
	/* get TelldusActionType_Id */
	SET @TelldusActionType_Id = (SELECT Id FROM TelldusActionTypes WHERE ActionTypeOption = p_TelldusActionTypeOption);
	
	/* get TelldusActionValueType_Id */
	SET @TelldusActionValueType_Id = (SELECT Id FROM TelldusActionValueTypes WHERE Name = p_TelldusActionValueTypeName);
	
	/* get TelldusActionValue_Id */
	INSERT INTO TelldusActionValues(ActionValue, FK_TelldusActionValueType_Id) VALUES (p_TelldusActionValue, @TelldusActionValueType_Id) 
		ON DUPLICATE KEY UPDATE Id = LAST_INSERT_ID(Id);
	SET @TelldusActionValue_Id = LAST_INSERT_ID();
	
	/* get TelldusUnit_Id */
	SET @TelldusUnit_Id = (SELECT Id FROM TelldusUnits WHERE Name = p_TelldusUnitName);
	
	/* get TelldusAction_Id */
	INSERT INTO TelldusActions ( Active, CronExpression, FK_ZWaveGatewayTellsticZnetLiteVer2_Id, FK_TelldusActionType_Id, FK_TelldusActionValue_Id, FK_TelldusUnit_Id) VALUES (p_Active, IFNULL(p_CronExpression,''),'1', @TelldusActionType_Id, @TelldusActionValue_Id, @TelldusUnit_Id) ON DUPLICATE KEY UPDATE Id = LAST_INSERT_ID(Id);
	
	SELECT LAST_INSERT_ID() INTO idOut ;
END$$
DELIMITER ;


DELIMITER $$
CREATE PROCEDURE RegisterPerformedTelldusAction (
	IN p_PerformedTelldusActionUnixTime INT,
	IN p_ZWaveGatewayTellsticZnetLiteVer2Id INT,
	IN p_TelldusActionTypeOption VARCHAR(255),
	IN p_TelldusActionValueTypeName VARCHAR(20),
	IN p_TelldusActionValue VARCHAR(255),
	IN p_TelldusUnitName VARCHAR(255),
	OUT idOut INT)
BEGIN
	CALL GetInsertedTelldusAction('1','',p_ZWaveGatewayTellsticZnetLiteVer2Id,p_TelldusActionTypeOption,p_TelldusActionValueTypeName,p_TelldusActionValue,p_TelldusUnitName,@InsertedTelldusAction_Id);
	
	/* register performed TelldusAction */
	INSERT INTO TelldusActionsPerformed(PerformedTime, FK_TelldusAction_Id) VALUES (IFNULL(p_PerformedTelldusActionUnixTime, UNIX_TIMESTAMP()), @InsertedTelldusAction_Id);
	SET @LastTelldusActionPerformed_Id = LAST_INSERT_ID();
	
	SELECT LAST_INSERT_ID() INTO idOut ;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE GetInsertedMediaAction ( 
	IN p_Active BIT,
	IN p_MediaSourceName VARCHAR(255),
	IN p_MediaOutputVolumeValue TINYINT,
	IN p_MediaOutputWebserviceUrl VARCHAR(100),
	IN p_MediaActionTypeOption VARCHAR(255),
	OUT idOut INT)
BEGIN
	/* Inserts an Action and returns Id for the inserted row. If an identical Action already is exists, its Id is returned. There are no optional parameters. Use empty strings. */
	
	/* get MediaSource_Id */
	SET @MediaSource_Id = (SELECT Id FROM MediaSources WHERE Name = p_MediaSourceName);
	
	/* get MediaOutputVolume_Id */
	SET @MediaOutputVolume_Id = (SELECT Id FROM MediaOutputVolumes WHERE VolumeValue = p_MediaOutputVolumeValue);
	
	/* get MediaOutput_Id */
	SET @MediaOutput_Id = (SELECT Id FROM MediaOutputs WHERE MediaWebserviceUrl = p_MediaOutputWebserviceUrl);
	
	/* get MediaActionType_Id */
	SET @MediaActionType_Id = (SELECT Id FROM MediaActionTypes WHERE ActionTypeOption = p_MediaActionTypeOption);
	
	/* get MediaAction_Id */
	INSERT INTO MediaActions ( Active, FK_MediaSource_Id, FK_MediaOutputVolume_Id, FK_MediaOutput_Id, FK_MediaActionType_Id) VALUES (p_Active, @MediaSource_Id, @MediaOutputVolume_Id, @MediaOutput_Id, @MediaActionType_Id) ON DUPLICATE KEY UPDATE Id = LAST_INSERT_ID(Id);
	
	SELECT LAST_INSERT_ID() INTO idOut ;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE RegisterPerformedMediaAction (
	IN p_PerformedMediaActionUnixTime INT,
	IN p_MediaSourceName VARCHAR(255),
	IN p_MediaOutputVolumeValue TINYINT,
	IN p_MediaOutputWebserviceUrl VARCHAR(100),
	IN p_MediaActionTypeOption VARCHAR(255),
	OUT idOut INT)
BEGIN
	CALL GetInsertedMediaAction('1', p_MediaSourceName, p_MediaOutputVolumeValue, p_MediaOutputWebserviceUrl, p_MediaActionTypeOption, @InsertedMediaAction_Id);
	
	/* register performed MediaAction */
	INSERT INTO MediaActionsPerformed(PerformedTime, FK_MediaAction_Id) VALUES (IFNULL(p_PerformedMediaActionUnixTime, UNIX_TIMESTAMP()), @InsertedMediaAction_Id);
	SET @LastMediaActionPerformed_Id = LAST_INSERT_ID();
	
	SELECT LAST_INSERT_ID() INTO idOut ;
END$$
DELIMITER ;

--------------------------------------------------

SET @TelldusActionPerformed_Id = 0;
CALL RegisterPerformedTelldusAction(1536521458,1,'TurnOn','Effect_W','50','A1', @TelldusActionPerformed_Id);

SELECT @TelldusActionPerformed_Id;


CALL RegisterPerformedTelldusAction(1536521458,1,'TurnOn','Effect_W','50','A1','');








/* get MediaSource_Id */
SET @MediaSource_Id = (SELECT Id FROM MediaSources WHERE Url = 'http://bbcmedia.ic.llnwd.net/stream/bbcmedia_lrnorfolk_mf_p');

/* get MediaOutputVolume_Id */
SET @MediaOutputVolume_Id = (SELECT Id FROM MediaOutputVolumes WHERE VolumeValue = '15');

/* get MediaOutput_Id */
SET @MediaOutput_Id = (SELECT Id FROM MediaOutputs WHERE MediaWebserviceUrl = 'http://10.0.0.1/example.com/playservice_POST.svc');

/* get MediaActionType_Id */
SET @MediaActionType_Id = (SELECT Id FROM MediaActionTypes WHERE ActionTypeOption = 'Stop');

INSERT INTO MediaActions(Active, CronExpression, FK_MediaSource_Id, FK_MediaOutputVolume_Id, FK_MediaOutput_Id, FK_MediaActionType_Id) VALUES ('1',IFNULL('EXEMPEL PÅ CRON',''),@MediaSource_Id, @MediaOutputVolume_Id, @MediaOutput_Id ,@MediaActionType_Id) ON DUPLICATE KEY UPDATE Id = LAST_INSERT_ID(Id);
SET @MediaAction_Id = LAST_INSERT_ID();

/* register performed MediaAction */
INSERT INTO MediaActionsPerformed(PerformedTime, FK_MediaAction_Id) VALUES (UNIX_TIMESTAMP(),@MediaAction_Id);
SET @LastTelldusActionPerformed_Id = LAST_INSERT_ID();