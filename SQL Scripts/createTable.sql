CREATE TABLE `Access` (
  `GmailAddress` varchar(100) NOT NULL,
  `CenterIDList` json NOT NULL,
  PRIMARY KEY (`GmailAddress`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `Facilitators` (
  `FacilitatorID` int(11) NOT NULL,
  `Name` varchar(500) NOT NULL,
  `Phone` double NOT NULL,
  PRIMARY KEY (`FacilitatorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `Indicators` (
  `indicatorID` int(11) NOT NULL AUTO_INCREMENT,
  `indicatorLabel` varchar(2000) NOT NULL,
  `category` varchar(500) NOT NULL,
  `subCategory` varchar(500) NOT NULL,
  `ageGroup` varchar(5) NOT NULL,
  PRIMARY KEY (`indicatorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `Centers` (
  `centerID` int(11) NOT NULL AUTO_INCREMENT,
  `centerName` varchar(500) NOT NULL,
  `centerAddress` varchar(1000) DEFAULT NULL,
  `pincode` double NOT NULL,
  `type` varchar(45) NOT NULL,
  `chapter` varchar(50) NOT NULL,
  `city` varchar(45) NOT NULL,
  `district` varchar(100) NOT NULL,
  `sevika` varchar(200) NOT NULL,
  `sevikaPhone` varchar(20) NOT NULL,
  `FacilitatorID` int(11) NOT NULL,
  `geolocation` json DEFAULT NULL,
  PRIMARY KEY (`centerID`),
  KEY `FacilitatorID_idx` (`FacilitatorID`),
  CONSTRAINT `FacilitatorID` FOREIGN KEY (`FacilitatorID`) REFERENCES `Facilitators` (`FacilitatorID`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=584506 DEFAULT CHARSET=utf8;


CREATE TABLE `Children` (
  `childID` int(11) NOT NULL,
  `childFName` varchar(500) NOT NULL,
  `childLName` varchar(500) DEFAULT NULL,
  `childDOB` varchar(20) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `guardianName` varchar(500) NOT NULL,
  `guardianPhone` varchar(20) NOT NULL,
  `centerID` int(11) NOT NULL,
  `imageID` varchar(200) DEFAULT NULL,
  `active` varchar(5) NOT NULL,
  PRIMARY KEY (`childID`),
  KEY `centerID` (`centerID`),
  CONSTRAINT `centerID` FOREIGN KEY (`centerID`) REFERENCES `Centers` (`centerID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `Community` (
  `IndicatorID` int(11) NOT NULL,
  `CenterID` int(11) NOT NULL,
  `Response` int(4) NOT NULL,
  `AssessmentDate` datetime NOT NULL,
  KEY `IndicatorIDComm_idx` (`IndicatorID`),
  KEY `CenterIDComm` (`CenterID`),
  CONSTRAINT `CenterIDComm` FOREIGN KEY (`CenterID`) REFERENCES `Centers` (`CenterID`),
  CONSTRAINT `IndicatorIDComm` FOREIGN KEY (`IndicatorID`) REFERENCES `Indicators` (`IndicatorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `InfrastructureDev` (
  `IndicatorID` int(11) NOT NULL,
  `CenterID` int(11) NOT NULL,
  `Response` int(4) NOT NULL,
  `AssessmentDate` datetime NOT NULL,
  KEY `IndicatorID_idx` (`IndicatorID`),
  KEY `CenterIDInfra` (`CenterID`),
  CONSTRAINT `CenterIDInfra` FOREIGN KEY (`CenterID`) REFERENCES `Centers` (`CenterID`),
  CONSTRAINT `IndicatorIDInfra` FOREIGN KEY (`IndicatorID`) REFERENCES `Indicators` (`IndicatorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `SchoolReadiness` (
  `IndicatorID` int(11) NOT NULL,
  `ChildID` int(11) NOT NULL,
  `Response` int(4) NOT NULL,
  `AssessmentDate` datetime NOT NULL,
  KEY `IndicatorID_idx` (`IndicatorID`),
  KEY `ChildID_idx` (`ChildID`),
  CONSTRAINT `ChildID` FOREIGN KEY (`ChildID`) REFERENCES `Children` (`childID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `IndicatorID` FOREIGN KEY (`IndicatorID`) REFERENCES `Indicators` (`indicatorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
