-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: localhost    Database: nss
-- ------------------------------------------------------
-- Server version	8.0.20

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
-- Table structure for table `activity`
--

DROP TABLE IF EXISTS `activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activity` (
  `activity_no` int NOT NULL,
  `activity_name` varchar(30) DEFAULT NULL,
  `location` varchar(30) DEFAULT NULL,
  `information` varchar(250) DEFAULT NULL,
  `date` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`activity_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity`
--

LOCK TABLES `activity` WRITE;
/*!40000 ALTER TABLE `activity` DISABLE KEYS */;
INSERT INTO `activity` VALUES (1,'Blood donation','Pune','organised with Jahangir Hospital','Wed Dec 09 2020'),(2,'Cleanliness drive','MCOE','cleaning','Mon Dec 14 2020'),(3,'River Cleanliness Drive','Onkareshwar mandir','Gloves and safety equipments req','Mon Dec 14 2020'),(4,'NSS DAY','Seminar hall,mcoe','51st NSS DAY Celebration','Mon Dec 14 2020'),(5,'Traffic Awareness ','xyz chowk','Street play','Mon Dec 14 2020'),(9,'republic day','mcoe','bcieguf ','Tue Dec 15 2020'),(11,'eee','eee','ee','Tue Dec 15 2020'),(12,'test','test','test','Fri Dec 18 2020');
/*!40000 ALTER TABLE `activity` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `takes_activity` AFTER INSERT ON `activity` FOR EACH ROW INSERT INTO takes VALUES (new.activity_no,'nssmcoe') */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `login_id` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES ('nssmcoe','nss@123');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `display`
--

DROP TABLE IF EXISTS `display`;
/*!50001 DROP VIEW IF EXISTS `display`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `display` AS SELECT 
 1 AS `prn`,
 1 AS `eligibility_no`,
 1 AS `roll_no`,
 1 AS `student_name`,
 1 AS `department`,
 1 AS `year`,
 1 AS `shift`,
 1 AS `designation`,
 1 AS `aadhaar_no`,
 1 AS `gender`,
 1 AS `email_id`,
 1 AS `whatsapp_no`,
 1 AS `category`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `enrolls`
--

DROP TABLE IF EXISTS `enrolls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enrolls` (
  `prn` varchar(20) NOT NULL,
  `login_id` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`prn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enrolls`
--

LOCK TABLES `enrolls` WRITE;
/*!40000 ALTER TABLE `enrolls` DISABLE KEYS */;
INSERT INTO `enrolls` VALUES ('3455','nssmcoe'),('78545','nssmcoe'),('78585488S','nssmcoe'),('8555544','nssmcoe'),('8596666T','nssmcoe'),('8965445K','nssmcoe');
/*!40000 ALTER TABLE `enrolls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `has`
--

DROP TABLE IF EXISTS `has`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `has` (
  `prn` varchar(20) NOT NULL,
  `aadhaar_no` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`prn`),
  KEY `aadhaar_no` (`aadhaar_no`),
  CONSTRAINT `has_ibfk_1` FOREIGN KEY (`aadhaar_no`) REFERENCES `personal_details` (`aadhaar_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `has`
--

LOCK TABLES `has` WRITE;
/*!40000 ALTER TABLE `has` DISABLE KEYS */;
INSERT INTO `has` VALUES ('8965445K','1245697552'),('3455','124677'),('78545','124689'),('8555544','25639745'),('78585488S','59665852'),('8596666T','7878788');
/*!40000 ALTER TABLE `has` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_details`
--

DROP TABLE IF EXISTS `personal_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_details` (
  `aadhaar_no` varchar(15) NOT NULL,
  `gender` varchar(8) DEFAULT NULL,
  `email_id` varchar(30) DEFAULT NULL,
  `whatsapp_no` bigint DEFAULT NULL,
  `category` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`aadhaar_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_details`
--

LOCK TABLES `personal_details` WRITE;
/*!40000 ALTER TABLE `personal_details` DISABLE KEYS */;
INSERT INTO `personal_details` VALUES ('1245697552','Male','ak@gmail.com',8596741230,'ST'),('124677','Male','wq@g.com',1234567890,'ss'),('124689','Male','we@f.com',7410258963,'aa'),('25639745','Male','piyush@gmail.com',4578963201,'obc'),('59665852','Female','pt@mcoe.com',2130548967,'OBC'),('7878788','Female','adkjjj@mcoe.in',9685748203,'Gen');
/*!40000 ALTER TABLE `personal_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `takes`
--

DROP TABLE IF EXISTS `takes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `takes` (
  `activity_no` int NOT NULL,
  `login_id` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`activity_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `takes`
--

LOCK TABLES `takes` WRITE;
/*!40000 ALTER TABLE `takes` DISABLE KEYS */;
INSERT INTO `takes` VALUES (1,'nssmcoe'),(2,'nssmcoe'),(3,'nssmcoe'),(4,'nssmcoe'),(5,'nssmcoe'),(9,'nssmcoe'),(11,'nssmcoe'),(12,'nssmcoe');
/*!40000 ALTER TABLE `takes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `volunteer`
--

DROP TABLE IF EXISTS `volunteer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `volunteer` (
  `prn` varchar(15) NOT NULL,
  `eligibility_no` varchar(15) DEFAULT NULL,
  `roll_no` int DEFAULT NULL,
  `student_name` varchar(30) DEFAULT NULL,
  `department` varchar(20) DEFAULT NULL,
  `year` varchar(10) DEFAULT NULL,
  `shift` varchar(10) DEFAULT NULL,
  `designation` varchar(30) DEFAULT NULL,
  `activity_1` varchar(10) DEFAULT 'Absent',
  `activity_2` varchar(10) DEFAULT 'Absent',
  `activity_3` varchar(10) DEFAULT 'Absent',
  `activity_4` varchar(10) DEFAULT 'Absent',
  `activity_5` varchar(10) DEFAULT 'Absent',
  `activity_9` varchar(10) DEFAULT 'Absent',
  `activity_11` varchar(10) DEFAULT 'Absent',
  `activity_12` varchar(10) DEFAULT 'Absent',
  PRIMARY KEY (`prn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `volunteer`
--

LOCK TABLES `volunteer` WRITE;
/*!40000 ALTER TABLE `volunteer` DISABLE KEYS */;
INSERT INTO `volunteer` VALUES ('3455','22333',22222,'Shubham','ELEC','TE','Second','Member','Present','Absent','Present','Present','Absent','Absent','Absent','Absent'),('78545','5555',3445,'Aditya','COMP','TE','First','Member','Present','Present','Present','Present','Absent','Present','Absent','Absent'),('78585488S','4598522',563442,'Pooja Tiwari','ENTC','SE','Second','Member','Absent','Absent','Absent','Absent','Present','Present','Absent','Absent'),('8555544','12828283',8968745,'Piyush Adhalikar','ELEC','BE','First','Member','Absent','Absent','Present','Absent','Present','Absent','Absent','Absent'),('8596666T','4455455',859674,'Aditi Singh','MECH','BE','Second','Member','Absent','Present','Present','Present','Absent','Present','Absent','Absent'),('8965445K','5938412',35034,'Abhishek Khetre','IT','TE','First','Member','Absent','Present','Absent','Absent','Present','Present','Absent','Absent');
/*!40000 ALTER TABLE `volunteer` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `enrolls_volunteer` AFTER INSERT ON `volunteer` FOR EACH ROW INSERT INTO enrolls VALUES (new.prn,'nssmcoe') */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `display`
--

/*!50001 DROP VIEW IF EXISTS `display`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `display` AS select `v`.`prn` AS `prn`,`v`.`eligibility_no` AS `eligibility_no`,`v`.`roll_no` AS `roll_no`,`v`.`student_name` AS `student_name`,`v`.`department` AS `department`,`v`.`year` AS `year`,`v`.`shift` AS `shift`,`v`.`designation` AS `designation`,`p`.`aadhaar_no` AS `aadhaar_no`,`p`.`gender` AS `gender`,`p`.`email_id` AS `email_id`,`p`.`whatsapp_no` AS `whatsapp_no`,`p`.`category` AS `category` from ((`volunteer` `v` join `personal_details` `p`) join `has` `h`) where ((`h`.`aadhaar_no` = `p`.`aadhaar_no`) and (`h`.`prn` = `v`.`prn`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-19 16:00:09
