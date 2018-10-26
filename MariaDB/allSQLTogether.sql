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

INSERT INTO TelldusUnitLocations (Name) VALUES ('*Ingen särskild plats*');
INSERT INTO TelldusUnitLocations (Name) VALUES ('Garage');
INSERT INTO TelldusUnitLocations (Name) VALUES ('Garage - tak');
INSERT INTO TelldusUnitLocations (Name) VALUES ('Garage - fasad');
INSERT INTO TelldusUnitLocations (Name) VALUES ('Parkering');
INSERT INTO TelldusUnitLocations (Name) VALUES ('Fågelmatare');
INSERT INTO TelldusUnitLocations (Name) VALUES ('Växthus');
INSERT INTO TelldusUnitLocations (Name) VALUES ('Trädgårdsland');
INSERT INTO TelldusUnitLocations (Name) VALUES ('Lekstuga');
INSERT INTO TelldusUnitLocations (Name) VALUES ('Hus - tak');
INSERT INTO TelldusUnitLocations (Name) VALUES ('Hus - fasad');
INSERT INTO TelldusUnitLocations (Name) VALUES ('Vind');
INSERT INTO TelldusUnitLocations (Name) VALUES ('Krypgrund');
INSERT INTO TelldusUnitLocations (Name) VALUES ('Kök');
INSERT INTO TelldusUnitLocations (Name) VALUES ('Grovkök');
INSERT INTO TelldusUnitLocations (Name) VALUES ('Korridor');
INSERT INTO TelldusUnitLocations (Name) VALUES ('Vardagsrum');
INSERT INTO TelldusUnitLocations (Name) VALUES ('Uterum');
INSERT INTO TelldusUnitLocations (Name) VALUES ('Gästtoalett');
INSERT INTO TelldusUnitLocations (Name) VALUES ('Städskrubb');
INSERT INTO TelldusUnitLocations (Name) VALUES ('Badrum');
INSERT INTO TelldusUnitLocations (Name) VALUES ('TV-rum');
INSERT INTO TelldusUnitLocations (Name) VALUES ('Atikas rum');
INSERT INTO TelldusUnitLocations (Name) VALUES ('Hans rum');
INSERT INTO TelldusUnitLocations (Name) VALUES ('Sovrum');

INSERT INTO TelldusUnitTypes (Name) VALUES ('433 MHz - OnOff');
INSERT INTO TelldusUnitTypes (Name) VALUES ('433 MHz - Bell');
INSERT INTO TelldusUnitTypes (Name) VALUES ('433 MHz - LightSensor');
INSERT INTO TelldusUnitTypes (Name) VALUES ('Z-Wave - OnOffDim');
INSERT INTO TelldusUnitTypes (Name) VALUES ('Z-Wave - HeatItZWaveThermostat');

INSERT INTO TelldusActionTypes (ActionTypeOption) VALUES ('getProfile');
INSERT INTO TelldusActionTypes (ActionTypeOption) VALUES ('listSensors');
INSERT INTO TelldusActionTypes (ActionTypeOption) VALUES ('setSensorName');
INSERT INTO TelldusActionTypes (ActionTypeOption) VALUES ('setSensorIgnore');
INSERT INTO TelldusActionTypes (ActionTypeOption) VALUES ('listClients');
INSERT INTO TelldusActionTypes (ActionTypeOption) VALUES ('listDevices');
INSERT INTO TelldusActionTypes (ActionTypeOption) VALUES ('getDeviceInfo');
INSERT INTO TelldusActionTypes (ActionTypeOption) VALUES ('addDevice');
INSERT INTO TelldusActionTypes (ActionTypeOption) VALUES ('deviceLearn');
INSERT INTO TelldusActionTypes (ActionTypeOption) VALUES ('setDeviceModel');
INSERT INTO TelldusActionTypes (ActionTypeOption) VALUES ('setDeviceName');
INSERT INTO TelldusActionTypes (ActionTypeOption) VALUES ('setDeviceParameter');
INSERT INTO TelldusActionTypes (ActionTypeOption) VALUES ('setDeviceProtocol');
INSERT INTO TelldusActionTypes (ActionTypeOption) VALUES ('removeDevice');
INSERT INTO TelldusActionTypes (ActionTypeOption) VALUES ('bellDevice');
INSERT INTO TelldusActionTypes (ActionTypeOption) VALUES ('dimDevice');
INSERT INTO TelldusActionTypes (ActionTypeOption) VALUES ('onOffDevice');
INSERT INTO TelldusActionTypes (ActionTypeOption) VALUES ('stopDevice');
INSERT INTO TelldusActionTypes (ActionTypeOption) VALUES ('upDownDevice');
INSERT INTO TelldusActionTypes (ActionTypeOption) VALUES ('commandDevice');
INSERT INTO TelldusActionTypes (ActionTypeOption) VALUES ('commandDevice');
INSERT INTO TelldusActionTypes (ActionTypeOption) VALUES ('listEvents');
INSERT INTO TelldusActionTypes (ActionTypeOption) VALUES ('deviceHistory');

INSERT INTO TelldusActionValueTypes (Name) VALUES ('');
INSERT INTO TelldusActionValueTypes (Name) VALUES ('levelValue');
INSERT INTO TelldusActionValueTypes (Name) VALUES ('commandValue');
INSERT INTO TelldusActionValueTypes (Name) VALUES ('effect_W');
INSERT INTO TelldusActionValueTypes (Name) VALUES ('temperature_C');

INSERT INTO TelldusActionValues (ActionValue,FK_TelldusActionValueType_Id) VALUES ('on',(SELECT Id FROM TelldusActionValueTypes WHERE Name = 'levelValue'));
INSERT INTO TelldusActionValues (ActionValue,FK_TelldusActionValueType_Id) VALUES ('off',(SELECT Id FROM TelldusActionValueTypes WHERE Name = 'levelValue'));
INSERT INTO TelldusActionValues (ActionValue,FK_TelldusActionValueType_Id) VALUES ('up',(SELECT Id FROM TelldusActionValueTypes WHERE Name = 'commandValue'));
INSERT INTO TelldusActionValues (ActionValue,FK_TelldusActionValueType_Id) VALUES ('down',(SELECT Id FROM TelldusActionValueTypes WHERE Name = 'commandValue'));
INSERT INTO TelldusActionValues (ActionValue,FK_TelldusActionValueType_Id) VALUES ('0',(SELECT Id FROM TelldusActionValueTypes WHERE Name = 'levelValue'));
INSERT INTO TelldusActionValues (ActionValue,FK_TelldusActionValueType_Id) VALUES ('1',(SELECT Id FROM TelldusActionValueTypes WHERE Name = 'levelValue'));
INSERT INTO TelldusActionValues (ActionValue,FK_TelldusActionValueType_Id) VALUES ('2',(SELECT Id FROM TelldusActionValueTypes WHERE Name = 'levelValue'));
INSERT INTO TelldusActionValues (ActionValue,FK_TelldusActionValueType_Id) VALUES ('3',(SELECT Id FROM TelldusActionValueTypes WHERE Name = 'levelValue'));
INSERT INTO TelldusActionValues (ActionValue,FK_TelldusActionValueType_Id) VALUES ('4',(SELECT Id FROM TelldusActionValueTypes WHERE Name = 'levelValue'));
INSERT INTO TelldusActionValues (ActionValue,FK_TelldusActionValueType_Id) VALUES ('5',(SELECT Id FROM TelldusActionValueTypes WHERE Name = 'levelValue'));
INSERT INTO TelldusActionValues (ActionValue,FK_TelldusActionValueType_Id) VALUES ('6',(SELECT Id FROM TelldusActionValueTypes WHERE Name = 'levelValue'));
INSERT INTO TelldusActionValues (ActionValue,FK_TelldusActionValueType_Id) VALUES ('7',(SELECT Id FROM TelldusActionValueTypes WHERE Name = 'levelValue'));
INSERT INTO TelldusActionValues (ActionValue,FK_TelldusActionValueType_Id) VALUES ('8',(SELECT Id FROM TelldusActionValueTypes WHERE Name = 'levelValue'));
INSERT INTO TelldusActionValues (ActionValue,FK_TelldusActionValueType_Id) VALUES ('9',(SELECT Id FROM TelldusActionValueTypes WHERE Name = 'levelValue'));
INSERT INTO TelldusActionValues (ActionValue,FK_TelldusActionValueType_Id) VALUES ('10',(SELECT Id FROM TelldusActionValueTypes WHERE Name = 'levelValue'));
INSERT INTO TelldusActionValues (ActionValue,FK_TelldusActionValueType_Id) VALUES ('11',(SELECT Id FROM TelldusActionValueTypes WHERE Name = 'levelValue'));
INSERT INTO TelldusActionValues (ActionValue,FK_TelldusActionValueType_Id) VALUES ('12',(SELECT Id FROM TelldusActionValueTypes WHERE Name = 'levelValue'));
INSERT INTO TelldusActionValues (ActionValue,FK_TelldusActionValueType_Id) VALUES ('13',(SELECT Id FROM TelldusActionValueTypes WHERE Name = 'levelValue'));
INSERT INTO TelldusActionValues (ActionValue,FK_TelldusActionValueType_Id) VALUES ('14',(SELECT Id FROM TelldusActionValueTypes WHERE Name = 'levelValue'));
INSERT INTO TelldusActionValues (ActionValue,FK_TelldusActionValueType_Id) VALUES ('15',(SELECT Id FROM TelldusActionValueTypes WHERE Name = 'levelValue'));
INSERT INTO TelldusActionValues (ActionValue,FK_TelldusActionValueType_Id) VALUES ('16',(SELECT Id FROM TelldusActionValueTypes WHERE Name = 'levelValue'));
INSERT INTO TelldusActionValues (ActionValue,FK_TelldusActionValueType_Id) VALUES ('17',(SELECT Id FROM TelldusActionValueTypes WHERE Name = 'levelValue'));
INSERT INTO TelldusActionValues (ActionValue,FK_TelldusActionValueType_Id) VALUES ('18',(SELECT Id FROM TelldusActionValueTypes WHERE Name = 'levelValue'));
INSERT INTO TelldusActionValues (ActionValue,FK_TelldusActionValueType_Id) VALUES ('19',(SELECT Id FROM TelldusActionValueTypes WHERE Name = 'levelValue'));
INSERT INTO TelldusActionValues (ActionValue,FK_TelldusActionValueType_Id) VALUES ('20',(SELECT Id FROM TelldusActionValueTypes WHERE Name = 'levelValue'));
INSERT INTO TelldusActionValues (ActionValue,FK_TelldusActionValueType_Id) VALUES ('21',(SELECT Id FROM TelldusActionValueTypes WHERE Name = 'levelValue'));
INSERT INTO TelldusActionValues (ActionValue,FK_TelldusActionValueType_Id) VALUES ('22',(SELECT Id FROM TelldusActionValueTypes WHERE Name = 'levelValue'));
INSERT INTO TelldusActionValues (ActionValue,FK_TelldusActionValueType_Id) VALUES ('23',(SELECT Id FROM TelldusActionValueTypes WHERE Name = 'levelValue'));
INSERT INTO TelldusActionValues (ActionValue,FK_TelldusActionValueType_Id) VALUES ('24',(SELECT Id FROM TelldusActionValueTypes WHERE Name = 'levelValue'));
INSERT INTO TelldusActionValues (ActionValue,FK_TelldusActionValueType_Id) VALUES ('25',(SELECT Id FROM TelldusActionValueTypes WHERE Name = 'levelValue'));
INSERT INTO TelldusActionValues (ActionValue,FK_TelldusActionValueType_Id) VALUES ('26',(SELECT Id FROM TelldusActionValueTypes WHERE Name = 'levelValue'));
INSERT INTO TelldusActionValues (ActionValue,FK_TelldusActionValueType_Id) VALUES ('27',(SELECT Id FROM TelldusActionValueTypes WHERE Name = 'levelValue'));
INSERT INTO TelldusActionValues (ActionValue,FK_TelldusActionValueType_Id) VALUES ('28',(SELECT Id FROM TelldusActionValueTypes WHERE Name = 'levelValue'));
INSERT INTO TelldusActionValues (ActionValue,FK_TelldusActionValueType_Id) VALUES ('29',(SELECT Id FROM TelldusActionValueTypes WHERE Name = 'levelValue'));
INSERT INTO TelldusActionValues (ActionValue,FK_TelldusActionValueType_Id) VALUES ('30',(SELECT Id FROM TelldusActionValueTypes WHERE Name = 'levelValue'));
INSERT INTO TelldusActionValues (ActionValue,FK_TelldusActionValueType_Id) VALUES ('31',(SELECT Id FROM TelldusActionValueTypes WHERE Name = 'levelValue'));
INSERT INTO TelldusActionValues (ActionValue,FK_TelldusActionValueType_Id) VALUES ('32',(SELECT Id FROM TelldusActionValueTypes WHERE Name = 'levelValue'));
INSERT INTO TelldusActionValues (ActionValue,FK_TelldusActionValueType_Id) VALUES ('33',(SELECT Id FROM TelldusActionValueTypes WHERE Name = 'levelValue'));
INSERT INTO TelldusActionValues (ActionValue,FK_TelldusActionValueType_Id) VALUES ('34',(SELECT Id FROM TelldusActionValueTypes WHERE Name = 'levelValue'));
INSERT INTO TelldusActionValues (ActionValue,FK_TelldusActionValueType_Id) VALUES ('35',(SELECT Id FROM TelldusActionValueTypes WHERE Name = 'levelValue'));
INSERT INTO TelldusActionValues (ActionValue,FK_TelldusActionValueType_Id) VALUES ('36',(SELECT Id FROM TelldusActionValueTypes WHERE Name = 'levelValue'));
INSERT INTO TelldusActionValues (ActionValue,FK_TelldusActionValueType_Id) VALUES ('37',(SELECT Id FROM TelldusActionValueTypes WHERE Name = 'levelValue'));
INSERT INTO TelldusActionValues (ActionValue,FK_TelldusActionValueType_Id) VALUES ('38',(SELECT Id FROM TelldusActionValueTypes WHERE Name = 'levelValue'));
INSERT INTO TelldusActionValues (ActionValue,FK_TelldusActionValueType_Id) VALUES ('39',(SELECT Id FROM TelldusActionValueTypes WHERE Name = 'levelValue'));
INSERT INTO TelldusActionValues (ActionValue,FK_TelldusActionValueType_Id) VALUES ('40',(SELECT Id FROM TelldusActionValueTypes WHERE Name = 'levelValue'));
INSERT INTO TelldusActionValues (ActionValue,FK_TelldusActionValueType_Id) VALUES ('41',(SELECT Id FROM TelldusActionValueTypes WHERE Name = 'levelValue'));
INSERT INTO TelldusActionValues (ActionValue,FK_TelldusActionValueType_Id) VALUES ('42',(SELECT Id FROM TelldusActionValueTypes WHERE Name = 'levelValue'));
INSERT INTO TelldusActionValues (ActionValue,FK_TelldusActionValueType_Id) VALUES ('43',(SELECT Id FROM TelldusActionValueTypes WHERE Name = 'levelValue'));
INSERT INTO TelldusActionValues (ActionValue,FK_TelldusActionValueType_Id) VALUES ('44',(SELECT Id FROM TelldusActionValueTypes WHERE Name = 'levelValue'));
INSERT INTO TelldusActionValues (ActionValue,FK_TelldusActionValueType_Id) VALUES ('45',(SELECT Id FROM TelldusActionValueTypes WHERE Name = 'levelValue'));
INSERT INTO TelldusActionValues (ActionValue,FK_TelldusActionValueType_Id) VALUES ('46',(SELECT Id FROM TelldusActionValueTypes WHERE Name = 'levelValue'));
INSERT INTO TelldusActionValues (ActionValue,FK_TelldusActionValueType_Id) VALUES ('47',(SELECT Id FROM TelldusActionValueTypes WHERE Name = 'levelValue'));
INSERT INTO TelldusActionValues (ActionValue,FK_TelldusActionValueType_Id) VALUES ('48',(SELECT Id FROM TelldusActionValueTypes WHERE Name = 'levelValue'));
INSERT INTO TelldusActionValues (ActionValue,FK_TelldusActionValueType_Id) VALUES ('49',(SELECT Id FROM TelldusActionValueTypes WHERE Name = 'levelValue'));
INSERT INTO TelldusActionValues (ActionValue,FK_TelldusActionValueType_Id) VALUES ('50',(SELECT Id FROM TelldusActionValueTypes WHERE Name = 'levelValue'));
INSERT INTO TelldusActionValues (ActionValue,FK_TelldusActionValueType_Id) VALUES ('51',(SELECT Id FROM TelldusActionValueTypes WHERE Name = 'levelValue'));
INSERT INTO TelldusActionValues (ActionValue,FK_TelldusActionValueType_Id) VALUES ('52',(SELECT Id FROM TelldusActionValueTypes WHERE Name = 'levelValue'));
INSERT INTO TelldusActionValues (ActionValue,FK_TelldusActionValueType_Id) VALUES ('53',(SELECT Id FROM TelldusActionValueTypes WHERE Name = 'levelValue'));
INSERT INTO TelldusActionValues (ActionValue,FK_TelldusActionValueType_Id) VALUES ('54',(SELECT Id FROM TelldusActionValueTypes WHERE Name = 'levelValue'));
INSERT INTO TelldusActionValues (ActionValue,FK_TelldusActionValueType_Id) VALUES ('55',(SELECT Id FROM TelldusActionValueTypes WHERE Name = 'levelValue'));
INSERT INTO TelldusActionValues (ActionValue,FK_TelldusActionValueType_Id) VALUES ('56',(SELECT Id FROM TelldusActionValueTypes WHERE Name = 'levelValue'));
INSERT INTO TelldusActionValues (ActionValue,FK_TelldusActionValueType_Id) VALUES ('57',(SELECT Id FROM TelldusActionValueTypes WHERE Name = 'levelValue'));
INSERT INTO TelldusActionValues (ActionValue,FK_TelldusActionValueType_Id) VALUES ('58',(SELECT Id FROM TelldusActionValueTypes WHERE Name = 'levelValue'));
INSERT INTO TelldusActionValues (ActionValue,FK_TelldusActionValueType_Id) VALUES ('59',(SELECT Id FROM TelldusActionValueTypes WHERE Name = 'levelValue'));
INSERT INTO TelldusActionValues (ActionValue,FK_TelldusActionValueType_Id) VALUES ('60',(SELECT Id FROM TelldusActionValueTypes WHERE Name = 'levelValue'));
INSERT INTO TelldusActionValues (ActionValue,FK_TelldusActionValueType_Id) VALUES ('61',(SELECT Id FROM TelldusActionValueTypes WHERE Name = 'levelValue'));
INSERT INTO TelldusActionValues (ActionValue,FK_TelldusActionValueType_Id) VALUES ('62',(SELECT Id FROM TelldusActionValueTypes WHERE Name = 'levelValue'));
INSERT INTO TelldusActionValues (ActionValue,FK_TelldusActionValueType_Id) VALUES ('63',(SELECT Id FROM TelldusActionValueTypes WHERE Name = 'levelValue'));
INSERT INTO TelldusActionValues (ActionValue,FK_TelldusActionValueType_Id) VALUES ('64',(SELECT Id FROM TelldusActionValueTypes WHERE Name = 'levelValue'));
INSERT INTO TelldusActionValues (ActionValue,FK_TelldusActionValueType_Id) VALUES ('65',(SELECT Id FROM TelldusActionValueTypes WHERE Name = 'levelValue'));
INSERT INTO TelldusActionValues (ActionValue,FK_TelldusActionValueType_Id) VALUES ('66',(SELECT Id FROM TelldusActionValueTypes WHERE Name = 'levelValue'));
INSERT INTO TelldusActionValues (ActionValue,FK_TelldusActionValueType_Id) VALUES ('67',(SELECT Id FROM TelldusActionValueTypes WHERE Name = 'levelValue'));
INSERT INTO TelldusActionValues (ActionValue,FK_TelldusActionValueType_Id) VALUES ('68',(SELECT Id FROM TelldusActionValueTypes WHERE Name = 'levelValue'));
INSERT INTO TelldusActionValues (ActionValue,FK_TelldusActionValueType_Id) VALUES ('69',(SELECT Id FROM TelldusActionValueTypes WHERE Name = 'levelValue'));
INSERT INTO TelldusActionValues (ActionValue,FK_TelldusActionValueType_Id) VALUES ('70',(SELECT Id FROM TelldusActionValueTypes WHERE Name = 'levelValue'));
INSERT INTO TelldusActionValues (ActionValue,FK_TelldusActionValueType_Id) VALUES ('71',(SELECT Id FROM TelldusActionValueTypes WHERE Name = 'levelValue'));
INSERT INTO TelldusActionValues (ActionValue,FK_TelldusActionValueType_Id) VALUES ('72',(SELECT Id FROM TelldusActionValueTypes WHERE Name = 'levelValue'));
INSERT INTO TelldusActionValues (ActionValue,FK_TelldusActionValueType_Id) VALUES ('73',(SELECT Id FROM TelldusActionValueTypes WHERE Name = 'levelValue'));
INSERT INTO TelldusActionValues (ActionValue,FK_TelldusActionValueType_Id) VALUES ('74',(SELECT Id FROM TelldusActionValueTypes WHERE Name = 'levelValue'));
INSERT INTO TelldusActionValues (ActionValue,FK_TelldusActionValueType_Id) VALUES ('75',(SELECT Id FROM TelldusActionValueTypes WHERE Name = 'levelValue'));
INSERT INTO TelldusActionValues (ActionValue,FK_TelldusActionValueType_Id) VALUES ('76',(SELECT Id FROM TelldusActionValueTypes WHERE Name = 'levelValue'));
INSERT INTO TelldusActionValues (ActionValue,FK_TelldusActionValueType_Id) VALUES ('77',(SELECT Id FROM TelldusActionValueTypes WHERE Name = 'levelValue'));
INSERT INTO TelldusActionValues (ActionValue,FK_TelldusActionValueType_Id) VALUES ('78',(SELECT Id FROM TelldusActionValueTypes WHERE Name = 'levelValue'));
INSERT INTO TelldusActionValues (ActionValue,FK_TelldusActionValueType_Id) VALUES ('79',(SELECT Id FROM TelldusActionValueTypes WHERE Name = 'levelValue'));
INSERT INTO TelldusActionValues (ActionValue,FK_TelldusActionValueType_Id) VALUES ('80',(SELECT Id FROM TelldusActionValueTypes WHERE Name = 'levelValue'));
INSERT INTO TelldusActionValues (ActionValue,FK_TelldusActionValueType_Id) VALUES ('81',(SELECT Id FROM TelldusActionValueTypes WHERE Name = 'levelValue'));
INSERT INTO TelldusActionValues (ActionValue,FK_TelldusActionValueType_Id) VALUES ('82',(SELECT Id FROM TelldusActionValueTypes WHERE Name = 'levelValue'));
INSERT INTO TelldusActionValues (ActionValue,FK_TelldusActionValueType_Id) VALUES ('83',(SELECT Id FROM TelldusActionValueTypes WHERE Name = 'levelValue'));
INSERT INTO TelldusActionValues (ActionValue,FK_TelldusActionValueType_Id) VALUES ('84',(SELECT Id FROM TelldusActionValueTypes WHERE Name = 'levelValue'));
INSERT INTO TelldusActionValues (ActionValue,FK_TelldusActionValueType_Id) VALUES ('85',(SELECT Id FROM TelldusActionValueTypes WHERE Name = 'levelValue'));
INSERT INTO TelldusActionValues (ActionValue,FK_TelldusActionValueType_Id) VALUES ('86',(SELECT Id FROM TelldusActionValueTypes WHERE Name = 'levelValue'));
INSERT INTO TelldusActionValues (ActionValue,FK_TelldusActionValueType_Id) VALUES ('87',(SELECT Id FROM TelldusActionValueTypes WHERE Name = 'levelValue'));
INSERT INTO TelldusActionValues (ActionValue,FK_TelldusActionValueType_Id) VALUES ('88',(SELECT Id FROM TelldusActionValueTypes WHERE Name = 'levelValue'));
INSERT INTO TelldusActionValues (ActionValue,FK_TelldusActionValueType_Id) VALUES ('89',(SELECT Id FROM TelldusActionValueTypes WHERE Name = 'levelValue'));
INSERT INTO TelldusActionValues (ActionValue,FK_TelldusActionValueType_Id) VALUES ('90',(SELECT Id FROM TelldusActionValueTypes WHERE Name = 'levelValue'));
INSERT INTO TelldusActionValues (ActionValue,FK_TelldusActionValueType_Id) VALUES ('91',(SELECT Id FROM TelldusActionValueTypes WHERE Name = 'levelValue'));
INSERT INTO TelldusActionValues (ActionValue,FK_TelldusActionValueType_Id) VALUES ('92',(SELECT Id FROM TelldusActionValueTypes WHERE Name = 'levelValue'));
INSERT INTO TelldusActionValues (ActionValue,FK_TelldusActionValueType_Id) VALUES ('93',(SELECT Id FROM TelldusActionValueTypes WHERE Name = 'levelValue'));
INSERT INTO TelldusActionValues (ActionValue,FK_TelldusActionValueType_Id) VALUES ('94',(SELECT Id FROM TelldusActionValueTypes WHERE Name = 'levelValue'));
INSERT INTO TelldusActionValues (ActionValue,FK_TelldusActionValueType_Id) VALUES ('95',(SELECT Id FROM TelldusActionValueTypes WHERE Name = 'levelValue'));
INSERT INTO TelldusActionValues (ActionValue,FK_TelldusActionValueType_Id) VALUES ('96',(SELECT Id FROM TelldusActionValueTypes WHERE Name = 'levelValue'));
INSERT INTO TelldusActionValues (ActionValue,FK_TelldusActionValueType_Id) VALUES ('97',(SELECT Id FROM TelldusActionValueTypes WHERE Name = 'levelValue'));
INSERT INTO TelldusActionValues (ActionValue,FK_TelldusActionValueType_Id) VALUES ('98',(SELECT Id FROM TelldusActionValueTypes WHERE Name = 'levelValue'));
INSERT INTO TelldusActionValues (ActionValue,FK_TelldusActionValueType_Id) VALUES ('99',(SELECT Id FROM TelldusActionValueTypes WHERE Name = 'levelValue'));
INSERT INTO TelldusActionValues (ActionValue,FK_TelldusActionValueType_Id) VALUES ('100',(SELECT Id FROM TelldusActionValueTypes WHERE Name = 'levelValue'));

INSERT INTO TelldusUnits (Active,Name,FK_TelldusUnitType_Id,FK_TelldusUnitLocation_Id,LocationDesciption) VALUES (1,'1',(SELECT Id FROM TelldusUnitTypes WHERE Name = '433 MHz - OnOff'),(SELECT Id FROM TelldusUnitLocations WHERE Name = 'Vardagsrum'),'fönsterlampa');
INSERT INTO TelldusUnits (Active,Name,FK_TelldusUnitType_Id,FK_TelldusUnitLocation_Id,LocationDesciption) VALUES (1,'2',(SELECT Id FROM TelldusUnitTypes WHERE Name = '433 MHz - OnOff'),(SELECT Id FROM TelldusUnitLocations WHERE Name = 'Vardagsrum'),'pianobelysning');
INSERT INTO TelldusUnits (Active,Name,FK_TelldusUnitType_Id,FK_TelldusUnitLocation_Id,LocationDesciption) VALUES (1,'3',(SELECT Id FROM TelldusUnitTypes WHERE Name = '433 MHz - OnOff'),(SELECT Id FROM TelldusUnitLocations WHERE Name = 'Vardagsrum'),'golvlampa');
INSERT INTO TelldusUnits (Active,Name,FK_TelldusUnitType_Id,FK_TelldusUnitLocation_Id,LocationDesciption) VALUES (1,'4',(SELECT Id FROM TelldusUnitTypes WHERE Name = '433 MHz - OnOff'),(SELECT Id FROM TelldusUnitLocations WHERE Name = 'Uterum'),'kulört dekorationsbelysning');
INSERT INTO TelldusUnits (Active,Name,FK_TelldusUnitType_Id,FK_TelldusUnitLocation_Id,LocationDesciption) VALUES (1,'5',(SELECT Id FROM TelldusUnitTypes WHERE Name = '433 MHz - OnOff'),(SELECT Id FROM TelldusUnitLocations WHERE Name = 'Kök'),'fönsterlampor');
INSERT INTO TelldusUnits (Active,Name,FK_TelldusUnitType_Id,FK_TelldusUnitLocation_Id,LocationDesciption) VALUES (1,'6',(SELECT Id FROM TelldusUnitTypes WHERE Name = '433 MHz - OnOff'),(SELECT Id FROM TelldusUnitLocations WHERE Name = 'TV-rum'),'belysning vid fågelmataren');
INSERT INTO TelldusUnits (Active,Name,FK_TelldusUnitType_Id,FK_TelldusUnitLocation_Id,LocationDesciption) VALUES (1,'7',(SELECT Id FROM TelldusUnitTypes WHERE Name = '433 MHz - OnOff'),(SELECT Id FROM TelldusUnitLocations WHERE Name = 'TV-rum'),'golvlampa');
INSERT INTO TelldusUnits (Active,Name,FK_TelldusUnitType_Id,FK_TelldusUnitLocation_Id,LocationDesciption) VALUES (1,'8',(SELECT Id FROM TelldusUnitTypes WHERE Name = '433 MHz - OnOff'),(SELECT Id FROM TelldusUnitLocations WHERE Name = 'TV-rum'),'subwoofer');
INSERT INTO TelldusUnits (Active,Name,FK_TelldusUnitType_Id,FK_TelldusUnitLocation_Id,LocationDesciption) VALUES (1,'9',(SELECT Id FROM TelldusUnitTypes WHERE Name = '433 MHz - OnOff'),(SELECT Id FROM TelldusUnitLocations WHERE Name = 'TV-rum'),'liten lampa på byrå');
INSERT INTO TelldusUnits (Active,Name,FK_TelldusUnitType_Id,FK_TelldusUnitLocation_Id,LocationDesciption) VALUES (1,'10',(SELECT Id FROM TelldusUnitTypes WHERE Name = '433 MHz - OnOff'),(SELECT Id FROM TelldusUnitLocations WHERE Name = 'Korridor'),'ljusglober utanför toalett');
INSERT INTO TelldusUnits (Active,Name,FK_TelldusUnitType_Id,FK_TelldusUnitLocation_Id,LocationDesciption) VALUES (1,'11',(SELECT Id FROM TelldusUnitTypes WHERE Name = '433 MHz - OnOff'),(SELECT Id FROM TelldusUnitLocations WHERE Name = 'Korridor'),'spegelbordet utanför den lilla toaletten');
INSERT INTO TelldusUnits (Active,Name,FK_TelldusUnitType_Id,FK_TelldusUnitLocation_Id,LocationDesciption) VALUES (1,'12',(SELECT Id FROM TelldusUnitTypes WHERE Name = '433 MHz - OnOff'),(SELECT Id FROM TelldusUnitLocations WHERE Name = 'Atikas rum'),'(ljusglober)');
INSERT INTO TelldusUnits (Active,Name,FK_TelldusUnitType_Id,FK_TelldusUnitLocation_Id,LocationDesciption) VALUES (1,'13',(SELECT Id FROM TelldusUnitTypes WHERE Name = '433 MHz - OnOff'),(SELECT Id FROM TelldusUnitLocations WHERE Name = 'Atikas rum'),'fönsterkarm');
INSERT INTO TelldusUnits (Active,Name,FK_TelldusUnitType_Id,FK_TelldusUnitLocation_Id,LocationDesciption) VALUES (1,'14',(SELECT Id FROM TelldusUnitTypes WHERE Name = '433 MHz - OnOff'),(SELECT Id FROM TelldusUnitLocations WHERE Name = 'Atikas rum'),'grön lampa');
INSERT INTO TelldusUnits (Active,Name,FK_TelldusUnitType_Id,FK_TelldusUnitLocation_Id,LocationDesciption) VALUES (1,'15',(SELECT Id FROM TelldusUnitTypes WHERE Name = '433 MHz - OnOff'),(SELECT Id FROM TelldusUnitLocations WHERE Name = 'Hans rum'),'liten bokhylla närmast fönstret');
INSERT INTO TelldusUnits (Active,Name,FK_TelldusUnitType_Id,FK_TelldusUnitLocation_Id,LocationDesciption) VALUES (1,'16',(SELECT Id FROM TelldusUnitTypes WHERE Name = '433 MHz - OnOff'),(SELECT Id FROM TelldusUnitLocations WHERE Name = 'Hans rum'),'vinkelbokhylla i hörnet');
INSERT INTO TelldusUnits (Active,Name,FK_TelldusUnitType_Id,FK_TelldusUnitLocation_Id,LocationDesciption) VALUES (1,'17',(SELECT Id FROM TelldusUnitTypes WHERE Name = '433 MHz - OnOff'),(SELECT Id FROM TelldusUnitLocations WHERE Name = 'Hans rum'),'liten bordslampa');
INSERT INTO TelldusUnits (Active,Name,FK_TelldusUnitType_Id,FK_TelldusUnitLocation_Id,LocationDesciption) VALUES (1,'18',(SELECT Id FROM TelldusUnitTypes WHERE Name = '433 MHz - OnOff'),(SELECT Id FROM TelldusUnitLocations WHERE Name = 'Vardagsrum'),'bokhyllebelysning');
INSERT INTO TelldusUnits (Active,Name,FK_TelldusUnitType_Id,FK_TelldusUnitLocation_Id,LocationDesciption) VALUES (1,'19',(SELECT Id FROM TelldusUnitTypes WHERE Name = '433 MHz - OnOff'),(SELECT Id FROM TelldusUnitLocations WHERE Name = 'Vardagsrum'),'ljusorgel');
INSERT INTO TelldusUnits (Active,Name,FK_TelldusUnitType_Id,FK_TelldusUnitLocation_Id,LocationDesciption) VALUES (1,'20',(SELECT Id FROM TelldusUnitTypes WHERE Name = '433 MHz - OnOff'),(SELECT Id FROM TelldusUnitLocations WHERE Name = 'Sovrum'),'fönsterkarmbelysning');
INSERT INTO TelldusUnits (Active,Name,FK_TelldusUnitType_Id,FK_TelldusUnitLocation_Id,LocationDesciption) VALUES (1,'21',(SELECT Id FROM TelldusUnitTypes WHERE Name = '433 MHz - OnOff'),(SELECT Id FROM TelldusUnitLocations WHERE Name = 'TV-rum'),'lampa i fönsterkarm');
INSERT INTO TelldusUnits (Active,Name,FK_TelldusUnitType_Id,FK_TelldusUnitLocation_Id,LocationDesciption) VALUES (1,'22',(SELECT Id FROM TelldusUnitTypes WHERE Name = '433 MHz - OnOff'),(SELECT Id FROM TelldusUnitLocations WHERE Name = '*Ingen särskild plats*'),'');
INSERT INTO TelldusUnits (Active,Name,FK_TelldusUnitType_Id,FK_TelldusUnitLocation_Id,LocationDesciption) VALUES (1,'23',(SELECT Id FROM TelldusUnitTypes WHERE Name = '433 MHz - OnOff'),(SELECT Id FROM TelldusUnitLocations WHERE Name = 'Uterum'),'jordglob');
INSERT INTO TelldusUnits (Active,Name,FK_TelldusUnitType_Id,FK_TelldusUnitLocation_Id,LocationDesciption) VALUES (1,'24',(SELECT Id FROM TelldusUnitTypes WHERE Name = '433 MHz - OnOff'),(SELECT Id FROM TelldusUnitLocations WHERE Name = '*Ingen särskild plats*'),'');
INSERT INTO TelldusUnits (Active,Name,FK_TelldusUnitType_Id,FK_TelldusUnitLocation_Id,LocationDesciption) VALUES (1,'25',(SELECT Id FROM TelldusUnitTypes WHERE Name = '433 MHz - OnOff'),(SELECT Id FROM TelldusUnitLocations WHERE Name = '*Ingen särskild plats*'),'');
   
INSERT INTO TelldusUnits (Active,Name,FK_TelldusUnitType_Id,FK_TelldusUnitLocation_Id,LocationDesciption) VALUES (1,'A1',(SELECT Id FROM TelldusUnitTypes WHERE Name = 'Z-Wave - OnOffDim'),(SELECT Id FROM TelldusUnitLocations WHERE Name = 'Hans rum'),'');
INSERT INTO TelldusUnits (Active,Name,FK_TelldusUnitType_Id,FK_TelldusUnitLocation_Id,LocationDesciption) VALUES (1,'B1',(SELECT Id FROM TelldusUnitTypes WHERE Name = 'Z-Wave - OnOffDim'),(SELECT Id FROM TelldusUnitLocations WHERE Name = 'Sovrum'),'');
INSERT INTO TelldusUnits (Active,Name,FK_TelldusUnitType_Id,FK_TelldusUnitLocation_Id,LocationDesciption) VALUES (1,'C1',(SELECT Id FROM TelldusUnitTypes WHERE Name = 'Z-Wave - OnOffDim'),(SELECT Id FROM TelldusUnitLocations WHERE Name = 'TV-rum'),'mitt i rummet');
INSERT INTO TelldusUnits (Active,Name,FK_TelldusUnitType_Id,FK_TelldusUnitLocation_Id,LocationDesciption) VALUES (1,'C2',(SELECT Id FROM TelldusUnitTypes WHERE Name = 'Z-Wave - OnOffDim'),(SELECT Id FROM TelldusUnitLocations WHERE Name = 'TV-rum'),'vid sovrumsväggen');
INSERT INTO TelldusUnits (Active,Name,FK_TelldusUnitType_Id,FK_TelldusUnitLocation_Id,LocationDesciption) VALUES (1,'D1',(SELECT Id FROM TelldusUnitTypes WHERE Name = 'Z-Wave - OnOffDim'),(SELECT Id FROM TelldusUnitLocations WHERE Name = 'Atikas rum'),'taket');
INSERT INTO TelldusUnits (Active,Name,FK_TelldusUnitType_Id,FK_TelldusUnitLocation_Id,LocationDesciption) VALUES (1,'E1',(SELECT Id FROM TelldusUnitTypes WHERE Name = 'Z-Wave - OnOffDim'),(SELECT Id FROM TelldusUnitLocations WHERE Name = 'Korridor'),'vid badrum');
INSERT INTO TelldusUnits (Active,Name,FK_TelldusUnitType_Id,FK_TelldusUnitLocation_Id,LocationDesciption) VALUES (1,'F1',(SELECT Id FROM TelldusUnitTypes WHERE Name = 'Z-Wave - OnOffDim'),(SELECT Id FROM TelldusUnitLocations WHERE Name = 'Korridor'),'entrebelysning');
INSERT INTO TelldusUnits (Active,Name,FK_TelldusUnitType_Id,FK_TelldusUnitLocation_Id,LocationDesciption) VALUES (1,'G1',(SELECT Id FROM TelldusUnitTypes WHERE Name = 'Z-Wave - OnOffDim'),(SELECT Id FROM TelldusUnitLocations WHERE Name = 'Korridor'),'vid gästtoalett');
INSERT INTO TelldusUnits (Active,Name,FK_TelldusUnitType_Id,FK_TelldusUnitLocation_Id,LocationDesciption) VALUES (1,'H1',(SELECT Id FROM TelldusUnitTypes WHERE Name = 'Z-Wave - OnOffDim'),(SELECT Id FROM TelldusUnitLocations WHERE Name = 'Vardagsrum'),'sydligaste taklampssektionen');
INSERT INTO TelldusUnits (Active,Name,FK_TelldusUnitType_Id,FK_TelldusUnitLocation_Id,LocationDesciption) VALUES (1,'H2',(SELECT Id FROM TelldusUnitTypes WHERE Name = 'Z-Wave - OnOffDim'),(SELECT Id FROM TelldusUnitLocations WHERE Name = 'Vardagsrum'),'mellersta taklampssektionen');
INSERT INTO TelldusUnits (Active,Name,FK_TelldusUnitType_Id,FK_TelldusUnitLocation_Id,LocationDesciption) VALUES (1,'H3',(SELECT Id FROM TelldusUnitTypes WHERE Name = 'Z-Wave - OnOffDim'),(SELECT Id FROM TelldusUnitLocations WHERE Name = 'Vardagsrum'),'nordligaste taklampssektionen');
INSERT INTO TelldusUnits (Active,Name,FK_TelldusUnitType_Id,FK_TelldusUnitLocation_Id,LocationDesciption) VALUES (1,'I1',(SELECT Id FROM TelldusUnitTypes WHERE Name = 'Z-Wave - OnOffDim'),(SELECT Id FROM TelldusUnitLocations WHERE Name = 'Uterum'),'yttre belysning');
INSERT INTO TelldusUnits (Active,Name,FK_TelldusUnitType_Id,FK_TelldusUnitLocation_Id,LocationDesciption) VALUES (1,'I2',(SELECT Id FROM TelldusUnitTypes WHERE Name = 'Z-Wave - OnOffDim'),(SELECT Id FROM TelldusUnitLocations WHERE Name = 'Uterum'),'inre belysning');
INSERT INTO TelldusUnits (Active,Name,FK_TelldusUnitType_Id,FK_TelldusUnitLocation_Id,LocationDesciption) VALUES (1,'J1',(SELECT Id FROM TelldusUnitTypes WHERE Name = 'Z-Wave - OnOffDim'),(SELECT Id FROM TelldusUnitLocations WHERE Name = 'Kök'),'matbordsbelysning');
INSERT INTO TelldusUnits (Active,Name,FK_TelldusUnitType_Id,FK_TelldusUnitLocation_Id,LocationDesciption) VALUES (1,'J2',(SELECT Id FROM TelldusUnitTypes WHERE Name = 'Z-Wave - OnOffDim'),(SELECT Id FROM TelldusUnitLocations WHERE Name = 'Kök'),'vask');
INSERT INTO TelldusUnits (Active,Name,FK_TelldusUnitType_Id,FK_TelldusUnitLocation_Id,LocationDesciption) VALUES (1,'J3',(SELECT Id FROM TelldusUnitTypes WHERE Name = 'Z-Wave - OnOffDim'),(SELECT Id FROM TelldusUnitLocations WHERE Name = 'Kök'),'yttre skåpbelysning');
INSERT INTO TelldusUnits (Active,Name,FK_TelldusUnitType_Id,FK_TelldusUnitLocation_Id,LocationDesciption) VALUES (1,'K1',(SELECT Id FROM TelldusUnitTypes WHERE Name = 'Z-Wave - OnOffDim'),(SELECT Id FROM TelldusUnitLocations WHERE Name = 'Grovkök'),'');
INSERT INTO TelldusUnits (Active,Name,FK_TelldusUnitType_Id,FK_TelldusUnitLocation_Id,LocationDesciption) VALUES (1,'L1',(SELECT Id FROM TelldusUnitTypes WHERE Name = 'Z-Wave - OnOffDim'),(SELECT Id FROM TelldusUnitLocations WHERE Name = 'Grovkök'),'ingång (entrebelysning)');

INSERT INTO TelldusUnits (Active,Name,FK_TelldusUnitType_Id,FK_TelldusUnitLocation_Id,LocationDesciption) VALUES (1,'Grovkök golvtermostat',(SELECT Id FROM TelldusUnitTypes WHERE Name = 'Z-Wave - HeatItZWaveThermostat'),(SELECT Id FROM TelldusUnitLocations WHERE Name = 'Grovkök'),'under elcentralen till vänster');
INSERT INTO TelldusUnits (Active,Name,FK_TelldusUnitType_Id,FK_TelldusUnitLocation_Id,LocationDesciption) VALUES (1,'Huvudtermostat',(SELECT Id FROM TelldusUnitTypes WHERE Name = 'Z-Wave - HeatItZWaveThermostat'),(SELECT Id FROM TelldusUnitLocations WHERE Name = 'Grovkök'),'under elcentralen till vänster');
INSERT INTO TelldusUnits (Active,Name,FK_TelldusUnitType_Id,FK_TelldusUnitLocation_Id,LocationDesciption) VALUES (1,'Uterum termostat',(SELECT Id FROM TelldusUnitTypes WHERE Name = 'Z-Wave - HeatItZWaveThermostat'),(SELECT Id FROM TelldusUnitLocations WHERE Name = 'Uterum'),'under elcentralen till vänster');
INSERT INTO TelldusUnits (Active,Name,FK_TelldusUnitType_Id,FK_TelldusUnitLocation_Id,LocationDesciption) VALUES (1,'Ringklocka Alarm',(SELECT Id FROM TelldusUnitTypes WHERE Name = '433 MHz - Bell'),(SELECT Id FROM TelldusUnitLocations WHERE Name = 'Hus - fasad'),'grovköksingång från parkeringen');
INSERT INTO TelldusUnits (Active,Name,FK_TelldusUnitType_Id,FK_TelldusUnitLocation_Id,LocationDesciption) VALUES (1,'Skymning',(SELECT Id FROM TelldusUnitTypes WHERE Name = '433 MHz - LightSensor'),(SELECT Id FROM TelldusUnitLocations WHERE Name = '*Ingen särskild plats*'),'');

INSERT INTO MediaCountries (Name,Code,ISOAlpha2,ISOAlpha3) VALUES ('Algeriet', '213', 'DZ', 'DZA');
INSERT INTO MediaCountries (Name,Code,ISOAlpha2,ISOAlpha3) VALUES ('Danmark', '45', 'DK', 'DNK');
INSERT INTO MediaCountries (Name,Code,ISOAlpha2,ISOAlpha3) VALUES ('Finland', '358', 'FI', 'FIN');
INSERT INTO MediaCountries (Name,Code,ISOAlpha2,ISOAlpha3) VALUES ('England', '44', 'GB', 'GBR');
INSERT INTO MediaCountries (Name,Code,ISOAlpha2,ISOAlpha3) VALUES ('Norge', '47', 'NO', 'NOR');
INSERT INTO MediaCountries (Name,Code,ISOAlpha2,ISOAlpha3) VALUES ('Sverige', '46', 'SE', 'SWE');
INSERT INTO MediaCountries (Name,Code,ISOAlpha2,ISOAlpha3) VALUES ('USA', '1', 'US', 'USA');

INSERT INTO MediaCategoryTypes (Name) VALUES ('InternetStreamRadio');

INSERT INTO MediaSources (Name,Url,FK_MediaCategoryType_Id,FK_MediaCountry_Id) VALUES ('SR P1','http://sverigesradio.se/topsy/direkt/132-hi-aac.m3u',(SELECT Id FROM MediaCategoryTypes WHERE Name = 'InternetStreamRadio'),(SELECT Id FROM MediaCountries WHERE Name = 'Sverige'));
INSERT INTO MediaSources (Name,Url,FK_MediaCategoryType_Id,FK_MediaCountry_Id) VALUES ('SR P2','http://sverigesradio.se/topsy/direkt/2562-hi-aac.m3u',(SELECT Id FROM MediaCategoryTypes WHERE Name = 'InternetStreamRadio'),(SELECT Id FROM MediaCountries WHERE Name = 'Sverige'));
INSERT INTO MediaSources (Name,Url,FK_MediaCategoryType_Id,FK_MediaCountry_Id) VALUES ('SR P3','http://sverigesradio.se/topsy/direkt/164-hi-aac.m3u',(SELECT Id FROM MediaCategoryTypes WHERE Name = 'InternetStreamRadio'),(SELECT Id FROM MediaCountries WHERE Name = 'Sverige'));
INSERT INTO MediaSources (Name,Url,FK_MediaCategoryType_Id,FK_MediaCountry_Id) VALUES ('SR Ekot sänder direkt','http://sverigesradio.se/topsy/direkt/4540-hi-aac.m3u',(SELECT Id FROM MediaCategoryTypes WHERE Name = 'InternetStreamRadio'),(SELECT Id FROM MediaCountries WHERE Name = 'Sverige'));
INSERT INTO MediaSources (Name,Url,FK_MediaCategoryType_Id,FK_MediaCountry_Id) VALUES ('SR P4 Plus','http://sverigesradio.se/topsy/direkt/4951-hi-aac.m3u',(SELECT Id FROM MediaCategoryTypes WHERE Name = 'InternetStreamRadio'),(SELECT Id FROM MediaCountries WHERE Name = 'Sverige'));
INSERT INTO MediaSources (Name,Url,FK_MediaCategoryType_Id,FK_MediaCountry_Id) VALUES ('SR P4 Blekinge','http://sverigesradio.se/topsy/direkt/213-hi-aac.m3u',(SELECT Id FROM MediaCategoryTypes WHERE Name = 'InternetStreamRadio'),(SELECT Id FROM MediaCountries WHERE Name = 'Sverige'));
INSERT INTO MediaSources (Name,Url,FK_MediaCategoryType_Id,FK_MediaCountry_Id) VALUES ('SR P4 Dalarna','http://sverigesradio.se/topsy/direkt/223-hi-aac.m3u',(SELECT Id FROM MediaCategoryTypes WHERE Name = 'InternetStreamRadio'),(SELECT Id FROM MediaCountries WHERE Name = 'Sverige'));
INSERT INTO MediaSources (Name,Url,FK_MediaCategoryType_Id,FK_MediaCountry_Id) VALUES ('SR P4 Gotland','http://sverigesradio.se/topsy/direkt/205-hi-aac.m3u',(SELECT Id FROM MediaCategoryTypes WHERE Name = 'InternetStreamRadio'),(SELECT Id FROM MediaCountries WHERE Name = 'Sverige'));
INSERT INTO MediaSources (Name,Url,FK_MediaCategoryType_Id,FK_MediaCountry_Id) VALUES ('SR P4 Gävleborg','http://sverigesradio.se/topsy/direkt/210-hi-aac.m3u',(SELECT Id FROM MediaCategoryTypes WHERE Name = 'InternetStreamRadio'),(SELECT Id FROM MediaCountries WHERE Name = 'Sverige'));
INSERT INTO MediaSources (Name,Url,FK_MediaCategoryType_Id,FK_MediaCountry_Id) VALUES ('SR P4 Göteborg','http://sverigesradio.se/topsy/direkt/212-hi-aac.m3u',(SELECT Id FROM MediaCategoryTypes WHERE Name = 'InternetStreamRadio'),(SELECT Id FROM MediaCountries WHERE Name = 'Sverige'));
INSERT INTO MediaSources (Name,Url,FK_MediaCategoryType_Id,FK_MediaCountry_Id) VALUES ('SR P4 Halland','http://sverigesradio.se/topsy/direkt/220-hi-aac.m3u',(SELECT Id FROM MediaCategoryTypes WHERE Name = 'InternetStreamRadio'),(SELECT Id FROM MediaCountries WHERE Name = 'Sverige'));
INSERT INTO MediaSources (Name,Url,FK_MediaCategoryType_Id,FK_MediaCountry_Id) VALUES ('SR P4 Jämtland','http://sverigesradio.se/topsy/direkt/200-hi-aac.m3u',(SELECT Id FROM MediaCategoryTypes WHERE Name = 'InternetStreamRadio'),(SELECT Id FROM MediaCountries WHERE Name = 'Sverige'));
INSERT INTO MediaSources (Name,Url,FK_MediaCategoryType_Id,FK_MediaCountry_Id) VALUES ('SR P4 Jönköping','http://sverigesradio.se/topsy/direkt/203-hi-aac.m3u',(SELECT Id FROM MediaCategoryTypes WHERE Name = 'InternetStreamRadio'),(SELECT Id FROM MediaCountries WHERE Name = 'Sverige'));
INSERT INTO MediaSources (Name,Url,FK_MediaCategoryType_Id,FK_MediaCountry_Id) VALUES ('SR P4 Kalmar','http://sverigesradio.se/topsy/direkt/201-hi-aac.m3u',(SELECT Id FROM MediaCategoryTypes WHERE Name = 'InternetStreamRadio'),(SELECT Id FROM MediaCountries WHERE Name = 'Sverige'));
INSERT INTO MediaSources (Name,Url,FK_MediaCategoryType_Id,FK_MediaCountry_Id) VALUES ('SR P4 Kristianstad','http://sverigesradio.se/topsy/direkt/211-hi-aac.m3u',(SELECT Id FROM MediaCategoryTypes WHERE Name = 'InternetStreamRadio'),(SELECT Id FROM MediaCountries WHERE Name = 'Sverige'));
INSERT INTO MediaSources (Name,Url,FK_MediaCategoryType_Id,FK_MediaCountry_Id) VALUES ('SR P4 Kronoberg','http://sverigesradio.se/topsy/direkt/214-hi-aac.m3u',(SELECT Id FROM MediaCategoryTypes WHERE Name = 'InternetStreamRadio'),(SELECT Id FROM MediaCountries WHERE Name = 'Sverige'));
INSERT INTO MediaSources (Name,Url,FK_MediaCategoryType_Id,FK_MediaCountry_Id) VALUES ('SR P4 Malmöhus','http://sverigesradio.se/topsy/direkt/207-hi-aac.m3u',(SELECT Id FROM MediaCategoryTypes WHERE Name = 'InternetStreamRadio'),(SELECT Id FROM MediaCountries WHERE Name = 'Sverige'));
INSERT INTO MediaSources (Name,Url,FK_MediaCategoryType_Id,FK_MediaCountry_Id) VALUES ('SR P4 Norrbotten','http://sverigesradio.se/topsy/direkt/209-hi-aac.m3u',(SELECT Id FROM MediaCategoryTypes WHERE Name = 'InternetStreamRadio'),(SELECT Id FROM MediaCountries WHERE Name = 'Sverige'));
INSERT INTO MediaSources (Name,Url,FK_MediaCategoryType_Id,FK_MediaCountry_Id) VALUES ('SR P4 Sjuhärad','http://sverigesradio.se/topsy/direkt/206-hi-aac.m3u',(SELECT Id FROM MediaCategoryTypes WHERE Name = 'InternetStreamRadio'),(SELECT Id FROM MediaCountries WHERE Name = 'Sverige'));
INSERT INTO MediaSources (Name,Url,FK_MediaCategoryType_Id,FK_MediaCountry_Id) VALUES ('SR P4 Skaraborg','http://sverigesradio.se/topsy/direkt/208-hi-aac.m3u',(SELECT Id FROM MediaCategoryTypes WHERE Name = 'InternetStreamRadio'),(SELECT Id FROM MediaCountries WHERE Name = 'Sverige'));
INSERT INTO MediaSources (Name,Url,FK_MediaCategoryType_Id,FK_MediaCountry_Id) VALUES ('SR P4 Stockholm','http://sverigesradio.se/topsy/direkt/701-hi-aac.m3u',(SELECT Id FROM MediaCategoryTypes WHERE Name = 'InternetStreamRadio'),(SELECT Id FROM MediaCountries WHERE Name = 'Sverige'));
INSERT INTO MediaSources (Name,Url,FK_MediaCategoryType_Id,FK_MediaCountry_Id) VALUES ('SR P4 Sörmland','http://sverigesradio.se/topsy/direkt/202-hi-aac.m3u',(SELECT Id FROM MediaCategoryTypes WHERE Name = 'InternetStreamRadio'),(SELECT Id FROM MediaCountries WHERE Name = 'Sverige'));
INSERT INTO MediaSources (Name,Url,FK_MediaCategoryType_Id,FK_MediaCountry_Id) VALUES ('SR P4 Uppland','http://sverigesradio.se/topsy/direkt/218-hi-aac.m3u',(SELECT Id FROM MediaCategoryTypes WHERE Name = 'InternetStreamRadio'),(SELECT Id FROM MediaCountries WHERE Name = 'Sverige'));
INSERT INTO MediaSources (Name,Url,FK_MediaCategoryType_Id,FK_MediaCountry_Id) VALUES ('SR P4 Värmland','http://sverigesradio.se/topsy/direkt/204-hi-aac.m3u',(SELECT Id FROM MediaCategoryTypes WHERE Name = 'InternetStreamRadio'),(SELECT Id FROM MediaCountries WHERE Name = 'Sverige'));
INSERT INTO MediaSources (Name,Url,FK_MediaCategoryType_Id,FK_MediaCountry_Id) VALUES ('SR P4 Väst','http://sverigesradio.se/topsy/direkt/219-hi-aac.m3u',(SELECT Id FROM MediaCategoryTypes WHERE Name = 'InternetStreamRadio'),(SELECT Id FROM MediaCountries WHERE Name = 'Sverige'));
INSERT INTO MediaSources (Name,Url,FK_MediaCategoryType_Id,FK_MediaCountry_Id) VALUES ('SR P4 Västerbotten','http://sverigesradio.se/topsy/direkt/215-hi-aac.m3u',(SELECT Id FROM MediaCategoryTypes WHERE Name = 'InternetStreamRadio'),(SELECT Id FROM MediaCountries WHERE Name = 'Sverige'));
INSERT INTO MediaSources (Name,Url,FK_MediaCategoryType_Id,FK_MediaCountry_Id) VALUES ('SR P4 Västernorrland','http://sverigesradio.se/topsy/direkt/216-hi-aac.m3u',(SELECT Id FROM MediaCategoryTypes WHERE Name = 'InternetStreamRadio'),(SELECT Id FROM MediaCountries WHERE Name = 'Sverige'));
INSERT INTO MediaSources (Name,Url,FK_MediaCategoryType_Id,FK_MediaCountry_Id) VALUES ('SR P4 Västmanland','http://sverigesradio.se/topsy/direkt/217-hi-aac.m3u',(SELECT Id FROM MediaCategoryTypes WHERE Name = 'InternetStreamRadio'),(SELECT Id FROM MediaCountries WHERE Name = 'Sverige'));
INSERT INTO MediaSources (Name,Url,FK_MediaCategoryType_Id,FK_MediaCountry_Id) VALUES ('SR P4 Örebro','http://sverigesradio.se/topsy/direkt/221-hi-aac.m3u',(SELECT Id FROM MediaCategoryTypes WHERE Name = 'InternetStreamRadio'),(SELECT Id FROM MediaCountries WHERE Name = 'Sverige'));
INSERT INTO MediaSources (Name,Url,FK_MediaCategoryType_Id,FK_MediaCountry_Id) VALUES ('SR P4 Östergötland','http://sverigesradio.se/topsy/direkt/222-hi-aac.m3u',(SELECT Id FROM MediaCategoryTypes WHERE Name = 'InternetStreamRadio'),(SELECT Id FROM MediaCountries WHERE Name = 'Sverige'));
INSERT INTO MediaSources (Name,Url,FK_MediaCategoryType_Id,FK_MediaCountry_Id) VALUES ('SR P3 Din gata','http://sverigesradio.se/topsy/direkt/2576-hi-aac.m3u',(SELECT Id FROM MediaCategoryTypes WHERE Name = 'InternetStreamRadio'),(SELECT Id FROM MediaCountries WHERE Name = 'Sverige'));
INSERT INTO MediaSources (Name,Url,FK_MediaCategoryType_Id,FK_MediaCountry_Id) VALUES ('SR P5 Sthlm','http://sverigesradio.se/topsy/direkt/2842-hi-aac.m3u',(SELECT Id FROM MediaCategoryTypes WHERE Name = 'InternetStreamRadio'),(SELECT Id FROM MediaCountries WHERE Name = 'Sverige'));
INSERT INTO MediaSources (Name,Url,FK_MediaCategoryType_Id,FK_MediaCountry_Id) VALUES ('SR P2 Språk och musik','http://sverigesradio.se/topsy/direkt/163-hi-aac.m3u',(SELECT Id FROM MediaCategoryTypes WHERE Name = 'InternetStreamRadio'),(SELECT Id FROM MediaCountries WHERE Name = 'Sverige'));
INSERT INTO MediaSources (Name,Url,FK_MediaCategoryType_Id,FK_MediaCountry_Id) VALUES ('SR P6','http://sverigesradio.se/topsy/direkt/166-hi-aac.m3u',(SELECT Id FROM MediaCategoryTypes WHERE Name = 'InternetStreamRadio'),(SELECT Id FROM MediaCountries WHERE Name = 'Sverige'));
INSERT INTO MediaSources (Name,Url,FK_MediaCategoryType_Id,FK_MediaCountry_Id) VALUES ('SR P3 Star','http://sverigesradio.se/topsy/direkt/1607-hi-aac.m3u',(SELECT Id FROM MediaCategoryTypes WHERE Name = 'InternetStreamRadio'),(SELECT Id FROM MediaCountries WHERE Name = 'Sverige'));
INSERT INTO MediaSources (Name,Url,FK_MediaCategoryType_Id,FK_MediaCountry_Id) VALUES ('SR Radioapans knattekanal','http://sverigesradio.se/topsy/direkt/2755-hi-aac.m3u',(SELECT Id FROM MediaCategoryTypes WHERE Name = 'InternetStreamRadio'),(SELECT Id FROM MediaCountries WHERE Name = 'Sverige'));
INSERT INTO MediaSources (Name,Url,FK_MediaCategoryType_Id,FK_MediaCountry_Id) VALUES ('SR P2 Klassiskt','http://sverigesradio.se/topsy/direkt/1603-hi-aac.m3u',(SELECT Id FROM MediaCategoryTypes WHERE Name = 'InternetStreamRadio'),(SELECT Id FROM MediaCountries WHERE Name = 'Sverige'));
INSERT INTO MediaSources (Name,Url,FK_MediaCategoryType_Id,FK_MediaCountry_Id) VALUES ('SR Sápmi','http://sverigesradio.se/topsy/direkt/224-hi-aac.m3u',(SELECT Id FROM MediaCategoryTypes WHERE Name = 'InternetStreamRadio'),(SELECT Id FROM MediaCountries WHERE Name = 'Sverige'));
INSERT INTO MediaSources (Name,Url,FK_MediaCategoryType_Id,FK_MediaCountry_Id) VALUES ('SR Sisuradio','http://sverigesradio.se/topsy/direkt/226-hi-aac.m3u',(SELECT Id FROM MediaCategoryTypes WHERE Name = 'InternetStreamRadio'),(SELECT Id FROM MediaCountries WHERE Name = 'Sverige'));
INSERT INTO MediaSources (Name,Url,FK_MediaCategoryType_Id,FK_MediaCountry_Id) VALUES ('SR P2 Världen','http://sverigesradio.se/topsy/direkt/2619-hi-aac.m3u',(SELECT Id FROM MediaCategoryTypes WHERE Name = 'InternetStreamRadio'),(SELECT Id FROM MediaCountries WHERE Name = 'Sverige'));
INSERT INTO MediaSources (Name,Url,FK_MediaCategoryType_Id,FK_MediaCountry_Id) VALUES ('SR Extra 01','http://sverigesradio.se/topsy/direkt/2383-hi-aac.m3u',(SELECT Id FROM MediaCategoryTypes WHERE Name = 'InternetStreamRadio'),(SELECT Id FROM MediaCountries WHERE Name = 'Sverige'));
INSERT INTO MediaSources (Name,Url,FK_MediaCategoryType_Id,FK_MediaCountry_Id) VALUES ('SR Extra 02','http://sverigesradio.se/topsy/direkt/2384-hi-aac.m3u',(SELECT Id FROM MediaCategoryTypes WHERE Name = 'InternetStreamRadio'),(SELECT Id FROM MediaCountries WHERE Name = 'Sverige'));
INSERT INTO MediaSources (Name,Url,FK_MediaCategoryType_Id,FK_MediaCountry_Id) VALUES ('SR Extra 03','http://sverigesradio.se/topsy/direkt/2385-hi-aac.m3u',(SELECT Id FROM MediaCategoryTypes WHERE Name = 'InternetStreamRadio'),(SELECT Id FROM MediaCountries WHERE Name = 'Sverige'));
INSERT INTO MediaSources (Name,Url,FK_MediaCategoryType_Id,FK_MediaCountry_Id) VALUES ('SR Extra 04','http://sverigesradio.se/topsy/direkt/2386-hi-aac.m3u',(SELECT Id FROM MediaCategoryTypes WHERE Name = 'InternetStreamRadio'),(SELECT Id FROM MediaCountries WHERE Name = 'Sverige'));
INSERT INTO MediaSources (Name,Url,FK_MediaCategoryType_Id,FK_MediaCountry_Id) VALUES ('SR Extra 05','http://sverigesradio.se/topsy/direkt/2387-hi-aac.m3u',(SELECT Id FROM MediaCategoryTypes WHERE Name = 'InternetStreamRadio'),(SELECT Id FROM MediaCountries WHERE Name = 'Sverige'));
INSERT INTO MediaSources (Name,Url,FK_MediaCategoryType_Id,FK_MediaCountry_Id) VALUES ('SR Extra 06','http://sverigesradio.se/topsy/direkt/2388-hi-aac.m3u',(SELECT Id FROM MediaCategoryTypes WHERE Name = 'InternetStreamRadio'),(SELECT Id FROM MediaCountries WHERE Name = 'Sverige'));
INSERT INTO MediaSources (Name,Url,FK_MediaCategoryType_Id,FK_MediaCountry_Id) VALUES ('SR Extra 07','http://sverigesradio.se/topsy/direkt/2389-hi-aac.m3u',(SELECT Id FROM MediaCategoryTypes WHERE Name = 'InternetStreamRadio'),(SELECT Id FROM MediaCountries WHERE Name = 'Sverige'));
INSERT INTO MediaSources (Name,Url,FK_MediaCategoryType_Id,FK_MediaCountry_Id) VALUES ('SR Extra 08','http://sverigesradio.se/topsy/direkt/2390-hi-aac.m3u',(SELECT Id FROM MediaCategoryTypes WHERE Name = 'InternetStreamRadio'),(SELECT Id FROM MediaCountries WHERE Name = 'Sverige'));
INSERT INTO MediaSources (Name,Url,FK_MediaCategoryType_Id,FK_MediaCountry_Id) VALUES ('SR Extra 09','http://sverigesradio.se/topsy/direkt/3268-hi-aac.m3u',(SELECT Id FROM MediaCategoryTypes WHERE Name = 'InternetStreamRadio'),(SELECT Id FROM MediaCountries WHERE Name = 'Sverige'));
INSERT INTO MediaSources (Name,Url,FK_MediaCategoryType_Id,FK_MediaCountry_Id) VALUES ('SR Extra 10','http://sverigesradio.se/topsy/direkt/3269-hi-aac.m3u',(SELECT Id FROM MediaCategoryTypes WHERE Name = 'InternetStreamRadio'),(SELECT Id FROM MediaCountries WHERE Name = 'Sverige'));
INSERT INTO MediaSources (Name,Url,FK_MediaCategoryType_Id,FK_MediaCountry_Id) VALUES ('SR P2 Klassisk Jul','http://sverigesradio.se/topsy/direkt/3036-hi-aac.m3u',(SELECT Id FROM MediaCategoryTypes WHERE Name = 'InternetStreamRadio'),(SELECT Id FROM MediaCountries WHERE Name = 'Sverige'));
INSERT INTO MediaSources (Name,Url,FK_MediaCategoryType_Id,FK_MediaCountry_Id) VALUES ('SR P4 Bjällerklang','http://sverigesradio.se/topsy/direkt/3034-hi-aac.m3u',(SELECT Id FROM MediaCategoryTypes WHERE Name = 'InternetStreamRadio'),(SELECT Id FROM MediaCountries WHERE Name = 'Sverige'));

INSERT INTO MediaSources (Name,Url,FK_MediaCategoryType_Id,FK_MediaCountry_Id) VALUES ('Malmökanalen', 'http://stream.nsp.se:8000/MNR89_MP3_Lo',(SELECT Id FROM MediaCategoryTypes WHERE Name = 'InternetStreamRadio'),(SELECT Id FROM MediaCountries WHERE Name = 'Sverige'));
INSERT INTO MediaSources (Name,Url,FK_MediaCategoryType_Id,FK_MediaCountry_Id) VALUES ('Radio Malmökanalen', 'http://stream.nsp.se:8000/MNR90_MP3_Lo',(SELECT Id FROM MediaCategoryTypes WHERE Name = 'InternetStreamRadio'),(SELECT Id FROM MediaCountries WHERE Name = 'Sverige'));
INSERT INTO MediaSources (Name,Url,FK_MediaCategoryType_Id,FK_MediaCountry_Id) VALUES ('Radio AF', 'http://live.radioaf.se:8000/;stream/1',(SELECT Id FROM MediaCategoryTypes WHERE Name = 'InternetStreamRadio'),(SELECT Id FROM MediaCountries WHERE Name = 'Sverige'));

INSERT INTO MediaSources (Name,Url,FK_MediaCategoryType_Id,FK_MediaCountry_Id) VALUES ('DR P1', 'http://live-icy.gss.dr.dk/A/A03H.mp3.m3u',(SELECT Id FROM MediaCategoryTypes WHERE Name = 'InternetStreamRadio'),(SELECT Id FROM MediaCountries WHERE Name = 'Danmark'));
INSERT INTO MediaSources (Name,Url,FK_MediaCategoryType_Id,FK_MediaCountry_Id) VALUES ('DR P2', 'http://live-icy.gss.dr.dk/A/A04H.mp3.m3u',(SELECT Id FROM MediaCategoryTypes WHERE Name = 'InternetStreamRadio'),(SELECT Id FROM MediaCountries WHERE Name = 'Danmark'));
INSERT INTO MediaSources (Name,Url,FK_MediaCategoryType_Id,FK_MediaCountry_Id) VALUES ('DR P3', 'http://live-icy.gss.dr.dk/A/A05H.mp3.m3u',(SELECT Id FROM MediaCategoryTypes WHERE Name = 'InternetStreamRadio'),(SELECT Id FROM MediaCountries WHERE Name = 'Danmark'));
INSERT INTO MediaSources (Name,Url,FK_MediaCategoryType_Id,FK_MediaCountry_Id) VALUES ('DR P4 Bornholm', 'http://live-icy.gss.dr.dk/A/A06H.mp3.m3u',(SELECT Id FROM MediaCategoryTypes WHERE Name = 'InternetStreamRadio'),(SELECT Id FROM MediaCountries WHERE Name = 'Danmark'));
INSERT INTO MediaSources (Name,Url,FK_MediaCategoryType_Id,FK_MediaCountry_Id) VALUES ('DR P4 Esbjerg', 'http://live-icy.gss.dr.dk/A/A15H.mp3.m3u',(SELECT Id FROM MediaCategoryTypes WHERE Name = 'InternetStreamRadio'),(SELECT Id FROM MediaCountries WHERE Name = 'Danmark'));
INSERT INTO MediaSources (Name,Url,FK_MediaCategoryType_Id,FK_MediaCountry_Id) VALUES ('DR P4 Fyn', 'http://live-icy.gss.dr.dk/A/A07H.mp3.m3u',(SELECT Id FROM MediaCategoryTypes WHERE Name = 'InternetStreamRadio'),(SELECT Id FROM MediaCountries WHERE Name = 'Danmark'));
INSERT INTO MediaSources (Name,Url,FK_MediaCategoryType_Id,FK_MediaCountry_Id) VALUES ('DR P4 København', 'http://live-icy.gss.dr.dk/A/A08H.mp3.m3u',(SELECT Id FROM MediaCategoryTypes WHERE Name = 'InternetStreamRadio'),(SELECT Id FROM MediaCountries WHERE Name = 'Danmark'));
INSERT INTO MediaSources (Name,Url,FK_MediaCategoryType_Id,FK_MediaCountry_Id) VALUES ('DR P4 Midt & Vest', 'http://live-icy.gss.dr.dk/A/A09H.mp3.m3u',(SELECT Id FROM MediaCategoryTypes WHERE Name = 'InternetStreamRadio'),(SELECT Id FROM MediaCountries WHERE Name = 'Danmark'));
INSERT INTO MediaSources (Name,Url,FK_MediaCategoryType_Id,FK_MediaCountry_Id) VALUES ('DR P4 Nordjylland', 'http://live-icy.gss.dr.dk/A/A10H.mp3.m3u',(SELECT Id FROM MediaCategoryTypes WHERE Name = 'InternetStreamRadio'),(SELECT Id FROM MediaCountries WHERE Name = 'Danmark'));
INSERT INTO MediaSources (Name,Url,FK_MediaCategoryType_Id,FK_MediaCountry_Id) VALUES ('DR P4 Sjælland', 'http://live-icy.gss.dr.dk/A/A11H.mp3.m3u',(SELECT Id FROM MediaCategoryTypes WHERE Name = 'InternetStreamRadio'),(SELECT Id FROM MediaCountries WHERE Name = 'Danmark'));
INSERT INTO MediaSources (Name,Url,FK_MediaCategoryType_Id,FK_MediaCountry_Id) VALUES ('DR P4 Syd', 'http://live-icy.gss.dr.dk/A/A12H.mp3.m3u',(SELECT Id FROM MediaCategoryTypes WHERE Name = 'InternetStreamRadio'),(SELECT Id FROM MediaCountries WHERE Name = 'Danmark'));
INSERT INTO MediaSources (Name,Url,FK_MediaCategoryType_Id,FK_MediaCountry_Id) VALUES ('DR P4 Trekanten', 'http://live-icy.gss.dr.dk/A/A13H.mp3.m3u',(SELECT Id FROM MediaCategoryTypes WHERE Name = 'InternetStreamRadio'),(SELECT Id FROM MediaCountries WHERE Name = 'Danmark'));
INSERT INTO MediaSources (Name,Url,FK_MediaCategoryType_Id,FK_MediaCountry_Id) VALUES ('DR P4 Østjyllands Radio', 'http://live-icy.gss.dr.dk/A/A14H.mp3.m3u',(SELECT Id FROM MediaCategoryTypes WHERE Name = 'InternetStreamRadio'),(SELECT Id FROM MediaCountries WHERE Name = 'Danmark'));
INSERT INTO MediaSources (Name,Url,FK_MediaCategoryType_Id,FK_MediaCountry_Id) VALUES ('DR P5', 'http://live-icy.gss.dr.dk/A/A25L.mp3.m3u',(SELECT Id FROM MediaCategoryTypes WHERE Name = 'InternetStreamRadio'),(SELECT Id FROM MediaCountries WHERE Name = 'Danmark'));
INSERT INTO MediaSources (Name,Url,FK_MediaCategoryType_Id,FK_MediaCountry_Id) VALUES ('DR P6 BEAT', 'http://live-icy.gss.dr.dk/A/A29H.mp3.m3u',(SELECT Id FROM MediaCategoryTypes WHERE Name = 'InternetStreamRadio'),(SELECT Id FROM MediaCountries WHERE Name = 'Danmark'));

INSERT INTO MediaSources (Name,Url,FK_MediaCategoryType_Id,FK_MediaCountry_Id) VALUES ('NRK P1','http://lyd.nrk.no/nrk_radio_p1_ostlandssendingen_mp3_h',(SELECT Id FROM MediaCategoryTypes WHERE Name = 'InternetStreamRadio'),(SELECT Id FROM MediaCountries WHERE Name = 'Norge'));
INSERT INTO MediaSources (Name,Url,FK_MediaCategoryType_Id,FK_MediaCountry_Id) VALUES ('NRK P1 Buskerud','http://lyd.nrk.no/nrk_radio_p1_buskerud_mp3_h',(SELECT Id FROM MediaCategoryTypes WHERE Name = 'InternetStreamRadio'),(SELECT Id FROM MediaCountries WHERE Name = 'Norge'));
INSERT INTO MediaSources (Name,Url,FK_MediaCategoryType_Id,FK_MediaCountry_Id) VALUES ('NRK P1 Finnmark','http://lyd.nrk.no/nrk_radio_p1_finnmark_mp3_h',(SELECT Id FROM MediaCategoryTypes WHERE Name = 'InternetStreamRadio'),(SELECT Id FROM MediaCountries WHERE Name = 'Norge'));
INSERT INTO MediaSources (Name,Url,FK_MediaCategoryType_Id,FK_MediaCountry_Id) VALUES ('NRK P1 Hedmark og Oppland','http://lyd.nrk.no/nrk_radio_p1_hedmark_og_oppland_mp3_h',(SELECT Id FROM MediaCategoryTypes WHERE Name = 'InternetStreamRadio'),(SELECT Id FROM MediaCountries WHERE Name = 'Norge'));
INSERT INTO MediaSources (Name,Url,FK_MediaCategoryType_Id,FK_MediaCountry_Id) VALUES ('NRK P1 Hordaland','http://lyd.nrk.no/nrk_radio_p1_hordaland_mp3_h',(SELECT Id FROM MediaCategoryTypes WHERE Name = 'InternetStreamRadio'),(SELECT Id FROM MediaCountries WHERE Name = 'Norge'));
INSERT INTO MediaSources (Name,Url,FK_MediaCategoryType_Id,FK_MediaCountry_Id) VALUES ('NRK P1 Møre og Romsdal','http://lyd.nrk.no/nrk_radio_p1_more_og_romsdal_mp3_h',(SELECT Id FROM MediaCategoryTypes WHERE Name = 'InternetStreamRadio'),(SELECT Id FROM MediaCountries WHERE Name = 'Norge'));
INSERT INTO MediaSources (Name,Url,FK_MediaCategoryType_Id,FK_MediaCountry_Id) VALUES ('NRK P1 Nordland','http://lyd.nrk.no/nrk_radio_p1_nordland_mp3_h',(SELECT Id FROM MediaCategoryTypes WHERE Name = 'InternetStreamRadio'),(SELECT Id FROM MediaCountries WHERE Name = 'Norge'));
INSERT INTO MediaSources (Name,Url,FK_MediaCategoryType_Id,FK_MediaCountry_Id) VALUES ('NRK P1 Rogaland','http://lyd.nrk.no/nrk_radio_p1_rogaland_mp3_h',(SELECT Id FROM MediaCategoryTypes WHERE Name = 'InternetStreamRadio'),(SELECT Id FROM MediaCountries WHERE Name = 'Norge'));
INSERT INTO MediaSources (Name,Url,FK_MediaCategoryType_Id,FK_MediaCountry_Id) VALUES ('NRK P1 Sogn og Fjordane MP3 (høy)','http://lyd.nrk.no/nrk_radio_p1_sogn_og_fjordane_mp3_h',(SELECT Id FROM MediaCategoryTypes WHERE Name = 'InternetStreamRadio'),(SELECT Id FROM MediaCountries WHERE Name = 'Norge'));
INSERT INTO MediaSources (Name,Url,FK_MediaCategoryType_Id,FK_MediaCountry_Id) VALUES ('NRK P1 Sørlandet','http://lyd.nrk.no/nrk_radio_p1_sorlandet_mp3_h',(SELECT Id FROM MediaCategoryTypes WHERE Name = 'InternetStreamRadio'),(SELECT Id FROM MediaCountries WHERE Name = 'Norge'));
INSERT INTO MediaSources (Name,Url,FK_MediaCategoryType_Id,FK_MediaCountry_Id) VALUES ('NRK P1 Telemark','http://lyd.nrk.no/nrk_radio_p1_telemark_mp3_h',(SELECT Id FROM MediaCategoryTypes WHERE Name = 'InternetStreamRadio'),(SELECT Id FROM MediaCountries WHERE Name = 'Norge'));
INSERT INTO MediaSources (Name,Url,FK_MediaCategoryType_Id,FK_MediaCountry_Id) VALUES ('NRK P1 Troms','http://lyd.nrk.no/nrk_radio_p1_troms_mp3_h',(SELECT Id FROM MediaCategoryTypes WHERE Name = 'InternetStreamRadio'),(SELECT Id FROM MediaCountries WHERE Name = 'Norge'));
INSERT INTO MediaSources (Name,Url,FK_MediaCategoryType_Id,FK_MediaCountry_Id) VALUES ('NRK P1 Trøndelag','http://lyd.nrk.no/nrk_radio_p1_trondelag_mp3_h',(SELECT Id FROM MediaCategoryTypes WHERE Name = 'InternetStreamRadio'),(SELECT Id FROM MediaCountries WHERE Name = 'Norge'));
INSERT INTO MediaSources (Name,Url,FK_MediaCategoryType_Id,FK_MediaCountry_Id) VALUES ('NRK P1 Vestfold','http://lyd.nrk.no/nrk_radio_p1_vestfold_mp3_h',(SELECT Id FROM MediaCategoryTypes WHERE Name = 'InternetStreamRadio'),(SELECT Id FROM MediaCountries WHERE Name = 'Norge'));
INSERT INTO MediaSources (Name,Url,FK_MediaCategoryType_Id,FK_MediaCountry_Id) VALUES ('NRK P1 Østfold','http://lyd.nrk.no/nrk_radio_p1_ostfold_mp3_h',(SELECT Id FROM MediaCategoryTypes WHERE Name = 'InternetStreamRadio'),(SELECT Id FROM MediaCountries WHERE Name = 'Norge'));
INSERT INTO MediaSources (Name,Url,FK_MediaCategoryType_Id,FK_MediaCountry_Id) VALUES ('NRK P2','http://lyd.nrk.no/nrk_radio_p2_mp3_h',(SELECT Id FROM MediaCategoryTypes WHERE Name = 'InternetStreamRadio'),(SELECT Id FROM MediaCountries WHERE Name = 'Norge'));
INSERT INTO MediaSources (Name,Url,FK_MediaCategoryType_Id,FK_MediaCountry_Id) VALUES ('NRK P3','http://lyd.nrk.no/nrk_radio_p3_mp3_h',(SELECT Id FROM MediaCategoryTypes WHERE Name = 'InternetStreamRadio'),(SELECT Id FROM MediaCountries WHERE Name = 'Norge'));
INSERT INTO MediaSources (Name,Url,FK_MediaCategoryType_Id,FK_MediaCountry_Id) VALUES ('NRK P1+','http://lyd.nrk.no/nrk_radio_p1pluss_mp3_h.m3u',(SELECT Id FROM MediaCategoryTypes WHERE Name = 'InternetStreamRadio'),(SELECT Id FROM MediaCountries WHERE Name = 'Norge'));
INSERT INTO MediaSources (Name,Url,FK_MediaCategoryType_Id,FK_MediaCountry_Id) VALUES ('NRK P13','http://lyd.nrk.no/nrk_radio_p13_mp3_h',(SELECT Id FROM MediaCategoryTypes WHERE Name = 'InternetStreamRadio'),(SELECT Id FROM MediaCountries WHERE Name = 'Norge'));
INSERT INTO MediaSources (Name,Url,FK_MediaCategoryType_Id,FK_MediaCountry_Id) VALUES ('NRK mP3','http://lyd.nrk.no/nrk_radio_mp3_aac_h',(SELECT Id FROM MediaCategoryTypes WHERE Name = 'InternetStreamRadio'),(SELECT Id FROM MediaCountries WHERE Name = 'Norge'));
INSERT INTO MediaSources (Name,Url,FK_MediaCategoryType_Id,FK_MediaCountry_Id) VALUES ('NRK Super','http://lyd.nrk.no/nrk_radio_super_mp3_h',(SELECT Id FROM MediaCategoryTypes WHERE Name = 'InternetStreamRadio'),(SELECT Id FROM MediaCountries WHERE Name = 'Norge'));
INSERT INTO MediaSources (Name,Url,FK_MediaCategoryType_Id,FK_MediaCountry_Id) VALUES ('NRK Alltid nyheter','http://lyd.nrk.no/nrk_radio_alltid_nyheter_mp3_h',(SELECT Id FROM MediaCategoryTypes WHERE Name = 'InternetStreamRadio'),(SELECT Id FROM MediaCountries WHERE Name = 'Norge'));
INSERT INTO MediaSources (Name,Url,FK_MediaCategoryType_Id,FK_MediaCountry_Id) VALUES ('NRK P3 Urørt','http://lyd.nrk.no/nrk_radio_p3_urort_mp3_h',(SELECT Id FROM MediaCategoryTypes WHERE Name = 'InternetStreamRadio'),(SELECT Id FROM MediaCountries WHERE Name = 'Norge'));
INSERT INTO MediaSources (Name,Url,FK_MediaCategoryType_Id,FK_MediaCountry_Id) VALUES ('NRK Sport','http://lyd.nrk.no/nrk_radio_sport_mp3_h',(SELECT Id FROM MediaCategoryTypes WHERE Name = 'InternetStreamRadio'),(SELECT Id FROM MediaCountries WHERE Name = 'Norge'));
INSERT INTO MediaSources (Name,Url,FK_MediaCategoryType_Id,FK_MediaCountry_Id) VALUES ('NRK Sápmi radio','http://lyd.nrk.no/nrk_radio_sami_mp3_h',(SELECT Id FROM MediaCategoryTypes WHERE Name = 'InternetStreamRadio'),(SELECT Id FROM MediaCountries WHERE Name = 'Norge'));
INSERT INTO MediaSources (Name,Url,FK_MediaCategoryType_Id,FK_MediaCountry_Id) VALUES ('NRK Klassisk','http://lyd.nrk.no/nrk_radio_klassisk_mp3_h',(SELECT Id FROM MediaCategoryTypes WHERE Name = 'InternetStreamRadio'),(SELECT Id FROM MediaCountries WHERE Name = 'Norge'));
INSERT INTO MediaSources (Name,Url,FK_MediaCategoryType_Id,FK_MediaCountry_Id) VALUES ('NRK Jazz','http://lyd.nrk.no/nrk_radio_jazz_mp3_h',(SELECT Id FROM MediaCategoryTypes WHERE Name = 'InternetStreamRadio'),(SELECT Id FROM MediaCountries WHERE Name = 'Norge'));
INSERT INTO MediaSources (Name,Url,FK_MediaCategoryType_Id,FK_MediaCountry_Id) VALUES ('NRK Folkemusikk','http://lyd.nrk.no/nrk_radio_folkemusikk_mp3_h',(SELECT Id FROM MediaCategoryTypes WHERE Name = 'InternetStreamRadio'),(SELECT Id FROM MediaCountries WHERE Name = 'Norge'));

INSERT INTO MediaSources (Name,Url,FK_MediaCategoryType_Id,FK_MediaCountry_Id) VALUES ('BBC Radio 1 (Nationella stationer)','http://bbcmedia.ic.llnwd.net/stream/bbcmedia_radio1_mf_p',(SELECT Id FROM MediaCategoryTypes WHERE Name = 'InternetStreamRadio'),(SELECT Id FROM MediaCountries WHERE Name = 'England'));
INSERT INTO MediaSources (Name,Url,FK_MediaCategoryType_Id,FK_MediaCountry_Id) VALUES ('BBC Radio 1xtra (Nationella stationer)','http://bbcmedia.ic.llnwd.net/stream/bbcmedia_radio1xtra_mf_p',(SELECT Id FROM MediaCategoryTypes WHERE Name = 'InternetStreamRadio'),(SELECT Id FROM MediaCountries WHERE Name = 'England'));
INSERT INTO MediaSources (Name,Url,FK_MediaCategoryType_Id,FK_MediaCountry_Id) VALUES ('BBC Radio 2 (Nationella stationer)','http://bbcmedia.ic.llnwd.net/stream/bbcmedia_radio2_mf_p',(SELECT Id FROM MediaCategoryTypes WHERE Name = 'InternetStreamRadio'),(SELECT Id FROM MediaCountries WHERE Name = 'England'));
INSERT INTO MediaSources (Name,Url,FK_MediaCategoryType_Id,FK_MediaCountry_Id) VALUES ('BBC Radio 3 (Nationella stationer)','http://bbcmedia.ic.llnwd.net/stream/bbcmedia_radio3_mf_p',(SELECT Id FROM MediaCategoryTypes WHERE Name = 'InternetStreamRadio'),(SELECT Id FROM MediaCountries WHERE Name = 'England'));
INSERT INTO MediaSources (Name,Url,FK_MediaCategoryType_Id,FK_MediaCountry_Id) VALUES ('BBC Radio 4FM (Nationella stationer)','http://bbcmedia.ic.llnwd.net/stream/bbcmedia_radio4fm_mf_p',(SELECT Id FROM MediaCategoryTypes WHERE Name = 'InternetStreamRadio'),(SELECT Id FROM MediaCountries WHERE Name = 'England'));
INSERT INTO MediaSources (Name,Url,FK_MediaCategoryType_Id,FK_MediaCountry_Id) VALUES ('BBC Radio 4LW (Nationella stationer)','http://bbcmedia.ic.llnwd.net/stream/bbcmedia_radio4lw_mf_p',(SELECT Id FROM MediaCategoryTypes WHERE Name = 'InternetStreamRadio'),(SELECT Id FROM MediaCountries WHERE Name = 'England'));
INSERT INTO MediaSources (Name,Url,FK_MediaCategoryType_Id,FK_MediaCountry_Id) VALUES ('BBC Radio 4 Extra (Nationella stationer)','http://bbcmedia.ic.llnwd.net/stream/bbcmedia_radio4extra_mf_p',(SELECT Id FROM MediaCategoryTypes WHERE Name = 'InternetStreamRadio'),(SELECT Id FROM MediaCountries WHERE Name = 'England'));
INSERT INTO MediaSources (Name,Url,FK_MediaCategoryType_Id,FK_MediaCountry_Id) VALUES ('BBC Radio 5 Live (Nationella stationer)','http://bbcmedia.ic.llnwd.net/stream/bbcmedia_radio5live_mf_p',(SELECT Id FROM MediaCategoryTypes WHERE Name = 'InternetStreamRadio'),(SELECT Id FROM MediaCountries WHERE Name = 'England'));
INSERT INTO MediaSources (Name,Url,FK_MediaCategoryType_Id,FK_MediaCountry_Id) VALUES ('BBC Radio 5 Live Sportsball Extra','http://bbcmedia.ic.llnwd.net/stream/bbcmedia_radio5extra_mf_p',(SELECT Id FROM MediaCategoryTypes WHERE Name = 'InternetStreamRadio'),(SELECT Id FROM MediaCountries WHERE Name = 'England'));
INSERT INTO MediaSources (Name,Url,FK_MediaCategoryType_Id,FK_MediaCountry_Id) VALUES ('BBC Radio 6 Music (Nationella stationer)','http://bbcmedia.ic.llnwd.net/stream/bbcmedia_6music_mf_p',(SELECT Id FROM MediaCategoryTypes WHERE Name = 'InternetStreamRadio'),(SELECT Id FROM MediaCountries WHERE Name = 'England'));
INSERT INTO MediaSources (Name,Url,FK_MediaCategoryType_Id,FK_MediaCountry_Id) VALUES ('BBC Asian Network (Nationella stationer)','http://bbcmedia.ic.llnwd.net/stream/bbcmedia_asianet_mf_p',(SELECT Id FROM MediaCategoryTypes WHERE Name = 'InternetStreamRadio'),(SELECT Id FROM MediaCountries WHERE Name = 'England'));
INSERT INTO MediaSources (Name,Url,FK_MediaCategoryType_Id,FK_MediaCountry_Id) VALUES ('BBC World Service UK stream (Nationella stationer)','http://bbcwssc.ic.llnwd.net/stream/bbcwssc_mp1_ws-eieuk',(SELECT Id FROM MediaCategoryTypes WHERE Name = 'InternetStreamRadio'),(SELECT Id FROM MediaCountries WHERE Name = 'England'));
INSERT INTO MediaSources (Name,Url,FK_MediaCategoryType_Id,FK_MediaCountry_Id) VALUES ('BBC World Service News stream (Nationella stationer)','http://bbcwssc.ic.llnwd.net/stream/bbcwssc_mp1_ws-einws',(SELECT Id FROM MediaCategoryTypes WHERE Name = 'InternetStreamRadio'),(SELECT Id FROM MediaCountries WHERE Name = 'England'));
INSERT INTO MediaSources (Name,Url,FK_MediaCategoryType_Id,FK_MediaCountry_Id) VALUES ('BBC Radio Cymru (Nationer och regioner)','http://bbcmedia.ic.llnwd.net/stream/bbcmedia_cymru_mf_p',(SELECT Id FROM MediaCategoryTypes WHERE Name = 'InternetStreamRadio'),(SELECT Id FROM MediaCountries WHERE Name = 'England'));
INSERT INTO MediaSources (Name,Url,FK_MediaCategoryType_Id,FK_MediaCountry_Id) VALUES ('BBC Radio Foyle (Nationer och regioner)','http://bbcmedia.ic.llnwd.net/stream/bbcmedia_foyle_mf_p',(SELECT Id FROM MediaCategoryTypes WHERE Name = 'InternetStreamRadio'),(SELECT Id FROM MediaCountries WHERE Name = 'England'));
INSERT INTO MediaSources (Name,Url,FK_MediaCategoryType_Id,FK_MediaCountry_Id) VALUES ('BBC Radio nan Gàidheal (Nationer och regioner)','http://bbcmedia.ic.llnwd.net/stream/bbcmedia_nangaidheal_mf_p',(SELECT Id FROM MediaCategoryTypes WHERE Name = 'InternetStreamRadio'),(SELECT Id FROM MediaCountries WHERE Name = 'England'));
INSERT INTO MediaSources (Name,Url,FK_MediaCategoryType_Id,FK_MediaCountry_Id) VALUES ('BBC Radio Scotland (Nationer och regioner)','http://bbcmedia.ic.llnwd.net/stream/bbcmedia_scotlandfm_mf_p',(SELECT Id FROM MediaCategoryTypes WHERE Name = 'InternetStreamRadio'),(SELECT Id FROM MediaCountries WHERE Name = 'England'));
INSERT INTO MediaSources (Name,Url,FK_MediaCategoryType_Id,FK_MediaCountry_Id) VALUES ('BBC Radio Ulster (Nationer och regioner)','http://bbcmedia.ic.llnwd.net/stream/bbcmedia_ulster_mf_p',(SELECT Id FROM MediaCategoryTypes WHERE Name = 'InternetStreamRadio'),(SELECT Id FROM MediaCountries WHERE Name = 'England'));
INSERT INTO MediaSources (Name,Url,FK_MediaCategoryType_Id,FK_MediaCountry_Id) VALUES ('BBC Radio Wales (Nationer och regioner)','http://bbcmedia.ic.llnwd.net/stream/bbcmedia_walesmw_mf_p',(SELECT Id FROM MediaCategoryTypes WHERE Name = 'InternetStreamRadio'),(SELECT Id FROM MediaCountries WHERE Name = 'England'));
INSERT INTO MediaSources (Name,Url,FK_MediaCategoryType_Id,FK_MediaCountry_Id) VALUES ('BBC Radio Berkshire (Lokalradio)','http://bbcmedia.ic.llnwd.net/stream/bbcmedia_lrberk_mf_p',(SELECT Id FROM MediaCategoryTypes WHERE Name = 'InternetStreamRadio'),(SELECT Id FROM MediaCountries WHERE Name = 'England'));
INSERT INTO MediaSources (Name,Url,FK_MediaCategoryType_Id,FK_MediaCountry_Id) VALUES ('BBC Radio Bristol (Lokalradio)','http://bbcmedia.ic.llnwd.net/stream/bbcmedia_lrbris_mf_p',(SELECT Id FROM MediaCategoryTypes WHERE Name = 'InternetStreamRadio'),(SELECT Id FROM MediaCountries WHERE Name = 'England'));
INSERT INTO MediaSources (Name,Url,FK_MediaCategoryType_Id,FK_MediaCountry_Id) VALUES ('BBC Radio Cambridgeshire (Lokalradio)','http://bbcmedia.ic.llnwd.net/stream/bbcmedia_lrcambs_mf_p',(SELECT Id FROM MediaCategoryTypes WHERE Name = 'InternetStreamRadio'),(SELECT Id FROM MediaCountries WHERE Name = 'England'));
INSERT INTO MediaSources (Name,Url,FK_MediaCategoryType_Id,FK_MediaCountry_Id) VALUES ('BBC Radio Cornwall (Lokalradio)','http://bbcmedia.ic.llnwd.net/stream/bbcmedia_lrcorn_mf_p',(SELECT Id FROM MediaCategoryTypes WHERE Name = 'InternetStreamRadio'),(SELECT Id FROM MediaCountries WHERE Name = 'England'));
INSERT INTO MediaSources (Name,Url,FK_MediaCategoryType_Id,FK_MediaCountry_Id) VALUES ('BBC Coventry & Warwickshire (Lokalradio)','http://bbcmedia.ic.llnwd.net/stream/bbcmedia_lrwmcandw_mf_p',(SELECT Id FROM MediaCategoryTypes WHERE Name = 'InternetStreamRadio'),(SELECT Id FROM MediaCountries WHERE Name = 'England'));
INSERT INTO MediaSources (Name,Url,FK_MediaCategoryType_Id,FK_MediaCountry_Id) VALUES ('BBC Radio Cumbria (Lokalradio)','http://bbcmedia.ic.llnwd.net/stream/bbcmedia_lrcumbria_mf_p',(SELECT Id FROM MediaCategoryTypes WHERE Name = 'InternetStreamRadio'),(SELECT Id FROM MediaCountries WHERE Name = 'England'));
INSERT INTO MediaSources (Name,Url,FK_MediaCategoryType_Id,FK_MediaCountry_Id) VALUES ('BBC Radio Derby (Lokalradio)','http://bbcmedia.ic.llnwd.net/stream/bbcmedia_lrderby_mf_p',(SELECT Id FROM MediaCategoryTypes WHERE Name = 'InternetStreamRadio'),(SELECT Id FROM MediaCountries WHERE Name = 'England'));
INSERT INTO MediaSources (Name,Url,FK_MediaCategoryType_Id,FK_MediaCountry_Id) VALUES ('BBC Radio Devon (Lokalradio)','http://bbcmedia.ic.llnwd.net/stream/bbcmedia_lrdevon_mf_p',(SELECT Id FROM MediaCategoryTypes WHERE Name = 'InternetStreamRadio'),(SELECT Id FROM MediaCountries WHERE Name = 'England'));
INSERT INTO MediaSources (Name,Url,FK_MediaCategoryType_Id,FK_MediaCountry_Id) VALUES ('BBC Essex (Lokalradio)','http://bbcmedia.ic.llnwd.net/stream/bbcmedia_lressex_mf_p',(SELECT Id FROM MediaCategoryTypes WHERE Name = 'InternetStreamRadio'),(SELECT Id FROM MediaCountries WHERE Name = 'England'));
INSERT INTO MediaSources (Name,Url,FK_MediaCategoryType_Id,FK_MediaCountry_Id) VALUES ('BBC Radio Gloucestershire (Lokalradio)','http://bbcmedia.ic.llnwd.net/stream/bbcmedia_lrgloucs_mf_p',(SELECT Id FROM MediaCategoryTypes WHERE Name = 'InternetStreamRadio'),(SELECT Id FROM MediaCountries WHERE Name = 'England'));
INSERT INTO MediaSources (Name,Url,FK_MediaCategoryType_Id,FK_MediaCountry_Id) VALUES ('BBC Radio Guernsey (Lokalradio)','http://bbcmedia.ic.llnwd.net/stream/bbcmedia_lrguern_mf_p',(SELECT Id FROM MediaCategoryTypes WHERE Name = 'InternetStreamRadio'),(SELECT Id FROM MediaCountries WHERE Name = 'England'));
INSERT INTO MediaSources (Name,Url,FK_MediaCategoryType_Id,FK_MediaCountry_Id) VALUES ('BBC Hereford & Worcester (Lokalradio)','http://bbcmedia.ic.llnwd.net/stream/bbcmedia_lrhandw_mf_p',(SELECT Id FROM MediaCategoryTypes WHERE Name = 'InternetStreamRadio'),(SELECT Id FROM MediaCountries WHERE Name = 'England'));
INSERT INTO MediaSources (Name,Url,FK_MediaCategoryType_Id,FK_MediaCountry_Id) VALUES ('BBC Radio Humberside (Lokalradio)','http://bbcmedia.ic.llnwd.net/stream/bbcmedia_lrhumber_mf_p',(SELECT Id FROM MediaCategoryTypes WHERE Name = 'InternetStreamRadio'),(SELECT Id FROM MediaCountries WHERE Name = 'England'));
INSERT INTO MediaSources (Name,Url,FK_MediaCategoryType_Id,FK_MediaCountry_Id) VALUES ('BBC Radio Jersey (Lokalradio)','http://bbcmedia.ic.llnwd.net/stream/bbcmedia_lrjersey_mf_p',(SELECT Id FROM MediaCategoryTypes WHERE Name = 'InternetStreamRadio'),(SELECT Id FROM MediaCountries WHERE Name = 'England'));
INSERT INTO MediaSources (Name,Url,FK_MediaCategoryType_Id,FK_MediaCountry_Id) VALUES ('BBC Radio Kent (Lokalradio)','http://bbcmedia.ic.llnwd.net/stream/bbcmedia_lrkent_mf_p',(SELECT Id FROM MediaCategoryTypes WHERE Name = 'InternetStreamRadio'),(SELECT Id FROM MediaCountries WHERE Name = 'England'));
INSERT INTO MediaSources (Name,Url,FK_MediaCategoryType_Id,FK_MediaCountry_Id) VALUES ('BBC Radio Lancashire (Lokalradio)','http://bbcmedia.ic.llnwd.net/stream/bbcmedia_lrlancs_mf_p',(SELECT Id FROM MediaCategoryTypes WHERE Name = 'InternetStreamRadio'),(SELECT Id FROM MediaCountries WHERE Name = 'England'));
INSERT INTO MediaSources (Name,Url,FK_MediaCategoryType_Id,FK_MediaCountry_Id) VALUES ('BBC Radio Leeds (Lokalradio)','http://bbcmedia.ic.llnwd.net/stream/bbcmedia_lrleeds_mf_p',(SELECT Id FROM MediaCategoryTypes WHERE Name = 'InternetStreamRadio'),(SELECT Id FROM MediaCountries WHERE Name = 'England'));
INSERT INTO MediaSources (Name,Url,FK_MediaCategoryType_Id,FK_MediaCountry_Id) VALUES ('BBC Radio Leicester (Lokalradio)','http://bbcmedia.ic.llnwd.net/stream/bbcmedia_lrleics_mf_p',(SELECT Id FROM MediaCategoryTypes WHERE Name = 'InternetStreamRadio'),(SELECT Id FROM MediaCountries WHERE Name = 'England'));
INSERT INTO MediaSources (Name,Url,FK_MediaCategoryType_Id,FK_MediaCountry_Id) VALUES ('BBC Radio Lincolnshire (Lokalradio)','http://bbcmedia.ic.llnwd.net/stream/bbcmedia_lrlincs_mf_p',(SELECT Id FROM MediaCategoryTypes WHERE Name = 'InternetStreamRadio'),(SELECT Id FROM MediaCountries WHERE Name = 'England'));
INSERT INTO MediaSources (Name,Url,FK_MediaCategoryType_Id,FK_MediaCountry_Id) VALUES ('BBC Radio London (Lokalradio)','http://bbcmedia.ic.llnwd.net/stream/bbcmedia_lrldn_mf_p',(SELECT Id FROM MediaCategoryTypes WHERE Name = 'InternetStreamRadio'),(SELECT Id FROM MediaCountries WHERE Name = 'England'));
INSERT INTO MediaSources (Name,Url,FK_MediaCategoryType_Id,FK_MediaCountry_Id) VALUES ('BBC Radio Manchester (Lokalradio)','http://bbcmedia.ic.llnwd.net/stream/bbcmedia_lrmanc_mf_p',(SELECT Id FROM MediaCategoryTypes WHERE Name = 'InternetStreamRadio'),(SELECT Id FROM MediaCountries WHERE Name = 'England'));
INSERT INTO MediaSources (Name,Url,FK_MediaCategoryType_Id,FK_MediaCountry_Id) VALUES ('BBC Radio Merseyside (Lokalradio)','http://bbcmedia.ic.llnwd.net/stream/bbcmedia_lrmersey_mf_p',(SELECT Id FROM MediaCategoryTypes WHERE Name = 'InternetStreamRadio'),(SELECT Id FROM MediaCountries WHERE Name = 'England'));
INSERT INTO MediaSources (Name,Url,FK_MediaCategoryType_Id,FK_MediaCountry_Id) VALUES ('BBC Newcastle (Lokalradio)','http://bbcmedia.ic.llnwd.net/stream/bbcmedia_lrnewc_mf_p',(SELECT Id FROM MediaCategoryTypes WHERE Name = 'InternetStreamRadio'),(SELECT Id FROM MediaCountries WHERE Name = 'England'));
INSERT INTO MediaSources (Name,Url,FK_MediaCategoryType_Id,FK_MediaCountry_Id) VALUES ('BBC Radio Norfolk (Lokalradio)','http://bbcmedia.ic.llnwd.net/stream/bbcmedia_lrnorfolk_mf_p',(SELECT Id FROM MediaCategoryTypes WHERE Name = 'InternetStreamRadio'),(SELECT Id FROM MediaCountries WHERE Name = 'England'));
INSERT INTO MediaSources (Name,Url,FK_MediaCategoryType_Id,FK_MediaCountry_Id) VALUES ('BBC Radio Northampton (Lokalradio)','http://bbcmedia.ic.llnwd.net/stream/bbcmedia_lrnthhnts_mf_p',(SELECT Id FROM MediaCategoryTypes WHERE Name = 'InternetStreamRadio'),(SELECT Id FROM MediaCountries WHERE Name = 'England'));
INSERT INTO MediaSources (Name,Url,FK_MediaCategoryType_Id,FK_MediaCountry_Id) VALUES ('BBC Radio Nottingham (Lokalradio)','http://bbcmedia.ic.llnwd.net/stream/bbcmedia_lrnotts_mf_p',(SELECT Id FROM MediaCategoryTypes WHERE Name = 'InternetStreamRadio'),(SELECT Id FROM MediaCountries WHERE Name = 'England'));
INSERT INTO MediaSources (Name,Url,FK_MediaCategoryType_Id,FK_MediaCountry_Id) VALUES ('BBC Radio Oxford (Lokalradio)','http://bbcmedia.ic.llnwd.net/stream/bbcmedia_lroxford_mf_p',(SELECT Id FROM MediaCategoryTypes WHERE Name = 'InternetStreamRadio'),(SELECT Id FROM MediaCountries WHERE Name = 'England'));
INSERT INTO MediaSources (Name,Url,FK_MediaCategoryType_Id,FK_MediaCountry_Id) VALUES ('BBC Radio Sheffield (Lokalradio)','http://bbcmedia.ic.llnwd.net/stream/bbcmedia_lrsheff_mf_p',(SELECT Id FROM MediaCategoryTypes WHERE Name = 'InternetStreamRadio'),(SELECT Id FROM MediaCountries WHERE Name = 'England'));
INSERT INTO MediaSources (Name,Url,FK_MediaCategoryType_Id,FK_MediaCountry_Id) VALUES ('BBC Radio Shropshire (Lokalradio)','http://bbcmedia.ic.llnwd.net/stream/bbcmedia_lrshrops_mf_p',(SELECT Id FROM MediaCategoryTypes WHERE Name = 'InternetStreamRadio'),(SELECT Id FROM MediaCountries WHERE Name = 'England'));
INSERT INTO MediaSources (Name,Url,FK_MediaCategoryType_Id,FK_MediaCountry_Id) VALUES ('BBC Radio Solent (Lokalradio)','http://bbcmedia.ic.llnwd.net/stream/bbcmedia_lrsolent_mf_p',(SELECT Id FROM MediaCategoryTypes WHERE Name = 'InternetStreamRadio'),(SELECT Id FROM MediaCountries WHERE Name = 'England'));
INSERT INTO MediaSources (Name,Url,FK_MediaCategoryType_Id,FK_MediaCountry_Id) VALUES ('BBC Somerset (Lokalradio)','http://bbcmedia.ic.llnwd.net/stream/bbcmedia_lrsomer_mf_p',(SELECT Id FROM MediaCategoryTypes WHERE Name = 'InternetStreamRadio'),(SELECT Id FROM MediaCountries WHERE Name = 'England'));
INSERT INTO MediaSources (Name,Url,FK_MediaCategoryType_Id,FK_MediaCountry_Id) VALUES ('BBC Radio Suffolk (Lokalradio)','http://bbcmedia.ic.llnwd.net/stream/bbcmedia_lrsuffolk_mf_p',(SELECT Id FROM MediaCategoryTypes WHERE Name = 'InternetStreamRadio'),(SELECT Id FROM MediaCountries WHERE Name = 'England'));
INSERT INTO MediaSources (Name,Url,FK_MediaCategoryType_Id,FK_MediaCountry_Id) VALUES ('BBC Surrey (Lokalradio)','http://bbcmedia.ic.llnwd.net/stream/bbcmedia_lrsurrey_mf_p',(SELECT Id FROM MediaCategoryTypes WHERE Name = 'InternetStreamRadio'),(SELECT Id FROM MediaCountries WHERE Name = 'England'));
INSERT INTO MediaSources (Name,Url,FK_MediaCategoryType_Id,FK_MediaCountry_Id) VALUES ('BBC Sussex (Lokalradio)','http://bbcmedia.ic.llnwd.net/stream/bbcmedia_lrsussex_mf_p',(SELECT Id FROM MediaCategoryTypes WHERE Name = 'InternetStreamRadio'),(SELECT Id FROM MediaCountries WHERE Name = 'England'));
INSERT INTO MediaSources (Name,Url,FK_MediaCategoryType_Id,FK_MediaCountry_Id) VALUES ('BBC Tees (Lokalradio)','http://bbcmedia.ic.llnwd.net/stream/bbcmedia_lrtees_mf_p',(SELECT Id FROM MediaCategoryTypes WHERE Name = 'InternetStreamRadio'),(SELECT Id FROM MediaCountries WHERE Name = 'England'));
INSERT INTO MediaSources (Name,Url,FK_MediaCategoryType_Id,FK_MediaCountry_Id) VALUES ('BBC Three Counties Radio (Lokalradio)','http://bbcmedia.ic.llnwd.net/stream/bbcmedia_lr3cr_mf_p',(SELECT Id FROM MediaCategoryTypes WHERE Name = 'InternetStreamRadio'),(SELECT Id FROM MediaCountries WHERE Name = 'England'));
INSERT INTO MediaSources (Name,Url,FK_MediaCategoryType_Id,FK_MediaCountry_Id) VALUES ('BBC Wiltshire (Lokalradio)','http://bbcmedia.ic.llnwd.net/stream/bbcmedia_lrwilts_mf_p',(SELECT Id FROM MediaCategoryTypes WHERE Name = 'InternetStreamRadio'),(SELECT Id FROM MediaCountries WHERE Name = 'England'));
INSERT INTO MediaSources (Name,Url,FK_MediaCategoryType_Id,FK_MediaCountry_Id) VALUES ('BBC WM 95.6 (Lokalradio)','http://bbcmedia.ic.llnwd.net/stream/bbcmedia_lrwm_mf_p',(SELECT Id FROM MediaCategoryTypes WHERE Name = 'InternetStreamRadio'),(SELECT Id FROM MediaCountries WHERE Name = 'England'));
INSERT INTO MediaSources (Name,Url,FK_MediaCategoryType_Id,FK_MediaCountry_Id) VALUES ('BBC Radio York (Lokalradio)','http://bbcmedia.ic.llnwd.net/stream/bbcmedia_lryork_mf_p',(SELECT Id FROM MediaCategoryTypes WHERE Name = 'InternetStreamRadio'), (SELECT Id FROM MediaCountries WHERE Name = 'England'));

INSERT INTO MediaOutputVolumes (VolumeValue) VALUES (0);
INSERT INTO MediaOutputVolumes (VolumeValue) VALUES (1);
INSERT INTO MediaOutputVolumes (VolumeValue) VALUES (2);
INSERT INTO MediaOutputVolumes (VolumeValue) VALUES (3);
INSERT INTO MediaOutputVolumes (VolumeValue) VALUES (4);
INSERT INTO MediaOutputVolumes (VolumeValue) VALUES (5);
INSERT INTO MediaOutputVolumes (VolumeValue) VALUES (6);
INSERT INTO MediaOutputVolumes (VolumeValue) VALUES (7);
INSERT INTO MediaOutputVolumes (VolumeValue) VALUES (8);
INSERT INTO MediaOutputVolumes (VolumeValue) VALUES (9);
INSERT INTO MediaOutputVolumes (VolumeValue) VALUES (10);
INSERT INTO MediaOutputVolumes (VolumeValue) VALUES (11);
INSERT INTO MediaOutputVolumes (VolumeValue) VALUES (12);
INSERT INTO MediaOutputVolumes (VolumeValue) VALUES (13);
INSERT INTO MediaOutputVolumes (VolumeValue) VALUES (14);
INSERT INTO MediaOutputVolumes (VolumeValue) VALUES (15);
INSERT INTO MediaOutputVolumes (VolumeValue) VALUES (16);
INSERT INTO MediaOutputVolumes (VolumeValue) VALUES (17);
INSERT INTO MediaOutputVolumes (VolumeValue) VALUES (18);
INSERT INTO MediaOutputVolumes (VolumeValue) VALUES (19);
INSERT INTO MediaOutputVolumes (VolumeValue) VALUES (20);
INSERT INTO MediaOutputVolumes (VolumeValue) VALUES (21);
INSERT INTO MediaOutputVolumes (VolumeValue) VALUES (22);
INSERT INTO MediaOutputVolumes (VolumeValue) VALUES (23);
INSERT INTO MediaOutputVolumes (VolumeValue) VALUES (24);
INSERT INTO MediaOutputVolumes (VolumeValue) VALUES (25);
INSERT INTO MediaOutputVolumes (VolumeValue) VALUES (26);
INSERT INTO MediaOutputVolumes (VolumeValue) VALUES (27);
INSERT INTO MediaOutputVolumes (VolumeValue) VALUES (28);
INSERT INTO MediaOutputVolumes (VolumeValue) VALUES (29);
INSERT INTO MediaOutputVolumes (VolumeValue) VALUES (30);
INSERT INTO MediaOutputVolumes (VolumeValue) VALUES (31);
INSERT INTO MediaOutputVolumes (VolumeValue) VALUES (32);
INSERT INTO MediaOutputVolumes (VolumeValue) VALUES (33);
INSERT INTO MediaOutputVolumes (VolumeValue) VALUES (34);
INSERT INTO MediaOutputVolumes (VolumeValue) VALUES (35);
INSERT INTO MediaOutputVolumes (VolumeValue) VALUES (36);
INSERT INTO MediaOutputVolumes (VolumeValue) VALUES (37);
INSERT INTO MediaOutputVolumes (VolumeValue) VALUES (38);
INSERT INTO MediaOutputVolumes (VolumeValue) VALUES (39);
INSERT INTO MediaOutputVolumes (VolumeValue) VALUES (40);
INSERT INTO MediaOutputVolumes (VolumeValue) VALUES (41);
INSERT INTO MediaOutputVolumes (VolumeValue) VALUES (42);
INSERT INTO MediaOutputVolumes (VolumeValue) VALUES (43);
INSERT INTO MediaOutputVolumes (VolumeValue) VALUES (44);
INSERT INTO MediaOutputVolumes (VolumeValue) VALUES (45);
INSERT INTO MediaOutputVolumes (VolumeValue) VALUES (46);
INSERT INTO MediaOutputVolumes (VolumeValue) VALUES (47);
INSERT INTO MediaOutputVolumes (VolumeValue) VALUES (48);
INSERT INTO MediaOutputVolumes (VolumeValue) VALUES (49);
INSERT INTO MediaOutputVolumes (VolumeValue) VALUES (50);
INSERT INTO MediaOutputVolumes (VolumeValue) VALUES (51);
INSERT INTO MediaOutputVolumes (VolumeValue) VALUES (52);
INSERT INTO MediaOutputVolumes (VolumeValue) VALUES (53);
INSERT INTO MediaOutputVolumes (VolumeValue) VALUES (54);
INSERT INTO MediaOutputVolumes (VolumeValue) VALUES (55);
INSERT INTO MediaOutputVolumes (VolumeValue) VALUES (56);
INSERT INTO MediaOutputVolumes (VolumeValue) VALUES (57);
INSERT INTO MediaOutputVolumes (VolumeValue) VALUES (58);
INSERT INTO MediaOutputVolumes (VolumeValue) VALUES (59);
INSERT INTO MediaOutputVolumes (VolumeValue) VALUES (60);
INSERT INTO MediaOutputVolumes (VolumeValue) VALUES (61);
INSERT INTO MediaOutputVolumes (VolumeValue) VALUES (62);
INSERT INTO MediaOutputVolumes (VolumeValue) VALUES (63);
INSERT INTO MediaOutputVolumes (VolumeValue) VALUES (64);
INSERT INTO MediaOutputVolumes (VolumeValue) VALUES (65);
INSERT INTO MediaOutputVolumes (VolumeValue) VALUES (66);
INSERT INTO MediaOutputVolumes (VolumeValue) VALUES (67);
INSERT INTO MediaOutputVolumes (VolumeValue) VALUES (68);
INSERT INTO MediaOutputVolumes (VolumeValue) VALUES (69);
INSERT INTO MediaOutputVolumes (VolumeValue) VALUES (70);
INSERT INTO MediaOutputVolumes (VolumeValue) VALUES (71);
INSERT INTO MediaOutputVolumes (VolumeValue) VALUES (72);
INSERT INTO MediaOutputVolumes (VolumeValue) VALUES (73);
INSERT INTO MediaOutputVolumes (VolumeValue) VALUES (74);
INSERT INTO MediaOutputVolumes (VolumeValue) VALUES (75);
INSERT INTO MediaOutputVolumes (VolumeValue) VALUES (76);
INSERT INTO MediaOutputVolumes (VolumeValue) VALUES (77);
INSERT INTO MediaOutputVolumes (VolumeValue) VALUES (78);
INSERT INTO MediaOutputVolumes (VolumeValue) VALUES (79);
INSERT INTO MediaOutputVolumes (VolumeValue) VALUES (80);
INSERT INTO MediaOutputVolumes (VolumeValue) VALUES (81);
INSERT INTO MediaOutputVolumes (VolumeValue) VALUES (82);
INSERT INTO MediaOutputVolumes (VolumeValue) VALUES (83);
INSERT INTO MediaOutputVolumes (VolumeValue) VALUES (84);
INSERT INTO MediaOutputVolumes (VolumeValue) VALUES (85);
INSERT INTO MediaOutputVolumes (VolumeValue) VALUES (86);
INSERT INTO MediaOutputVolumes (VolumeValue) VALUES (87);
INSERT INTO MediaOutputVolumes (VolumeValue) VALUES (88);
INSERT INTO MediaOutputVolumes (VolumeValue) VALUES (89);
INSERT INTO MediaOutputVolumes (VolumeValue) VALUES (90);
INSERT INTO MediaOutputVolumes (VolumeValue) VALUES (91);
INSERT INTO MediaOutputVolumes (VolumeValue) VALUES (92);
INSERT INTO MediaOutputVolumes (VolumeValue) VALUES (93);
INSERT INTO MediaOutputVolumes (VolumeValue) VALUES (94);
INSERT INTO MediaOutputVolumes (VolumeValue) VALUES (95);
INSERT INTO MediaOutputVolumes (VolumeValue) VALUES (96);
INSERT INTO MediaOutputVolumes (VolumeValue) VALUES (97);
INSERT INTO MediaOutputVolumes (VolumeValue) VALUES (98);
INSERT INTO MediaOutputVolumes (VolumeValue) VALUES (99);
INSERT INTO MediaOutputVolumes (VolumeValue) VALUES (100);

INSERT INTO MediaOutputs (MediaWebserviceUrl) VALUES ('http://10.0.0.1/example.com/playservice_POST.svc');

INSERT INTO MediaActionTypes (ActionTypeOption) VALUES ('Play');
INSERT INTO MediaActionTypes (ActionTypeOption) VALUES ('Pause');
INSERT INTO MediaActionTypes (ActionTypeOption) VALUES ('Resume');
INSERT INTO MediaActionTypes (ActionTypeOption) VALUES ('SetVolume');
INSERT INTO MediaActionTypes (ActionTypeOption) VALUES ('Stop');


DROP procedure IF EXISTS RegisterPerformedTelldusAction;
DROP procedure IF EXISTS GetInsertedTelldusAction;
DROP procedure IF EXISTS GetRegisteredScheduler;
DROP procedure IF EXISTS RegisterTelldusAction_Scheduler;
DROP procedure IF EXISTS RegisterPerformedMediaAction;
DROP procedure IF EXISTS GetInsertedMediaAction;

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
	SET @TelldusUnit_Id = (SELECT Id FROM TelldusUnits WHERE Name = p_TelldusUnit_Name);

	/* get TelldusActionType_Id */
	SET @TelldusActionType_Id = (SELECT Id FROM TelldusActionTypes WHERE ActionTypeOption = p_TelldusActionType_ActionTypeOption);
	
	/* get TelldusActionValueType_Id */
	SET @TelldusActionValueType_Id = (SELECT Id FROM TelldusActionValueTypes WHERE Name = p_TelldusActionValueType_Name);
	
	/* get TelldusActionValue_Id */
	INSERT INTO TelldusActionValues(ActionValue, FK_TelldusActionValueType_Id) VALUES (p_TelldusActionValue_ActionValue, @TelldusActionValueType_Id) 
		ON DUPLICATE KEY UPDATE Id = LAST_INSERT_ID(Id);
	SET @TelldusActionValue_Id = LAST_INSERT_ID();
	
	
	/* get TelldusAction_Id */
	INSERT INTO TelldusActions ( Active, FK_TelldusActionType_Id, FK_TelldusActionValue_Id, FK_TelldusUnit_Id) VALUES (p_Active, @TelldusActionType_Id, @TelldusActionValue_Id, @TelldusUnit_Id) ON DUPLICATE KEY UPDATE Id = LAST_INSERT_ID(Id);
	
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
	CALL GetInsertedTelldusAction('1', p_TelldusUnit_Name,p_TelldusActionType_ActionTypeOption,p_TelldusActionValueType_Name,p_TelldusActionValue_ActionValue,@InsertedTelldusAction_Id);
	
	/* register performed TelldusAction */
	INSERT INTO TelldusActionsPerformed(PerformedTime, FK_TelldusAction_Id) VALUES (IFNULL(p_PerformedTelldusActionUnixTime, UNIX_TIMESTAMP()), @InsertedTelldusAction_Id);
	SET @LastTelldusActionPerformed_Id = LAST_INSERT_ID();
	
	SELECT LAST_INSERT_ID() INTO idOut ;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE GetRegisteredScheduler (
	IN p_Scheduler_Year		CHAR(4),
	IN p_Scheduler_Month	CHAR(2),
	IN p_Scheduler_Day		CHAR(2),	
	IN p_Scheduler_WeekDay	CHAR(2),	
	IN p_Scheduler_Hour		CHAR(2),
	IN p_Scheduler_Minute	CHAR(2),
	OUT idOut INT)
BEGIN
	/* Inserts a Scheduler (in Schedulers) and returns Id for the inserted row. If an identical Scheduler already is exists, its Id is returned. There are no optional parameters. Use empty strings. */
	
	INSERT INTO Schedulers(Year, Month, Day, WeekDay, Hour, Minute) VALUES (p_Scheduler_Year, p_Scheduler_Month, p_Scheduler_Day, p_Scheduler_WeekDay, p_Scheduler_Hour, p_Scheduler_Minute)ON DUPLICATE KEY UPDATE Id = LAST_INSERT_ID(Id);
	
	SELECT LAST_INSERT_ID() INTO idOut ;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE RegisterTelldusAction_Scheduler ( 
	IN p_TelldusAction_Active				BIT,
	IN p_TelldusUnit_Name 					VARCHAR(255),
	IN p_TelldusActionType_ActionTypeOption VARCHAR(255),
	IN p_TelldusActionValueType_Name 		VARCHAR(20),
	IN p_TelldusActionValue_ActionValue 	VARCHAR(255),
	IN p_Scheduler_Year						CHAR(4),
	IN p_Scheduler_Month					CHAR(2),
	IN p_Scheduler_Day						CHAR(2),	
	IN p_Scheduler_WeekDay					CHAR(2),	
	IN p_Scheduler_Hour						CHAR(2),
	IN p_Scheduler_Minute					CHAR(2),
	OUT idOut INT)
BEGIN
	/* Inserts a TelldusAction with Scheduler (in TelldusActions_Schedulers) and returns Id for the inserted row. If an identical TelldusActions_Schedulers already is exists, its Id is returned. */
	
	CALL GetRegisteredScheduler(p_Scheduler_Year, p_Scheduler_Month, p_Scheduler_Day, p_Scheduler_WeekDay, p_Scheduler_Hour, p_Scheduler_Minute, @Scheduler_Id);

	/* get TelldusActionType_Id */
	CALL GetInsertedTelldusAction(p_TelldusAction_Active, p_TelldusUnit_Name, p_TelldusActionType_ActionTypeOption, p_TelldusActionValueType_Name, p_TelldusActionValue_ActionValue, @TelldusAction_Id);
	
	
	INSERT INTO TelldusActions_Schedulers(FK_TelldusAction_Id, FK_Scheduler_Id) VALUES (@TelldusAction_Id, @Scheduler_Id) ON DUPLICATE KEY UPDATE Id = LAST_INSERT_ID(Id);	
	
	SELECT LAST_INSERT_ID() INTO idOut ;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE GetInsertedMediaAction ( 
	IN p_Active 					BIT,
	IN p_MediaSourceName 			VARCHAR(255),
	IN p_MediaOutputVolumeValue 	TINYINT,
	IN p_MediaOutputWebserviceUrl	VARCHAR(100),
	IN p_MediaActionTypeOption 		VARCHAR(255),
	OUT idOut						INT)
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
	IN p_PerformedMediaActionUnixTime 	INT,
	IN p_MediaSourceName 				VARCHAR(255),
	IN p_MediaOutputVolumeValue 		TINYINT,
	IN p_MediaOutputWebserviceUrl 		VARCHAR(100),
	IN p_MediaActionTypeOption 			VARCHAR(255),
	OUT idOut 							INT)
BEGIN
	CALL GetInsertedMediaAction('1', p_MediaSourceName, p_MediaOutputVolumeValue, p_MediaOutputWebserviceUrl, p_MediaActionTypeOption, @InsertedMediaAction_Id);
	
	/* register performed MediaAction */
	INSERT INTO MediaActionsPerformed(PerformedTime, FK_MediaAction_Id) VALUES (IFNULL(p_PerformedMediaActionUnixTime, UNIX_TIMESTAMP()), @InsertedMediaAction_Id);
	SET @LastMediaActionPerformed_Id = LAST_INSERT_ID();
	
	SELECT LAST_INSERT_ID() INTO idOut ;
END$$
DELIMITER ;
