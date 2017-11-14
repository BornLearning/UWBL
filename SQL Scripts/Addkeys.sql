ALTER TABLE `uwmdb`.`Access` 
CHANGE COLUMN `GmailAddress` `gmailAddress` VARCHAR(100) NOT NULL ,
CHANGE COLUMN `CenterIDList` `centerIDList` JSON NOT NULL ;

ALTER TABLE `uwmdb`.`Community` 
DROP FOREIGN KEY `CenterIDComm`,
DROP FOREIGN KEY `IndicatorIDComm`;

ALTER TABLE `uwmdb`.`Community` 
CHANGE COLUMN `IndicatorID` `indicatorID` INT(11) NOT NULL ,
CHANGE COLUMN `CenterID` `centerID` INT(11) NOT NULL ,
CHANGE COLUMN `Response` `response` INT(11) NOT NULL ,
CHANGE COLUMN `AssessmentDate` `assessmentDate` DATETIME NOT NULL ,
DROP INDEX `CenterIDComm` ,
ADD INDEX `centerIDComm` (`centerID` ASC);

ALTER TABLE `uwmdb`.`Community` 
ADD CONSTRAINT `centerIDComm`
  FOREIGN KEY (`centerID`)
  REFERENCES `uwmdb`.`Centers` (`centerID`),
ADD CONSTRAINT `indicatorIDComm`
  FOREIGN KEY (`indicatorID`)
  REFERENCES `uwmdb`.`Indicators` (`indicatorID`);
  
ALTER TABLE `uwmdb`.`Facilitators` 
CHANGE COLUMN `FacilitatorID` `facilitatorID` INT(11) NOT NULL ,
CHANGE COLUMN `Name` `name` VARCHAR(500) NOT NULL ,
CHANGE COLUMN `Phone` `phone` DOUBLE NOT NULL ;

ALTER TABLE `uwmdb`.`Centers` 
DROP FOREIGN KEY `FacilitatorID`;

ALTER TABLE `uwmdb`.`Centers` 
CHANGE COLUMN `FacilitatorID` `facilitatorID` INT(11) NOT NULL ;

ALTER TABLE `uwmdb`.`Centers` 
ADD CONSTRAINT `facilitatorID`
  FOREIGN KEY (`facilitatorID`)
  REFERENCES `uwmdb`.`Facilitators` (`facilitatorID`)
  ON DELETE NO ACTION
  ON UPDATE CASCADE;

ALTER TABLE `uwmdb`.`InfrastructureDev` 
DROP FOREIGN KEY `CenterIDInfra`,
DROP FOREIGN KEY `IndicatorIDInfra`;

ALTER TABLE `uwmdb`.`InfrastructureDev` 
CHANGE COLUMN `IndicatorID` `indicatorID` INT(11) NOT NULL ,
CHANGE COLUMN `CenterID` `centerID` INT(11) NOT NULL ,
CHANGE COLUMN `Response` `response` INT(11) NOT NULL ,
CHANGE COLUMN `AssessmentDate` `assessmentDate` DATETIME NOT NULL ,
DROP INDEX `CenterIDInfra` ,
ADD INDEX `centerIDInfra` (`centerID` ASC);
ALTER TABLE `uwmdb`.`InfrastructureDev` 
ADD CONSTRAINT `centerIDInfra`
  FOREIGN KEY (`centerID`)
  REFERENCES `uwmdb`.`Centers` (`centerID`),
ADD CONSTRAINT `indicatorIDInfra`
  FOREIGN KEY (`indicatorID`)
  REFERENCES `uwmdb`.`Indicators` (`indicatorID`);
  
ALTER TABLE `uwmdb`.`SchoolReadiness` 
DROP FOREIGN KEY `ChildID`,
DROP FOREIGN KEY `IndicatorID`;

ALTER TABLE `uwmdb`.`SchoolReadiness` 
CHANGE COLUMN `IndicatorID` `indicatorID` INT(11) NOT NULL ,
CHANGE COLUMN `ChildID` `childID` VARCHAR(20) NOT NULL ,
CHANGE COLUMN `Response` `response` INT(11) NOT NULL ,
CHANGE COLUMN `AssessmentDate` `assessmentDate` DATETIME NOT NULL ;

ALTER TABLE `uwmdb`.`SchoolReadiness` 
ADD CONSTRAINT `ChildID`
  FOREIGN KEY (`childID`)
  REFERENCES `uwmdb`.`Children` (`childID`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `IndicatorID`
  FOREIGN KEY (`indicatorID`)
  REFERENCES `uwmdb`.`Indicators` (`indicatorID`);
ALTER TABLE `uwmdb`.`Centers` 
CHANGE COLUMN `geolocation` `geolocation` VARCHAR(100) NULL DEFAULT NULL ;

ALTER TABLE `uwmdb`.`Centers` 
CHANGE COLUMN `pincode` `pincode` INT NOT NULL ;

ALTER TABLE `uwmdb`.`Facilitators` 
CHANGE COLUMN `phone` `phone` VARCHAR(20) NOT NULL ;
ALTER TABLE `uwmdb`.`Indicators` 
CHANGE COLUMN `subCategory` `subCategory` VARCHAR(500) NULL ;
