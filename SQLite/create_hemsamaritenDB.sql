DROP TABLE IF EXISTS `TelldusUnitLocations`;
DROP TABLE IF EXISTS `TelldusUnitTypes`;
DROP TABLE IF EXISTS `ZWaveGatewayTellsticZnetLiteVer2s`;
DROP TABLE IF EXISTS `TelldusActionTypes`;
DROP TABLE IF EXISTS `TelldusActionValues`;
DROP TABLE IF EXISTS `TelldusUnits`;
DROP TABLE IF EXISTS `TelldusActions`;
DROP TABLE IF EXISTS `Actions`;
DROP TABLE IF EXISTS `MediaActions`;
DROP TABLE IF EXISTS `MediaSources`;
DROP TABLE IF EXISTS `PerformedActions`;
DROP TABLE IF EXISTS `Countries`;
DROP TABLE IF EXISTS `MediaOutputVolumes`;
DROP TABLE IF EXISTS `MediaOutputs`;
DROP TABLE IF EXISTS `MediaActionTypes`;

CREATE TABLE `TelldusUnitLocations` (
	`Id`		INTEGER PRIMARY KEY AUTOINCREMENT,
	
	`Name`		TEXT
);

CREATE TABLE `TelldusUnitTypes` (
	`Id`		INTEGER PRIMARY KEY AUTOINCREMENT,
	
	`Name`		TEXT NOT NULL
);

CREATE TABLE `ZWaveGatewayTellsticZnetLiteVer2s` (
	`Id`		INTEGER PRIMARY KEY AUTOINCREMENT,
	
	`BaseURL`	TEXT NOT NULL
);

CREATE TABLE `TelldusActionTypes` (
	`Id`		INTEGER PRIMARY KEY AUTOINCREMENT,
	
	`Option`	TEXT NOT NULL CHECK (`ActionTypeOption` IN ('TurnOn', 'TurnOff', 'OnLevel','GetEffect','GetTemperature', 'SetTemperature', 'RefreshBearerToken'))
);

CREATE TABLE `TelldusActionValues` (
	`Id`		INTEGER PRIMARY KEY AUTOINCREMENT,
	
	`OnLevelValue`	INTEGER CHECK(0 <= `OnLevelValue` AND `OnLevelValue` <= 99),
	`Effect`		REAL,
	`TemperatureC`	TEXT,
	`LightLumen`	INTEGER,
	
	`BearerToken`			TEXT,	
	`BearerTokenExpires`	INTEGER
);

CREATE TABLE `TelldusUnits` (
	`Id`		INTEGER PRIMARY KEY AUTOINCREMENT,
	`Active`	INTEGER NOT NULL CHECK(`Active` IN (0,1)),
	
	`Name`					TEXT NOT NULL,
	`Location`				TEXT,
	`LocationDesciption`	TEXT,	
	
	--constraints
	`FK_TelldusUnitLocation_Id`	INTEGER NOT NULL,
	`FK_TelldusUnitType_Id`		INTEGER NOT NULL,
	
	FOREIGN KEY (FK_TelldusUnitLocation_Id) REFERENCES TelldusUnitLocations(Id),
	FOREIGN KEY (FK_TelldusUnitType_Id) REFERENCES TelldusUnitTypes(Id)
);
 
CREATE TABLE `TelldusActions` (
	`Id`		INTEGER PRIMARY KEY AUTOINCREMENT,
	
	--constraints
	`FK_ZWaveGatewayTellsticZnetLiteVer2_Id`	INTEGER NOT NULL,
	`FK_TelldusActionType_Id`	INTEGER NOT NULL,
	`FK_TelldusActionValue_Id`	INTEGER NOT NULL,
	`FK_TelldusUnit_Id`	INTEGER NOT NULL,
	
	FOREIGN KEY (FK_ZWaveGatewayTellsticZnetLiteVer2_Id) REFERENCES ZWaveGatewayTellsticZnetLiteVer2s(Id),
	FOREIGN KEY (FK_TelldusActionType_Id) REFERENCES TelldusActionTypes(Id),
	FOREIGN KEY (FK_TelldusActionValue_Id) REFERENCES TelldusActionValues(Id),
	FOREIGN KEY (FK_TelldusUnit_Id) REFERENCES TelldusUnits(Id)
);

CREATE TABLE `Actions` (
	`Id`		INTEGER PRIMARY KEY AUTOINCREMENT,
	`Active`	INTEGER NOT NULL CHECK(`Active` IN (0,1)),
	
	`CronExpression`		TEXT,
	
	--constraints
	`FK_TelldusAction_Id`	INTEGER NOT NULL,
	`FK_MediaAction_Id`		INTEGER NOT NULL,
	
	FOREIGN KEY (FK_TelldusAction_Id) 	REFERENCES TelldusActions(Id),
	FOREIGN KEY (FK_MediaAction_Id) 	REFERENCES MediaActions(Id)
);

CREATE TABLE `MediaActions` (
	`Id`		INTEGER PRIMARY KEY AUTOINCREMENT,
	
	--constraints
	`FK_MediaSource_Id`	INTEGER NOT NULL,	
	`FK_MediaOutputVolume_Id`	INTEGER NOT NULL,
	`FK_MediaOutput_Id`	INTEGER NOT NULL,
	`FK_MediaActionType_Id`	INTEGER NOT NULL,
	
	FOREIGN KEY (FK_MediaSource_Id) REFERENCES MediaSources(Id),
	FOREIGN KEY (FK_MediaOutputVolume_Id) REFERENCES MediaOutputVolumes(Id),	
	FOREIGN KEY (FK_MediaOutput_Id) REFERENCES MediaOutputs(Id),	
	FOREIGN KEY (FK_MediaActionType_Id) REFERENCES MediaActionTypes(Id)
);

CREATE TABLE `MediaSources` (
	`Id`		INTEGER PRIMARY KEY AUTOINCREMENT,
	
	`Name`					TEXT NOT NULL,
	`Url`					TEXT,
	`MediaDataBase64` 		TEXT,
	`MediaCategoryType` 	TEXT NOT NULL CHECK (`MediaCategoryType` IN ('InternetStreamRadio', 'FileSoundEffect')),
	
	--constraints
	`FK_Country_Id`	INTEGER NOT NULL,
	
	FOREIGN KEY (FK_Country_Id) REFERENCES Countries(Id)	
);

CREATE TABLE `PerformedActions` (
	`Id`		INTEGER PRIMARY KEY AUTOINCREMENT,
	
	`PerformedTime`	INTEGER NOT NULL,
	
	--constraints
	`FK_Action_Id`	INTEGER NOT NULL,
	FOREIGN KEY (FK_Action_Id) REFERENCES Actions(Id)
);

CREATE TABLE `Countries` (
	`Id`		INTEGER PRIMARY KEY AUTOINCREMENT,
	
	`Name`	TEXT,
	`Code`	TEXT,
	`ISOAlpha2`	TEXT,
	`ISOAlpha3`	TEXT
);

CREATE TABLE `MediaOutputVolumes` (
	`Id`		INTEGER PRIMARY KEY AUTOINCREMENT,
	
	`VolumeValue0_100`	INTEGER NOT NULL CHECK(0 <= `VolumeValue0_100` AND `VolumeValue0_100` <= 100)
);

CREATE TABLE `MediaOutputs` (
	`Id`		INTEGER PRIMARY KEY AUTOINCREMENT,
	
	`MediaWebserviceURL`	TEXT
);

CREATE TABLE `MediaActionTypes` (
	`Id`		INTEGER PRIMARY KEY AUTOINCREMENT,
	
	`ActionTypeOption`	TEXT NOT NULL CHECK (`ActionTypeOption` IN ('Play', 'Pause', 'Stop', 'SetVolume'))
);
