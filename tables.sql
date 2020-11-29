-- MySQL dump 10.13  Distrib 8.0.19, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: PRCD
-- ------------------------------------------------------
-- Server version	8.0.19-0ubuntu0.19.10.3

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Steering Committee`
--

DROP TABLE IF EXISTS `Steering_Committee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `Steering_Committee` (
  `role_ID` int(10) NOT NULL,
  `role` char(50) DEFAULT NULL,
  `name` char(50) DEFAULT NULL,
  `cell` bigint(10) DEFAULT NULL,
  `email` char(50) DEFAULT NULL,
  `address` char(100) DEFAULT NULL,
  PRIMARY KEY (`role_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Steering_Committee`
--

LOCK TABLES `Steering_Committee` WRITE;
/*!40000 ALTER TABLE `Steering_Committee` DISABLE KEYS */;
INSERT INTO `Steering_Committee` VALUES (1,"Steering Committee Chair","Shawn Mendes",1111111111,"shawn@case.edu","1, song street, CA"), (2,"Committee Co-Chair","Emily Ratajkowski",2222222222,"emrata@case.edu","1, model street, NY"), (3,"Inventory Manager","Marcus Rashford",3333333333,"marcus@case.edu","1, football street, FL"), (4,"Inventory Manager","Marco Reus",4444444444,"marco10@case.edu","2, football street, FL"),
(5,"Food Pantry Manager","Taylor Swift",5555555555,"tswift@case.edu","2, song street, CA"), (6,"Food Pantry Manager","Loren Gray",6666666666,"gray@case.edu","1, influencer street, IL"),(7,"Real Estate Liason","Will Smith",7777777777,"legend@case.edu","1 actor street, OH"),(8,"Public Relations Officer","Adison Rae",8888888888,"adirae@case.edu","2, influencer street, IL"),
(9,"Operations Manager","Scarlett Johanson" ,9999999999,"blackwidow@case.edu","2, actor street, OH"),(10,"Community Outreach Coordinator","Kanye West",1010101010,"yeezy@case.edu","3, song street, CA"),(12,"Graduate Student Representative","Natalie Portman",1212121212,"nat@case.edu","3 actor street, OH"),(13,"USG Representative" ,"Kim Kardashian West",1313131313,"kkw@case.edu","3, influencer steert, IL"),
(14,"UDC Representative","Kylie Jenner",1414141414,"kylie@case.edu","2, model street, NY"),(15,"Sustainability Ambassador" ,"N'Golo Kante",1515151515,"ng@case.edu","3, football street, FL"),(44,"Personnel Manager","Barack Obama",4848484848,"44th@case.edu","1, president street, DC"),(45,"Personnel Manager","Homer Simpson",4545454545,"simpsons@case.edu","1, cartoon street, GA");
/*!40000 ALTER TABLE ` Steering_Committee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Shifts`
--

DROP TABLE IF EXISTS `Shifts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */
/*!50503 SET character_set_client = utf8 */
CREATE TABLE `Shifts` (
  `shift_date` DATE NOT NULL,
  `shift_time` TIME NOT NULL,
  `capacity` int DEFAULT NULL,
  PRIMARY KEY (`shift_date`, `shift_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Shifts`
--

LOCK TABLES `Shifts` WRITE;
/*!40000 ALTER TABLE `Shifts` DISABLE KEYS */;
INSERT INTO `Shifts` VALUES ("2020-08-15","13:00",4),("2020-08-16","15:00",4),("2020-08-17","13:00",4),("2020-08-18","15:00",4),("2020-08-19","13:00",4),("2020-08-20","15:00",4),("2020-08-21","10:00",7),
("2020-08-22","13:00",4),("2020-08-23","12:00",10),("2020-08-24","13:00",4),("2020-08-25","15:00",4),("2020-08-26","13:00",4),("2020-08-27","15:00",4);
/*!40000 ALTER TABLE `Shifts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Volunteers`
--

DROP TABLE IF EXISTS `Volunteers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `Volunteers` (
  `case_ID` char(7) NOT NULL,
  `name` char(50) NOT NULL,
  `cell` bigint(10) DEFAULT NULL,
  `email` char(50) DEFAULT NULL,
  `type` char(4) NOT NULL,
  `hours` int DEFAULT NULL,
  PRIMARY KEY (`case_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Volunteers`
--

LOCK TABLES `Volunteers` WRITE;
/*!40000 ALTER TABLE `Volunteers` DISABLE KEYS */;
INSERT INTO `Volunteers` VALUES ("aaa111","Aria Adam",1616161616,"aaa111@case.edu","FLEX",2), ("bbb222","Brianna Beach",1717171717,"bbb222@case.edu","LONG",5),("ccc333","Caleb Curry",1818181818,"ccc333@case.edu","FLEX",0),("ddd444","Dylan Douglas",1919191919,"ddd444@case.edu","LONG",8),
("eee555","Emily Erikson",2020202020,"eee555@case.edu","LONG",4),("fff666","Fiona Fragman",2121212121,"fff666@case.edu","LONG",7),("ggg777","Gordon Gullit",2323232323,"ggg777@case.edu","FLEX",1),("hhh888","Hannah Hauber",2424242424,"hhh888@case.edu","LONG",6),("iii999","Iris Illaya",2525252525,"iii999@case.edu","LONG",5),
("jjj1010","Jughead Jones",2626262626,"jjj1010@case.edu","FLEX",4),("kkk1111","Kate Kinglsey",2727272727,"kkk1111@case.edu","LONG",6),("lll1212","Lindsay Lohan",2828282828,"lll1212@case.edu","LONG",8),("mmm1313","Madeiline Myers",2929292929,"mmm1313@case.edu","LONG",6),("nnn1414","Nate Nguyen",3030303030,"nnn1414@case.edu","FLEX",3),
("ooo1515","Oolong Osborne",3131313131,"ooo1515@case.edu","LONG",4),("ppp1616","Peter Parker",3232323232,"ppp1616@case.edu","LONG",7),("rrr1818","Rebecca Robinhood",3434343434,"rrr1818@case.edu","LONG",9);
/*!40000 ALTER TABLE ` Volunteers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Advisors`
--

DROP TABLE IF EXISTS `Advisors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `Advisors` (
  `case_ID` char(7) NOT NULL,
  `name` char(50) NOT NULL,
  `email` char(50) DEFAULT NULL,
  `office` char(100) DEFAULT NULL,
  `speciality` char(50) DEFAULT NULL,
  PRIMARY KEY (`case_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Advisors`
--

LOCK TABLES `Advisors` WRITE;
/*!40000 ALTER TABLE `Advisors` DISABLE KEYS */;
INSERT INTO `Advisors` VALUES ("sss1919","Shannon Shea","sss1919@case.edu","Student Activites and Leadership","Risk and Safety Managment"),("ttt2020","Tiffany Tims","ttt2020@case.edu","Division of Student Affairs","Funding"),("uuu2121","Ulises Umber","uuu2121@case.edu","Office of Real Estate","Real Estate"),("vvv2222","Vivian Vox","vvv2222@case.edu","Sustainailtiy Office","Sustainabiltiy" ),
("www2323","Wiley Willamson","www2323@case.edu","Civic Service Office","Volunteers Recruitment"),("xxx2424","Xander Xage","xxx2424@case.edu","University Procurement Office","Funding"),("yyy2525","Yohann Yogi","yyy2525@case.edu","The Daily","Marketing") ,("zzz2626","Zehra Zalika","zzz2626@case.edu","Office of Multicultural Affairs","Community Engagment");
/*!40000 ALTER TABLE ` Advisors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Inventory`
--

DROP TABLE IF EXISTS `Inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `Inventory` (
  `type` char(100) NOT NULL,
  `qty` int DEFAULT NULL,
  `vendor` char(100) NOT NULL,
  PRIMARY KEY (`type`, `vendor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Inventory`
--

LOCK TABLES `Inventory` WRITE;
/*!40000 ALTER TABLE `Inventory` DISABLE KEYS */;
INSERT INTO `Inventory` VALUES ("Tops",10,"GreekLife"),("Denims",15,"Levis"),("Sweatpants",31,"ResCycle"),("Jackets",5,"NorthFace"), ("Sweaters",25,"ResCycle"), ("Condoms",30,"OhioGov"), ("Shoes",3,"CCEL"),
("Cookware",4,"SA&L"), ("Furniture" ,8,"Thwing"), ("Decorations",7,"ReCylce"), ("Socks",40,"Resilliency"), ("Menstural",23,"Period@CWRU"),("Leather",2,"CoC"),("Menstrual",6,"DivaCup"),("Tops",31,"DicsoverCLE"),
("Denims",14,"CalvinKlein"), ("Tops",12,"ResCycle");
/*!40000 ALTER TABLE ` Inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Food`
--

DROP TABLE IF EXISTS `Food`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `Food` (
  `category` char(100) NOT NULL,
  `accommodations` char(100) DEFAULT NULL,
  `qty` int DEFAULT NULL,
  `vendor` char(100) NOT NULL,
  PRIMARY KEY (`category`, `vendor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Food`
--

LOCK TABLES `Food` WRITE;
/*!40000 ALTER TABLE `Food` DISABLE KEYS */;
INSERT INTO `Food` VALUES ("Dairy","Vegetarian",3,"BonApp"),("Dairy","Vegetarian",2,"FRN"), ("Pasta","Vegan",14,"CFB"), ("Rice","Dairy Free",9,"CoC"), ("Beans","Vegan",6,"FRN"),
("Snack Bars","Vegetarian",12,"OMA"), ("Seafood","Dairy Free",7,"GivingTuesday"), ("Poultry","Dairy Free",8,"GivingTuesday"), ("Cereal","Vegetarian",4,"OMA"),
("Spices","Dairy Free",6,"CoC");
/*!40000 ALTER TABLE ` Food` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Recipe`
--

DROP TABLE IF EXISTS `Recipe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `Recipe` (
  `recipe_ID` int NOT NULL,
  `name` char(100) NOT NULL,
  `weblink` char(200) DEFAULT NULL,
  PRIMARY KEY (`recipe_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Recipe`
--

LOCK TABLES `Recipe` WRITE;
/*!40000 ALTER TABLE `Recipe` DISABLE KEYS */;
INSERT INTO `Recipe` VALUES (8,"Pesto Pasta","makepasta.com"),(12,"Chocolate Cake","makecake.com"),(17,"Vanilla Ice Cream","iceice.com"),(19,"Mousse","ratatouille.com"),(22,"Chicken Wings",NULL),(23,"Chicken Marinara","marinate.com"),(29,"Chicken Parmesan","mamashomecooking.com"),(32,"Seafood Rissotto","littleitaly.com");
/*!40000 ALTER TABLE ` Recipe` ENABLE KEYS */;
UNLOCK TABLES;



--
-- Table structure for table `ManagesItems`
--

DROP TABLE IF EXISTS `ManagesItems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `ManagesItems` (
  `role_ID` int(10) NOT NULL,
  `type` char(100) NOT NULL,
  `vendor` char(100) NOT NULL,
  PRIMARY KEY (`role_ID`,`type`,`vendor`),
  KEY `ManagesItems_type_fk` (`type`),
  KEY `ManagesItems_vendor_fk` (`vendor`),
  CONSTRAINT `ManagesItems_roleID_fk` FOREIGN KEY (`role_ID`) REFERENCES `Steering_Committee` (`role_ID`),
  CONSTRAINT `ManagesItems_inventory_fk` FOREIGN KEY (`type`, `vendor`) REFERENCES `Inventory` (`type`, `vendor`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ManagesItems`
--

LOCK TABLES `ManagesItems` WRITE;
/*!40000 ALTER TABLE `ManagesItems` DISABLE KEYS */;
INSERT INTO `ManagesItems` VALUES (1,'Denims','Levis');
/*!40000 ALTER TABLE `ManagesItems` ENABLE KEYS */;
UNLOCK TABLES;



--
-- Table structure for table `ManagesFood`
--

DROP TABLE IF EXISTS `ManagesFood`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `ManagesFood` (
  `role_ID` int(10) NOT NULL,
  `category` char(100) NOT NULL,
  `vendor` char(100) NOT NULL,
  PRIMARY KEY (`role_ID`,`category`,`vendor`),
  KEY `ManagesFood_category_fk` (`category`),
  KEY `ManagesFood_vendor_fk` (`vendor`),
  CONSTRAINT `ManagesFood_roleID_fk` FOREIGN KEY (`role_ID`) REFERENCES `Steering_Committee` (`role_ID`),
  CONSTRAINT `ManagesFood_food_fk` FOREIGN KEY (`category`, `vendor`) REFERENCES `Food` (`category`, `vendor`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ManagesItems`
--

LOCK TABLES `ManagesFood` WRITE;
/*!40000 ALTER TABLE `ManagesFood` DISABLE KEYS */;
INSERT INTO `ManagesFood` VALUES (1,'Dairy','BonApp');
/*!40000 ALTER TABLE `ManagesFood` ENABLE KEYS */;
UNLOCK TABLES;



--
-- Table structure for table `ManagesPeople`
--

DROP TABLE IF EXISTS `ManagesPeople`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `ManagesPeople` (
  `role_ID` int(10) NOT NULL,
  `case_ID` char(7) NOT NULL,
  PRIMARY KEY (`role_ID`,`case_ID`),
  KEY `ManagesPeople_case_ID_fk` (`case_ID`),
  CONSTRAINT `ManagesPeople_roleID_fk` FOREIGN KEY (`role_ID`) REFERENCES `Steering_Committee` (`role_ID`),
  CONSTRAINT `ManagesPeople_case_ID_fk` FOREIGN KEY (`case_ID`) REFERENCES `Volunteers` (`case_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ManagesPeople`
--

LOCK TABLES `ManagesPeople` WRITE;
/*!40000 ALTER TABLE `ManagesPeople` DISABLE KEYS */;
INSERT INTO `ManagesPeople` VALUES (1,'mmm1313');
/*!40000 ALTER TABLE `ManagesPeople` ENABLE KEYS */;
UNLOCK TABLES;




--
-- Table structure for table `UsedIn`
--

DROP TABLE IF EXISTS `UsedIn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `UsedIn` (
  `recipe_ID` int NOT NULL,
  `category` char(100) NOT NULL,
  PRIMARY KEY (`recipe_ID`,`category`),
  KEY `UsedIn_category_fk` (`category`),
  KEY `UsedIn_recipe_ID_fk` (`recipe_ID`),
  CONSTRAINT `UsedIn_recipe_ID_fk` FOREIGN KEY (`recipe_ID`) REFERENCES `Recipe` (`recipe_ID`),
  CONSTRAINT `UsedIn_category_fk` FOREIGN KEY (`category`) REFERENCES `Food` (`category`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UsedIn`
--

LOCK TABLES `UsedIn` WRITE;
/*!40000 ALTER TABLE `ManagesFood` DISABLE KEYS */;
INSERT INTO `UsedIn` VALUES (12,'Dairy');
/*!40000 ALTER TABLE `ManagesFood` ENABLE KEYS */;
UNLOCK TABLES;





--
-- Table structure for table `Advise`
--

DROP TABLE IF EXISTS `Advise`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `Advise` (
  `role_ID` int(10) NOT NULL,
  `case_ID` char(7) NOT NULL,
  PRIMARY KEY (`role_ID`,`case_ID`),
  KEY `Advise_case_ID_fk` (`case_ID`),
  CONSTRAINT `Advise_roleID_fk` FOREIGN KEY (`role_ID`) REFERENCES `Steering_Committee` (`role_ID`),
  CONSTRAINT `Advise_case_ID_fk` FOREIGN KEY (`case_ID`) REFERENCES `Advisors` (`case_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ManagesPeople`
--

LOCK TABLES `Advise` WRITE;
/*!40000 ALTER TABLE `ManagesPeople` DISABLE KEYS */;
INSERT INTO `Advise` VALUES (1,'sss1919');
/*!40000 ALTER TABLE `ManagesPeople` ENABLE KEYS */;
UNLOCK TABLES;



--
-- Table structure for table `SignUp`
--

DROP TABLE IF EXISTS `SignUp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `SignUp` (
  `case_ID` char(7) NOT NULL,
  `shift_date` DATE NOT NULL,
  `shift_time` TIME NOT NULL,
  PRIMARY KEY (`case_ID`,`shift_date`,`shift_time`),
  KEY `SignUp_date_fk` (`shift_date`),
  KEY `SignUp_time_fk` (`shift_time`),
  CONSTRAINT `SignUp_case_ID_fk` FOREIGN KEY (`case_ID`) REFERENCES `Volunteers` (`case_ID`),
  CONSTRAINT `SignUp_shift_fk` FOREIGN KEY (`shift_date`, `shift_time`) REFERENCES `Shifts` (`shift_date`, `shift_time`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SignUp`
--

LOCK TABLES `SignUp` WRITE;
/*!40000 ALTER TABLE `SignUp` DISABLE KEYS */;
INSERT INTO `SignUp` VALUES ("mmm1313","2020-08-16","15:00");
/*!40000 ALTER TABLE `SignUp` ENABLE KEYS */;
UNLOCK TABLES;
