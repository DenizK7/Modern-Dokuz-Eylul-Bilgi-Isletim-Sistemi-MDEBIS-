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
  `Days` varchar(40) NOT NULL,
  `Hours` varchar(40) NOT NULL,
  `Credit` int NOT NULL,
  PRIMARY KEY (`Course_Id`),
  KEY `fk_Course_Department1_idx` (`Departmend_Ids`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES (1,'Course Name',1,2,'3;5','8;1',1),(2,'Course Name',1,3,'2;4','7;3',2),(3,'Course Name',1,-1,'2;4','6;6',4),(4,'Course Name',1,1,'2;1','1;4',4),(5,'Course Name',1,2,'3;3','1;8',2),(6,'Course Name',1,-1,'5;2','6;6',4),(7,'Course Name',1,4,'1;2','6;6',2),(8,'Course Name',1,1,'5;5','2;1',1),(9,'Course Name',1,-1,'2;3','6;4',1),(10,'Course Name',1,1,'4;3','1;2',0),(11,'Course Name',1,3,'1;3','2;8',2),(12,'Course Name',1,2,'2;4','5;8',2),(13,'Course Name',1,1,'2;1','7;5',0),(14,'Course Name',1,3,'2;5','7;2',4),(15,'Course Name',1,-1,'3;4','5;8',3),(16,'Course Name',1,3,'4;2','3;2',1),(17,'Course Name',1,2,'4;2','2;4',3),(18,'Course Name',1,1,'4;5','7;3',2),(19,'Course Name',1,0,'1;1','6;2',3),(20,'Course Name',1,2,'1;5','7;6',0),(21,'Course Name',1,0,'2;5','2;6',1),(22,'Course Name',1,2,'4;2','6;6',4),(23,'Course Name',1,1,'2;3','3;7',0),(24,'Course Name',1,3,'1;3','3;7',2),(25,'Course Name',1,-1,'4;4','1;5',4),(26,'Course Name',1,0,'5;2','7;2',2),(27,'Course Name',1,1,'4;4','7;1',0),(28,'Course Name',1,1,'2;5','7;7',4),(29,'Course Name',1,-1,'4;4','5;2',2),(30,'Course Name',1,2,'3;2','6;5',0),(31,'Course Name',1,4,'1;1','6;7',0),(32,'Course Name',1,3,'3;1','8;1',1),(33,'Course Name',1,4,'1;5','4;2',3),(34,'Course Name',1,2,'2;3','8;3',2),(35,'Course Name',1,3,'2;4','4;1',0),(36,'Course Name',2,-1,'1;5','8;7',1),(37,'Course Name',2,-1,'2;4','7;5',0),(38,'Course Name',2,0,'5;2','3;1',4),(39,'Course Name',2,1,'4;3','6;5',0),(40,'Course Name',2,-1,'1;2','6;3',3),(41,'Course Name',2,4,'2;2','3;8',4),(42,'Course Name',2,2,'4;3','3;8',3),(43,'Course Name',2,1,'5;5','5;5',0),(44,'Course Name',2,-1,'1;5','2;5',2),(45,'Course Name',2,1,'4;2','7;2',1),(46,'Course Name',2,1,'5;4','5;6',3),(47,'Course Name',2,-1,'5;4','2;1',1),(48,'Course Name',2,2,'2;5','2;6',1),(49,'Course Name',2,0,'1;3','6;7',2),(50,'Course Name',2,3,'4;1','4;1',0),(51,'Course Name',2,0,'4;3','8;6',0),(52,'Course Name',2,0,'5;3','1;5',0),(53,'Course Name',2,3,'3;3','8;5',0),(54,'Course Name',2,0,'5;2','5;6',4),(55,'Course Name',2,4,'1;3','2;4',1),(56,'Course Name',2,1,'1;1','1;2',3),(57,'Course Name',2,-1,'4;5','1;4',1),(58,'Course Name',2,2,'2;3','5;1',1),(59,'Course Name',2,0,'4;1','7;6',0),(60,'Course Name',2,4,'5;1','6;1',0),(61,'Course Name',2,2,'2;5','3;4',4),(62,'Course Name',2,4,'2;1','5;5',3),(63,'Course Name',2,2,'4;2','3;8',1),(64,'Course Name',2,3,'2;1','7;7',2),(65,'Course Name',2,2,'2;3','6;3',3),(66,'Course Name',2,4,'4;1','1;7',2),(67,'Course Name',2,4,'1;2','1;4',3),(68,'Course Name',2,2,'2;1','2;6',3),(69,'Course Name',2,0,'2;2','7;3',1),(70,'Course Name',2,3,'2;4','6;6',0),(71,'Course Name',3,-1,'5;1','5;3',4),(72,'Course Name',3,3,'3;4','5;8',4),(73,'Course Name',3,-1,'4;2','2;7',4),(74,'Course Name',3,-1,'4;3','4;6',3),(75,'Course Name',3,1,'4;4','6;7',3),(76,'Course Name',3,2,'1;2','1;1',1),(77,'Course Name',3,1,'3;3','1;5',3),(78,'Course Name',3,4,'1;4','2;6',0),(79,'Course Name',3,1,'1;3','7;3',4),(80,'Course Name',3,0,'1;2','8;6',0),(81,'Course Name',3,-1,'5;1','8;2',4),(82,'Course Name',3,0,'4;5','7;5',1),(83,'Course Name',3,1,'3;3','4;7',1),(84,'Course Name',3,0,'3;5','6;3',3),(85,'Course Name',3,0,'2;1','3;3',1),(86,'Course Name',3,0,'2;1','8;8',0),(87,'Course Name',3,3,'3;5','4;8',1),(88,'Course Name',3,2,'1;4','8;2',4),(89,'Course Name',3,0,'4;4','8;5',0),(90,'Course Name',3,3,'4;5','4;2',1),(91,'Course Name',3,0,'3;4','1;1',2),(92,'Course Name',3,3,'1;3','1;7',3),(93,'Course Name',3,3,'2;2','4;5',1),(94,'Course Name',3,-1,'2;3','6;6',3),(95,'Course Name',3,4,'1;4','3;1',4),(96,'Course Name',3,0,'3;4','8;6',0),(97,'Course Name',3,4,'1;2','5;2',2),(98,'Course Name',3,4,'1;4','3;1',1),(99,'Course Name',3,2,'2;3','8;2',2),(100,'Course Name',3,1,'2;1','6;8',3),(101,'Course Name',3,1,'1;2','3;8',0),(102,'Course Name',3,2,'3;5','8;7',0),(103,'Course Name',3,-1,'5;2','3;1',3),(104,'Course Name',3,1,'3;4','7;6',3),(105,'Course Name',3,1,'2;1','4;6',4),(106,'Course Name',4,0,'3;4','2;1',4),(107,'Course Name',4,2,'1;5','7;6',0),(108,'Course Name',4,0,'5;3','5;5',0),(109,'Course Name',4,3,'5;4','2;1',0),(110,'Course Name',4,0,'5;1','8;1',2),(111,'Course Name',4,-1,'2;4','4;6',1),(112,'Course Name',4,2,'4;3','7;1',1),(113,'Course Name',4,4,'2;2','4;6',1),(114,'Course Name',4,0,'3;1','5;3',4),(115,'Course Name',4,2,'5;3','6;8',0),(116,'Course Name',4,4,'1;4','6;2',4),(117,'Course Name',4,4,'4;4','3;4',3),(118,'Course Name',4,3,'2;1','8;4',2),(119,'Course Name',4,-1,'5;3','2;8',1),(120,'Course Name',4,4,'4;3','4;4',3),(121,'Course Name',4,1,'1;3','3;6',4),(122,'Course Name',4,-1,'4;5','3;7',1),(123,'Course Name',4,1,'5;4','5;1',0),(124,'Course Name',4,1,'2;3','8;1',1),(125,'Course Name',4,3,'5;4','7;2',0),(126,'Course Name',4,0,'2;3','4;6',2),(127,'Course Name',4,-1,'3;5','5;1',1),(128,'Course Name',4,-1,'4;1','4;3',1),(129,'Course Name',4,-1,'1;5','6;2',3),(130,'Course Name',4,4,'5;5','2;4',1),(131,'Course Name',4,3,'1;3','7;2',4),(132,'Course Name',4,0,'2;5','5;1',4),(133,'Course Name',4,3,'2;4','5;6',3),(134,'Course Name',4,0,'4;5','7;7',2),(135,'Course Name',4,3,'4;2','7;4',1),(136,'Course Name',4,0,'4;5','6;8',3),(137,'Course Name',4,2,'1;3','4;5',2),(138,'Course Name',4,4,'4;5','3;3',4),(139,'Course Name',4,1,'4;5','8;8',2),(140,'Course Name',4,-1,'5;4','7;4',0),(141,'Course Name',5,4,'3;1','3;1',0),(142,'Course Name',5,2,'1;3','8;5',1),(143,'Course Name',5,2,'3;4','2;2',1),(144,'Course Name',5,-1,'1;4','7;3',1),(145,'Course Name',5,2,'5;5','8;2',1),(146,'Course Name',5,-1,'5;2','3;7',3),(147,'Course Name',5,-1,'2;1','1;3',1),(148,'Course Name',5,4,'1;2','2;7',0),(149,'Course Name',5,-1,'2;4','2;8',1),(150,'Course Name',5,1,'4;1','8;1',2),(151,'Course Name',5,4,'5;5','2;7',1),(152,'Course Name',5,4,'2;1','7;1',2),(153,'Course Name',5,4,'1;4','2;8',4),(154,'Course Name',5,1,'1;5','6;6',4),(155,'Course Name',5,3,'1;4','8;2',1),(156,'Course Name',5,0,'5;4','8;2',0),(157,'Course Name',5,3,'1;1','4;3',1),(158,'Course Name',5,0,'4;1','6;2',0),(159,'Course Name',5,-1,'2;3','1;4',0),(160,'Course Name',5,3,'2;3','4;3',1),(161,'Course Name',5,2,'1;2','7;8',0),(162,'Course Name',5,2,'4;2','4;6',2),(163,'Course Name',5,0,'4;4','1;2',3),(164,'Course Name',5,4,'5;3','1;2',1),(165,'Course Name',5,4,'4;1','5;6',1),(166,'Course Name',5,3,'1;2','4;4',1),(167,'Course Name',5,3,'3;4','8;8',3),(168,'Course Name',5,0,'1;2','6;7',2),(169,'Course Name',5,0,'5;4','8;6',0),(170,'Course Name',5,1,'3;5','1;2',4),(171,'Course Name',5,0,'1;4','2;3',4),(172,'Course Name',5,-1,'1;3','7;8',0),(173,'Course Name',5,3,'5;3','1;6',2),(174,'Course Name',5,2,'1;4','1;7',1),(175,'Course Name',5,-1,'1;2','3;5',3),(176,'Course Name',6,0,'3;5','1;1',0),(177,'Course Name',6,-1,'2;1','4;3',3),(178,'Course Name',6,-1,'3;1','1;8',3),(179,'Course Name',6,4,'5;1','5;4',1),(180,'Course Name',6,4,'4;2','5;5',0),(181,'Course Name',6,1,'2;3','6;1',1),(182,'Course Name',6,-1,'4;4','3;3',4),(183,'Course Name',6,0,'3;4','5;5',4),(184,'Course Name',6,3,'1;4','1;4',2),(185,'Course Name',6,3,'4;2','5;2',2),(186,'Course Name',6,1,'4;4','3;8',2),(187,'Course Name',6,1,'3;1','1;5',4),(188,'Course Name',6,2,'5;3','7;5',3),(189,'Course Name',6,1,'5;2','1;2',1),(190,'Course Name',6,2,'3;1','3;3',3),(191,'Course Name',6,3,'5;5','4;4',0),(192,'Course Name',6,-1,'4;5','8;2',3),(193,'Course Name',6,3,'4;3','8;3',0),(194,'Course Name',6,1,'4;2','7;1',4),(195,'Course Name',6,2,'1;4','2;6',3),(196,'Course Name',6,1,'4;2','1;6',3),(197,'Course Name',6,3,'4;1','1;5',4),(198,'Course Name',6,1,'3;5','1;7',4),(199,'Course Name',6,0,'1;2','7;7',3),(200,'Course Name',6,0,'4;1','6;1',0),(201,'Course Name',6,2,'4;1','2;7',3),(202,'Course Name',6,3,'5;1','1;3',1),(203,'Course Name',6,-1,'3;4','2;6',0),(204,'Course Name',6,0,'3;5','3;7',2),(205,'Course Name',6,3,'1;5','6;8',1),(206,'Course Name',6,0,'1;3','7;1',4),(207,'Course Name',6,-1,'1;1','1;4',4),(208,'Course Name',6,1,'5;4','8;3',0),(209,'Course Name',6,2,'5;2','4;6',4),(210,'Course Name',6,-1,'2;5','2;7',1),(211,'Course Name',7,2,'5;4','8;2',3),(212,'Course Name',7,4,'5;3','1;8',0),(213,'Course Name',7,1,'4;3','3;4',2),(214,'Course Name',7,1,'3;4','2;5',2),(215,'Course Name',7,4,'5;2','3;3',4),(216,'Course Name',7,-1,'4;2','4;4',1),(217,'Course Name',7,4,'2;1','3;3',1),(218,'Course Name',7,2,'5;3','8;1',2),(219,'Course Name',7,0,'5;2','2;5',3),(220,'Course Name',7,3,'4;1','2;6',2),(221,'Course Name',7,3,'2;4','5;1',2),(222,'Course Name',7,-1,'3;1','1;8',3),(223,'Course Name',7,0,'4;4','8;3',2),(224,'Course Name',7,2,'5;5','2;5',4),(225,'Course Name',7,2,'5;3','5;5',1),(226,'Course Name',7,-1,'3;1','8;1',1),(227,'Course Name',7,0,'3;1','4;2',4),(228,'Course Name',7,4,'3;3','3;2',2),(229,'Course Name',7,0,'3;5','5;4',1),(230,'Course Name',7,-1,'2;3','8;3',2),(231,'Course Name',7,1,'5;4','2;7',2),(232,'Course Name',7,2,'1;3','6;4',1),(233,'Course Name',7,0,'3;2','2;2',2),(234,'Course Name',7,0,'1;1','4;7',0),(235,'Course Name',7,4,'4;1','7;3',3),(236,'Course Name',7,3,'3;2','5;6',4),(237,'Course Name',7,4,'3;5','4;3',3),(238,'Course Name',7,4,'5;2','7;5',3),(239,'Course Name',7,4,'2;3','2;4',2),(240,'Course Name',7,2,'5;1','4;7',0),(241,'Course Name',7,2,'5;4','4;1',3),(242,'Course Name',7,1,'5;1','4;1',1),(243,'Course Name',7,-1,'4;2','4;7',3),(244,'Course Name',7,0,'1;2','6;5',1),(245,'Course Name',7,4,'1;3','5;4',3),(246,'Course Name',8,0,'5;5','7;8',3),(247,'Course Name',8,-1,'3;5','4;1',0),(248,'Course Name',8,4,'2;4','3;6',4),(249,'Course Name',8,0,'1;2','3;6',4),(250,'Course Name',8,1,'3;5','6;2',0),(251,'Course Name',8,-1,'1;4','7;8',0),(252,'Course Name',8,3,'5;3','2;7',1),(253,'Course Name',8,0,'5;1','3;1',0),(254,'Course Name',8,1,'4;3','8;8',0),(255,'Course Name',8,3,'1;4','3;7',1),(256,'Course Name',8,4,'4;5','2;6',4),(257,'Course Name',8,1,'5;1','7;4',4),(258,'Course Name',8,2,'4;1','3;7',1),(259,'Course Name',8,4,'5;4','6;5',2),(260,'Course Name',8,0,'3;5','8;1',1),(261,'Course Name',8,2,'3;1','2;4',0),(262,'Course Name',8,1,'4;2','6;3',3),(263,'Course Name',8,1,'1;4','3;4',2),(264,'Course Name',8,2,'1;2','6;7',0),(265,'Course Name',8,1,'4;4','7;4',0),(266,'Course Name',8,3,'3;3','2;8',2),(267,'Course Name',8,0,'2;4','6;8',0),(268,'Course Name',8,2,'4;4','6;5',4),(269,'Course Name',8,4,'3;5','7;8',4),(270,'Course Name',8,3,'2;1','7;3',2),(271,'Course Name',8,-1,'3;1','1;6',4),(272,'Course Name',8,1,'4;1','3;1',4),(273,'Course Name',8,1,'3;5','8;1',4),(274,'Course Name',8,0,'1;4','8;5',0),(275,'Course Name',8,1,'5;3','1;2',3),(276,'Course Name',8,4,'5;2','4;7',1),(277,'Course Name',8,-1,'1;2','4;4',1),(278,'Course Name',8,3,'2;3','7;4',1),(279,'Course Name',8,2,'2;5','8;3',2),(280,'Course Name',8,0,'5;5','5;8',2),(281,'Course Name',9,4,'2;3','8;8',4),(282,'Course Name',9,-1,'5;1','4;1',4),(283,'Course Name',9,4,'4;4','6;6',4),(284,'Course Name',9,2,'3;5','7;1',3),(285,'Course Name',9,4,'2;4','4;4',0),(286,'Course Name',9,4,'5;5','1;6',2),(287,'Course Name',9,4,'5;3','8;4',4),(288,'Course Name',9,0,'5;5','4;1',2),(289,'Course Name',9,2,'5;2','7;6',3),(290,'Course Name',9,2,'4;1','8;6',0),(291,'Course Name',9,3,'1;1','2;5',2),(292,'Course Name',9,4,'2;1','6;6',3),(293,'Course Name',9,2,'5;3','3;1',3),(294,'Course Name',9,1,'5;5','4;3',3),(295,'Course Name',9,4,'2;4','4;3',4),(296,'Course Name',9,0,'4;5','8;5',2),(297,'Course Name',9,4,'1;5','5;6',1),(298,'Course Name',9,0,'5;2','8;2',1),(299,'Course Name',9,4,'2;1','7;7',3),(300,'Course Name',9,1,'2;2','5;6',0),(301,'Course Name',9,0,'5;2','4;3',4),(302,'Course Name',9,0,'3;1','5;6',4),(303,'Course Name',9,4,'1;1','3;7',2),(304,'Course Name',9,-1,'1;5','5;7',0),(305,'Course Name',9,-1,'1;2','2;4',1),(306,'Course Name',9,0,'5;1','5;2',1),(307,'Course Name',9,2,'5;5','7;2',0),(308,'Course Name',9,3,'4;1','8;4',0),(309,'Course Name',9,0,'5;2','3;2',0),(310,'Course Name',9,-1,'5;5','3;2',1),(311,'Course Name',9,2,'2;3','8;3',3),(312,'Course Name',9,2,'5;1','4;8',0),(313,'Course Name',9,3,'1;2','6;7',1),(314,'Course Name',9,1,'1;2','2;7',2),(315,'Course Name',9,0,'5;4','4;4',0),(316,'Course Name',10,0,'2;3','5;3',3),(317,'Course Name',10,3,'1;5','6;6',3),(318,'Course Name',10,4,'2;5','3;3',1),(319,'Course Name',10,3,'3;3','5;5',1),(320,'Course Name',10,2,'1;5','8;2',4),(321,'Course Name',10,1,'5;1','5;7',2),(322,'Course Name',10,-1,'3;5','4;8',2),(323,'Course Name',10,-1,'5;5','3;6',4),(324,'Course Name',10,3,'1;4','3;5',1),(325,'Course Name',10,2,'4;1','6;3',1),(326,'Course Name',10,-1,'1;2','5;4',2),(327,'Course Name',10,-1,'5;4','4;6',0),(328,'Course Name',10,2,'2;5','2;6',0),(329,'Course Name',10,2,'2;3','3;1',1),(330,'Course Name',10,0,'1;4','2;6',0),(331,'Course Name',10,1,'5;5','3;6',3),(332,'Course Name',10,0,'4;5','7;3',1),(333,'Course Name',10,-1,'3;1','1;3',4),(334,'Course Name',10,-1,'4;5','7;1',1),(335,'Course Name',10,-1,'2;2','3;4',1),(336,'Course Name',10,1,'2;5','8;5',4),(337,'Course Name',10,2,'5;5','5;1',0),(338,'Course Name',10,0,'1;3','1;1',1),(339,'Course Name',10,4,'2;1','8;2',1),(340,'Course Name',10,3,'5;3','7;6',1),(341,'Course Name',10,4,'1;4','4;5',0),(342,'Course Name',10,1,'4;3','6;3',3),(343,'Course Name',10,3,'4;2','8;3',0),(344,'Course Name',10,3,'2;3','2;5',1),(345,'Course Name',10,-1,'3;5','2;7',2),(346,'Course Name',10,4,'5;1','5;7',0),(347,'Course Name',10,1,'4;4','1;6',1),(348,'Course Name',10,-1,'5;4','1;5',0),(349,'Course Name',10,1,'1;1','7;1',1),(350,'Course Name',10,0,'5;4','1;1',0),(351,'Course Name',11,2,'3;4','2;6',3),(352,'Course Name',11,2,'1;3','3;8',3),(353,'Course Name',11,-1,'5;3','3;6',0),(354,'Course Name',11,1,'5;1','8;6',4),(355,'Course Name',11,-1,'3;2','7;5',2),(356,'Course Name',11,3,'4;3','2;7',4),(357,'Course Name',11,2,'5;4','7;2',1),(358,'Course Name',11,2,'3;2','2;5',1),(359,'Course Name',11,3,'3;4','1;6',4),(360,'Course Name',11,0,'2;4','7;3',4),(361,'Course Name',11,4,'5;2','8;3',1),(362,'Course Name',11,2,'1;2','7;6',4),(363,'Course Name',11,4,'5;4','8;3',1),(364,'Course Name',11,0,'2;3','6;4',4),(365,'Course Name',11,4,'3;2','7;3',0),(366,'Course Name',11,2,'2;3','4;1',3),(367,'Course Name',11,3,'4;3','5;7',3),(368,'Course Name',11,2,'5;4','5;3',1),(369,'Course Name',11,3,'2;2','3;5',2),(370,'Course Name',11,1,'2;4','8;4',0),(371,'Course Name',11,4,'3;5','2;5',2),(372,'Course Name',11,0,'5;1','6;7',2),(373,'Course Name',11,4,'1;2','3;2',4),(374,'Course Name',11,1,'5;2','8;1',1),(375,'Course Name',11,2,'4;4','3;7',1),(376,'Course Name',11,1,'5;4','8;3',1),(377,'Course Name',11,3,'4;3','8;5',4),(378,'Course Name',11,3,'5;3','2;3',0),(379,'Course Name',11,3,'1;5','4;6',2),(380,'Course Name',11,1,'1;1','4;3',4),(381,'Course Name',11,0,'5;2','5;5',2),(382,'Course Name',11,4,'5;4','1;6',3),(383,'Course Name',11,-1,'3;5','3;7',4),(384,'Course Name',11,0,'2;3','4;2',1),(385,'Course Name',11,1,'5;4','3;1',1),(386,'Course Name',12,1,'5;2','3;8',0),(387,'Course Name',12,0,'4;5','3;7',3),(388,'Course Name',12,1,'4;4','6;5',0),(389,'Course Name',12,2,'2;5','7;1',2),(390,'Course Name',12,-1,'5;5','2;8',3),(391,'Course Name',12,-1,'3;3','7;2',4),(392,'Course Name',12,3,'4;3','8;8',3),(393,'Course Name',12,3,'2;2','1;7',3),(394,'Course Name',12,4,'5;4','2;7',3),(395,'Course Name',12,0,'2;4','1;5',3),(396,'Course Name',12,4,'3;2','6;2',4),(397,'Course Name',12,2,'1;5','2;6',4),(398,'Course Name',12,0,'4;3','5;5',4),(399,'Course Name',12,3,'1;3','2;2',4),(400,'Course Name',12,3,'3;3','6;3',3),(401,'Course Name',12,2,'3;1','1;4',1),(402,'Course Name',12,0,'1;2','8;5',1),(403,'Course Name',12,1,'4;4','6;7',1),(404,'Course Name',12,1,'2;4','6;8',3),(405,'Course Name',12,0,'2;4','4;4',2),(406,'Course Name',12,1,'4;3','6;4',1),(407,'Course Name',12,2,'2;3','3;3',0),(408,'Course Name',12,3,'4;5','3;7',0),(409,'Course Name',12,4,'5;5','1;4',1),(410,'Course Name',12,-1,'1;3','7;2',0),(411,'Course Name',12,1,'2;4','2;3',0),(412,'Course Name',12,2,'1;3','5;3',3),(413,'Course Name',12,3,'5;2','1;7',3),(414,'Course Name',12,1,'3;5','4;5',1),(415,'Course Name',12,-1,'2;4','4;5',4),(416,'Course Name',12,-1,'2;1','5;1',1),(417,'Course Name',12,0,'3;2','4;7',3),(418,'Course Name',12,0,'1;4','7;4',1),(419,'Course Name',12,1,'1;1','5;2',1),(420,'Course Name',12,4,'1;5','4;3',3),(421,'Course Name',13,-1,'5;3','1;5',0),(422,'Course Name',13,2,'5;2','1;3',3),(423,'Course Name',13,3,'2;2','7;4',4),(424,'Course Name',13,1,'4;1','1;3',0),(425,'Course Name',13,3,'5;1','7;1',4),(426,'Course Name',13,2,'2;4','1;6',2),(427,'Course Name',13,2,'1;2','7;3',1),(428,'Course Name',13,1,'3;1','2;6',3),(429,'Course Name',13,-1,'2;2','5;5',4),(430,'Course Name',13,-1,'3;1','5;1',0),(431,'Course Name',13,4,'5;2','2;3',0),(432,'Course Name',13,3,'1;3','1;1',2),(433,'Course Name',13,2,'1;5','4;5',1),(434,'Course Name',13,1,'3;5','8;5',1),(435,'Course Name',13,1,'5;5','5;7',4),(436,'Course Name',13,3,'1;4','5;4',4),(437,'Course Name',13,3,'2;5','8;7',0),(438,'Course Name',13,3,'4;5','3;4',0),(439,'Course Name',13,1,'5;1','5;4',2),(440,'Course Name',13,0,'1;2','1;4',3),(441,'Course Name',13,3,'4;3','3;3',1),(442,'Course Name',13,-1,'5;1','5;1',4),(443,'Course Name',13,3,'2;4','3;8',3),(444,'Course Name',13,1,'4;5','7;6',1),(445,'Course Name',13,4,'3;2','4;2',1),(446,'Course Name',13,-1,'1;1','7;8',3),(447,'Course Name',13,3,'2;5','2;1',1),(448,'Course Name',13,2,'1;5','7;1',1),(449,'Course Name',13,4,'5;2','7;1',3),(450,'Course Name',13,3,'5;5','5;2',0),(451,'Course Name',13,1,'2;3','1;6',3),(452,'Course Name',13,1,'3;1','8;5',4),(453,'Course Name',13,4,'4;4','6;6',3),(454,'Course Name',13,-1,'1;1','5;7',4),(455,'Course Name',13,1,'1;5','4;1',1),(456,'Course Name',14,1,'5;5','5;8',0),(457,'Course Name',14,3,'4;1','7;7',0),(458,'Course Name',14,2,'2;1','2;4',3),(459,'Course Name',14,1,'3;5','5;1',0),(460,'Course Name',14,3,'5;3','8;2',2),(461,'Course Name',14,4,'3;1','5;1',1),(462,'Course Name',14,3,'4;1','7;3',2),(463,'Course Name',14,0,'1;5','6;8',3),(464,'Course Name',14,2,'1;1','6;5',4),(465,'Course Name',14,1,'3;2','7;1',2),(466,'Course Name',14,0,'1;5','3;1',1),(467,'Course Name',14,1,'5;2','6;6',2),(468,'Course Name',14,2,'1;3','7;3',2),(469,'Course Name',14,4,'1;2','6;8',1),(470,'Course Name',14,1,'1;1','5;8',0),(471,'Course Name',14,3,'2;4','7;2',4),(472,'Course Name',14,-1,'1;2','1;3',0),(473,'Course Name',14,3,'2;3','5;1',1),(474,'Course Name',14,0,'2;1','1;7',0),(475,'Course Name',14,2,'2;4','3;6',0),(476,'Course Name',14,0,'3;3','2;4',0),(477,'Course Name',14,-1,'2;2','2;5',2),(478,'Course Name',14,1,'3;3','6;4',4),(479,'Course Name',14,0,'4;3','7;4',1),(480,'Course Name',14,1,'1;5','4;2',3),(481,'Course Name',14,3,'4;4','7;5',2),(482,'Course Name',14,2,'2;3','4;4',4),(483,'Course Name',14,3,'1;1','8;7',0),(484,'Course Name',14,-1,'2;4','2;6',0),(485,'Course Name',14,0,'2;4','8;3',3),(486,'Course Name',14,0,'2;2','1;3',3),(487,'Course Name',14,1,'5;3','4;2',2),(488,'Course Name',14,1,'2;3','4;1',3),(489,'Course Name',14,-1,'4;3','8;1',4),(490,'Course Name',14,0,'3;5','4;4',3),(491,'Course Name',15,2,'1;4','8;4',3),(492,'Course Name',15,2,'2;3','3;3',1),(493,'Course Name',15,4,'2;2','4;8',2),(494,'Course Name',15,-1,'1;2','5;7',0),(495,'Course Name',15,-1,'3;1','2;1',3),(496,'Course Name',15,0,'1;1','1;1',2),(497,'Course Name',15,3,'1;5','1;8',3),(498,'Course Name',15,1,'3;1','1;5',2),(499,'Course Name',15,3,'2;5','5;1',3),(500,'Course Name',15,2,'3;2','4;4',2),(501,'Course Name',15,3,'3;3','8;6',0),(502,'Course Name',15,2,'4;4','1;8',2),(503,'Course Name',15,1,'2;4','7;2',4),(504,'Course Name',15,1,'3;2','4;1',3),(505,'Course Name',15,3,'5;2','6;3',3),(506,'Course Name',15,0,'3;2','6;1',4),(507,'Course Name',15,1,'2;2','1;4',0),(508,'Course Name',15,3,'5;4','4;7',3),(509,'Course Name',15,0,'1;4','1;3',2),(510,'Course Name',15,4,'1;5','8;8',2),(511,'Course Name',15,3,'1;2','6;2',3),(512,'Course Name',15,2,'1;4','1;4',0),(513,'Course Name',15,1,'2;1','4;3',4),(514,'Course Name',15,2,'4;1','4;7',4),(515,'Course Name',15,-1,'4;2','5;8',0),(516,'Course Name',15,4,'2;4','4;4',4),(517,'Course Name',15,0,'3;2','6;6',4),(518,'Course Name',15,3,'3;3','7;3',4),(519,'Course Name',15,0,'5;5','2;8',2),(520,'Course Name',15,4,'4;2','3;7',1),(521,'Course Name',15,2,'2;2','7;4',1),(522,'Course Name',15,1,'5;4','5;2',2),(523,'Course Name',15,0,'4;5','3;3',0),(524,'Course Name',15,1,'4;5','8;1',1),(525,'Course Name',15,-1,'3;1','7;3',4),(526,'Course Name',16,1,'2;4','5;2',1),(527,'Course Name',16,4,'4;2','6;8',1),(528,'Course Name',16,2,'4;1','3;7',3),(529,'Course Name',16,0,'5;4','6;2',0),(530,'Course Name',16,0,'4;1','3;4',1),(531,'Course Name',16,0,'1;2','3;8',0),(532,'Course Name',16,1,'2;2','6;3',1),(533,'Course Name',16,1,'5;2','2;6',2),(534,'Course Name',16,2,'1;4','8;2',4),(535,'Course Name',16,1,'2;1','7;8',1),(536,'Course Name',16,-1,'1;1','6;1',1),(537,'Course Name',16,1,'1;4','3;3',1),(538,'Course Name',16,3,'1;1','2;3',2),(539,'Course Name',16,-1,'1;1','2;1',0),(540,'Course Name',16,4,'1;1','1;1',3),(541,'Course Name',16,3,'2;5','7;3',1),(542,'Course Name',16,2,'3;4','1;1',1),(543,'Course Name',16,2,'1;4','6;8',3),(544,'Course Name',16,0,'5;2','6;5',4),(545,'Course Name',16,0,'1;4','2;6',0),(546,'Course Name',16,2,'4;3','1;4',0),(547,'Course Name',16,3,'4;5','6;2',0),(548,'Course Name',16,2,'4;4','6;3',3),(549,'Course Name',16,2,'1;4','8;2',3),(550,'Course Name',16,2,'4;3','8;2',4),(551,'Course Name',16,1,'5;3','1;3',2),(552,'Course Name',16,4,'5;4','8;7',2),(553,'Course Name',16,0,'4;4','7;4',3),(554,'Course Name',16,-1,'4;1','2;1',0),(555,'Course Name',16,4,'1;5','3;7',1),(556,'Course Name',16,3,'5;4','5;1',3),(557,'Course Name',16,0,'2;5','1;6',0),(558,'Course Name',16,0,'4;1','4;3',2),(559,'Course Name',16,3,'4;3','4;7',1),(560,'Course Name',16,-1,'1;1','2;5',4),(561,'Course Name',17,3,'2;1','1;7',2),(562,'Course Name',17,2,'2;3','7;4',3),(563,'Course Name',17,3,'3;2','3;8',4),(564,'Course Name',17,3,'1;5','4;8',0),(565,'Course Name',17,-1,'2;5','5;5',1),(566,'Course Name',17,1,'3;1','2;8',3),(567,'Course Name',17,-1,'4;4','5;8',1),(568,'Course Name',17,3,'4;5','7;7',0),(569,'Course Name',17,4,'3;4','2;6',1),(570,'Course Name',17,1,'2;5','4;2',0),(571,'Course Name',17,0,'5;4','5;6',3),(572,'Course Name',17,4,'2;5','4;4',1),(573,'Course Name',17,2,'2;1','8;4',1),(574,'Course Name',17,0,'5;4','5;3',3),(575,'Course Name',17,3,'1;4','4;1',4),(576,'Course Name',17,0,'1;5','8;3',4),(577,'Course Name',17,2,'5;3','1;2',3),(578,'Course Name',17,1,'4;5','7;2',3),(579,'Course Name',17,1,'2;1','8;1',1),(580,'Course Name',17,4,'2;4','8;4',3),(581,'Course Name',17,2,'5;5','5;6',2),(582,'Course Name',17,1,'3;4','7;2',3),(583,'Course Name',17,0,'3;4','2;1',1),(584,'Course Name',17,2,'2;3','2;5',0),(585,'Course Name',17,4,'2;5','2;1',0),(586,'Course Name',17,0,'1;3','7;7',2),(587,'Course Name',17,1,'3;2','3;1',2),(588,'Course Name',17,2,'4;5','3;4',0),(589,'Course Name',17,-1,'5;5','5;2',3),(590,'Course Name',17,-1,'4;3','3;8',2),(591,'Course Name',17,3,'1;5','8;8',1),(592,'Course Name',17,-1,'1;2','1;8',1),(593,'Course Name',17,1,'1;3','8;5',2),(594,'Course Name',17,2,'1;3','2;4',3),(595,'Course Name',17,1,'1;1','4;6',4);
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

-- Dump completed on 2022-11-20 21:45:21