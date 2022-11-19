-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: mdebis
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course` (
  `Course_Id` int NOT NULL,
  `Name` varchar(45) NOT NULL,
  `Departmend_Ids` int NOT NULL,
  `Attandence_Limit` int NOT NULL,
  `Student_Ids` text,
  `Days` varchar(40) NOT NULL,
  `Hours` varchar(40) NOT NULL,
  PRIMARY KEY (`Course_Id`),
  KEY `fk_Course_Department1_idx` (`Departmend_Ids`),
  CONSTRAINT `fk_Course_Department1` FOREIGN KEY (`Departmend_Ids`) REFERENCES `department` (`Department_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES (1,'Course Name',1,3,'','4;2','1;1'),(2,'Course Name',1,3,'','2;5','2;5'),(3,'Course Name',1,0,'','3;1','8;3'),(4,'Course Name',1,3,'','5;5','2;3'),(5,'Course Name',1,1,'','3;2','6;2'),(6,'Course Name',1,2,'','5;3','4;2'),(7,'Course Name',1,4,'','1;3','3;3'),(8,'Course Name',1,-1,'','5;2','4;5'),(9,'Course Name',1,1,'','5;1','8;8'),(10,'Course Name',1,-1,'','5;3','2;4'),(11,'Course Name',1,-1,'','1;1','7;2'),(12,'Course Name',1,2,'','2;4','8;3'),(13,'Course Name',1,3,'','4;5','8;6'),(14,'Course Name',1,2,'','5;2','1;8'),(15,'Course Name',1,3,'','5;1','8;8'),(16,'Course Name',1,1,'','1;5','6;7'),(17,'Course Name',1,4,'','1;3','3;6'),(18,'Course Name',1,3,'','5;2','1;2'),(19,'Course Name',1,4,'','5;3','4;6'),(20,'Course Name',2,3,'','5;2','1;4'),(21,'Course Name',2,4,'','2;2','1;2'),(22,'Course Name',2,1,'','1;3','8;1'),(23,'Course Name',2,4,'','2;1','2;1'),(24,'Course Name',2,2,'','4;4','1;3'),(25,'Course Name',2,1,'','1;5','4;7'),(26,'Course Name',2,-1,'','4;4','8;4'),(27,'Course Name',2,2,'','4;1','7;4'),(28,'Course Name',2,1,'','3;5','4;5'),(29,'Course Name',2,2,'','3;3','7;4'),(30,'Course Name',3,4,'','5;3','2;2'),(31,'Course Name',3,4,'','3;4','1;8'),(32,'Course Name',3,4,'','4;4','4;6'),(33,'Course Name',3,-1,'','5;3','4;7'),(34,'Course Name',3,4,'','3;2','1;1'),(35,'Course Name',3,0,'','4;1','6;2'),(36,'Course Name',3,0,'','1;1','7;1'),(37,'Course Name',3,1,'','1;3','6;3'),(38,'Course Name',3,1,'','1;2','2;6'),(39,'Course Name',3,1,'','5;5','7;7'),(40,'Course Name',4,4,'','1;2','5;5'),(41,'Course Name',4,0,'','2;5','3;8'),(42,'Course Name',4,2,'','3;5','6;4'),(43,'Course Name',4,1,'','3;1','3;2'),(44,'Course Name',4,1,'','4;2','1;2'),(45,'Course Name',4,4,'','3;2','1;4'),(46,'Course Name',4,3,'','4;2','2;4'),(47,'Course Name',4,-1,'','2;3','2;6'),(48,'Course Name',4,3,'','3;4','5;3'),(49,'Course Name',4,3,'','5;3','5;8'),(50,'Course Name',5,0,'','4;4','4;4'),(51,'Course Name',5,2,'','2;3','7;1'),(52,'Course Name',5,2,'','4;2','2;3'),(53,'Course Name',5,3,'','4;1','7;4'),(54,'Course Name',5,4,'','3;1','3;6'),(55,'Course Name',5,0,'','2;2','5;1'),(56,'Course Name',5,2,'','3;3','8;3'),(57,'Course Name',5,3,'','5;4','6;3'),(58,'Course Name',5,-1,'','5;3','7;2'),(59,'Course Name',5,3,'','3;4','7;7'),(60,'Course Name',6,4,'','1;1','1;6'),(61,'Course Name',6,-1,'','5;4','7;7'),(62,'Course Name',6,0,'','1;4','4;4'),(63,'Course Name',6,-1,'','2;4','1;3'),(64,'Course Name',6,1,'','2;4','7;2'),(65,'Course Name',6,4,'','2;2','1;1'),(66,'Course Name',6,0,'','3;5','3;8'),(67,'Course Name',6,4,'','5;3','6;5'),(68,'Course Name',6,4,'','3;3','7;2'),(69,'Course Name',6,4,'','1;3','8;4'),(70,'Course Name',7,2,'','3;5','8;4'),(71,'Course Name',7,0,'','5;5','2;3'),(72,'Course Name',7,2,'','5;5','2;1'),(73,'Course Name',7,-1,'','4;4','6;8'),(74,'Course Name',7,4,'','3;3','6;1'),(75,'Course Name',7,4,'','5;1','7;6'),(76,'Course Name',7,4,'','2;1','1;8'),(77,'Course Name',7,2,'','5;2','7;4'),(78,'Course Name',7,4,'','1;1','5;6'),(79,'Course Name',7,1,'','1;4','1;7'),(80,'Course Name',8,2,'','1;1','8;1'),(81,'Course Name',8,3,'','1;2','7;4'),(82,'Course Name',8,-1,'','3;3','8;4'),(83,'Course Name',8,4,'','1;4','7;4'),(84,'Course Name',8,-1,'','4;5','3;5'),(85,'Course Name',8,1,'','5;3','4;2'),(86,'Course Name',8,3,'','1;2','4;2'),(87,'Course Name',8,-1,'','1;5','2;6'),(88,'Course Name',8,4,'','4;2','3;6'),(89,'Course Name',8,1,'','5;5','6;3'),(90,'Course Name',9,3,'','4;2','2;2'),(91,'Course Name',9,-1,'','1;2','5;2'),(92,'Course Name',9,4,'','5;2','4;8'),(93,'Course Name',9,-1,'','5;3','8;6'),(94,'Course Name',9,-1,'','1;2','1;8'),(95,'Course Name',9,3,'','1;1','5;3'),(96,'Course Name',9,4,'','5;5','8;3'),(97,'Course Name',9,0,'','4;4','2;7'),(98,'Course Name',9,4,'','3;1','2;7'),(99,'Course Name',9,0,'','4;3','1;6'),(100,'Course Name',10,-1,'','4;1','4;3'),(101,'Course Name',10,1,'','3;3','7;7'),(102,'Course Name',10,3,'','1;3','8;1'),(103,'Course Name',10,4,'','2;2','5;7'),(104,'Course Name',10,2,'','3;4','4;6'),(105,'Course Name',10,-1,'','5;3','7;4'),(106,'Course Name',10,4,'','1;5','6;2'),(107,'Course Name',10,0,'','3;4','2;3'),(108,'Course Name',10,1,'','2;1','8;2'),(109,'Course Name',10,0,'','1;2','6;2'),(110,'Course Name',11,0,'','4;3','6;8'),(111,'Course Name',11,-1,'','5;2','8;5'),(112,'Course Name',11,4,'','5;1','1;8'),(113,'Course Name',11,3,'','5;5','3;2'),(114,'Course Name',11,2,'','3;4','4;7'),(115,'Course Name',11,2,'','4;4','6;8'),(116,'Course Name',11,-1,'','1;4','1;2'),(117,'Course Name',11,1,'','5;5','5;4'),(118,'Course Name',11,4,'','4;2','2;6'),(119,'Course Name',11,1,'','5;4','3;7'),(120,'Course Name',12,2,'','1;4','2;6'),(121,'Course Name',12,1,'','5;2','6;2'),(122,'Course Name',12,-1,'','5;3','2;6'),(123,'Course Name',12,0,'','5;3','8;4'),(124,'Course Name',12,1,'','2;5','7;2'),(125,'Course Name',12,-1,'','1;3','2;6'),(126,'Course Name',12,2,'','3;2','1;1'),(127,'Course Name',12,1,'','2;3','2;1'),(128,'Course Name',12,0,'','2;4','8;6'),(129,'Course Name',12,0,'','3;1','7;6'),(130,'Course Name',13,-1,'','3;1','6;5'),(131,'Course Name',13,0,'','3;3','3;7'),(132,'Course Name',13,2,'','3;1','8;3'),(133,'Course Name',13,4,'','2;5','6;3'),(134,'Course Name',13,3,'','3;3','6;5'),(135,'Course Name',13,4,'','3;2','8;6'),(136,'Course Name',13,4,'','3;3','1;6'),(137,'Course Name',13,1,'','4;5','7;6'),(138,'Course Name',13,4,'','4;1','3;5'),(139,'Course Name',13,3,'','2;1','5;5'),(140,'Course Name',14,3,'','4;5','4;6'),(141,'Course Name',14,0,'','1;5','6;6'),(142,'Course Name',14,-1,'','3;3','8;7'),(143,'Course Name',14,2,'','3;3','6;3'),(144,'Course Name',14,1,'','4;4','3;7'),(145,'Course Name',14,2,'','1;1','3;3'),(146,'Course Name',14,1,'','3;3','6;2'),(147,'Course Name',14,2,'','5;4','5;2'),(148,'Course Name',14,-1,'','5;5','4;2'),(149,'Course Name',14,4,'','2;2','8;5'),(150,'Course Name',15,2,'','2;5','6;6'),(151,'Course Name',15,-1,'','4;2','1;5'),(152,'Course Name',15,1,'','2;3','6;7'),(153,'Course Name',15,2,'','2;1','1;8'),(154,'Course Name',15,1,'','3;4','3;2'),(155,'Course Name',15,1,'','3;5','1;5'),(156,'Course Name',15,4,'','1;2','7;2'),(157,'Course Name',15,1,'','5;3','2;3'),(158,'Course Name',15,1,'','2;3','7;1'),(159,'Course Name',15,2,'','1;5','3;8'),(160,'Course Name',16,1,'','2;3','1;2'),(161,'Course Name',16,-1,'','3;3','5;8'),(162,'Course Name',16,0,'','2;3','7;5'),(163,'Course Name',16,4,'','2;5','3;7'),(164,'Course Name',16,4,'','2;5','3;4'),(165,'Course Name',16,1,'','2;5','4;1'),(166,'Course Name',16,1,'','2;3','4;8'),(167,'Course Name',16,1,'','5;3','5;7'),(168,'Course Name',16,-1,'','2;3','3;4'),(169,'Course Name',16,4,'','5;2','2;5'),(170,'Course Name',17,3,'','2;4','3;5');
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-20  2:46:46
