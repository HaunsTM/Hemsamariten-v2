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
	LocationDesciption			VARCHAR(255),
	
	FK_TelldusUnitLocation_Id	INT,
	FK_TelldusUnitType_Id		INT,
	
	PRIMARY KEY (Id)
);
 
CREATE TABLE TelldusActions (
	Id										INT NOT NULL AUTO_INCREMENT,
	Active									BIT NOT NULL,	
	
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

CREATE TABLE TelldusActions_Schedulers (
	Id					INT NOT NULL AUTO_INCREMENT,
	
	FK_TelldusAction_Id	INT NOT NULL,
	FK_Scheduler_Id		INT NOT NULL,
	
	PRIMARY KEY (Id)
);

CREATE TABLE Schedulers (
	Id			INT NOT NULL AUTO_INCREMENT,
	
	Year		CHAR(4),
	Month		CHAR(2),
	Day			CHAR(2),
	WeekDay		CHAR(2),
	Hour		CHAR(2),
	Minute		CHAR(2),
		
	PRIMARY KEY (Id)
);

CREATE TABLE MediaActions_Schedulers (
	Id					INT NOT NULL AUTO_INCREMENT,
	
	FK_MediaAction_Id	INT NOT NULL,
	FK_Scheduler_Id		INT NOT NULL,
	
	PRIMARY KEY (Id)
);

CREATE TABLE MediaActions (
	Id						INT NOT NULL AUTO_INCREMENT,
	Active					BIT NOT NULL,
		
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
	
	Name					VARCHAR(100),
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

ALTER TABLE TelldusActions ADD FOREIGN KEY (FK_TelldusActionType_Id) REFERENCES TelldusActionTypes(Id);
ALTER TABLE TelldusActions ADD FOREIGN KEY (FK_TelldusActionValue_Id) REFERENCES TelldusActionValues(Id);
ALTER TABLE TelldusActions ADD FOREIGN KEY (FK_TelldusUnit_Id) REFERENCES TelldusUnits(Id);

ALTER TABLE TelldusActions_Schedulers ADD FOREIGN KEY (FK_TelldusAction_Id) REFERENCES TelldusActions(Id);
ALTER TABLE TelldusActions_Schedulers  ADD FOREIGN KEY (FK_Scheduler_Id) REFERENCES Schedulers(Id);

ALTER TABLE MediaActions_Schedulers ADD FOREIGN KEY (FK_MediaAction_Id) REFERENCES MediaActions(Id);
ALTER TABLE MediaActions_Schedulers ADD FOREIGN KEY (FK_Scheduler_Id) REFERENCES Schedulers(Id);
		
ALTER TABLE MediaActions ADD FOREIGN KEY (FK_MediaSource_Id) REFERENCES MediaSources(Id);
ALTER TABLE MediaActions ADD FOREIGN KEY (FK_MediaOutputVolume_Id) REFERENCES MediaOutputVolumes(Id);	
ALTER TABLE MediaActions ADD FOREIGN KEY (FK_MediaOutput_Id) REFERENCES MediaOutputs(Id);
ALTER TABLE MediaActions ADD FOREIGN KEY (FK_MediaActionType_Id) REFERENCES MediaActionTypes(Id);

ALTER TABLE MediaSources ADD FOREIGN KEY (FK_MediaCategoryType_Id) REFERENCES MediaCategoryTypes(Id);
ALTER TABLE MediaSources ADD FOREIGN KEY (FK_MediaCountry_Id) REFERENCES MediaCountries(Id);

ALTER TABLE TelldusActionsPerformed ADD FOREIGN KEY (FK_TelldusAction_Id) REFERENCES TelldusActions(Id);
ALTER TABLE MediaActionsPerformed ADD FOREIGN KEY (FK_MediaAction_Id) REFERENCES MediaActions(Id);

ALTER TABLE	TelldusActionValues ADD UNIQUE (ActionValue, FK_TelldusActionValueType_Id);
	
ALTER TABLE	TelldusActions ADD UNIQUE (FK_TelldusActionType_Id, FK_TelldusActionValue_Id, FK_TelldusUnit_Id);
	
	
ALTER TABLE	TelldusActions_Schedulers ADD UNIQUE (FK_TelldusAction_Id, FK_Scheduler_Id);

ALTER TABLE	Schedulers ADD UNIQUE (Year, Month, Day, WeekDay, Hour, Minute); 

ALTER TABLE	MediaActions_Schedulers ADD UNIQUE (FK_MediaAction_Id, FK_Scheduler_Id);
	
ALTER TABLE	MediaSources ADD UNIQUE (Name);
ALTER TABLE	MediaSources ADD UNIQUE (Url);
ALTER TABLE	MediaOutputs ADD UNIQUE (MediaWebserviceUrl);

ALTER TABLE	MediaActions ADD UNIQUE (FK_MediaSource_Id, FK_MediaOutputVolume_Id, FK_MediaOutput_Id, FK_MediaActionType_Id);

