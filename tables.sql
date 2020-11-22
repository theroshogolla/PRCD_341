-- MySQL dump 10.13  Distrib 8.0.19, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: hackathon_management
-- ------------------------------------------------------
-- Server version	8.0.19-0ubuntu0.19.10.3

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Steering_Committee` (
  `role_ID` int NOT NULL,
  `role` char(30) DEFAULT NULL,
  `name` char(30) DEFAULT NULL,
  `cell` int(20) DEFAULT NULL,
  `email` char(30) DEFAULT NULL,
  `address` char(30) DEFAULT NULL,
  PRIMARY KEY (`role_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Steering_Committee`
--

LOCK TABLES `Steering_Committee` WRITE;
/*!40000 ALTER TABLE `Steering_Committee` DISABLE KEYS */;
INSERT INTO `Steering_Committee` VALUES (1,'Manager','Martin Cara', 2153444, NULL, NULL )
/*!40000 ALTER TABLE ` Steering_Committee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Shifts`
--

DROP TABLE IF EXISTS `Shifts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Shifts` (
  `date` date NOT NULL,
  `time` time NOT NULL,
  `capacity` char(30) DEFAULT NULL,
  PRIMARY KEY (`date`, 'time')
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Shifts`
--

LOCK TABLES `Shifts` WRITE;
/*!40000 ALTER TABLE `Shifts` DISABLE KEYS */;
INSERT INTO `Shifts` VALUES ('2020-01-16','00:00:00' ,10 )
/*!40000 ALTER TABLE `Shifts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Volunteers`
--

DROP TABLE IF EXISTS `Volunteers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Volunteers` (
  `case_ID` int NOT NULL,
  `hours` int DEFAULT NULL,
  `name` char(30) DEFAULT NULL,
  `cell` int(20) DEFAULT NULL,
  `email` char(30) DEFAULT NULL,
  `type` char(30) DEFAULT NULL,
  PRIMARY KEY (`case_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Volunteers`
--

LOCK TABLES `Volunteers` WRITE;
/*!40000 ALTER TABLE `Volunteers` DISABLE KEYS */;
INSERT INTO `Volunteers` VALUES (1, 5,'Martin Cara', 2153444, NULL, NULL )
/*!40000 ALTER TABLE ` Volunteers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Advisors`
--

DROP TABLE IF EXISTS `Advisors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Advisors` (
  `case_ID` int NOT NULL,
  `name` char(30) DEFAULT NULL,
  `email` char(20) DEFAULT NULL,
  `office` char(30) DEFAULT NULL,
  `speciality` char(30) DEFAULT NULL,
  PRIMARY KEY (`case_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Advisors`
--

LOCK TABLES `Advisors` WRITE;
/*!40000 ALTER TABLE `Advisors` DISABLE KEYS */;
INSERT INTO `Advisors` VALUES (1,'Martin Cara', 'csds@gmail.com', NULL, NULL )
/*!40000 ALTER TABLE ` Advisors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Inventory`
--

DROP TABLE IF EXISTS `Inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Inventory` (
  `type` char(100) NOT NULL,
  `vendor` char(100) NOT NULL,
  `qty` int DEFAULT NULL,
  PRIMARY KEY (`type`, 'vendor')
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Inventory`
--

LOCK TABLES `Inventory` WRITE;
/*!40000 ALTER TABLE `Inventory` DISABLE KEYS */;
INSERT INTO `Inventory` VALUES ('bakery','Presti', 10 )
/*!40000 ALTER TABLE ` Inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Food`
--

DROP TABLE IF EXISTS `Food`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Food` (
  `category` char(100) NOT NULL,
  `vendor` char(100) NOT NULL,
  `qty` int DEFAULT NULL,
  'accomodations' char(50) DEFAULT NULL,
  PRIMARY KEY (`category`, 'vendor')
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Food`
--

LOCK TABLES `Food` WRITE;
/*!40000 ALTER TABLE `Food` DISABLE KEYS */;
INSERT INTO `Food` VALUES ('dairy','Daves', 10, NULL )
/*!40000 ALTER TABLE ` Food` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Recipe`
--

DROP TABLE IF EXISTS `Recipe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Recipe` (
  `recipe_ID` int NOT NULL,
  `name` char(100) DEFAULT NULL,
  `weblink` char(500) DEFAULT NULL,
  PRIMARY KEY (`recipe_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Recipe`
--

LOCK TABLES `Recipe` WRITE;
/*!40000 ALTER TABLE `Recipe` DISABLE KEYS */;
INSERT INTO `Recipe` VALUES (100, NULL, NULL )
/*!40000 ALTER TABLE ` Recipe` ENABLE KEYS */;
UNLOCK TABLES;
