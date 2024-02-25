CREATE DATABASE grain_and_oil2;
use grain_and_oil2;
CREATE TABLE `ACCS`  (
  `A ID` int NOT NULL,
  `softwarename` varchar(255) NOT NULL,
  `shortname` varchar(255) NULL,
  `versionnum` varchar(50) NULL,
  `classification` varchar(255) NOT NULL,
  `industry` varchar(255) NOT NULL,
  `recorddate` date ,
  `company` varchar(255) NOT NULL,
  `firstdate` date ,
  `b_i ID` varchar(50) NOT NULL,
  PRIMARY KEY (`A ID`)
);

CREATE TABLE `basic_information`  (
  `b_i ID` varchar(50) NOT NULL,
  `url` varchar(255) NOT NULL,
  `enterprise_name` varchar(255) NOT NULL,
  `annul_date` date,
  `authority` varchar(255) NOT NULL,
  `district` varchar(255) NOT NULL,
  `entype` varchar(255) NOT NULL,
  `industry` varchar(255) NOT NULL,
  `insurence_num` varchar(255) NOT NULL,
  `legai_person` varchar(255) NOT NULL,
  `license_num` varchar(255) NOT NULL,
  `open_status` varchar(255) NOT NULL,
  `opentime` varchar(255),
  `orgnum` varchar(255) NOT NULL,
  `regNo` varchar(255) Null,
  PRIMARY KEY (`b_i ID`)
);

CREATE TABLE `brand`  (
  `registr ID` varchar(50) NOT NULL,
  `brandwebsite` varchar(255) NOT NULL,
  `brand` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `b_i ID` varchar(50) NOT NULL,
  PRIMARY KEY (`registr ID`)
);

CREATE TABLE `change_record`  (
  `c_r ID` int NOT NULL,
  `changedate` varchar(255) NOT NULL,
  `changeitem` varchar(5000) NULL,
  `beforechange` varchar(5000) NULL,
  `afterchange` varchar(5000) NULL,
  `b_i ID` varchar(50) NULL,
  PRIMARY KEY (`c_r ID`)
);

CREATE TABLE `comment`  (
  `comment ID` varchar(255) NOT NULL,
  `content` varchar(5000) NULL,
  `replynum` float NULL,
  `time` datetime NULL,
  `score` float NULL,
  `type` varchar(255) NULL,
  `SKU ID` varchar(255) NULL,
  PRIMARY KEY (`comment ID`)
);

CREATE TABLE `goods_information`  (
  `SKU ID` varchar(255) NOT NULL,
  `title` varchar(5000) NULL,
  `brand` varchar(255) NULL,
  `originplace` varchar(255) NULL,
  `type` varchar(255) NULL,
  `store ID` int NULL,
  PRIMARY KEY (`SKU ID`)
);

CREATE TABLE `ICP_record`  (
  `I_r ID` int NOT NULL,
  `websitename` varchar(255) NOT NULL,
  `website` varchar(255) NOT NULL,
  `recordnum` varchar(255) NOT NULL,
  `b_i ID` varchar(50) NOT NULL,
  PRIMARY KEY (`I_r ID`)
);

CREATE TABLE `jingdong_store`  (
  `store ID` int NOT NULL,
  `storename` varchar(255) NOT NULL,
  `link` varchar(255) NOT NULL,
  `b_i ID` varchar(50) NULL,
  PRIMARY KEY (`store ID`)
);

CREATE TABLE `patent`  (
  `patentnum` varchar(50) NOT NULL,
  `patentname` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `b_i ID` varchar(50) NOT NULL,
  PRIMARY KEY (`patentnum`)
);

CREATE TABLE `production`  (
  `name` varchar(255) NOT NULL,
  `recordnum` varchar(50) NOT NULL,
  `type` varchar(255) NOT NULL,
  `completedate` date NULL,
  `firstdate` date NULL,
  `recorddate` date NULL,
  `b_i ID` varchar(50) NOT NULL,
  PRIMARY KEY (`name`)
);

CREATE TABLE `regulatory_record`  (
  `r_r ID` int NOT NULL,
  `date` date NOT NULL,
  `type` varchar(255) NULL,
  `result` varchar(5000) NULL,
  `org` varchar(255) NULL,
  `b_i ID` varchar(50) NOT NULL,
  PRIMARY KEY (`r_r ID`)
);

CREATE TABLE `shareholder_information`  (
  `s_i ID` int NOT NULL,
  `shareholdername` varchar(255) NOT NULL,
  `shareholdingratio` varchar(255) NOT NULL,
  `money` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `b_i ID` varchar(50) NOT NULL,
  PRIMARY KEY (`s_i ID`)
);

CREATE TABLE `transaction_data`  (
  `t_d ID` int NOT NULL,
  `time` varchar(255)  NULL,
  `commentnum` varchar(255)  NULL,
  `standard` varchar(255) NULL,
  `price` varchar(255) NULL,
  `praisedegree` varchar(255)  NULL,
  `SKU ID` varchar(255)  NULL,
  PRIMARY KEY (`t_d ID`)
);

ALTER TABLE `ACCS` ADD FOREIGN KEY (`b_i ID`) REFERENCES `basic_information` (`b_i ID`);
ALTER TABLE `brand` ADD FOREIGN KEY (`b_i ID`) REFERENCES `basic_information` (`b_i ID`);
ALTER TABLE `change_record` ADD FOREIGN KEY (`b_i ID`) REFERENCES `basic_information` (`b_i ID`);
ALTER TABLE `comment` ADD FOREIGN KEY (`SKU ID`) REFERENCES `goods_information` (`SKU ID`);
ALTER TABLE `goods_information` ADD FOREIGN KEY (`store ID`) REFERENCES `jingdong_store` (`store ID`);
ALTER TABLE `ICP_record` ADD FOREIGN KEY (`b_i ID`) REFERENCES `basic_information` (`b_i ID`);
ALTER TABLE `jingdong_store` ADD FOREIGN KEY (`b_i ID`) REFERENCES `basic_information` (`b_i ID`);
ALTER TABLE `patent` ADD FOREIGN KEY (`b_i ID`) REFERENCES `basic_information` (`b_i ID`);
ALTER TABLE `production` ADD FOREIGN KEY (`b_i ID`) REFERENCES `basic_information` (`b_i ID`);
ALTER TABLE `regulatory_record` ADD FOREIGN KEY (`b_i ID`) REFERENCES `basic_information` (`b_i ID`);
ALTER TABLE `shareholder_information` ADD FOREIGN KEY (`b_i ID`) REFERENCES `basic_information` (`b_i ID`);
ALTER TABLE `transaction_data` ADD FOREIGN KEY (`SKU ID`) REFERENCES `goods_information` (`SKU ID`);

select * from comment