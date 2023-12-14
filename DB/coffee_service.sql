-- MySQL dump 10.13  Distrib 8.0.34, for macos13 (arm64)
--
-- Host: 127.0.0.1    Database: coffee_service
-- ------------------------------------------------------
-- Server version	8.2.0

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
-- Table structure for table `Account`
--

DROP TABLE IF EXISTS `Account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Account` (
  `account_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `password` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `is_banned` bit(1) DEFAULT NULL,
  `forget_code` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`account_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Account`
--

LOCK TABLES `Account` WRITE;
/*!40000 ALTER TABLE `Account` DISABLE KEYS */;
INSERT INTO `Account` VALUES (1,'admin','admin',NULL,NULL,NULL,NULL),(2,'test','test',_binary '\0','','2023-11-30 12:29:06','2023-11-30 12:29:06'),(3,'test123','test123',_binary '\0','','2023-12-01 00:22:52','2023-12-01 00:22:52');
/*!40000 ALTER TABLE `Account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Admin`
--

DROP TABLE IF EXISTS `Admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Admin` (
  `admin_id` int NOT NULL AUTO_INCREMENT,
  `account_id` int DEFAULT NULL,
  `name` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `phone` varchar(15) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `email` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`admin_id`),
  KEY `account_id` (`account_id`),
  CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `Account` (`account_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Admin`
--

LOCK TABLES `Admin` WRITE;
/*!40000 ALTER TABLE `Admin` DISABLE KEYS */;
INSERT INTO `Admin` VALUES (1,1,'ADMIN','0936787579','Hanoi','admin@gmail.com',NULL,NULL);
/*!40000 ALTER TABLE `Admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Banner`
--

DROP TABLE IF EXISTS `Banner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Banner` (
  `banner_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `image_url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`banner_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `banner_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Banner`
--

LOCK TABLES `Banner` WRITE;
/*!40000 ALTER TABLE `Banner` DISABLE KEYS */;
INSERT INTO `Banner` VALUES (1,2,'https://file.hstatic.net/1000075078/file/_kh_9431__1__e19a7a49963245b39b280271da3cd9fb_master.jpg',NULL,NULL),(2,3,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT91ZThxE5QJgeWxNOsWMhPkzd-Dud6ewjlrTFuoYVOWfw1R0FJThVX3T1FLuppOQ4XUHU&usqp=CAU',NULL,NULL),(3,4,'https://file.hstatic.net/1000075078/file/grandview2_a48a6f2b6495492180138bfd09d22bb3_master.jpg',NULL,NULL),(44,5,'https://img.freepik.com/free-psd/international-coffee-day-banner-concept-template_23-2148652747.jpg?size=626&ext=jpg',NULL,NULL),(45,2,'https://image.freepik.com/free-psd/international-coffee-day-flyer-concept-template_23-2148652751.jpg',NULL,NULL),(46,1,'http://localhost:3076/images/ff51cf13-a313-489b-80ca-df5488287367.jpg','2023-11-26 16:10:35','2023-11-26 16:10:35'),(47,1,'http://localhost:3076/images/220cdae6-c5df-4262-b49b-4add334224ae.jpg','2023-11-26 23:30:52','2023-11-26 23:30:52'),(48,8,'http://localhost:3076/images/6ec690ea-fb48-4075-ae9a-5b4766b3036e.png','2023-11-30 07:56:09','2023-11-30 07:56:09');
/*!40000 ALTER TABLE `Banner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Customer`
--

DROP TABLE IF EXISTS `Customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Customer` (
  `customer_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `phone` varchar(15) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `address` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `email` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `age` int DEFAULT NULL,
  `account_id` int DEFAULT NULL,
  `avatar` varchar(1045) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`customer_id`),
  KEY `account_id` (`account_id`),
  CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `Account` (`account_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customer`
--

LOCK TABLES `Customer` WRITE;
/*!40000 ALTER TABLE `Customer` DISABLE KEYS */;
INSERT INTO `Customer` VALUES (1,'test','0123456','','test@gmaill.com',25,2,'','2023-11-30 12:29:06','2023-11-30 12:29:06'),(2,'test123','0123456','','test123@gmail.com',15,3,'','2023-12-01 00:22:52','2023-12-01 00:22:52');
/*!40000 ALTER TABLE `Customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Event`
--

DROP TABLE IF EXISTS `Event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Event` (
  `event_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(1045) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `location_id` int DEFAULT NULL,
  `date` date DEFAULT NULL,
  `groupImage_id` int DEFAULT NULL,
  `description` varchar(1045) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `to_age` int DEFAULT NULL,
  `from_age` int DEFAULT NULL,
  `seat_count` int DEFAULT NULL,
  `price` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`event_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `event_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Event`
--

LOCK TABLES `Event` WRITE;
/*!40000 ALTER TABLE `Event` DISABLE KEYS */;
INSERT INTO `Event` VALUES (1,'The heaven coffee',1,'2023-08-22',4,'A San Diego roasting startup called Talitha Coffee is cranking out colorfully packaged, fresh-roasted, specialty-grade beans. Yet behind each bag is a deeper commitment to creating opportunities and support systems for survivors of sex trafficking. Talitha Coffee Co-Founder Jenny Barber has been working to combat human trafficking through nonprofit work for more than a decade, witnessing survivors running into similar barriers to education and employment.','2023-08-22 00:00:00','2023-08-23 00:00:00',70,18,50,10000,1,NULL,NULL),(2,'The heaven coffee',2,'2023-08-22',5,'The company has created what it calls the Talitha Survivor Support Network, which involves partnerships with numerous nonprofits. When a position is available within Talitha Coffee, the company will notify the network, then get referrals. Barber said the young company has helped provide career opportunities for three survivors so far, while the goal is to scale bigger to support more people. ','2023-08-22 00:00:00','2023-08-23 00:00:00',70,18,40,12000,3,NULL,NULL),(3,'Go to the moon',3,'2023-08-22',6,'“We have connections with support groups, counseling, tangible needs, housing, helping with budgeting, medical care, even as far as scholarships, if they want to go down that route to go to school,” she said. “We’re making sure they have a successful support system.” Robert Barber, an on-staff Q Grader and the rest of a small production team are currently overseeing roasting operations at a roastery near downtown San Diego, according to Jenny Barber. Talitha was just named one of the host venues of the U.S. Coffee Championships preliminary events.','2023-08-22 00:00:00','2023-08-23 00:00:00',70,18,70,15000,4,NULL,NULL),(15,'Venue Rentals',5,'2023-04-02',20,'As a coffee shop owner, you probably invested considerable time and effort into making your business a space in which customers want to spend time. Why not capitalize on that appealing environment by renting your space out as a special event venue? Coffee shops can make ideal event spaces because they offer a unique atmosphere along with a supply of beverages and small bites.','2024-04-02 15:36:56','2024-04-03 15:36:56',70,18,200,11000,1,NULL,NULL),(16,'Test123',10,'2023-11-27',36,'Test123','2023-11-26 23:06:00','2023-11-27 00:07:00',70,18,12,50000,1,'2023-11-27 00:13:23','2023-11-27 00:13:23'),(17,'Ktra',12,'2023-11-30',38,'','2023-11-29 23:03:00','2023-11-29 20:03:00',70,18,50,250000,7,'2023-11-30 06:17:15','2023-11-30 06:17:15'),(18,'TestAge',13,'2023-11-16',40,'','2023-11-29 23:03:00','2023-11-29 23:07:00',70,12,10,500000,7,'2023-11-30 06:30:26','2023-11-30 06:30:26'),(19,'Test',14,'2023-11-15',41,'','2023-11-29 20:03:00','2023-11-29 23:04:00',28,15,15,50000,17,'2023-11-30 07:33:44','2023-11-30 07:33:44'),(20,'TestThuan777',15,'2023-11-30',43,'','2023-11-30 06:03:00','2023-11-29 20:03:00',70,25,540,500000,8,'2023-11-30 07:56:47','2023-11-30 07:56:47');
/*!40000 ALTER TABLE `Event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Following`
--

DROP TABLE IF EXISTS `Following`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Following` (
  `following_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `customer_id` int DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`following_id`),
  KEY `user_id` (`user_id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `following_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`),
  CONSTRAINT `following_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `Customer` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Following`
--

LOCK TABLES `Following` WRITE;
/*!40000 ALTER TABLE `Following` DISABLE KEYS */;
/*!40000 ALTER TABLE `Following` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GroupImage`
--

DROP TABLE IF EXISTS `GroupImage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `GroupImage` (
  `groupImage_id` int NOT NULL AUTO_INCREMENT,
  `image_id` int DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`groupImage_id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GroupImage`
--

LOCK TABLES `GroupImage` WRITE;
/*!40000 ALTER TABLE `GroupImage` DISABLE KEYS */;
INSERT INTO `GroupImage` VALUES (4,1,NULL,NULL),(5,2,NULL,NULL),(6,4,NULL,NULL),(7,3,NULL,NULL),(9,7,NULL,NULL),(13,11,NULL,NULL),(14,5,NULL,NULL),(15,12,NULL,NULL),(16,13,NULL,NULL),(17,14,NULL,NULL),(18,15,NULL,NULL),(19,16,NULL,NULL),(20,17,NULL,NULL),(21,18,NULL,NULL),(22,19,NULL,NULL),(23,20,NULL,NULL),(24,21,NULL,NULL),(25,22,NULL,NULL),(26,23,NULL,NULL),(32,27,'2023-11-26 16:43:33','2023-11-26 16:43:33'),(33,29,'2023-11-26 23:41:40','2023-11-26 23:41:40'),(36,33,'2023-11-27 00:13:23','2023-11-27 00:13:23'),(37,35,'2023-11-30 06:15:51','2023-11-30 06:15:51'),(38,35,'2023-11-30 06:17:15','2023-11-30 06:17:15'),(39,36,'2023-11-30 06:17:35','2023-11-30 06:17:35'),(40,37,'2023-11-30 06:30:26','2023-11-30 06:30:26'),(41,38,'2023-11-30 07:33:44','2023-11-30 07:33:44'),(42,39,'2023-11-30 07:34:02','2023-11-30 07:34:02'),(43,44,'2023-11-30 07:56:47','2023-11-30 07:56:47'),(44,45,'2023-11-30 07:57:29','2023-11-30 07:57:29'),(45,46,'2023-11-30 08:04:21','2023-11-30 08:04:21');
/*!40000 ALTER TABLE `GroupImage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Image`
--

DROP TABLE IF EXISTS `Image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Image` (
  `image_id` int NOT NULL AUTO_INCREMENT,
  `image` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`image_id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Image`
--

LOCK TABLES `Image` WRITE;
/*!40000 ALTER TABLE `Image` DISABLE KEYS */;
INSERT INTO `Image` VALUES (1,'https://media.istockphoto.com/id/1177900338/photo/cup-of-espresso-with-coffee-beans.jpg?b=1&s=612x612&w=0&k=20&c=Kq8k4AR5xJQjiNWccTmR6txlxRSi_90qBKOq30LGGoY=',NULL,NULL),(2,'https://media.istockphoto.com/id/1177900338/photo/cup-of-espresso-with-coffee-beans.jpg?b=1&s=612x612&w=0&k=20&c=Kq8k4AR5xJQjiNWccTmR6txlxRSi_90qBKOq30LGGoY=',NULL,NULL),(3,'https://media.istockphoto.com/id/1177900338/photo/cup-of-espresso-with-coffee-beans.jpg?b=1&s=612x612&w=0&k=20&c=Kq8k4AR5xJQjiNWccTmR6txlxRSi_90qBKOq30LGGoY=',NULL,NULL),(4,'https://media.istockphoto.com/id/1177900338/photo/cup-of-espresso-with-coffee-beans.jpg?b=1&s=612x612&w=0&k=20&c=Kq8k4AR5xJQjiNWccTmR6txlxRSi_90qBKOq30LGGoY=',NULL,NULL),(5,'https://media.istockphoto.com/id/1177900338/photo/cup-of-espresso-with-coffee-beans.jpg?b=1&s=612x612&w=0&k=20&c=Kq8k4AR5xJQjiNWccTmR6txlxRSi_90qBKOq30LGGoY=',NULL,NULL),(7,'https://dailycoffeenews.com/wp-content/uploads/2023/07/acaia-woc-athens-7.jpg',NULL,NULL),(11,'https://dailycoffeenews.com/wp-content/uploads/2023/07/acaia-woc-athens-6.jpg',NULL,NULL),(12,'https://www.trendingus.com/wp-content/uploads/2021/04/2553a7077d79dc73ef17a63ef6d798e7.jpeg',NULL,NULL),(13,'https://th.bing.com/th/id/OIP.4AkaPgBCAPyI2xW0zpbBXQHaEK?pid=ImgDet&w=1600&h=900&rs=1',NULL,NULL),(14,'https://th.bing.com/th/id/OIP.e8sCcJEm8ZazYpseru2zvAHaE6?pid=ImgDet&rs=1',NULL,NULL),(15,'https://th.bing.com/th/id/R.9f7f757559ac185935b585cbcc673b1a?rik=iaTsYfJw5hFkAQ&pid=ImgRaw&r=0',NULL,NULL),(16,'https://th.bing.com/th/id/R.aaafb3b31ce64d34f36e97c319af5da2?rik=VjMLs%2bhhuyPkbA&pid=ImgRaw&r=0',NULL,NULL),(17,'https://th.bing.com/th/id/OIP.QS-bdQ-PF6cICX0meTqn5QHaJ3?pid=ImgDet&w=500&h=666&rs=1',NULL,NULL),(18,'https://th.bing.com/th/id/R.fc206f2d337239f34dffa931f077b239?rik=OISx%2fvypyy2HAQ&pid=ImgRaw&r=0',NULL,NULL),(19,'https://th.bing.com/th/id/OIP.JeBNrAnjlYUoNp-NF8svkQHaEo?pid=ImgDet&w=960&h=600&rs=1',NULL,NULL),(20,'https://i.pinimg.com/originals/3c/f5/ca/3cf5ca05ac6b0b9296cb1343ebbb2aa4.jpg',NULL,NULL),(21,'https://th.bing.com/th/id/OIP.m1_8rE-neKICC_2EJvZiOAHaLH?pid=ImgDet&w=1020&h=1530&rs=1',NULL,NULL),(22,'https://th.bing.com/th/id/OIP.bMRYh01YDpK4IeXS9W4kpgHaKo?pid=ImgDet&w=500&h=718&rs=1',NULL,NULL),(23,'https://i.pinimg.com/originals/ba/50/36/ba5036d4406005c83ad8640aa92434b6.jpg',NULL,NULL),(27,'http://localhost:3076/images/1352f4f1-aca3-4945-9661-534f33f7cc84.webp','2023-11-26 16:43:31','2023-11-26 16:43:31'),(28,'http://localhost:3076/images/220cdae6-c5df-4262-b49b-4add334224ae.jpg','2023-11-26 23:30:50','2023-11-26 23:30:50'),(29,'http://localhost:3076/images/fd7f108f-66d4-4a3b-8cab-4c15d74effa2.webp','2023-11-26 23:41:39','2023-11-26 23:41:39'),(30,'http://localhost:3076/images/00b73fb1-a6ba-4082-86f0-30b5f1029fd5.png','2023-11-26 23:53:12','2023-11-26 23:53:12'),(31,'http://localhost:3076/images/b71df85e-d6f5-4ea6-a6bd-b7dd84b0f8e6.jpeg','2023-11-27 00:09:35','2023-11-27 00:09:35'),(32,'http://localhost:3076/images/9579b9d6-11d2-44bd-aefc-a89491f7f073.png','2023-11-27 00:11:11','2023-11-27 00:11:11'),(33,'http://localhost:3076/images/2d692076-6b03-40f5-867a-c0f25710e0cb.png','2023-11-27 00:13:09','2023-11-27 00:13:09'),(34,'http://localhost:3076/images/43d48621-87f1-4475-ba7e-15e7865947e7.png','2023-11-30 06:03:43','2023-11-30 06:03:43'),(35,'http://localhost:3076/images/4c086d8d-da42-4930-9290-2e6e9cf2695d.png','2023-11-30 06:15:26','2023-11-30 06:15:26'),(36,'http://localhost:3076/images/1472d216-1216-406f-a1a5-6d9248315fb2.png','2023-11-30 06:17:34','2023-11-30 06:17:34'),(37,'http://localhost:3076/images/e026d38d-fe9b-427c-bbef-61c5db6e3378.png','2023-11-30 06:30:04','2023-11-30 06:30:04'),(38,'http://localhost:3076/images/5d9f307e-8815-4ecf-baa3-36445a2cdc31.png','2023-11-30 07:33:25','2023-11-30 07:33:25'),(39,'http://localhost:3076/images/7d32f37a-e387-442b-a915-3eddd7b11872.png','2023-11-30 07:33:57','2023-11-30 07:33:57'),(40,'http://localhost:3076/images/0826e060-f65c-47dd-b6c8-3e7658dedbf8.png','2023-11-30 07:38:54','2023-11-30 07:38:54'),(41,'http://localhost:3076/images/f6bb2e44-66ff-42ee-bd32-a92b72bdf406.png','2023-11-30 07:48:45','2023-11-30 07:48:45'),(42,'http://localhost:3076/images/132c0541-176c-46cb-8d25-4560b2ac8ce1.png','2023-11-30 07:53:24','2023-11-30 07:53:24'),(43,'http://localhost:3076/images/6ec690ea-fb48-4075-ae9a-5b4766b3036e.png','2023-11-30 07:56:08','2023-11-30 07:56:08'),(44,'http://localhost:3076/images/f2186fdd-dbe3-4e8d-9287-1f6dd03d9078.png','2023-11-30 07:56:24','2023-11-30 07:56:24'),(45,'http://localhost:3076/images/96f07aaf-b84e-438d-a1db-817e2619ad8a.png','2023-11-30 07:57:28','2023-11-30 07:57:28'),(46,'http://localhost:3076/images/1ac79b2a-3390-4daa-a284-6e03f0a4e044.png','2023-11-30 07:57:37','2023-11-30 07:57:37');
/*!40000 ALTER TABLE `Image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Location`
--

DROP TABLE IF EXISTS `Location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Location` (
  `location_id` int NOT NULL AUTO_INCREMENT,
  `address` varchar(1045) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`location_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `location_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Location`
--

LOCK TABLES `Location` WRITE;
/*!40000 ALTER TABLE `Location` DISABLE KEYS */;
INSERT INTO `Location` VALUES (1,'Hanoi',1,NULL,NULL),(2,'DaNang',2,NULL,NULL),(3,'TPHCM',3,NULL,NULL),(4,'Hanoi',4,NULL,NULL),(5,'Hanoi',5,NULL,NULL),(6,'Hanoi',6,NULL,NULL),(7,'DaNang',7,NULL,NULL),(10,'Test123',1,'2023-11-27 00:13:23','2023-11-27 00:13:23'),(11,'HaNoi',7,'2023-11-30 06:15:51','2023-11-30 06:15:51'),(12,'HaNoi',7,'2023-11-30 06:17:15','2023-11-30 06:17:15'),(13,'TestAge',7,'2023-11-30 06:30:26','2023-11-30 06:30:26'),(14,'Test',17,'2023-11-30 07:33:44','2023-11-30 07:33:44'),(15,'TestThuan777',8,'2023-11-30 07:56:47','2023-11-30 07:56:47');
/*!40000 ALTER TABLE `Location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `News`
--

DROP TABLE IF EXISTS `News`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `News` (
  `news_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `title` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `description` varchar(1045) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `groupImage_id` int DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`news_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `news_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `News`
--

LOCK TABLES `News` WRITE;
/*!40000 ALTER TABLE `News` DISABLE KEYS */;
INSERT INTO `News` VALUES (1,1,'Coffe Is Good','Coffee is good for health',4,'2023-08-22',NULL,NULL),(2,2,'Coffee Not Good','Coffee is not good for health',5,'2023-08-22',NULL,NULL),(3,4,'CoffeeHouse khai truong','CoffeeHouse khai truong tai Ha Noi',6,'2023-08-22',NULL,NULL),(4,4,'Go to the Moon','Drink Coffee at the moon',7,'2023-08-22',NULL,NULL),(5,5,'Slow coffee','Apart from enjoying a nice cup of coffee...',9,'2023-07-22',NULL,NULL),(6,1,'TestSuccessfullly','TestSuccessfullly',32,'2023-11-26','2023-11-26 16:43:33','2023-11-26 16:43:33'),(7,1,'Black Friday','Black Friday',33,'2023-11-26','2023-11-26 23:41:41','2023-11-26 23:41:41'),(8,7,'Test','Test',39,'2023-11-30','2023-11-30 06:17:35','2023-11-30 06:17:35'),(9,17,'Test','Test',42,'2023-11-30','2023-11-30 07:34:02','2023-11-30 07:34:02'),(10,8,'Test123123213','Test123123213',44,'2023-11-30','2023-11-30 07:57:29','2023-11-30 07:57:29');
/*!40000 ALTER TABLE `News` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Schedule`
--

DROP TABLE IF EXISTS `Schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Schedule` (
  `schedule_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `event_id` int DEFAULT NULL,
  `customer_id` int DEFAULT NULL,
  `ticket_count` int DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`schedule_id`),
  KEY `event_id` (`event_id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `schedule_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `Event` (`event_id`),
  CONSTRAINT `schedule_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `Customer` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Schedule`
--

LOCK TABLES `Schedule` WRITE;
/*!40000 ALTER TABLE `Schedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `Schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Service`
--

DROP TABLE IF EXISTS `Service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Service` (
  `service_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `description` varchar(1045) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `groupImage_id` int DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`service_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `service_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Service`
--

LOCK TABLES `Service` WRITE;
/*!40000 ALTER TABLE `Service` DISABLE KEYS */;
INSERT INTO `Service` VALUES (11,'Payment','Thanh toan',1,5,NULL,NULL),(12,'Buy 2 Get 1','Mua 2 tang 1',2,6,NULL,NULL),(13,'Exchange 10 cups for 1 cup of coffee','Doi 10 vo lon lay 1 ly cafe',3,5,NULL,NULL),(14,'Smooth draw for buyers','Boc tham trung thuong',1,4,NULL,NULL),(15,'Payment','Thanh toan',1,5,NULL,NULL),(17,'Exchange bottles for drinks for no charge','Doi vo chai lay nuoc mien phi',4,5,NULL,NULL),(18,'Earn card upgrade points','Tich diem the',5,7,NULL,NULL),(19,'Use the invoice as a discount voucher','Dung vocher giam gia',6,9,NULL,NULL),(20,'Free upsize','Mien phi upsize',7,13,NULL,NULL),(21,'Give combos to guests','Tang combo cho khach',1,14,NULL,NULL),(22,'Return the wrong product in the menu','Doi tra lai san pham cho khach ',3,15,NULL,NULL),(23,'Create a membership card','Tao the thanh vien',7,16,NULL,NULL),(24,'Golden hour deals','Uu dai gio vang',7,17,NULL,NULL),(25,'Test123123213','Test123123213',8,45,'2023-11-30 08:04:21','2023-11-30 08:04:21');
/*!40000 ALTER TABLE `Service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `User` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `address` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `email` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `phone` varchar(15) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `coffeeShopName` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `account_id` int DEFAULT NULL,
  `avatar` varchar(1045) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `account_id` (`account_id`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `Account` (`account_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
INSERT INTO `User` VALUES (1,'tesst','tesst@gmail.com','0123456','tesst',1,NULL,NULL,NULL);
/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Waiting`
--

DROP TABLE IF EXISTS `Waiting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Waiting` (
  `waiting_id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int DEFAULT NULL,
  `address` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `email` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `phone` varchar(15) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `coffeeShopName` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`waiting_id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `waiting_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `Customer` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Waiting`
--

LOCK TABLES `Waiting` WRITE;
/*!40000 ALTER TABLE `Waiting` DISABLE KEYS */;
/*!40000 ALTER TABLE `Waiting` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-14 10:06:10
