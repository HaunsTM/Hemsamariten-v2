------------------------------------------------------------------

/* get TelldusActionType_Id */
SET @TelldusActionType_Id = (SELECT `Id` FROM `TelldusActionTypes` WHERE `ActionTypeOption`='TurnOn');


/* get TelldusActionValueType_Id */
SET @TelldusActionValueType_Id = (SELECT `Id` FROM `TelldusActionValueTypes` WHERE `Name`='Effect_W');

/* get TelldusActionValue_Id */
INSERT INTO `TelldusActionValues`(`ActionValue`, `FK_TelldusActionValueType_Id`) VALUES ('50',@TelldusActionValueType_Id) 
	ON DUPLICATE KEY UPDATE Id = LAST_INSERT_ID(Id);
SET @TelldusActionValue_Id = LAST_INSERT_ID();



/* get TelldusUnit_Id */
SET @TelldusUnit_Id = (SELECT `Id` FROM `TelldusUnits` WHERE `Name`='A1');


/* get TelldusActions_Id */
INSERT INTO `TelldusActions` ( `Active`, `CronExpression`, `FK_ZWaveGatewayTellsticZnetLiteVer2_Id`, `FK_TelldusActionType_Id`, `FK_TelldusActionValue_Id`, `FK_TelldusUnit_Id`) VALUES ('1', IFNULL('EXEMPEL PÅ CRON',''),'1', @TelldusActionType_Id, @TelldusActionValue_Id, @TelldusUnit_Id) ON DUPLICATE KEY UPDATE Id = LAST_INSERT_ID(Id);
SET @TelldusActions_Id = LAST_INSERT_ID();


/* register performed TelldusAction */
INSERT INTO `TelldusActionsPerformed`(`PerformedTime`, `FK_TelldusAction_Id`) VALUES (UNIX_TIMESTAMP(),@TelldusActions_Id);
SET @LastTelldusActionPerformed_Id = LAST_INSERT_ID();

*******************
