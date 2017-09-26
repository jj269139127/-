# Host: 127.0.0.1  (Version: 5.5.20)
# Date: 2015-04-21 16:26:15
# Generator: MySQL-Front 5.3  (Build 4.205)

/*!40101 SET NAMES utf8 */;

#
# Structure for table "category_name"
#

DROP TABLE IF EXISTS `category_name`;
CREATE TABLE `category_name` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `category` char(20) DEFAULT NULL,
  `name` char(20) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

#
# Data for table "category_name"
#

INSERT INTO `category_name` VALUES (1,'田赛','跳高'),(2,'田赛','撑杆跳高'),(3,'田赛','跳远'),(4,'田赛','三级跳远'),(5,'田赛','铅球'),(6,'田赛','铁饼'),(7,'田赛','链球'),(8,'田赛','标枪'),(9,'田赛','十项全能'),(10,'径赛','100米'),(11,'径赛','200米'),(12,'径赛','400米'),(13,'径赛','800米'),(14,'径赛','1500米'),(15,'径赛','5000米'),(16,'径赛','10000米'),(17,'径赛','马拉松'),(18,'径赛','3000米障碍跑'),(19,'径赛','110米跨栏'),(20,'径赛','400米跨栏'),(21,'径赛','20公里竞走'),(22,'径赛','50公里竞走'),(23,'径赛','4X100接力跑'),(24,'径赛','4X400接力跑');

#
# Structure for table "class"
#

DROP TABLE IF EXISTS `class`;
CREATE TABLE `class` (
  `Class_id` int(10) NOT NULL DEFAULT '0',
  `Class_department` varchar(255) NOT NULL DEFAULT 'null',
  `Class_name` varchar(50) DEFAULT NULL,
  `Class_score` int(10) DEFAULT '0',
  PRIMARY KEY (`Class_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "class"
#

INSERT INTO `class` VALUES (101001,'软件1201','计算机科学与技术学院',5),(101002,'软件1202','计算机科学与技术学院',0),(101101,'机械1101','机械学院',0),(101203,'纺织1303','纺织学院',0),(101301,'日语1101','人文学院',4),(101302,'英语1202','人文学院',0),(101403,'材料1203','材料学院',0),(101501,'数学1201','理学院',0);

#
# Structure for table "manager"
#

DROP TABLE IF EXISTS `manager`;
CREATE TABLE `manager` (
  `Manager_id` int(10) NOT NULL,
  `Manager_password` char(20) DEFAULT NULL,
  PRIMARY KEY (`Manager_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "manager"
#

INSERT INTO `manager` VALUES (1,'1');

#
# Structure for table "project"
#

DROP TABLE IF EXISTS `project`;
CREATE TABLE `project` (
  `Project_id` int(10) NOT NULL,
  `Project_name` char(20) DEFAULT NULL,
  `Project_number` int(8) DEFAULT NULL,
  `Project_category` char(16) DEFAULT NULL,
  `Project_sex` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`Project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "project"
#

INSERT INTO `project` VALUES (101,'女子跳高',50,'0','f'),(102,'女子撑杆跳高',40,'0','f'),(103,'女子跳远',60,'0','f'),(105,'女子铅球',45,'0','f'),(201,'男子跳高',60,'0','m'),(202,'男子撑杆跳高',40,'0','m'),(203,'男子跳远',65,'0','m'),(205,'男子铅球',40,'0','m'),(1110,'女子100米',100,'1','f'),(1111,'女子200米',100,'1','f'),(1112,'女子400米',90,'1','f'),(1123,'女子4X100接力跑',80,'1','f'),(2111,'男子200米',12,'1','m'),(2113,'男子800米',50,'1','m'),(2114,'男子1500米',80,'1','m'),(2123,'男子4X100接力跑',80,'1','m');

#
# Structure for table "schedule"
#

DROP TABLE IF EXISTS `schedule`;
CREATE TABLE `schedule` (
  `Schedule_id` int(10) NOT NULL AUTO_INCREMENT,
  `Schedule_address` char(24) DEFAULT NULL,
  `Schedule_starttime` datetime DEFAULT NULL,
  `Schedule_endtime` datetime DEFAULT NULL,
  `Project_id` int(10) NOT NULL,
  `Schedule_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Schedule_id`),
  KEY `Project_id` (`Project_id`),
  CONSTRAINT `schedule_ibfk_1` FOREIGN KEY (`Project_id`) REFERENCES `project` (`Project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

#
# Data for table "schedule"
#

INSERT INTO `schedule` VALUES (9,'体育馆','2015-04-16 13:00:00','2015-04-16 14:00:00',101,'决赛'),(10,'体育馆','2015-04-15 13:00:00','2015-04-15 14:00:00',102,'决赛'),(11,'体育馆','2015-04-14 13:00:00','2015-04-14 14:00:00',103,'决赛'),(12,'体育馆','2015-04-17 13:00:00','2015-04-17 13:00:00',105,'决赛'),(13,'体育场','2015-04-14 13:00:00','2015-04-14 13:00:00',1110,'决赛'),(14,'篮球场','2015-04-15 13:00:00','2015-04-15 14:00:00',1111,'决赛'),(15,'体育场','2015-04-16 13:00:00','2015-04-16 14:00:00',1112,'决赛'),(16,'体育场','2015-04-17 13:00:00','2015-04-17 14:00:00',1123,'决赛'),(17,'体育馆','2015-04-14 13:00:00','2015-04-14 14:00:00',201,'决赛'),(18,'体育馆','2015-04-15 13:00:00','2015-04-15 14:00:00',202,'决赛'),(19,'体育馆','2015-04-16 13:00:00','2015-04-16 14:00:00',203,'决赛'),(20,'体育馆','2015-04-17 13:00:00','2015-04-17 14:00:00',205,'决赛'),(21,'体育场','2015-04-14 13:00:00','2015-04-14 14:00:00',2111,'初赛'),(22,'体育场','2015-04-15 13:00:00','2015-04-15 14:00:00',2113,'决赛'),(23,'体育场','2015-04-16 13:00:00','2015-04-16 01:00:00',2114,'决赛'),(24,'体育场','2015-04-17 13:00:00','2015-04-17 14:00:00',2123,'决赛'),(25,'体育场','2015-04-15 14:00:00','2015-04-15 15:00:00',2111,'复赛'),(26,'体育场','2015-04-16 14:00:00','2015-04-16 15:00:00',2111,'决赛');

#
# Structure for table "student"
#

DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `Student_number` int(10) NOT NULL DEFAULT '0',
  `Competer_id` int(10) NOT NULL DEFAULT '0',
  `Student_name` char(16) DEFAULT NULL,
  `Student_sex` char(4) DEFAULT NULL,
  `Class_id` int(10) DEFAULT NULL,
  `Student_password` char(20) DEFAULT NULL,
  `Student_introduction` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`Student_number`),
  KEY `fk_class_id` (`Class_id`),
  KEY `Competer_id` (`Competer_id`),
  CONSTRAINT `fk_class_id` FOREIGN KEY (`Class_id`) REFERENCES `class` (`Class_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "student"
#

INSERT INTO `student` VALUES (121320107,1001,'金','f',101001,'121320107',''),(121320205,1002,'white','f',101301,'121320205',''),(121320207,1003,'雷','f',101403,'121320207','');

#
# Structure for table "records"
#

DROP TABLE IF EXISTS `records`;
CREATE TABLE `records` (
  `Competer_id` int(10) NOT NULL,
  `Project_id` int(10) NOT NULL,
  `Grades_grades` char(20) DEFAULT NULL,
  `Grades_ranking` int(8) DEFAULT '0',
  `Grades_flag` int(1) DEFAULT '0',
  PRIMARY KEY (`Competer_id`,`Project_id`),
  KEY `Project_id` (`Project_id`),
  KEY `Competer_id` (`Competer_id`),
  CONSTRAINT `records_ibfk_1` FOREIGN KEY (`Competer_id`) REFERENCES `student` (`Competer_id`),
  CONSTRAINT `records_ibfk_2` FOREIGN KEY (`Project_id`) REFERENCES `project` (`Project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "records"
#

INSERT INTO `records` VALUES (1001,103,'200',1,1),(1002,103,'190',2,1),(1002,1110,NULL,0,0),(1003,101,NULL,0,0),(1003,1110,NULL,0,0),(1003,1112,NULL,0,0);
