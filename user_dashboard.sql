-- MySQL dump 10.13  Distrib 5.7.12, for osx10.9 (x86_64)
--
-- Host: 127.0.0.1    Database: user_dashboard
-- ------------------------------------------------------
-- Server version	5.6.28

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comment` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `message_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (1,'asdf','2016-09-17 19:38:08',8,14),(2,'fadssadfsfasdfjasldkf','2016-09-17 19:42:48',8,14),(3,'fadssafsdf','2016-09-17 19:43:47',8,13),(4,'fasdfsad','2016-09-17 19:43:53',8,12),(5,'fa;slkdjfa','2016-09-17 19:50:31',8,14),(6,'fja;skdjfl;asd','2016-09-17 19:50:43',8,14),(7,'hi minh8','2016-09-17 21:00:54',8,14),(8,'fsadfsd','2016-09-17 21:01:01',8,13),(9,'fads','2016-09-17 21:01:05',8,12),(10,'fasdf','2016-09-21 13:58:45',28,17),(11,'asdfasdf','2016-09-21 13:58:47',28,17),(12,'ffasdf','2016-09-21 13:58:50',28,17),(13,'fads','2016-09-21 13:58:56',28,16),(14,'sdfasd','2016-09-21 13:58:58',28,15);
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message_friend`
--

DROP TABLE IF EXISTS `message_friend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message_friend` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` varchar(45) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `friend_id` int(11) DEFAULT NULL,
  `created_at` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message_friend`
--

LOCK TABLES `message_friend` WRITE;
/*!40000 ALTER TABLE `message_friend` DISABLE KEYS */;
INSERT INTO `message_friend` VALUES (4,'hello',8,33,'2016-09-22 15:22:06'),(5,'good',33,8,NULL),(6,'dm may',33,8,'2016-09-22 15:30:39'),(7,'fas;dfkadjs',8,33,'2016-09-22 17:08:45'),(8,'fasdlhfk',33,8,'2016-09-22 17:09:14');
/*!40000 ALTER TABLE `message_friend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` varchar(255) DEFAULT NULL,
  `created_at` varchar(45) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (12,'fasdf','2016-09-17 19:00:44',8),(13,'fads','2016-09-17 19:00:54',8),(14,'Hfsajfl;jasdfl;','2016-09-17 19:15:05',8),(15,'Hello everyone i am minh 8','2016-09-17 21:00:36',8),(16,'Hi guys!','2016-09-19 11:59:46',30),(17,'Hello','2016-09-21 13:58:42',8);
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `requests`
--

DROP TABLE IF EXISTS `requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `requests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `friend_id` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT 'pending',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `requests`
--

LOCK TABLES `requests` WRITE;
/*!40000 ALTER TABLE `requests` DISABLE KEYS */;
INSERT INTO `requests` VALUES (34,8,22,'pending');
/*!40000 ALTER TABLE `requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `pw_hash` varchar(255) DEFAULT NULL,
  `level` varchar(45) DEFAULT 'normal',
  `description` varchar(255) DEFAULT 'I am happy',
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (8,'Minh','Phamm','minh9@gmail.com','$2b$12$0Q4nxhz5N3VOo6pdQi8GBuaClpFgKYz.Eva6Pgizk/szpwB1xpfUq','normal','I am happy','2016-09-19 11:32:43'),(22,'Minh','phan','minh1@gmail.com','$2b$12$jUGdlfkKLLY3pc.xZpZZUOXDqwsLZkCuBg.TbcuiXK4gyx9WPrx/6','admin','I am happy','2016-09-19 10:06:58'),(23,'Minh','Pham','minh2@gmail.com','$2b$12$2fi3gZCtf63wvY0RhVn1KOJNfzc3m5gvVXP/ReD9ljWXyt.IAbzE.','admin','I am happy','2016-09-19 10:14:21'),(24,'Minh','Minh1234','minh3@gmail.com','$2b$12$orz2mNTisircby95jntg.Oor1JyVLzldBchgPAxZERYAvgREYQHfy','normal','I am happy','2016-09-19 10:30:36'),(25,'Minh','Pham','minh6@gmail.com','$2b$12$6/AkRCeoAIuIPyfeIDi3Z.BZYMFpEPuf4QeyVbDaa.k8ecVLbqWo.','normal','I am happy','2016-09-19 10:40:43'),(28,'Minh','Pham','minh10@gmail.com','$2b$12$vN0ByrG9x/T.g2wRm13ILuM6jreJiOnEEWaWBWtPDUGdsxmWblGky','normal','I am happy','2016-09-19 11:33:12'),(29,'Minh','Pham','minh4@gmail.com','$2b$12$ii1mk4.EVif.eBTdAmBKXuyPFmBnOo9Qsvk9ithtLBUI45fuZL9dC','normal','I am happy','2016-09-19 11:35:03'),(30,'Brendan','Stanton','brendan@gmail.com','$2b$12$QU/F0pTmVR0Ti4TRJnnl..bg9JMQnOrgQ6vFmE/L.FA7DmXfsJgIO','admin','I am happy','2016-09-19 11:58:25'),(31,'steve','america','steve@gmail.com','$2b$12$JLXz.YgMAzFgGxhHFqEWoOsed1b0FNVw.J43AN5Nj/iGz4aL2kGbC','normal','I am happy','2016-09-19 12:05:04'),(32,'Minh','Pham','minh10@gmail.com','$2b$12$URsj1T6igiPEz33IanUx5O74wERHQf1KPBvTv5k6DIH/ybWwK0Uf6','normal','I am happy','2016-09-20 20:31:53'),(33,'Minh11','Minh1234','minh11@gmail.com','$2b$12$O/wtfP03iu841EiZYIgGu.dM0wTkzAuybFnyEiNapzjdEyZ4a8rmO','normal','I am happy','2016-09-21 10:00:37');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-09-23 13:55:36
