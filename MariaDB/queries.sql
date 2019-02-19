
DROP procedure IF EXISTS RegisterPerformedTelldusAction;
DROP procedure IF EXISTS GetInsertedTelldusAction;
DROP procedure IF EXISTS GetRegisteredScheduler;
DROP procedure IF EXISTS RegisterTelldusAction_Scheduler;
DROP procedure IF EXISTS RegisterPerformedMediaAction;
DROP procedure IF EXISTS GetInsertedMediaAction;


DELIMITER $$
CREATE PROCEDURE GetRegisteredScheduler (
	IN p_Scheduler_Date		DATE,
	IN p_Scheduler_Day		CHAR(2),
	IN p_Scheduler_Time		TIME,
	OUT idOut INT)
BEGIN
	/* Inserts a Scheduler (in Schedulers) and returns Id for the inserted row. If an identical Scheduler already is exists, its Id is returned. */
	
	INSERT INTO Schedulers(`Date`, `Day`, `Time`) VALUES (p_Scheduler_Date, p_Scheduler_Day, p_Scheduler_Time) ON DUPLICATE KEY UPDATE `Id` = LAST_INSERT_ID(`Id`);
	
	SELECT LAST_INSERT_ID() INTO idOut ;
END$$
DELIMITER ;


DELIMITER $$
CREATE PROCEDURE RegisterPerformedTelldusAction (
	IN p_PerformedTelldusActionUnixTime 	INT,
	IN p_TelldusUnit_Name 					VARCHAR(255),
	IN p_TelldusActionType_ActionTypeOption VARCHAR(255),
	IN p_TelldusActionValueType_Name 		VARCHAR(20),
	IN p_TelldusActionValue_ActionValue 	VARCHAR(255),
	OUT idOut INT)
BEGIN
	CALL GetInsertedTelldusAction('1', p_TelldusUnit_Name, p_TelldusActionType_ActionTypeOption,p_TelldusActionValueType_Name, p_TelldusActionValue_ActionValue,@InsertedTelldusAction_Id);
	
	/* register performed TelldusAction */
	INSERT INTO `TelldusActionsPerformed`(`PerformedTime`, `FK_TelldusAction_Id`) VALUES (IFNULL(p_PerformedTelldusActionUnixTime, UNIX_TIMESTAMP()), @InsertedTelldusAction_Id);
	SET @LastTelldusActionPerformed_Id = LAST_INSERT_ID();
	
	SELECT LAST_INSERT_ID() INTO idOut ;
END$$
DELIMITER ;


DELIMITER $$
CREATE PROCEDURE GetInsertedTelldusAction ( 
	IN p_Active 							BIT,
	IN p_TelldusUnit_Name 					VARCHAR(255),
	IN p_TelldusActionType_ActionTypeOption VARCHAR(255),
	IN p_TelldusActionValueType_Name 		VARCHAR(20),
	IN p_TelldusActionValue_ActionValue 	VARCHAR(255),
	OUT idOut INT)
BEGIN
	/* Inserts an Action and returns Id for the inserted row. If an identical Action already is exists, its Id is returned. There are no optional parameters. Use empty strings. */
	
	/* get TelldusUnit_Id */
	SET @TelldusUnit_Id = (SELECT `Id` FROM `TelldusUnits` WHERE `Name` = p_TelldusUnit_Name);

	/* get TelldusActionType_Id */
	SET @TelldusActionType_Id = (SELECT `Id` FROM `TelldusActionTypes` WHERE `ActionTypeOption` = p_TelldusActionType_ActionTypeOption);

	/* get TelldusActionValue_Id */
	SET @TelldusActionValue_Id = 
	(SELECT
		`TelldusActionValues`.`Id`
		FROM `TelldusActionValues` INNER JOIN `TelldusActionValueTypes` 
			ON `TelldusActionValues`.`FK_TelldusActionValueType_Id` = `TelldusActionValueTypes`.`Id`
		WHERE `TelldusActionValues`.`ActionValue` = p_TelldusActionValue_ActionValue 
			AND `TelldusActionValueTypes`.`Name` = p_TelldusActionValueType_Name);

	
	/* get TelldusAction_Id */
	INSERT INTO `TelldusActions` (`Active`, `FK_TelldusActionType_Id`, `FK_TelldusActionValue_Id`, `FK_TelldusUnit_Id`) VALUES (p_Active, @TelldusActionType_Id, @TelldusActionValue_Id, @TelldusUnit_Id) ON DUPLICATE KEY UPDATE `Id` = LAST_INSERT_ID(`Id`);
	
	SELECT LAST_INSERT_ID() INTO idOut ;
END$$
DELIMITER ;





DELIMITER $$
CREATE PROCEDURE RegisterTelldusAction_Scheduler ( 
	IN p_TelldusAction_Active					BIT,
	IN p_TelldusUnit_Name 						VARCHAR(255),
	IN p_TelldusActionType_ActionTypeOption 	VARCHAR(255),
	IN p_TelldusActionValueType_Name 			VARCHAR(20),
	IN p_TelldusActionValue_ActionValue 		VARCHAR(255),
	IN p_telldusAction_Scheduler_ReferenceId	VARCHAR(255),
	IN p_Scheduler_Date							DATE,
	IN p_Scheduler_Day							CHAR(2),
	IN p_Scheduler_Time							TIME,
	OUT idOut INT)
BEGIN
	/* Inserts a TelldusAction with Scheduler (in TelldusActions_Schedulers) and returns Id for the inserted row. If an identical TelldusActions_Schedulers already is exists, its Id is returned. */
	
	CALL GetRegisteredScheduler(p_Scheduler_Date, p_Scheduler_Day, p_Scheduler_Time, @Scheduler_Id);

	/* get TelldusActionType_Id */
	CALL GetInsertedTelldusAction(p_TelldusAction_Active, p_TelldusUnit_Name, p_TelldusActionType_ActionTypeOption, p_TelldusActionValueType_Name, p_TelldusActionValue_ActionValue, @TelldusAction_Id);


	INSERT INTO `TelldusActions_Schedulers`(`ReferenceId`, `FK_TelldusAction_Id`, `FK_Scheduler_Id`) VALUES (p_telldusAction_Scheduler_ReferenceId, @TelldusAction_Id, @Scheduler_Id) ON DUPLICATE KEY UPDATE `Id` = LAST_INSERT_ID(`Id`);
	
	SELECT LAST_INSERT_ID() INTO idOut ;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE GetInsertedMediaAction ( 
	IN p_Active 					BIT,
	IN p_MediaSourceName 			VARCHAR(255),
	IN p_MediaOutputValue 			TINYINT,
	IN p_MediaOutputWebserviceUrl	VARCHAR(100),
	IN p_MediaActionTypeOption 		VARCHAR(255),
	OUT idOut						INT)
BEGIN
	/* Inserts an Action and returns Id for the inserted row. If an identical Action already is exists, its Id is returned. There are no optional parameters. Use empty strings. */
	
	/* get MediaSource_Id */
	SET @MediaSource_Id = (SELECT `Id` FROM `MediaSources` WHERE `Name` = p_MediaSourceName);
	
	/* get MediaOutputVolume_Id */
	SET @MediaOutputVolume_Id = (SELECT `Id` FROM `MediaOutputVolumes` WHERE `Value` = p_MediaOutputValue);
	
	/* get MediaOutput_Id */
	SET @MediaOutput_Id = (SELECT `Id` FROM `MediaOutputs` WHERE `MediaWebserviceUrl` = p_MediaOutputWebserviceUrl);
	
	/* get MediaActionType_Id */
	SET @MediaActionType_Id = (SELECT `Id` FROM `MediaActionTypes` WHERE `ActionTypeOption` = p_MediaActionTypeOption);
	
	/* get MediaAction_Id */
	INSERT INTO MediaActions ( `Active`, `FK_MediaSource_Id`, `FK_MediaOutputVolume_Id`, `FK_MediaOutput_Id`, `FK_MediaActionType_Id`) VALUES (p_Active, @MediaSource_Id, @MediaOutputVolume_Id, @MediaOutput_Id, @MediaActionType_Id) ON DUPLICATE KEY UPDATE `Id` = LAST_INSERT_ID(`Id`);
	
	SELECT LAST_INSERT_ID() INTO idOut ;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE RegisterPerformedMediaAction (
	IN p_PerformedMediaActionUnixTime 	INT,
	IN p_MediaSourceName 				VARCHAR(255),
	IN p_MediaOutputValue 				TINYINT,
	IN p_MediaOutputWebserviceUrl 		VARCHAR(100),
	IN p_MediaActionTypeOption 			VARCHAR(255),
	OUT idOut 							INT)
BEGIN
	CALL GetInsertedMediaAction('1', p_MediaSourceName, p_MediaOutputValue, p_MediaOutputWebserviceUrl, p_MediaActionTypeOption, @InsertedMediaAction_Id);
	
	/* register performed MediaAction */
	INSERT INTO `MediaActionsPerformed`(`PerformedTime`, `FK_MediaAction_Id`) VALUES (IFNULL(p_PerformedMediaActionUnixTime, UNIX_TIMESTAMP()), @InsertedMediaAction_Id);
	
	SELECT LAST_INSERT_ID() INTO idOut ;
END$$
DELIMITER ;
