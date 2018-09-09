CREATE TABLE TelldusUnitLocations (
	Id			INT NOT NULL AUTO_INCREMENT,
	
	Name		TEXT,
	
	PRIMARY KEY (Id)
);

CREATE TABLE TelldusUnitTypes (
	Id			INT NOT NULL AUTO_INCREMENT,
	
	Name		VARCHAR(255),
	
	PRIMARY KEY (Id)
);

CREATE TABLE ZWaveGatewayTellsticZnetLiteVer2s (
	Id			INT NOT NULL AUTO_INCREMENT,
	
	BaseURL		VARCHAR(255),
	
	PRIMARY KEY (Id)
);

CREATE TABLE TelldusActionTypes (
	Id					INT NOT NULL AUTO_INCREMENT,
	
	ActionTypeOption	VARCHAR(255),
	
	PRIMARY KEY (Id)
);

CREATE TABLE TelldusActionValueTypes (
	Id					INT NOT NULL AUTO_INCREMENT,	
	
	Name				VARCHAR(255)  NOT NULL,
	
	PRIMARY KEY (Id)
);

CREATE TABLE TelldusActionValues (
	Id								INT NOT NULL AUTO_INCREMENT,
	
	ActionValue						VARCHAR(20) NOT NULL,
	
	FK_TelldusActionValueType_Id	INT NOT NULL,
	
	PRIMARY KEY (Id)
);

CREATE TABLE TelldusUnits (
	Id							INT NOT NULL AUTO_INCREMENT,	
	Active						BIT NOT NULL,
	
	Name						VARCHAR(255) NOT NULL,
	Location					VARCHAR(255),
	LocationDesciption			VARCHAR(255),
	
	FK_TelldusUnitLocation_Id	INT,
	FK_TelldusUnitType_Id		INT,
	
	PRIMARY KEY (Id)
);
 
CREATE TABLE TelldusActions (
	Id										INT NOT NULL AUTO_INCREMENT,
	Active									BIT NOT NULL,
	
	CronExpression							VARCHAR(30) NOT NULL,
	
	FK_ZWaveGatewayTellsticZnetLiteVer2_Id	INT NOT NULL,
	FK_TelldusActionType_Id					INT NOT NULL,
	FK_TelldusActionValue_Id				INT NOT NULL,
	FK_TelldusUnit_Id						INT NOT NULL,
	
	PRIMARY KEY (Id)
);

CREATE TABLE TelldusActionsPerformed (
	Id					INT NOT NULL AUTO_INCREMENT,
	
	PerformedTime		INT NOT NULL,
	
	FK_TelldusAction_Id	INT NOT NULL,
	
	PRIMARY KEY (Id)
);

CREATE TABLE MediaActions (
	Id						INT NOT NULL AUTO_INCREMENT,
	Active					BIT NOT NULL,
	
	CronExpression			VARCHAR(30) NOT NULL,
	
	FK_MediaSource_Id		INT NOT NULL,	
	FK_MediaOutputVolume_Id	INT NOT NULL,
	FK_MediaOutput_Id		INT NOT NULL,
	FK_MediaActionType_Id	INT NOT NULL,
	
	PRIMARY KEY (Id)
);

CREATE TABLE MediaActionsPerformed (
	Id					INT NOT NULL AUTO_INCREMENT,
	
	PerformedTime		INT NOT NULL,
	
	FK_MediaAction_Id	INT NOT NULL,
	
	PRIMARY KEY (Id)
);

CREATE TABLE MediaSources (
	Id						INT NOT NULL AUTO_INCREMENT,
	
	Name					VARCHAR(255) NOT NULL,
	Url						VARCHAR(100),
	
	FK_MediaCategoryType_Id	INT NOT NULL,
	FK_MediaCountry_Id		INT,
	
	PRIMARY KEY (Id)
);

CREATE TABLE MediaCategoryTypes (
	Id	INT NOT NULL AUTO_INCREMENT,	
	
	Name VARCHAR(255),	
	
	PRIMARY KEY (Id)
);

CREATE TABLE MediaCountries (
	Id			INT NOT NULL AUTO_INCREMENT,
	
	Name		VARCHAR(255),
	Code		VARCHAR(255),
	ISOAlpha2	VARCHAR(255),
	ISOAlpha3	VARCHAR(255),
	
	PRIMARY KEY (Id)
);

CREATE TABLE MediaOutputVolumes (
	Id			INT NOT NULL AUTO_INCREMENT,
	
	VolumeValue	TINYINT NOT NULL,
	
	PRIMARY KEY (Id)
);

CREATE TABLE MediaOutputs (
	Id					INT NOT NULL AUTO_INCREMENT,
	
	MediaWebserviceUrl	VARCHAR(100),
	
	PRIMARY KEY (Id)
);

CREATE TABLE MediaActionTypes (
	Id					INT NOT NULL AUTO_INCREMENT,
	
	ActionTypeOption	VARCHAR(255) NOT NULL,
	
	PRIMARY KEY (Id)
);


ALTER TABLE TelldusActionValues ADD FOREIGN KEY (FK_TelldusActionValueType_Id) REFERENCES TelldusActionValueTypes(Id);

ALTER TABLE TelldusUnits ADD FOREIGN KEY (FK_TelldusUnitLocation_Id) REFERENCES TelldusUnitLocations(Id);
ALTER TABLE TelldusUnits ADD FOREIGN KEY (FK_TelldusUnitType_Id) REFERENCES TelldusUnitTypes(Id);

ALTER TABLE TelldusActions ADD FOREIGN KEY (FK_ZWaveGatewayTellsticZnetLiteVer2_Id) REFERENCES ZWaveGatewayTellsticZnetLiteVer2s(Id);
ALTER TABLE TelldusActions ADD FOREIGN KEY (FK_TelldusActionType_Id) REFERENCES TelldusActionTypes(Id);
ALTER TABLE TelldusActions ADD FOREIGN KEY (FK_TelldusActionValue_Id) REFERENCES TelldusActionValues(Id);
ALTER TABLE TelldusActions ADD FOREIGN KEY (FK_TelldusUnit_Id) REFERENCES TelldusUnits(Id);
		
ALTER TABLE MediaActions ADD FOREIGN KEY (FK_MediaSource_Id) REFERENCES MediaSources(Id);
ALTER TABLE MediaActions ADD FOREIGN KEY (FK_MediaOutputVolume_Id) REFERENCES MediaOutputVolumes(Id);	
ALTER TABLE MediaActions ADD FOREIGN KEY (FK_MediaOutput_Id) REFERENCES MediaOutputs(Id);
ALTER TABLE MediaActions ADD FOREIGN KEY (FK_MediaActionType_Id) REFERENCES MediaActionTypes(Id);


ALTER TABLE MediaSources ADD FOREIGN KEY (FK_MediaCategoryType_Id) REFERENCES MediaCategoryTypes(Id);
ALTER TABLE MediaSources ADD FOREIGN KEY (FK_MediaCountry_Id) REFERENCES MediaCountries(Id);

ALTER TABLE TelldusActionsPerformed ADD FOREIGN KEY (FK_TelldusAction_Id) REFERENCES TelldusActions(Id);
ALTER TABLE MediaActionsPerformed ADD FOREIGN KEY (FK_MediaAction_Id) REFERENCES MediaActions(Id);

ALTER TABLE	TelldusActionValues ADD UNIQUE NoDuplicate(ActionValue, FK_TelldusActionValueType_Id);
	
ALTER TABLE	TelldusActions ADD UNIQUE NoDuplicate(CronExpression, FK_ZWaveGatewayTellsticZnetLiteVer2_Id, FK_TelldusActionType_Id, FK_TelldusActionValue_Id, FK_TelldusUnit_Id);
	
ALTER TABLE	MediaSources ADD UNIQUE NoDuplicate(Url);
ALTER TABLE	MediaOutputs ADD UNIQUE NoDuplicate(MediaWebserviceUrl);

ALTER TABLE	MediaActions ADD UNIQUE NoDuplicate(CronExpression, FK_MediaSource_Id, FK_MediaOutputVolume_Id, FK_MediaOutput_Id, FK_MediaActionType_Id);