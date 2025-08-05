-- MySQL dump 10.13  Distrib 8.0.36, for macos14 (arm64)
--
-- Host: localhost    Database: chatbot
-- ------------------------------------------------------
-- Server version	8.4.3

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
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `messages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sender` varchar(50) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_messages_id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (1,'user','Hi'),(2,'user','Hi'),(3,'user','Test'),(4,'user','Hi'),(5,'user','Hi'),(6,'user','looking for freelancer'),(7,'user','freelancer'),(8,'user','i need developer'),(9,'user','i need a develoepr'),(10,'user','i need a developer'),(11,'user','Hello'),(12,'user','do you know me?'),(13,'user','My name is vishal'),(14,'user','i need a developer'),(15,'user','Hi'),(16,'user','how are you?'),(17,'user','I need a developer'),(18,'user','do you know me'),(19,'user','My name is vishal'),(20,'user','Hi'),(21,'user','Hi'),(22,'user','Hi'),(23,'user','Hi'),(24,'user','Hi'),(25,'user','Hi'),(26,'user','how are you?'),(27,'user','need a developer'),(28,'user','developer require'),(29,'user','which one?'),(30,'user','Hi'),(31,'user','My name is Vishal'),(32,'user','do you know my name?'),(33,'user','Hi'),(34,'user','Do you know my name?'),(35,'user','My name is Vishal'),(36,'user','now you know my name?'),(37,'user','do you know my name?'),(38,'user','now know my name?'),(39,'user','know my name'),(40,'user','My name is Vishal'),(41,'user','Hi'),(42,'user','Hi'),(43,'user','how are you?'),(44,'user','i need a developer'),(45,'user','could you please help me to find developer?'),(46,'user','React developer'),(47,'user','can you connect with any developer?'),(48,'user','Do you have React Developer?'),(49,'user','Do you have React Developer'),(50,'user','could you help me to provide process to onboard?'),(51,'user','thanks'),(52,'user','thanks'),(53,'user','do you know my name'),(54,'user','my name is vishal'),(55,'user','what is my name?'),(56,'user','Hi'),(57,'user','how are you?'),(58,'user','Looking for developer'),(59,'user','Reactjs'),(60,'user','need reactjs developer to onboard for project'),(61,'user','can you provide process?'),(62,'user','Hi'),(63,'user','Hi'),(64,'user','looking for software developer'),(65,'user','do you have react developer?'),(66,'user','can you help me to provide process to onboard him quickly ?'),(67,'user','thanks'),(68,'user','Hi'),(69,'user','looking for software engineer'),(70,'user','do you have react developer?'),(71,'user','can you help me to provide process'),(72,'user','thanks');
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `training_data`
--

DROP TABLE IF EXISTS `training_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `training_data` (
  `id` int NOT NULL AUTO_INCREMENT,
  `question` varchar(255) DEFAULT NULL,
  `answer` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ix_training_data_question` (`question`),
  KEY `ix_training_data_id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `training_data`
--

LOCK TABLES `training_data` WRITE;
/*!40000 ALTER TABLE `training_data` DISABLE KEYS */;
INSERT INTO `training_data` VALUES (1,'hi','Hi there!'),(2,'hello','Hello! How can I help you today?'),(3,'how are you','I\'m doing great, thank you!'),(4,'do you know me','Not yet, but I’d love to!'),(5,'i need a developer','Sure! We have freelancers available.'),(6,'looking for software engineer','We can help with that. What skills are you looking for?'),(7,'can you help me','Absolutely! Let me know what you need.'),(8,'bye','Goodbye! Have a great day.'),(9,'Do you have React Developer','Yes we do have available to work on immediate basis.'),(10,'Can you help me to provide process to onboard him quickly','Yes sure, please write email to us with your detail requirement to support@example.com'),(11,'thanks','Happy to help you.'),(12,'need developer','Sure! We have freelancers available, do you need to provide process ?'),(13,'yes please provide info how to hire them?','Sure! please write email to us with your software requirement to support@example.com');
/*!40000 ALTER TABLE `training_data` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-08-05 21:29:31
