-- MySQL dump 10.13  Distrib 5.7.12, for osx10.9 (x86_64)
--
-- Host: 127.0.0.1    Database: exam
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
-- Table structure for table `pokes`
--

DROP TABLE IF EXISTS `pokes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pokes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `friend_id` int(11) DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pokes`
--

LOCK TABLES `pokes` WRITE;
/*!40000 ALTER TABLE `pokes` DISABLE KEYS */;
INSERT INTO `pokes` VALUES (1,2,1,4),(2,1,2,3),(3,3,1,1),(4,3,2,3),(5,7,1,2),(6,7,2,5),(7,7,5,2),(8,7,3,2),(9,8,1,3),(10,8,4,1),(11,8,2,1),(12,8,7,2),(13,9,5,2),(14,9,2,6),(15,9,7,2),(16,9,3,1),(17,9,8,1),(18,9,1,2),(19,10,1,5),(20,10,8,1),(21,10,2,1),(22,10,7,1),(23,1,9,2),(24,1,4,2),(25,1,7,1),(26,1,6,1),(27,1,5,1),(28,16,3,1),(29,16,1,2),(30,16,8,1),(31,17,1,2),(32,17,15,2),(33,17,3,1),(34,17,8,3),(35,17,6,1);
/*!40000 ALTER TABLE `pokes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `alias` varchar(45) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `date_of_birth` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'minh1','Minh1234','minh1@gmail.com','$2b$12$La9HJJwSBi/RA5Kn4xPFAeOSYFGWSAFBbS8A89uYntDGL5sif3KTK','0000-00-00 00:00:00','2016-09-25 11:25:00'),(2,'minh2','Minh1234','minh2@gmail.com','$2b$12$DEjQd44pW9MlOqkoLuyxb.bcGk/3Kg8jrYWtNFTPtJQwAwopQArAC','0000-00-00 00:00:00','2016-09-25 11:28:08'),(3,'minh3','Minh1234','minh3@gmail.com','$2b$12$D0PYp/FnISxROt59Mf7UrO43VF9/pw1IbdL5nNR45VgFGUGLGmXFW','0000-00-00 00:00:00','2016-09-25 11:35:03'),(4,'minh4','Minh1234','minh4@gmail.com','$2b$12$r11Yb.7SwOjOyxGhvRPCBe7M54FOL1sSwMblY3f2nLIegmOJNw2Yi','12/24/1993','2016-09-25 11:41:18'),(5,'minh5','Minh1234','minh5@gmail.com','$2b$12$Cl99fSNeuJnF.tvUUwn6nOJZokZIjc85WbquCy3Nh7r.e5WimiqRe','09/22/2016','2016-09-25 12:00:59'),(6,'minh6','Minh1234','minh6@gmail.com','$2b$12$yF8H9y0IkWVT.M410Cw06uZ1vSkI7ViM3e.lugjYoxdi6lRNo.fzu','09/23/2016','2016-09-25 12:22:52'),(7,'minh7','Minh1234','minh7@gmail.com','$2b$12$5cBvOa3iVz28CrecVTdd8ufh0i2KuGFXUdVs6ICP2AltvEtGd/xAG','09/05/2016','2016-09-25 12:24:43'),(8,'minh8','Minh1234','minh8@gmail.com','$2b$12$eESiLtEAUBOvV/IZaw1Tw.AYGV0Mt2GpdPIWQjU9MEp3dDMcQyGMi','10/06/1993','2016-09-25 12:25:46'),(9,'minh9','Minh1234','minh9@gmail.com','$2b$12$5HqYMkdQetEdwk81PBpl6uDYueN66RrBVZdhz1kvkVKRAN0QKyDcO','09/22/1994','2016-09-25 12:26:29'),(10,'minh10','Minh1234','minh10@gmail.com','$2b$12$XERSWjFTne3uPqXXlxtU/..auwFLdQ/PXkZh.BheQn8cpzVS0lM.G','09/11/2001','2016-09-25 12:26:57'),(11,'minh11','Minh1234','minh11@gmail.com','$2b$12$hHgeRtchXU12BIttX7jVnOLS/W2gr.rx8cprXJ7xfrUW7d6gCD7lm',NULL,'2016-09-25 12:39:18'),(14,'minh12','Minh1234','minh12@gmail.com','$2b$12$03cPiy1cQyaXjC1qwPX7ZOKoXr/Mxk2bShnJKuUy5bCXazVmsMxZ.','09/14/1994','2016-09-25 12:47:09'),(15,'minh13','Minh1234','minh13@gmail.com','$2b$12$1PZu9Q3XkT7ls5o0QlbD5OLgLTNfr3jmbXuL07iWquyDkwwXK9AEi','05/23/1994','2016-09-25 12:47:50'),(16,'minh15','Minh1234','minh15@gmail.com','$2b$12$jsNEs3FJo1LLg0DbQQ8JE.fbZ0odAU91iz9LuQ/90f9IIDZKzZtSK','09/13/1996','2016-09-25 13:00:55'),(17,'minh20','Minh1234','minh20@gmail.com','$2b$12$Qiuv7JXdYg8UXMPzuekGWuGDnW09E4iX1bWDgL2jgNSu0/MpCYzlC','09/14/1993','2016-09-25 13:25:04');
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

-- Dump completed on 2016-09-25 13:43:56
