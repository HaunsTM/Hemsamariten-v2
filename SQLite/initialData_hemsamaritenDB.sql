--TelldusUnitLocations
INSERT INTO `TelldusUnitLocations` (`Name`) VALUES ('*Ingen särskild plats*');
INSERT INTO `TelldusUnitLocations` (`Name`) VALUES ('Garage');
INSERT INTO `TelldusUnitLocations` (`Name`) VALUES ('Garage - tak');
INSERT INTO `TelldusUnitLocations` (`Name`) VALUES ('Garage - fasad');

INSERT INTO `TelldusUnitLocations` (`Name`) VALUES ('Parkering');

INSERT INTO `TelldusUnitLocations` (`Name`) VALUES ('Fågelmatare');
INSERT INTO `TelldusUnitLocations` (`Name`) VALUES ('Växthus');
INSERT INTO `TelldusUnitLocations` (`Name`) VALUES ('Trädgårdsland');

INSERT INTO `TelldusUnitLocations` (`Name`) VALUES ('Lekstuga');

INSERT INTO `TelldusUnitLocations` (`Name`) VALUES ('Hus - tak');
INSERT INTO `TelldusUnitLocations` (`Name`) VALUES ('Hus - fasad');
INSERT INTO `TelldusUnitLocations` (`Name`) VALUES ('Vind');
INSERT INTO `TelldusUnitLocations` (`Name`) VALUES ('Krypgrund');
INSERT INTO `TelldusUnitLocations` (`Name`) VALUES ('Kök');
INSERT INTO `TelldusUnitLocations` (`Name`) VALUES ('Grovkök');
INSERT INTO `TelldusUnitLocations` (`Name`) VALUES ('Korridor');
INSERT INTO `TelldusUnitLocations` (`Name`) VALUES ('Vardagsrum');
INSERT INTO `TelldusUnitLocations` (`Name`) VALUES ('Uterum');
INSERT INTO `TelldusUnitLocations` (`Name`) VALUES ('Gästtoalett');
INSERT INTO `TelldusUnitLocations` (`Name`) VALUES ('Städskrubb');
INSERT INTO `TelldusUnitLocations` (`Name`) VALUES ('Badrum');
INSERT INTO `TelldusUnitLocations` (`Name`) VALUES ('TV-rum');
INSERT INTO `TelldusUnitLocations` (`Name`) VALUES ('Atikas rum');
INSERT INTO `TelldusUnitLocations` (`Name`) VALUES ('Hans rum');
INSERT INTO `TelldusUnitLocations` (`Name`) VALUES ('Sovrum');

--TelldusUnitTypes
INSERT INTO `TelldusUnitTypes` (`Name`) VALUES ('433 MHz');
INSERT INTO `TelldusUnitTypes` (`Name`) VALUES ('Z-Wave');

--TelldusActionTypes
INSERT INTO `TelldusActionTypes` (`Option`) VALUES ('TurnOn');
INSERT INTO `TelldusActionTypes` (`Option`) VALUES ('TurnOff');
INSERT INTO `TelldusActionTypes` (`Option`) VALUES ('OnLevel');
INSERT INTO `TelldusActionTypes` (`Option`) VALUES ('GetEffect');
INSERT INTO `TelldusActionTypes` (`Option`) VALUES ('GetTemperature');
INSERT INTO `TelldusActionTypes` (`Option`) VALUES ('SetTemperature');
INSERT INTO `TelldusActionTypes` (`Option`) VALUES ('RefreshBearerToken');
INSERT INTO `TelldusActionTypes` (`Option`) VALUES ('GetSunriseTime');
INSERT INTO `TelldusActionTypes` (`Option`) VALUES ('GetSunsetTime');
INSERT INTO `TelldusActionTypes` (`Option`) VALUES ('GetLightLumen');


'TurnOn', 'TurnOff', 'OnLevel','GetEffect','GetTemperature', 'SetTemperature', 'RefreshBearerToken'

--TelldusUnits
INSERT INTO `TelldusUnits` (`Active`,`Name`,`FK_TelldusUnitType_Id`,`FK_TelldusUnitLocation_Id`,`LocationDesciption`) VALUES (1,'1',(SELECT `Id` FROM `TelldusUnitTypes` WHERE `Name` = '433 MHz'),(SELECT `Id` FROM `TelldusUnitLocations` WHERE `Name` = 'Vardagsrum'),'fönsterlampa');
INSERT INTO `TelldusUnits` (`Active`,`Name`,`FK_TelldusUnitType_Id`,`FK_TelldusUnitLocation_Id`,`LocationDesciption`) VALUES (1,'2',(SELECT `Id` FROM `TelldusUnitTypes` WHERE `Name` = '433 MHz'),(SELECT `Id` FROM `TelldusUnitLocations` WHERE `Name` = 'Vardagsrum'),'pianobelysning');
INSERT INTO `TelldusUnits` (`Active`,`Name`,`FK_TelldusUnitType_Id`,`FK_TelldusUnitLocation_Id`,`LocationDesciption`) VALUES (1,'3',(SELECT `Id` FROM `TelldusUnitTypes` WHERE `Name` = '433 MHz'),(SELECT `Id` FROM `TelldusUnitLocations` WHERE `Name` = 'Vardagsrum'),'golvlampa');
INSERT INTO `TelldusUnits` (`Active`,`Name`,`FK_TelldusUnitType_Id`,`FK_TelldusUnitLocation_Id`,`LocationDesciption`) VALUES (1,'4',(SELECT `Id` FROM `TelldusUnitTypes` WHERE `Name` = '433 MHz'),(SELECT `Id` FROM `TelldusUnitLocations` WHERE `Name` = 'Uterum'),'kulört dekorationsbelysning');
INSERT INTO `TelldusUnits` (`Active`,`Name`,`FK_TelldusUnitType_Id`,`FK_TelldusUnitLocation_Id`,`LocationDesciption`) VALUES (1,'5',(SELECT `Id` FROM `TelldusUnitTypes` WHERE `Name` = '433 MHz'),(SELECT `Id` FROM `TelldusUnitLocations` WHERE `Name` = 'Kök'),'fönsterlampor');

INSERT INTO `TelldusUnits` (`Active`,`Name`,`FK_TelldusUnitType_Id`,`FK_TelldusUnitLocation_Id`,`LocationDesciption`) VALUES (1,'6',(SELECT `Id` FROM `TelldusUnitTypes` WHERE `Name` = '433 MHz'),(SELECT `Id` FROM `TelldusUnitLocations` WHERE `Name` = 'TV-rum'),'belysning vid fågelmataren');
INSERT INTO `TelldusUnits` (`Active`,`Name`,`FK_TelldusUnitType_Id`,`FK_TelldusUnitLocation_Id`,`LocationDesciption`) VALUES (1,'7',(SELECT `Id` FROM `TelldusUnitTypes` WHERE `Name` = '433 MHz'),(SELECT `Id` FROM `TelldusUnitLocations` WHERE `Name` = 'TV-rum'),'golvlampa');
INSERT INTO `TelldusUnits` (`Active`,`Name`,`FK_TelldusUnitType_Id`,`FK_TelldusUnitLocation_Id`,`LocationDesciption`) VALUES (1,'8',(SELECT `Id` FROM `TelldusUnitTypes` WHERE `Name` = '433 MHz'),(SELECT `Id` FROM `TelldusUnitLocations` WHERE `Name` = 'TV-rum'),'subwoofer');
INSERT INTO `TelldusUnits` (`Active`,`Name`,`FK_TelldusUnitType_Id`,`FK_TelldusUnitLocation_Id`,`LocationDesciption`) VALUES (1,'9',(SELECT `Id` FROM `TelldusUnitTypes` WHERE `Name` = '433 MHz'),(SELECT `Id` FROM `TelldusUnitLocations` WHERE `Name` = 'TV-rum'),'liten lampa på byrå');
INSERT INTO `TelldusUnits` (`Active`,`Name`,`FK_TelldusUnitType_Id`,`FK_TelldusUnitLocation_Id`,`LocationDesciption`) VALUES (1,'10',(SELECT `Id` FROM `TelldusUnitTypes` WHERE `Name` = '433 MHz'),(SELECT `Id` FROM `TelldusUnitLocations` WHERE `Name` = 'Korridor'),'ljusglober utanför toalett');
INSERT INTO `TelldusUnits` (`Active`,`Name`,`FK_TelldusUnitType_Id`,`FK_TelldusUnitLocation_Id`,`LocationDesciption`) VALUES (1,'11',(SELECT `Id` FROM `TelldusUnitTypes` WHERE `Name` = '433 MHz'),(SELECT `Id` FROM `TelldusUnitLocations` WHERE `Name` = 'Korridor'),'spegelbordet utanför den lilla toaletten');
INSERT INTO `TelldusUnits` (`Active`,`Name`,`FK_TelldusUnitType_Id`,`FK_TelldusUnitLocation_Id`,`LocationDesciption`) VALUES (1,'12',(SELECT `Id` FROM `TelldusUnitTypes` WHERE `Name` = '433 MHz'),(SELECT `Id` FROM `TelldusUnitLocations` WHERE `Name` = 'Atikas rum'),'(ljusglober)');
INSERT INTO `TelldusUnits` (`Active`,`Name`,`FK_TelldusUnitType_Id`,`FK_TelldusUnitLocation_Id`,`LocationDesciption`) VALUES (1,'13',(SELECT `Id` FROM `TelldusUnitTypes` WHERE `Name` = '433 MHz'),(SELECT `Id` FROM `TelldusUnitLocations` WHERE `Name` = 'Atikas rum'),'fönsterkarm');
INSERT INTO `TelldusUnits` (`Active`,`Name`,`FK_TelldusUnitType_Id`,`FK_TelldusUnitLocation_Id`,`LocationDesciption`) VALUES (1,'14',(SELECT `Id` FROM `TelldusUnitTypes` WHERE `Name` = '433 MHz'),(SELECT `Id` FROM `TelldusUnitLocations` WHERE `Name` = 'Atikas rum'),'grön lampa');
INSERT INTO `TelldusUnits` (`Active`,`Name`,`FK_TelldusUnitType_Id`,`FK_TelldusUnitLocation_Id`,`LocationDesciption`) VALUES (1,'15',(SELECT `Id` FROM `TelldusUnitTypes` WHERE `Name` = '433 MHz'),(SELECT `Id` FROM `TelldusUnitLocations` WHERE `Name` = 'Hans rum'),'liten bokhylla närmast fönstret');

INSERT INTO `TelldusUnits` (`Active`,`Name`,`FK_TelldusUnitType_Id`,`FK_TelldusUnitLocation_Id`,`LocationDesciption`) VALUES (1,'16',(SELECT `Id` FROM `TelldusUnitTypes` WHERE `Name` = '433 MHz'),(SELECT `Id` FROM `TelldusUnitLocations` WHERE `Name` = 'Hans rum'),'vinkelbokhylla i hörnet');
INSERT INTO `TelldusUnits` (`Active`,`Name`,`FK_TelldusUnitType_Id`,`FK_TelldusUnitLocation_Id`,`LocationDesciption`) VALUES (1,'17',(SELECT `Id` FROM `TelldusUnitTypes` WHERE `Name` = '433 MHz'),(SELECT `Id` FROM `TelldusUnitLocations` WHERE `Name` = 'Hans rum'),'liten bordslampa');
INSERT INTO `TelldusUnits` (`Active`,`Name`,`FK_TelldusUnitType_Id`,`FK_TelldusUnitLocation_Id`,`LocationDesciption`) VALUES (1,'18',(SELECT `Id` FROM `TelldusUnitTypes` WHERE `Name` = '433 MHz'),(SELECT `Id` FROM `TelldusUnitLocations` WHERE `Name` = 'Vardagsrum'),'bokhyllebelysning');
INSERT INTO `TelldusUnits` (`Active`,`Name`,`FK_TelldusUnitType_Id`,`FK_TelldusUnitLocation_Id`,`LocationDesciption`) VALUES (1,'19',(SELECT `Id` FROM `TelldusUnitTypes` WHERE `Name` = '433 MHz'),(SELECT `Id` FROM `TelldusUnitLocations` WHERE `Name` = 'Vardagsrum'),'ljusorgel');
INSERT INTO `TelldusUnits` (`Active`,`Name`,`FK_TelldusUnitType_Id`,`FK_TelldusUnitLocation_Id`,`LocationDesciption`) VALUES (1,'20',(SELECT `Id` FROM `TelldusUnitTypes` WHERE `Name` = '433 MHz'),(SELECT `Id` FROM `TelldusUnitLocations` WHERE `Name` = 'Sovrum'),'fönsterkarmbelysning');

INSERT INTO `TelldusUnits` (`Active`,`Name`,`FK_TelldusUnitType_Id`,`FK_TelldusUnitLocation_Id`,`LocationDesciption`) VALUES (1,'21',(SELECT `Id` FROM `TelldusUnitTypes` WHERE `Name` = '433 MHz'),(SELECT `Id` FROM `TelldusUnitLocations` WHERE `Name` = 'TV-rum'),'lampa i fönsterkarm');
INSERT INTO `TelldusUnits` (`Active`,`Name`,`FK_TelldusUnitType_Id`,`FK_TelldusUnitLocation_Id`,`LocationDesciption`) VALUES (1,'22',(SELECT `Id` FROM `TelldusUnitTypes` WHERE `Name` = '433 MHz'),(SELECT `Id` FROM `TelldusUnitLocations` WHERE `Name` = '*Ingen särskild plats*'),'');
INSERT INTO `TelldusUnits` (`Active`,`Name`,`FK_TelldusUnitType_Id`,`FK_TelldusUnitLocation_Id`,`LocationDesciption`) VALUES (1,'23',(SELECT `Id` FROM `TelldusUnitTypes` WHERE `Name` = '433 MHz'),(SELECT `Id` FROM `TelldusUnitLocations` WHERE `Name` = 'Uterum'),'jordglob');
INSERT INTO `TelldusUnits` (`Active`,`Name`,`FK_TelldusUnitType_Id`,`FK_TelldusUnitLocation_Id`,`LocationDesciption`) VALUES (1,'24',(SELECT `Id` FROM `TelldusUnitTypes` WHERE `Name` = '433 MHz'),(SELECT `Id` FROM `TelldusUnitLocations` WHERE `Name` = '*Ingen särskild plats*'),'');
INSERT INTO `TelldusUnits` (`Active`,`Name`,`FK_TelldusUnitType_Id`,`FK_TelldusUnitLocation_Id`,`LocationDesciption`) VALUES (1,'25',(SELECT `Id` FROM `TelldusUnitTypes` WHERE `Name` = '433 MHz'),(SELECT `Id` FROM `TelldusUnitLocations` WHERE `Name` = '*Ingen särskild plats*'),'');
   
INSERT INTO `TelldusUnits` (`Active`,`Name`,`FK_TelldusUnitType_Id`,`FK_TelldusUnitLocation_Id`,`LocationDesciption`) VALUES (1,'A1',(SELECT `Id` FROM `TelldusUnitTypes` WHERE `Name` = 'Z-Wave'),(SELECT `Id` FROM `TelldusUnitLocations` WHERE `Name` = 'Hans rum'),'');
INSERT INTO `TelldusUnits` (`Active`,`Name`,`FK_TelldusUnitType_Id`,`FK_TelldusUnitLocation_Id`,`LocationDesciption`) VALUES (1,'B1',(SELECT `Id` FROM `TelldusUnitTypes` WHERE `Name` = 'Z-Wave'),(SELECT `Id` FROM `TelldusUnitLocations` WHERE `Name` = 'Sovrum'),'');
INSERT INTO `TelldusUnits` (`Active`,`Name`,`FK_TelldusUnitType_Id`,`FK_TelldusUnitLocation_Id`,`LocationDesciption`) VALUES (1,'C1',(SELECT `Id` FROM `TelldusUnitTypes` WHERE `Name` = 'Z-Wave'),(SELECT `Id` FROM `TelldusUnitLocations` WHERE `Name` = 'TV-rum'),'mitt i rummet');
INSERT INTO `TelldusUnits` (`Active`,`Name`,`FK_TelldusUnitType_Id`,`FK_TelldusUnitLocation_Id`,`LocationDesciption`) VALUES (1,'C2',(SELECT `Id` FROM `TelldusUnitTypes` WHERE `Name` = 'Z-Wave'),(SELECT `Id` FROM `TelldusUnitLocations` WHERE `Name` = 'TV-rum'),'vid sovrumsväggen');
INSERT INTO `TelldusUnits` (`Active`,`Name`,`FK_TelldusUnitType_Id`,`FK_TelldusUnitLocation_Id`,`LocationDesciption`) VALUES (1,'D1',(SELECT `Id` FROM `TelldusUnitTypes` WHERE `Name` = 'Z-Wave'),(SELECT `Id` FROM `TelldusUnitLocations` WHERE `Name` = 'Atikas rum'),'taket');
INSERT INTO `TelldusUnits` (`Active`,`Name`,`FK_TelldusUnitType_Id`,`FK_TelldusUnitLocation_Id`,`LocationDesciption`) VALUES (1,'E1',(SELECT `Id` FROM `TelldusUnitTypes` WHERE `Name` = 'Z-Wave'),(SELECT `Id` FROM `TelldusUnitLocations` WHERE `Name` = 'Korridor'),'vid badrum');
INSERT INTO `TelldusUnits` (`Active`,`Name`,`FK_TelldusUnitType_Id`,`FK_TelldusUnitLocation_Id`,`LocationDesciption`) VALUES (1,'F1',(SELECT `Id` FROM `TelldusUnitTypes` WHERE `Name` = 'Z-Wave'),(SELECT `Id` FROM `TelldusUnitLocations` WHERE `Name` = 'Korridor'),'entrebelysning');
INSERT INTO `TelldusUnits` (`Active`,`Name`,`FK_TelldusUnitType_Id`,`FK_TelldusUnitLocation_Id`,`LocationDesciption`) VALUES (1,'G1',(SELECT `Id` FROM `TelldusUnitTypes` WHERE `Name` = 'Z-Wave'),(SELECT `Id` FROM `TelldusUnitLocations` WHERE `Name` = 'Korridor'),'vid gästtoalett');
INSERT INTO `TelldusUnits` (`Active`,`Name`,`FK_TelldusUnitType_Id`,`FK_TelldusUnitLocation_Id`,`LocationDesciption`) VALUES (1,'H1',(SELECT `Id` FROM `TelldusUnitTypes` WHERE `Name` = 'Z-Wave'),(SELECT `Id` FROM `TelldusUnitLocations` WHERE `Name` = 'Vardagsrum'),'sydligaste taklampssektionen');
INSERT INTO `TelldusUnits` (`Active`,`Name`,`FK_TelldusUnitType_Id`,`FK_TelldusUnitLocation_Id`,`LocationDesciption`) VALUES (1,'H2',(SELECT `Id` FROM `TelldusUnitTypes` WHERE `Name` = 'Z-Wave'),(SELECT `Id` FROM `TelldusUnitLocations` WHERE `Name` = 'Vardagsrum'),'mellersta taklampssektionen');
INSERT INTO `TelldusUnits` (`Active`,`Name`,`FK_TelldusUnitType_Id`,`FK_TelldusUnitLocation_Id`,`LocationDesciption`) VALUES (1,'H3',(SELECT `Id` FROM `TelldusUnitTypes` WHERE `Name` = 'Z-Wave'),(SELECT `Id` FROM `TelldusUnitLocations` WHERE `Name` = 'Vardagsrum'),'nordligaste taklampssektionen');
INSERT INTO `TelldusUnits` (`Active`,`Name`,`FK_TelldusUnitType_Id`,`FK_TelldusUnitLocation_Id`,`LocationDesciption`) VALUES (1,'I1',(SELECT `Id` FROM `TelldusUnitTypes` WHERE `Name` = 'Z-Wave'),(SELECT `Id` FROM `TelldusUnitLocations` WHERE `Name` = 'Uterum'),'yttre belysning');
INSERT INTO `TelldusUnits` (`Active`,`Name`,`FK_TelldusUnitType_Id`,`FK_TelldusUnitLocation_Id`,`LocationDesciption`) VALUES (1,'I2',(SELECT `Id` FROM `TelldusUnitTypes` WHERE `Name` = 'Z-Wave'),(SELECT `Id` FROM `TelldusUnitLocations` WHERE `Name` = 'Uterum'),'inre belysning');
INSERT INTO `TelldusUnits` (`Active`,`Name`,`FK_TelldusUnitType_Id`,`FK_TelldusUnitLocation_Id`,`LocationDesciption`) VALUES (1,'J1',(SELECT `Id` FROM `TelldusUnitTypes` WHERE `Name` = 'Z-Wave'),(SELECT `Id` FROM `TelldusUnitLocations` WHERE `Name` = 'Kök'),'matbordsbelysning');
INSERT INTO `TelldusUnits` (`Active`,`Name`,`FK_TelldusUnitType_Id`,`FK_TelldusUnitLocation_Id`,`LocationDesciption`) VALUES (1,'J2',(SELECT `Id` FROM `TelldusUnitTypes` WHERE `Name` = 'Z-Wave'),(SELECT `Id` FROM `TelldusUnitLocations` WHERE `Name` = 'Kök'),'vask');
INSERT INTO `TelldusUnits` (`Active`,`Name`,`FK_TelldusUnitType_Id`,`FK_TelldusUnitLocation_Id`,`LocationDesciption`) VALUES (1,'J3',(SELECT `Id` FROM `TelldusUnitTypes` WHERE `Name` = 'Z-Wave'),(SELECT `Id` FROM `TelldusUnitLocations` WHERE `Name` = 'Kök'),'yttre skåpbelysning');
INSERT INTO `TelldusUnits` (`Active`,`Name`,`FK_TelldusUnitType_Id`,`FK_TelldusUnitLocation_Id`,`LocationDesciption`) VALUES (1,'K1',(SELECT `Id` FROM `TelldusUnitTypes` WHERE `Name` = 'Z-Wave'),(SELECT `Id` FROM `TelldusUnitLocations` WHERE `Name` = 'Grovkök'),'');
INSERT INTO `TelldusUnits` (`Active`,`Name`,`FK_TelldusUnitType_Id`,`FK_TelldusUnitLocation_Id`,`LocationDesciption`) VALUES (1,'L1',(SELECT `Id` FROM `TelldusUnitTypes` WHERE `Name` = 'Z-Wave'),(SELECT `Id` FROM `TelldusUnitLocations` WHERE `Name` = 'Grovkök'),'ingång (entrebelysning)');


--Countries
INSERT INTO `Countries` (`Name`,`Code`,`ISOAlpha2`,`ISOAlpha3`) VALUES ('Algeriet', '213', 'DZ', 'DZA');
INSERT INTO `Countries` (`Name`,`Code`,`ISOAlpha2`,`ISOAlpha3`) VALUES ('Danmark', '45', 'DK', 'DNK');
INSERT INTO `Countries` (`Name`,`Code`,`ISOAlpha2`,`ISOAlpha3`) VALUES ('Finland', '358', 'FI', 'FIN');
INSERT INTO `Countries` (`Name`,`Code`,`ISOAlpha2`,`ISOAlpha3`) VALUES ('England', '44', 'GB', 'GBR');
INSERT INTO `Countries` (`Name`,`Code`,`ISOAlpha2`,`ISOAlpha3`) VALUES ('Norge', '47', 'NO', 'NOR');
INSERT INTO `Countries` (`Name`,`Code`,`ISOAlpha2`,`ISOAlpha3`) VALUES ('Sverige', '46', 'SE', 'SWE');
INSERT INTO `Countries` (`Name`,`Code`,`ISOAlpha2`,`ISOAlpha3`) VALUES ('USA', '1', 'US', 'USA');

--MediaSources
INSERT INTO `MediaSources` (`Name`,`Url`,`MediaCategoryType`,`FK_Country_Id`) VALUES ('SR P1','http://sverigesradio.se/topsy/direkt/132-hi-aac.m3u','InternetStreamRadio',(SELECT `Id` FROM `Countries` WHERE `Name` = 'Sverige'));
INSERT INTO `MediaSources` (`Name`,`Url`,`MediaCategoryType`,`FK_Country_Id`) VALUES ('SR P2','http://sverigesradio.se/topsy/direkt/2562-hi-aac.m3u','InternetStreamRadio',(SELECT `Id` FROM `Countries` WHERE `Name` = 'Sverige'));
INSERT INTO `MediaSources` (`Name`,`Url`,`MediaCategoryType`,`FK_Country_Id`) VALUES ('SR P3','http://sverigesradio.se/topsy/direkt/164-hi-aac.m3u','InternetStreamRadio',(SELECT `Id` FROM `Countries` WHERE `Name` = 'Sverige'));
INSERT INTO `MediaSources` (`Name`,`Url`,`MediaCategoryType`,`FK_Country_Id`) VALUES ('SR Ekot sänder direkt','http://sverigesradio.se/topsy/direkt/4540-hi-aac.m3u','InternetStreamRadio',(SELECT `Id` FROM `Countries` WHERE `Name` = 'Sverige'));
INSERT INTO `MediaSources` (`Name`,`Url`,`MediaCategoryType`,`FK_Country_Id`) VALUES ('SR P4 Plus','http://sverigesradio.se/topsy/direkt/4951-hi-aac.m3u','InternetStreamRadio',(SELECT `Id` FROM `Countries` WHERE `Name` = 'Sverige'));
INSERT INTO `MediaSources` (`Name`,`Url`,`MediaCategoryType`,`FK_Country_Id`) VALUES ('SR P4 Blekinge','http://sverigesradio.se/topsy/direkt/213-hi-aac.m3u','InternetStreamRadio',(SELECT `Id` FROM `Countries` WHERE `Name` = 'Sverige'));
INSERT INTO `MediaSources` (`Name`,`Url`,`MediaCategoryType`,`FK_Country_Id`) VALUES ('SR P4 Dalarna','http://sverigesradio.se/topsy/direkt/223-hi-aac.m3u','InternetStreamRadio',(SELECT `Id` FROM `Countries` WHERE `Name` = 'Sverige'));
INSERT INTO `MediaSources` (`Name`,`Url`,`MediaCategoryType`,`FK_Country_Id`) VALUES ('SR P4 Gotland','http://sverigesradio.se/topsy/direkt/205-hi-aac.m3u','InternetStreamRadio',(SELECT `Id` FROM `Countries` WHERE `Name` = 'Sverige'));
INSERT INTO `MediaSources` (`Name`,`Url`,`MediaCategoryType`,`FK_Country_Id`) VALUES ('SR P4 Gävleborg','http://sverigesradio.se/topsy/direkt/210-hi-aac.m3u','InternetStreamRadio',(SELECT `Id` FROM `Countries` WHERE `Name` = 'Sverige'));
INSERT INTO `MediaSources` (`Name`,`Url`,`MediaCategoryType`,`FK_Country_Id`) VALUES ('SR P4 Göteborg','http://sverigesradio.se/topsy/direkt/212-hi-aac.m3u','InternetStreamRadio',(SELECT `Id` FROM `Countries` WHERE `Name` = 'Sverige'));
INSERT INTO `MediaSources` (`Name`,`Url`,`MediaCategoryType`,`FK_Country_Id`) VALUES ('SR P4 Halland','http://sverigesradio.se/topsy/direkt/220-hi-aac.m3u','InternetStreamRadio',(SELECT `Id` FROM `Countries` WHERE `Name` = 'Sverige'));
INSERT INTO `MediaSources` (`Name`,`Url`,`MediaCategoryType`,`FK_Country_Id`) VALUES ('SR P4 Jämtland','http://sverigesradio.se/topsy/direkt/200-hi-aac.m3u','InternetStreamRadio',(SELECT `Id` FROM `Countries` WHERE `Name` = 'Sverige'));
INSERT INTO `MediaSources` (`Name`,`Url`,`MediaCategoryType`,`FK_Country_Id`) VALUES ('SR P4 Jönköping','http://sverigesradio.se/topsy/direkt/203-hi-aac.m3u','InternetStreamRadio',(SELECT `Id` FROM `Countries` WHERE `Name` = 'Sverige'));
INSERT INTO `MediaSources` (`Name`,`Url`,`MediaCategoryType`,`FK_Country_Id`) VALUES ('SR P4 Kalmar','http://sverigesradio.se/topsy/direkt/201-hi-aac.m3u','InternetStreamRadio',(SELECT `Id` FROM `Countries` WHERE `Name` = 'Sverige'));
INSERT INTO `MediaSources` (`Name`,`Url`,`MediaCategoryType`,`FK_Country_Id`) VALUES ('SR P4 Kristianstad','http://sverigesradio.se/topsy/direkt/211-hi-aac.m3u','InternetStreamRadio',(SELECT `Id` FROM `Countries` WHERE `Name` = 'Sverige'));
INSERT INTO `MediaSources` (`Name`,`Url`,`MediaCategoryType`,`FK_Country_Id`) VALUES ('SR P4 Kronoberg','http://sverigesradio.se/topsy/direkt/214-hi-aac.m3u','InternetStreamRadio',(SELECT `Id` FROM `Countries` WHERE `Name` = 'Sverige'));
INSERT INTO `MediaSources` (`Name`,`Url`,`MediaCategoryType`,`FK_Country_Id`) VALUES ('SR P4 Malmöhus','http://sverigesradio.se/topsy/direkt/207-hi-aac.m3u','InternetStreamRadio',(SELECT `Id` FROM `Countries` WHERE `Name` = 'Sverige'));
INSERT INTO `MediaSources` (`Name`,`Url`,`MediaCategoryType`,`FK_Country_Id`) VALUES ('SR P4 Norrbotten','http://sverigesradio.se/topsy/direkt/209-hi-aac.m3u','InternetStreamRadio',(SELECT `Id` FROM `Countries` WHERE `Name` = 'Sverige'));
INSERT INTO `MediaSources` (`Name`,`Url`,`MediaCategoryType`,`FK_Country_Id`) VALUES ('SR P4 Sjuhärad','http://sverigesradio.se/topsy/direkt/206-hi-aac.m3u','InternetStreamRadio',(SELECT `Id` FROM `Countries` WHERE `Name` = 'Sverige'));
INSERT INTO `MediaSources` (`Name`,`Url`,`MediaCategoryType`,`FK_Country_Id`) VALUES ('SR P4 Skaraborg','http://sverigesradio.se/topsy/direkt/208-hi-aac.m3u','InternetStreamRadio',(SELECT `Id` FROM `Countries` WHERE `Name` = 'Sverige'));
INSERT INTO `MediaSources` (`Name`,`Url`,`MediaCategoryType`,`FK_Country_Id`) VALUES ('SR P4 Stockholm','http://sverigesradio.se/topsy/direkt/701-hi-aac.m3u','InternetStreamRadio',(SELECT `Id` FROM `Countries` WHERE `Name` = 'Sverige'));
INSERT INTO `MediaSources` (`Name`,`Url`,`MediaCategoryType`,`FK_Country_Id`) VALUES ('SR P4 Sörmland','http://sverigesradio.se/topsy/direkt/202-hi-aac.m3u','InternetStreamRadio',(SELECT `Id` FROM `Countries` WHERE `Name` = 'Sverige'));
INSERT INTO `MediaSources` (`Name`,`Url`,`MediaCategoryType`,`FK_Country_Id`) VALUES ('SR P4 Uppland','http://sverigesradio.se/topsy/direkt/218-hi-aac.m3u','InternetStreamRadio',(SELECT `Id` FROM `Countries` WHERE `Name` = 'Sverige'));
INSERT INTO `MediaSources` (`Name`,`Url`,`MediaCategoryType`,`FK_Country_Id`) VALUES ('SR P4 Värmland','http://sverigesradio.se/topsy/direkt/204-hi-aac.m3u','InternetStreamRadio',(SELECT `Id` FROM `Countries` WHERE `Name` = 'Sverige'));
INSERT INTO `MediaSources` (`Name`,`Url`,`MediaCategoryType`,`FK_Country_Id`) VALUES ('SR P4 Väst','http://sverigesradio.se/topsy/direkt/219-hi-aac.m3u','InternetStreamRadio',(SELECT `Id` FROM `Countries` WHERE `Name` = 'Sverige'));
INSERT INTO `MediaSources` (`Name`,`Url`,`MediaCategoryType`,`FK_Country_Id`) VALUES ('SR P4 Västerbotten','http://sverigesradio.se/topsy/direkt/215-hi-aac.m3u','InternetStreamRadio',(SELECT `Id` FROM `Countries` WHERE `Name` = 'Sverige'));
INSERT INTO `MediaSources` (`Name`,`Url`,`MediaCategoryType`,`FK_Country_Id`) VALUES ('SR P4 Västernorrland','http://sverigesradio.se/topsy/direkt/216-hi-aac.m3u','InternetStreamRadio',(SELECT `Id` FROM `Countries` WHERE `Name` = 'Sverige'));
INSERT INTO `MediaSources` (`Name`,`Url`,`MediaCategoryType`,`FK_Country_Id`) VALUES ('SR P4 Västmanland','http://sverigesradio.se/topsy/direkt/217-hi-aac.m3u','InternetStreamRadio',(SELECT `Id` FROM `Countries` WHERE `Name` = 'Sverige'));
INSERT INTO `MediaSources` (`Name`,`Url`,`MediaCategoryType`,`FK_Country_Id`) VALUES ('SR P4 Örebro','http://sverigesradio.se/topsy/direkt/221-hi-aac.m3u','InternetStreamRadio',(SELECT `Id` FROM `Countries` WHERE `Name` = 'Sverige'));
INSERT INTO `MediaSources` (`Name`,`Url`,`MediaCategoryType`,`FK_Country_Id`) VALUES ('SR P4 Östergötland','http://sverigesradio.se/topsy/direkt/222-hi-aac.m3u','InternetStreamRadio',(SELECT `Id` FROM `Countries` WHERE `Name` = 'Sverige'));
INSERT INTO `MediaSources` (`Name`,`Url`,`MediaCategoryType`,`FK_Country_Id`) VALUES ('SR P3 Din gata','http://sverigesradio.se/topsy/direkt/2576-hi-aac.m3u','InternetStreamRadio',(SELECT `Id` FROM `Countries` WHERE `Name` = 'Sverige'));
INSERT INTO `MediaSources` (`Name`,`Url`,`MediaCategoryType`,`FK_Country_Id`) VALUES ('SR P5 Sthlm','http://sverigesradio.se/topsy/direkt/2842-hi-aac.m3u','InternetStreamRadio',(SELECT `Id` FROM `Countries` WHERE `Name` = 'Sverige'));
INSERT INTO `MediaSources` (`Name`,`Url`,`MediaCategoryType`,`FK_Country_Id`) VALUES ('SR P2 Språk och musik','http://sverigesradio.se/topsy/direkt/163-hi-aac.m3u','InternetStreamRadio',(SELECT `Id` FROM `Countries` WHERE `Name` = 'Sverige'));
INSERT INTO `MediaSources` (`Name`,`Url`,`MediaCategoryType`,`FK_Country_Id`) VALUES ('SR P6','http://sverigesradio.se/topsy/direkt/166-hi-aac.m3u','InternetStreamRadio',(SELECT `Id` FROM `Countries` WHERE `Name` = 'Sverige'));
INSERT INTO `MediaSources` (`Name`,`Url`,`MediaCategoryType`,`FK_Country_Id`) VALUES ('SR P3 Star','http://sverigesradio.se/topsy/direkt/1607-hi-aac.m3u','InternetStreamRadio',(SELECT `Id` FROM `Countries` WHERE `Name` = 'Sverige'));
INSERT INTO `MediaSources` (`Name`,`Url`,`MediaCategoryType`,`FK_Country_Id`) VALUES ('SR Radioapans knattekanal','http://sverigesradio.se/topsy/direkt/2755-hi-aac.m3u','InternetStreamRadio',(SELECT `Id` FROM `Countries` WHERE `Name` = 'Sverige'));
INSERT INTO `MediaSources` (`Name`,`Url`,`MediaCategoryType`,`FK_Country_Id`) VALUES ('SR P2 Klassiskt','http://sverigesradio.se/topsy/direkt/1603-hi-aac.m3u','InternetStreamRadio',(SELECT `Id` FROM `Countries` WHERE `Name` = 'Sverige'));
INSERT INTO `MediaSources` (`Name`,`Url`,`MediaCategoryType`,`FK_Country_Id`) VALUES ('SR Sápmi','http://sverigesradio.se/topsy/direkt/224-hi-aac.m3u','InternetStreamRadio',(SELECT `Id` FROM `Countries` WHERE `Name` = 'Sverige'));
INSERT INTO `MediaSources` (`Name`,`Url`,`MediaCategoryType`,`FK_Country_Id`) VALUES ('SR Sisuradio','http://sverigesradio.se/topsy/direkt/226-hi-aac.m3u','InternetStreamRadio',(SELECT `Id` FROM `Countries` WHERE `Name` = 'Sverige'));
INSERT INTO `MediaSources` (`Name`,`Url`,`MediaCategoryType`,`FK_Country_Id`) VALUES ('SR P2 Världen','http://sverigesradio.se/topsy/direkt/2619-hi-aac.m3u','InternetStreamRadio',(SELECT `Id` FROM `Countries` WHERE `Name` = 'Sverige'));
INSERT INTO `MediaSources` (`Name`,`Url`,`MediaCategoryType`,`FK_Country_Id`) VALUES ('SR Extra 01','http://sverigesradio.se/topsy/direkt/2383-hi-aac.m3u','InternetStreamRadio',(SELECT `Id` FROM `Countries` WHERE `Name` = 'Sverige'));
INSERT INTO `MediaSources` (`Name`,`Url`,`MediaCategoryType`,`FK_Country_Id`) VALUES ('SR Extra 02','http://sverigesradio.se/topsy/direkt/2384-hi-aac.m3u','InternetStreamRadio',(SELECT `Id` FROM `Countries` WHERE `Name` = 'Sverige'));
INSERT INTO `MediaSources` (`Name`,`Url`,`MediaCategoryType`,`FK_Country_Id`) VALUES ('SR Extra 03','http://sverigesradio.se/topsy/direkt/2385-hi-aac.m3u','InternetStreamRadio',(SELECT `Id` FROM `Countries` WHERE `Name` = 'Sverige'));
INSERT INTO `MediaSources` (`Name`,`Url`,`MediaCategoryType`,`FK_Country_Id`) VALUES ('SR Extra 04','http://sverigesradio.se/topsy/direkt/2386-hi-aac.m3u','InternetStreamRadio',(SELECT `Id` FROM `Countries` WHERE `Name` = 'Sverige'));
INSERT INTO `MediaSources` (`Name`,`Url`,`MediaCategoryType`,`FK_Country_Id`) VALUES ('SR Extra 05','http://sverigesradio.se/topsy/direkt/2387-hi-aac.m3u','InternetStreamRadio',(SELECT `Id` FROM `Countries` WHERE `Name` = 'Sverige'));
INSERT INTO `MediaSources` (`Name`,`Url`,`MediaCategoryType`,`FK_Country_Id`) VALUES ('SR Extra 06','http://sverigesradio.se/topsy/direkt/2388-hi-aac.m3u','InternetStreamRadio',(SELECT `Id` FROM `Countries` WHERE `Name` = 'Sverige'));
INSERT INTO `MediaSources` (`Name`,`Url`,`MediaCategoryType`,`FK_Country_Id`) VALUES ('SR Extra 07','http://sverigesradio.se/topsy/direkt/2389-hi-aac.m3u','InternetStreamRadio',(SELECT `Id` FROM `Countries` WHERE `Name` = 'Sverige'));
INSERT INTO `MediaSources` (`Name`,`Url`,`MediaCategoryType`,`FK_Country_Id`) VALUES ('SR Extra 08','http://sverigesradio.se/topsy/direkt/2390-hi-aac.m3u','InternetStreamRadio',(SELECT `Id` FROM `Countries` WHERE `Name` = 'Sverige'));
INSERT INTO `MediaSources` (`Name`,`Url`,`MediaCategoryType`,`FK_Country_Id`) VALUES ('SR Extra 09','http://sverigesradio.se/topsy/direkt/3268-hi-aac.m3u','InternetStreamRadio',(SELECT `Id` FROM `Countries` WHERE `Name` = 'Sverige'));
INSERT INTO `MediaSources` (`Name`,`Url`,`MediaCategoryType`,`FK_Country_Id`) VALUES ('SR Extra 10','http://sverigesradio.se/topsy/direkt/3269-hi-aac.m3u','InternetStreamRadio',(SELECT `Id` FROM `Countries` WHERE `Name` = 'Sverige'));
INSERT INTO `MediaSources` (`Name`,`Url`,`MediaCategoryType`,`FK_Country_Id`) VALUES ('SR P2 Klassisk Jul','http://sverigesradio.se/topsy/direkt/3036-hi-aac.m3u','InternetStreamRadio',(SELECT `Id` FROM `Countries` WHERE `Name` = 'Sverige'));
INSERT INTO `MediaSources` (`Name`,`Url`,`MediaCategoryType`,`FK_Country_Id`) VALUES ('SR P4 Bjällerklang','http://sverigesradio.se/topsy/direkt/3034-hi-aac.m3u','InternetStreamRadio',(SELECT `Id` FROM `Countries` WHERE `Name` = 'Sverige'));

INSERT INTO `MediaSources` (`Name`,`Url`,`MediaCategoryType`,`FK_Country_Id`) VALUES ('Malmökanalen', 'http://stream.nsp.se:8000/MNR89_MP3_Lo','InternetStreamRadio',(SELECT `Id` FROM `Countries` WHERE `Name` = 'Sverige'));
INSERT INTO `MediaSources` (`Name`,`Url`,`MediaCategoryType`,`FK_Country_Id`) VALUES ('Radio Malmökanalen', 'http://stream.nsp.se:8000/MNR90_MP3_Lo','InternetStreamRadio',(SELECT `Id` FROM `Countries` WHERE `Name` = 'Sverige'));
INSERT INTO `MediaSources` (`Name`,`Url`,`MediaCategoryType`,`FK_Country_Id`) VALUES ('Radio AF', 'http://live.radioaf.se:8000/;stream/1','InternetStreamRadio',(SELECT `Id` FROM `Countries` WHERE `Name` = 'Sverige'));

INSERT INTO `MediaSources` (`Name`,`Url`,`MediaCategoryType`,`FK_Country_Id`) VALUES ('DR P1', 'http://live-icy.gss.dr.dk/A/A03H.mp3.m3u','InternetStreamRadio',(SELECT `Id` FROM `Countries` WHERE `Name` = 'Danmark'));
INSERT INTO `MediaSources` (`Name`,`Url`,`MediaCategoryType`,`FK_Country_Id`) VALUES ('DR P2', 'http://live-icy.gss.dr.dk/A/A04H.mp3.m3u','InternetStreamRadio',(SELECT `Id` FROM `Countries` WHERE `Name` = 'Danmark'));
INSERT INTO `MediaSources` (`Name`,`Url`,`MediaCategoryType`,`FK_Country_Id`) VALUES ('DR P3', 'http://live-icy.gss.dr.dk/A/A05H.mp3.m3u','InternetStreamRadio',(SELECT `Id` FROM `Countries` WHERE `Name` = 'Danmark'));
INSERT INTO `MediaSources` (`Name`,`Url`,`MediaCategoryType`,`FK_Country_Id`) VALUES ('DR P4 Bornholm', 'http://live-icy.gss.dr.dk/A/A06H.mp3.m3u','InternetStreamRadio',(SELECT `Id` FROM `Countries` WHERE `Name` = 'Danmark'));
INSERT INTO `MediaSources` (`Name`,`Url`,`MediaCategoryType`,`FK_Country_Id`) VALUES ('DR P4 Esbjerg', 'http://live-icy.gss.dr.dk/A/A15H.mp3.m3u','InternetStreamRadio',(SELECT `Id` FROM `Countries` WHERE `Name` = 'Danmark'));
INSERT INTO `MediaSources` (`Name`,`Url`,`MediaCategoryType`,`FK_Country_Id`) VALUES ('DR P4 Fyn', 'http://live-icy.gss.dr.dk/A/A07H.mp3.m3u','InternetStreamRadio',(SELECT `Id` FROM `Countries` WHERE `Name` = 'Danmark'));
INSERT INTO `MediaSources` (`Name`,`Url`,`MediaCategoryType`,`FK_Country_Id`) VALUES ('DR P4 København', 'http://live-icy.gss.dr.dk/A/A08H.mp3.m3u','InternetStreamRadio',(SELECT `Id` FROM `Countries` WHERE `Name` = 'Danmark'));
INSERT INTO `MediaSources` (`Name`,`Url`,`MediaCategoryType`,`FK_Country_Id`) VALUES ('DR P4 Midt & Vest', 'http://live-icy.gss.dr.dk/A/A09H.mp3.m3u','InternetStreamRadio',(SELECT `Id` FROM `Countries` WHERE `Name` = 'Danmark'));
INSERT INTO `MediaSources` (`Name`,`Url`,`MediaCategoryType`,`FK_Country_Id`) VALUES ('DR P4 Nordjylland', 'http://live-icy.gss.dr.dk/A/A10H.mp3.m3u','InternetStreamRadio',(SELECT `Id` FROM `Countries` WHERE `Name` = 'Danmark'));
INSERT INTO `MediaSources` (`Name`,`Url`,`MediaCategoryType`,`FK_Country_Id`) VALUES ('DR P4 Sjælland', 'http://live-icy.gss.dr.dk/A/A11H.mp3.m3u','InternetStreamRadio',(SELECT `Id` FROM `Countries` WHERE `Name` = 'Danmark'));
INSERT INTO `MediaSources` (`Name`,`Url`,`MediaCategoryType`,`FK_Country_Id`) VALUES ('DR P4 Syd', 'http://live-icy.gss.dr.dk/A/A12H.mp3.m3u','InternetStreamRadio',(SELECT `Id` FROM `Countries` WHERE `Name` = 'Danmark'));
INSERT INTO `MediaSources` (`Name`,`Url`,`MediaCategoryType`,`FK_Country_Id`) VALUES ('DR P4 Trekanten', 'http://live-icy.gss.dr.dk/A/A13H.mp3.m3u','InternetStreamRadio',(SELECT `Id` FROM `Countries` WHERE `Name` = 'Danmark'));
INSERT INTO `MediaSources` (`Name`,`Url`,`MediaCategoryType`,`FK_Country_Id`) VALUES ('DR P4 Østjyllands Radio', 'http://live-icy.gss.dr.dk/A/A14H.mp3.m3u','InternetStreamRadio',(SELECT `Id` FROM `Countries` WHERE `Name` = 'Danmark'));
INSERT INTO `MediaSources` (`Name`,`Url`,`MediaCategoryType`,`FK_Country_Id`) VALUES ('DR P5', 'http://live-icy.gss.dr.dk/A/A25L.mp3.m3u','InternetStreamRadio',(SELECT `Id` FROM `Countries` WHERE `Name` = 'Danmark'));
INSERT INTO `MediaSources` (`Name`,`Url`,`MediaCategoryType`,`FK_Country_Id`) VALUES ('DR P6 BEAT', 'http://live-icy.gss.dr.dk/A/A29H.mp3.m3u','InternetStreamRadio',(SELECT `Id` FROM `Countries` WHERE `Name` = 'Danmark'));

INSERT INTO `MediaSources` (`Name`,`Url`,`MediaCategoryType`,`FK_Country_Id`) VALUES ('NRK P1','http://lyd.nrk.no/nrk_radio_p1_ostlandssendingen_mp3_h','InternetStreamRadio',(SELECT `Id` FROM `Countries` WHERE `Name` = 'Norge'));
INSERT INTO `MediaSources` (`Name`,`Url`,`MediaCategoryType`,`FK_Country_Id`) VALUES ('NRK P1 Buskerud','http://lyd.nrk.no/nrk_radio_p1_buskerud_mp3_h','InternetStreamRadio',(SELECT `Id` FROM `Countries` WHERE `Name` = 'Norge'));
INSERT INTO `MediaSources` (`Name`,`Url`,`MediaCategoryType`,`FK_Country_Id`) VALUES ('NRK P1 Finnmark','http://lyd.nrk.no/nrk_radio_p1_finnmark_mp3_h','InternetStreamRadio',(SELECT `Id` FROM `Countries` WHERE `Name` = 'Norge'));
INSERT INTO `MediaSources` (`Name`,`Url`,`MediaCategoryType`,`FK_Country_Id`) VALUES ('NRK P1 Hedmark og Oppland','http://lyd.nrk.no/nrk_radio_p1_hedmark_og_oppland_mp3_h','InternetStreamRadio',(SELECT `Id` FROM `Countries` WHERE `Name` = 'Norge'));
INSERT INTO `MediaSources` (`Name`,`Url`,`MediaCategoryType`,`FK_Country_Id`) VALUES ('NRK P1 Hordaland','http://lyd.nrk.no/nrk_radio_p1_hordaland_mp3_h','InternetStreamRadio',(SELECT `Id` FROM `Countries` WHERE `Name` = 'Norge'));
INSERT INTO `MediaSources` (`Name`,`Url`,`MediaCategoryType`,`FK_Country_Id`) VALUES ('NRK P1 Møre og Romsdal','http://lyd.nrk.no/nrk_radio_p1_more_og_romsdal_mp3_h','InternetStreamRadio',(SELECT `Id` FROM `Countries` WHERE `Name` = 'Norge'));
INSERT INTO `MediaSources` (`Name`,`Url`,`MediaCategoryType`,`FK_Country_Id`) VALUES ('NRK P1 Nordland','http://lyd.nrk.no/nrk_radio_p1_nordland_mp3_h','InternetStreamRadio',(SELECT `Id` FROM `Countries` WHERE `Name` = 'Norge'));
INSERT INTO `MediaSources` (`Name`,`Url`,`MediaCategoryType`,`FK_Country_Id`) VALUES ('NRK P1 Rogaland','http://lyd.nrk.no/nrk_radio_p1_rogaland_mp3_h','InternetStreamRadio',(SELECT `Id` FROM `Countries` WHERE `Name` = 'Norge'));
INSERT INTO `MediaSources` (`Name`,`Url`,`MediaCategoryType`,`FK_Country_Id`) VALUES ('NRK P1 Sogn og Fjordane','http://lyd.nrk.no/nrk_radio_p1_sogn_og_fjordane_mp3_h','InternetStreamRadio',(SELECT `Id` FROM `Countries` WHERE `Name` = 'Norge'));
INSERT INTO `MediaSources` (`Name`,`Url`,`MediaCategoryType`,`FK_Country_Id`) VALUES ('NRK P1 Sogn og Fjordane MP3 (høy)','http://lyd.nrk.no/nrk_radio_p1_sogn_og_fjordane_mp3_h','InternetStreamRadio',(SELECT `Id` FROM `Countries` WHERE `Name` = 'Norge'));
INSERT INTO `MediaSources` (`Name`,`Url`,`MediaCategoryType`,`FK_Country_Id`) VALUES ('NRK P1 Sørlandet','http://lyd.nrk.no/nrk_radio_p1_sorlandet_mp3_h','InternetStreamRadio',(SELECT `Id` FROM `Countries` WHERE `Name` = 'Norge'));
INSERT INTO `MediaSources` (`Name`,`Url`,`MediaCategoryType`,`FK_Country_Id`) VALUES ('NRK P1 Telemark','http://lyd.nrk.no/nrk_radio_p1_telemark_mp3_h','InternetStreamRadio',(SELECT `Id` FROM `Countries` WHERE `Name` = 'Norge'));
INSERT INTO `MediaSources` (`Name`,`Url`,`MediaCategoryType`,`FK_Country_Id`) VALUES ('NRK P1 Troms','http://lyd.nrk.no/nrk_radio_p1_troms_mp3_h','InternetStreamRadio',(SELECT `Id` FROM `Countries` WHERE `Name` = 'Norge'));
INSERT INTO `MediaSources` (`Name`,`Url`,`MediaCategoryType`,`FK_Country_Id`) VALUES ('NRK P1 Trøndelag','http://lyd.nrk.no/nrk_radio_p1_trondelag_mp3_h','InternetStreamRadio',(SELECT `Id` FROM `Countries` WHERE `Name` = 'Norge'));
INSERT INTO `MediaSources` (`Name`,`Url`,`MediaCategoryType`,`FK_Country_Id`) VALUES ('NRK P1 Vestfold','http://lyd.nrk.no/nrk_radio_p1_vestfold_mp3_h','InternetStreamRadio',(SELECT `Id` FROM `Countries` WHERE `Name` = 'Norge'));
INSERT INTO `MediaSources` (`Name`,`Url`,`MediaCategoryType`,`FK_Country_Id`) VALUES ('NRK P1 Østfold','http://lyd.nrk.no/nrk_radio_p1_ostfold_mp3_h','InternetStreamRadio',(SELECT `Id` FROM `Countries` WHERE `Name` = 'Norge'));
INSERT INTO `MediaSources` (`Name`,`Url`,`MediaCategoryType`,`FK_Country_Id`) VALUES ('NRK P1 Østlandssendingen','http://lyd.nrk.no/nrk_radio_p1_ostlandssendingen_mp3_h','InternetStreamRadio',(SELECT `Id` FROM `Countries` WHERE `Name` = 'Norge'));
INSERT INTO `MediaSources` (`Name`,`Url`,`MediaCategoryType`,`FK_Country_Id`) VALUES ('NRK P2','http://lyd.nrk.no/nrk_radio_p2_mp3_h','InternetStreamRadio',(SELECT `Id` FROM `Countries` WHERE `Name` = 'Norge'));
INSERT INTO `MediaSources` (`Name`,`Url`,`MediaCategoryType`,`FK_Country_Id`) VALUES ('NRK P3','http://lyd.nrk.no/nrk_radio_p3_mp3_h','InternetStreamRadio',(SELECT `Id` FROM `Countries` WHERE `Name` = 'Norge'));
INSERT INTO `MediaSources` (`Name`,`Url`,`MediaCategoryType`,`FK_Country_Id`) VALUES ('NRK P1+','http://lyd.nrk.no/nrk_radio_p1pluss_mp3_h.m3u','InternetStreamRadio',(SELECT `Id` FROM `Countries` WHERE `Name` = 'Norge'));
INSERT INTO `MediaSources` (`Name`,`Url`,`MediaCategoryType`,`FK_Country_Id`) VALUES ('NRK P13','http://lyd.nrk.no/nrk_radio_p13_mp3_h','InternetStreamRadio',(SELECT `Id` FROM `Countries` WHERE `Name` = 'Norge'));
INSERT INTO `MediaSources` (`Name`,`Url`,`MediaCategoryType`,`FK_Country_Id`) VALUES ('NRK mP3','http://lyd.nrk.no/nrk_radio_mp3_aac_h','InternetStreamRadio',(SELECT `Id` FROM `Countries` WHERE `Name` = 'Norge'));
INSERT INTO `MediaSources` (`Name`,`Url`,`MediaCategoryType`,`FK_Country_Id`) VALUES ('NRK Super','http://lyd.nrk.no/nrk_radio_super_mp3_h','InternetStreamRadio',(SELECT `Id` FROM `Countries` WHERE `Name` = 'Norge'));
INSERT INTO `MediaSources` (`Name`,`Url`,`MediaCategoryType`,`FK_Country_Id`) VALUES ('NRK Alltid nyheter','http://lyd.nrk.no/nrk_radio_alltid_nyheter_mp3_h','InternetStreamRadio',(SELECT `Id` FROM `Countries` WHERE `Name` = 'Norge'));
INSERT INTO `MediaSources` (`Name`,`Url`,`MediaCategoryType`,`FK_Country_Id`) VALUES ('NRK P3 Urørt','http://lyd.nrk.no/nrk_radio_p3_urort_mp3_h','InternetStreamRadio',(SELECT `Id` FROM `Countries` WHERE `Name` = 'Norge'));
INSERT INTO `MediaSources` (`Name`,`Url`,`MediaCategoryType`,`FK_Country_Id`) VALUES ('NRK Sport','http://lyd.nrk.no/nrk_radio_sport_mp3_h','InternetStreamRadio',(SELECT `Id` FROM `Countries` WHERE `Name` = 'Norge'));
INSERT INTO `MediaSources` (`Name`,`Url`,`MediaCategoryType`,`FK_Country_Id`) VALUES ('NRK Sápmi radio','http://lyd.nrk.no/nrk_radio_sami_mp3_h','InternetStreamRadio',(SELECT `Id` FROM `Countries` WHERE `Name` = 'Norge'));
INSERT INTO `MediaSources` (`Name`,`Url`,`MediaCategoryType`,`FK_Country_Id`) VALUES ('NRK Klassisk','http://lyd.nrk.no/nrk_radio_klassisk_mp3_h','InternetStreamRadio',(SELECT `Id` FROM `Countries` WHERE `Name` = 'Norge'));
INSERT INTO `MediaSources` (`Name`,`Url`,`MediaCategoryType`,`FK_Country_Id`) VALUES ('NRK Jazz','http://lyd.nrk.no/nrk_radio_jazz_mp3_h','InternetStreamRadio',(SELECT `Id` FROM `Countries` WHERE `Name` = 'Norge'));
INSERT INTO `MediaSources` (`Name`,`Url`,`MediaCategoryType`,`FK_Country_Id`) VALUES ('NRK Folkemusikk','http://lyd.nrk.no/nrk_radio_folkemusikk_mp3_h','InternetStreamRadio',(SELECT `Id` FROM `Countries` WHERE `Name` = 'Norge'));

INSERT INTO `MediaSources` (`Name`,`Url`,`MediaCategoryType`,`FK_Country_Id`) VALUES ('BBC Radio 1 (Nationella stationer)','http://bbcmedia.ic.llnwd.net/stream/bbcmedia_radio1_mf_p','InternetStreamRadio',(SELECT `Id` FROM `Countries` WHERE `Name` = 'England'));
INSERT INTO `MediaSources` (`Name`,`Url`,`MediaCategoryType`,`FK_Country_Id`) VALUES ('BBC Radio 1xtra (Nationella stationer)','http://bbcmedia.ic.llnwd.net/stream/bbcmedia_radio1xtra_mf_p','InternetStreamRadio',(SELECT `Id` FROM `Countries` WHERE `Name` = 'England'));
INSERT INTO `MediaSources` (`Name`,`Url`,`MediaCategoryType`,`FK_Country_Id`) VALUES ('BBC Radio 2 (Nationella stationer)','http://bbcmedia.ic.llnwd.net/stream/bbcmedia_radio2_mf_p','InternetStreamRadio',(SELECT `Id` FROM `Countries` WHERE `Name` = 'England'));
INSERT INTO `MediaSources` (`Name`,`Url`,`MediaCategoryType`,`FK_Country_Id`) VALUES ('BBC Radio 3 (Nationella stationer)','http://bbcmedia.ic.llnwd.net/stream/bbcmedia_radio3_mf_p','InternetStreamRadio',(SELECT `Id` FROM `Countries` WHERE `Name` = 'England'));
INSERT INTO `MediaSources` (`Name`,`Url`,`MediaCategoryType`,`FK_Country_Id`) VALUES ('BBC Radio 4FM (Nationella stationer)','http://bbcmedia.ic.llnwd.net/stream/bbcmedia_radio4fm_mf_p','InternetStreamRadio',(SELECT `Id` FROM `Countries` WHERE `Name` = 'England'));
INSERT INTO `MediaSources` (`Name`,`Url`,`MediaCategoryType`,`FK_Country_Id`) VALUES ('BBC Radio 4LW (Nationella stationer)','http://bbcmedia.ic.llnwd.net/stream/bbcmedia_radio4lw_mf_p','InternetStreamRadio',(SELECT `Id` FROM `Countries` WHERE `Name` = 'England'));
INSERT INTO `MediaSources` (`Name`,`Url`,`MediaCategoryType`,`FK_Country_Id`) VALUES ('BBC Radio 4 Extra (Nationella stationer)','http://bbcmedia.ic.llnwd.net/stream/bbcmedia_radio4extra_mf_p','InternetStreamRadio',(SELECT `Id` FROM `Countries` WHERE `Name` = 'England'));
INSERT INTO `MediaSources` (`Name`,`Url`,`MediaCategoryType`,`FK_Country_Id`) VALUES ('BBC Radio 5 Live (Nationella stationer)','http://bbcmedia.ic.llnwd.net/stream/bbcmedia_radio5live_mf_p','InternetStreamRadio',(SELECT `Id` FROM `Countries` WHERE `Name` = 'England'));
INSERT INTO `MediaSources` (`Name`,`Url`,`MediaCategoryType`,`FK_Country_Id`) VALUES ('BBC Radio 5 Live Sportsball Extra','http://bbcmedia.ic.llnwd.net/stream/bbcmedia_radio5extra_mf_p','InternetStreamRadio',(SELECT `Id` FROM `Countries` WHERE `Name` = 'England'));
INSERT INTO `MediaSources` (`Name`,`Url`,`MediaCategoryType`,`FK_Country_Id`) VALUES ('BBC Radio 6 Music (Nationella stationer)','http://bbcmedia.ic.llnwd.net/stream/bbcmedia_6music_mf_p','InternetStreamRadio',(SELECT `Id` FROM `Countries` WHERE `Name` = 'England'));
INSERT INTO `MediaSources` (`Name`,`Url`,`MediaCategoryType`,`FK_Country_Id`) VALUES ('BBC Asian Network (Nationella stationer)','http://bbcmedia.ic.llnwd.net/stream/bbcmedia_asianet_mf_p','InternetStreamRadio',(SELECT `Id` FROM `Countries` WHERE `Name` = 'England'));
INSERT INTO `MediaSources` (`Name`,`Url`,`MediaCategoryType`,`FK_Country_Id`) VALUES ('BBC World Service UK stream (Nationella stationer)','http://bbcwssc.ic.llnwd.net/stream/bbcwssc_mp1_ws-eieuk','InternetStreamRadio',(SELECT `Id` FROM `Countries` WHERE `Name` = 'England'));
INSERT INTO `MediaSources` (`Name`,`Url`,`MediaCategoryType`,`FK_Country_Id`) VALUES ('BBC World Service News stream (Nationella stationer)','http://bbcwssc.ic.llnwd.net/stream/bbcwssc_mp1_ws-einws','InternetStreamRadio',(SELECT `Id` FROM `Countries` WHERE `Name` = 'England'));
INSERT INTO `MediaSources` (`Name`,`Url`,`MediaCategoryType`,`FK_Country_Id`) VALUES ('BBC Radio Cymru (Nationer och regioner)','http://bbcmedia.ic.llnwd.net/stream/bbcmedia_cymru_mf_p','InternetStreamRadio',(SELECT `Id` FROM `Countries` WHERE `Name` = 'England'));
INSERT INTO `MediaSources` (`Name`,`Url`,`MediaCategoryType`,`FK_Country_Id`) VALUES ('BBC Radio Foyle (Nationer och regioner)','http://bbcmedia.ic.llnwd.net/stream/bbcmedia_foyle_mf_p','InternetStreamRadio',(SELECT `Id` FROM `Countries` WHERE `Name` = 'England'));
INSERT INTO `MediaSources` (`Name`,`Url`,`MediaCategoryType`,`FK_Country_Id`) VALUES ('BBC Radio nan Gàidheal (Nationer och regioner)','http://bbcmedia.ic.llnwd.net/stream/bbcmedia_nangaidheal_mf_p','InternetStreamRadio',(SELECT `Id` FROM `Countries` WHERE `Name` = 'England'));
INSERT INTO `MediaSources` (`Name`,`Url`,`MediaCategoryType`,`FK_Country_Id`) VALUES ('BBC Radio Scotland (Nationer och regioner)','http://bbcmedia.ic.llnwd.net/stream/bbcmedia_scotlandfm_mf_p','InternetStreamRadio',(SELECT `Id` FROM `Countries` WHERE `Name` = 'England'));
INSERT INTO `MediaSources` (`Name`,`Url`,`MediaCategoryType`,`FK_Country_Id`) VALUES ('BBC Radio Ulster (Nationer och regioner)','http://bbcmedia.ic.llnwd.net/stream/bbcmedia_ulster_mf_p','InternetStreamRadio',(SELECT `Id` FROM `Countries` WHERE `Name` = 'England'));
INSERT INTO `MediaSources` (`Name`,`Url`,`MediaCategoryType`,`FK_Country_Id`) VALUES ('BBC Radio Wales (Nationer och regioner)','http://bbcmedia.ic.llnwd.net/stream/bbcmedia_walesmw_mf_p','InternetStreamRadio',(SELECT `Id` FROM `Countries` WHERE `Name` = 'England'));
INSERT INTO `MediaSources` (`Name`,`Url`,`MediaCategoryType`,`FK_Country_Id`) VALUES ('BBC Radio Berkshire (Lokalradio)','http://bbcmedia.ic.llnwd.net/stream/bbcmedia_lrberk_mf_p','InternetStreamRadio',(SELECT `Id` FROM `Countries` WHERE `Name` = 'England'));
INSERT INTO `MediaSources` (`Name`,`Url`,`MediaCategoryType`,`FK_Country_Id`) VALUES ('BBC Radio Bristol (Lokalradio)','http://bbcmedia.ic.llnwd.net/stream/bbcmedia_lrbris_mf_p','InternetStreamRadio',(SELECT `Id` FROM `Countries` WHERE `Name` = 'England'));
INSERT INTO `MediaSources` (`Name`,`Url`,`MediaCategoryType`,`FK_Country_Id`) VALUES ('BBC Radio Cambridgeshire (Lokalradio)','http://bbcmedia.ic.llnwd.net/stream/bbcmedia_lrcambs_mf_p','InternetStreamRadio',(SELECT `Id` FROM `Countries` WHERE `Name` = 'England'));
INSERT INTO `MediaSources` (`Name`,`Url`,`MediaCategoryType`,`FK_Country_Id`) VALUES ('BBC Radio Cornwall (Lokalradio)','http://bbcmedia.ic.llnwd.net/stream/bbcmedia_lrcorn_mf_p','InternetStreamRadio',(SELECT `Id` FROM `Countries` WHERE `Name` = 'England'));
INSERT INTO `MediaSources` (`Name`,`Url`,`MediaCategoryType`,`FK_Country_Id`) VALUES ('BBC Coventry & Warwickshire (Lokalradio)','http://bbcmedia.ic.llnwd.net/stream/bbcmedia_lrwmcandw_mf_p','InternetStreamRadio',(SELECT `Id` FROM `Countries` WHERE `Name` = 'England'));
INSERT INTO `MediaSources` (`Name`,`Url`,`MediaCategoryType`,`FK_Country_Id`) VALUES ('BBC Radio Cumbria (Lokalradio)','http://bbcmedia.ic.llnwd.net/stream/bbcmedia_lrcumbria_mf_p','InternetStreamRadio',(SELECT `Id` FROM `Countries` WHERE `Name` = 'England'));
INSERT INTO `MediaSources` (`Name`,`Url`,`MediaCategoryType`,`FK_Country_Id`) VALUES ('BBC Radio Derby (Lokalradio)','http://bbcmedia.ic.llnwd.net/stream/bbcmedia_lrderby_mf_p','InternetStreamRadio',(SELECT `Id` FROM `Countries` WHERE `Name` = 'England'));
INSERT INTO `MediaSources` (`Name`,`Url`,`MediaCategoryType`,`FK_Country_Id`) VALUES ('BBC Radio Devon (Lokalradio)','http://bbcmedia.ic.llnwd.net/stream/bbcmedia_lrdevon_mf_p','InternetStreamRadio',(SELECT `Id` FROM `Countries` WHERE `Name` = 'England'));
INSERT INTO `MediaSources` (`Name`,`Url`,`MediaCategoryType`,`FK_Country_Id`) VALUES ('BBC Essex (Lokalradio)','http://bbcmedia.ic.llnwd.net/stream/bbcmedia_lressex_mf_p','InternetStreamRadio',(SELECT `Id` FROM `Countries` WHERE `Name` = 'England'));
INSERT INTO `MediaSources` (`Name`,`Url`,`MediaCategoryType`,`FK_Country_Id`) VALUES ('BBC Radio Gloucestershire (Lokalradio)','http://bbcmedia.ic.llnwd.net/stream/bbcmedia_lrgloucs_mf_p','InternetStreamRadio',(SELECT `Id` FROM `Countries` WHERE `Name` = 'England'));
INSERT INTO `MediaSources` (`Name`,`Url`,`MediaCategoryType`,`FK_Country_Id`) VALUES ('BBC Radio Guernsey (Lokalradio)','http://bbcmedia.ic.llnwd.net/stream/bbcmedia_lrguern_mf_p','InternetStreamRadio',(SELECT `Id` FROM `Countries` WHERE `Name` = 'England'));
INSERT INTO `MediaSources` (`Name`,`Url`,`MediaCategoryType`,`FK_Country_Id`) VALUES ('BBC Hereford & Worcester (Lokalradio)','http://bbcmedia.ic.llnwd.net/stream/bbcmedia_lrhandw_mf_p','InternetStreamRadio',(SELECT `Id` FROM `Countries` WHERE `Name` = 'England'));
INSERT INTO `MediaSources` (`Name`,`Url`,`MediaCategoryType`,`FK_Country_Id`) VALUES ('BBC Radio Humberside (Lokalradio)','http://bbcmedia.ic.llnwd.net/stream/bbcmedia_lrhumber_mf_p','InternetStreamRadio',(SELECT `Id` FROM `Countries` WHERE `Name` = 'England'));
INSERT INTO `MediaSources` (`Name`,`Url`,`MediaCategoryType`,`FK_Country_Id`) VALUES ('BBC Radio Jersey (Lokalradio)','http://bbcmedia.ic.llnwd.net/stream/bbcmedia_lrjersey_mf_p','InternetStreamRadio',(SELECT `Id` FROM `Countries` WHERE `Name` = 'England'));
INSERT INTO `MediaSources` (`Name`,`Url`,`MediaCategoryType`,`FK_Country_Id`) VALUES ('BBC Radio Kent (Lokalradio)','http://bbcmedia.ic.llnwd.net/stream/bbcmedia_lrkent_mf_p','InternetStreamRadio',(SELECT `Id` FROM `Countries` WHERE `Name` = 'England'));
INSERT INTO `MediaSources` (`Name`,`Url`,`MediaCategoryType`,`FK_Country_Id`) VALUES ('BBC Radio Lancashire (Lokalradio)','http://bbcmedia.ic.llnwd.net/stream/bbcmedia_lrlancs_mf_p','InternetStreamRadio',(SELECT `Id` FROM `Countries` WHERE `Name` = 'England'));
INSERT INTO `MediaSources` (`Name`,`Url`,`MediaCategoryType`,`FK_Country_Id`) VALUES ('BBC Radio Leeds (Lokalradio)','http://bbcmedia.ic.llnwd.net/stream/bbcmedia_lrleeds_mf_p','InternetStreamRadio',(SELECT `Id` FROM `Countries` WHERE `Name` = 'England'));
INSERT INTO `MediaSources` (`Name`,`Url`,`MediaCategoryType`,`FK_Country_Id`) VALUES ('BBC Radio Leicester (Lokalradio)','http://bbcmedia.ic.llnwd.net/stream/bbcmedia_lrleics_mf_p','InternetStreamRadio',(SELECT `Id` FROM `Countries` WHERE `Name` = 'England'));
INSERT INTO `MediaSources` (`Name`,`Url`,`MediaCategoryType`,`FK_Country_Id`) VALUES ('BBC Radio Lincolnshire (Lokalradio)','http://bbcmedia.ic.llnwd.net/stream/bbcmedia_lrlincs_mf_p','InternetStreamRadio',(SELECT `Id` FROM `Countries` WHERE `Name` = 'England'));
INSERT INTO `MediaSources` (`Name`,`Url`,`MediaCategoryType`,`FK_Country_Id`) VALUES ('BBC Radio London (Lokalradio)','http://bbcmedia.ic.llnwd.net/stream/bbcmedia_lrldn_mf_p','InternetStreamRadio',(SELECT `Id` FROM `Countries` WHERE `Name` = 'England'));
INSERT INTO `MediaSources` (`Name`,`Url`,`MediaCategoryType`,`FK_Country_Id`) VALUES ('BBC Radio Manchester (Lokalradio)','http://bbcmedia.ic.llnwd.net/stream/bbcmedia_lrmanc_mf_p','InternetStreamRadio',(SELECT `Id` FROM `Countries` WHERE `Name` = 'England'));
INSERT INTO `MediaSources` (`Name`,`Url`,`MediaCategoryType`,`FK_Country_Id`) VALUES ('BBC Radio Merseyside (Lokalradio)','http://bbcmedia.ic.llnwd.net/stream/bbcmedia_lrmersey_mf_p','InternetStreamRadio',(SELECT `Id` FROM `Countries` WHERE `Name` = 'England'));
INSERT INTO `MediaSources` (`Name`,`Url`,`MediaCategoryType`,`FK_Country_Id`) VALUES ('BBC Newcastle (Lokalradio)','http://bbcmedia.ic.llnwd.net/stream/bbcmedia_lrnewc_mf_p','InternetStreamRadio',(SELECT `Id` FROM `Countries` WHERE `Name` = 'England'));
INSERT INTO `MediaSources` (`Name`,`Url`,`MediaCategoryType`,`FK_Country_Id`) VALUES ('BBC Radio Norfolk (Lokalradio)','http://bbcmedia.ic.llnwd.net/stream/bbcmedia_lrnorfolk_mf_p','InternetStreamRadio',(SELECT `Id` FROM `Countries` WHERE `Name` = 'England'));
INSERT INTO `MediaSources` (`Name`,`Url`,`MediaCategoryType`,`FK_Country_Id`) VALUES ('BBC Radio Northampton (Lokalradio)','http://bbcmedia.ic.llnwd.net/stream/bbcmedia_lrnthhnts_mf_p','InternetStreamRadio',(SELECT `Id` FROM `Countries` WHERE `Name` = 'England'));
INSERT INTO `MediaSources` (`Name`,`Url`,`MediaCategoryType`,`FK_Country_Id`) VALUES ('BBC Radio Nottingham (Lokalradio)','http://bbcmedia.ic.llnwd.net/stream/bbcmedia_lrnotts_mf_p','InternetStreamRadio',(SELECT `Id` FROM `Countries` WHERE `Name` = 'England'));
INSERT INTO `MediaSources` (`Name`,`Url`,`MediaCategoryType`,`FK_Country_Id`) VALUES ('BBC Radio Oxford (Lokalradio)','http://bbcmedia.ic.llnwd.net/stream/bbcmedia_lroxford_mf_p','InternetStreamRadio',(SELECT `Id` FROM `Countries` WHERE `Name` = 'England'));
INSERT INTO `MediaSources` (`Name`,`Url`,`MediaCategoryType`,`FK_Country_Id`) VALUES ('BBC Radio Sheffield (Lokalradio)','http://bbcmedia.ic.llnwd.net/stream/bbcmedia_lrsheff_mf_p','InternetStreamRadio',(SELECT `Id` FROM `Countries` WHERE `Name` = 'England'));
INSERT INTO `MediaSources` (`Name`,`Url`,`MediaCategoryType`,`FK_Country_Id`) VALUES ('BBC Radio Shropshire (Lokalradio)','http://bbcmedia.ic.llnwd.net/stream/bbcmedia_lrshrops_mf_p','InternetStreamRadio',(SELECT `Id` FROM `Countries` WHERE `Name` = 'England'));
INSERT INTO `MediaSources` (`Name`,`Url`,`MediaCategoryType`,`FK_Country_Id`) VALUES ('BBC Radio Solent (Lokalradio)','http://bbcmedia.ic.llnwd.net/stream/bbcmedia_lrsolent_mf_p','InternetStreamRadio',(SELECT `Id` FROM `Countries` WHERE `Name` = 'England'));
INSERT INTO `MediaSources` (`Name`,`Url`,`MediaCategoryType`,`FK_Country_Id`) VALUES ('BBC Somerset (Lokalradio)','http://bbcmedia.ic.llnwd.net/stream/bbcmedia_lrsomer_mf_p','InternetStreamRadio',(SELECT `Id` FROM `Countries` WHERE `Name` = 'England'));
INSERT INTO `MediaSources` (`Name`,`Url`,`MediaCategoryType`,`FK_Country_Id`) VALUES ('BBC Radio Stoke (Lokalradio)','http://bbcmedia.ic.llnwd.net/stream/bbcmedia_lrsomer_mf_p','InternetStreamRadio',(SELECT `Id` FROM `Countries` WHERE `Name` = 'England'));
INSERT INTO `MediaSources` (`Name`,`Url`,`MediaCategoryType`,`FK_Country_Id`) VALUES ('BBC Radio Suffolk (Lokalradio)','http://bbcmedia.ic.llnwd.net/stream/bbcmedia_lrsuffolk_mf_p','InternetStreamRadio',(SELECT `Id` FROM `Countries` WHERE `Name` = 'England'));
INSERT INTO `MediaSources` (`Name`,`Url`,`MediaCategoryType`,`FK_Country_Id`) VALUES ('BBC Surrey (Lokalradio)','http://bbcmedia.ic.llnwd.net/stream/bbcmedia_lrsurrey_mf_p','InternetStreamRadio',(SELECT `Id` FROM `Countries` WHERE `Name` = 'England'));
INSERT INTO `MediaSources` (`Name`,`Url`,`MediaCategoryType`,`FK_Country_Id`) VALUES ('BBC Sussex (Lokalradio)','http://bbcmedia.ic.llnwd.net/stream/bbcmedia_lrsussex_mf_p','InternetStreamRadio',(SELECT `Id` FROM `Countries` WHERE `Name` = 'England'));
INSERT INTO `MediaSources` (`Name`,`Url`,`MediaCategoryType`,`FK_Country_Id`) VALUES ('BBC Tees (Lokalradio)','http://bbcmedia.ic.llnwd.net/stream/bbcmedia_lrtees_mf_p','InternetStreamRadio',(SELECT `Id` FROM `Countries` WHERE `Name` = 'England'));
INSERT INTO `MediaSources` (`Name`,`Url`,`MediaCategoryType`,`FK_Country_Id`) VALUES ('BBC Three Counties Radio (Lokalradio)','http://bbcmedia.ic.llnwd.net/stream/bbcmedia_lr3cr_mf_p','InternetStreamRadio',(SELECT `Id` FROM `Countries` WHERE `Name` = 'England'));
INSERT INTO `MediaSources` (`Name`,`Url`,`MediaCategoryType`,`FK_Country_Id`) VALUES ('BBC Wiltshire (Lokalradio)','http://bbcmedia.ic.llnwd.net/stream/bbcmedia_lrwilts_mf_p','InternetStreamRadio',(SELECT `Id` FROM `Countries` WHERE `Name` = 'England'));
INSERT INTO `MediaSources` (`Name`,`Url`,`MediaCategoryType`,`FK_Country_Id`) VALUES ('BBC WM 95.6 (Lokalradio)','http://bbcmedia.ic.llnwd.net/stream/bbcmedia_lrwm_mf_p','InternetStreamRadio',(SELECT `Id` FROM `Countries` WHERE `Name` = 'England'));
INSERT INTO `MediaSources` (`Name`,`Url`,`MediaCategoryType`,`FK_Country_Id`) VALUES ('BBC Radio York (Lokalradio)','http://bbcmedia.ic.llnwd.net/stream/bbcmedia_lryork_mf_p','InternetStreamRadio', (SELECT `Id` FROM `Countries` WHERE `Name` = 'England'));
            