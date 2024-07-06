-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: localhost    Database: hotelproject
-- ------------------------------------------------------
-- Server version	8.0.25

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
-- Table structure for table `guests`
--

DROP TABLE IF EXISTS `guests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `guests` (
  `guest_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `phone_number` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  PRIMARY KEY (`guest_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guests`
--

LOCK TABLES `guests` WRITE;
/*!40000 ALTER TABLE `guests` DISABLE KEYS */;
INSERT INTO `guests` VALUES (1,'Admin','LLH','114329983','admin@llh.co.za','$2a$10$g4Fe7FJCMUPlwwlwEHa5mutD9QfXrzCcVTQSSDMTEspDmbX56WOme'),(2,'Siya','Heck','832129845','azyeki01@gmail.com','$2a$10$acTfurQSTjvX3UDwz7uzYObVZHo2zEMXfb91QK/.NGIiZJtapD/j2'),(3,'Axl','Rod','9877654321','axrod@gmail.com','$2a$10$NNXfqExI9HzOI43yTH2lcOQDrG/quUhLu3BxiQflSsexnfh9ScJsW'),(4,'Zanele','Hlongwane','0937427455','zahlongwanezee@gmail.com','$2a$10$mPz2N9NfmSOYeo2GCioqMeDubU96mpNwVxvRlolx39fENdNJ5QSoK'),(5,'Anakie','Mask','0937427459','nokuphiwamntambo@gmail.com','$2a$10$FMKQESuDtgF72w2xYnwFLum/g1YRr2ESBA5QkPm0FassC.V/hK/Sq'),(6,'Johnny','Doodmaak','0821235463','mr.qtshotsho@gmail.com','$2a$10$..Y3U2Hz3C4P5msHM7J9zOFmrlIQyhRNdVAQh5853SinyK/t2wNqS'),(7,'Azi','Nduks','0987654321','anxthii007@gmail.com','$2a$10$3r8vHceUakksxyaIFJ.dpuqgRe7bYLY7NbOTqx0fvvslW9hVf9m5C'),(8,'Rigby','Mordo','0987654321','azyeki01@outlook.com','$2a$10$vD.GQAhXt/K8KhY0Onev4.qTm8Evcu9qB9dB8dLX7uD6CCF41S3Fq'),(9,'Vuyo','Tsi','0785385789','qayiya.tshotsho@icloud.com','$2a$10$qv1qjGlJ0ihY67EG1ENa6uFdAm9S/QTaNoY3TrwNyNDLeKShiH.f6'),(10,'Vuyo','Tsi','0785385780','ndumisoc@mecerintered.co.za','$2a$10$D0CEi6TklnTzTdstbwPNE./GIH05d0T9wmDzBaEsr5WcT.TaWqHxq');
/*!40000 ALTER TABLE `guests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservations`
--

DROP TABLE IF EXISTS `reservations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservations` (
  `reservation_id` int NOT NULL AUTO_INCREMENT,
  `guest_id` int NOT NULL,
  `room_id` int NOT NULL,
  `check_in_date` date NOT NULL,
  `check_out_date` date NOT NULL,
  `total_price` int NOT NULL,
  `dining_pref` varchar(50) DEFAULT NULL,
  `special_requests` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`reservation_id`),
  KEY `guest_id` (`guest_id`),
  KEY `room_id` (`room_id`),
  CONSTRAINT `reservations_ibfk_1` FOREIGN KEY (`guest_id`) REFERENCES `guests` (`guest_id`),
  CONSTRAINT `reservations_ibfk_2` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`room_id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservations`
--

LOCK TABLES `reservations` WRITE;
/*!40000 ALTER TABLE `reservations` DISABLE KEYS */;
INSERT INTO `reservations` VALUES (1,2,7,'2024-07-22','2024-07-28',30000,'GLUTEN_FREE','none'),(2,3,4,'2024-08-20','2024-08-21',4200,'VEGAN','white, warm sheets.'),(4,6,14,'2024-06-27','2024-06-30',24000,'OTHER','fully stocked bar fridge, please.'),(6,4,3,'2024-08-06','2024-08-09',12300,'HALAAL','nothing.'),(15,6,1,'2024-06-26','2024-06-30',16400,'VEGAN','copper pots only.'),(21,3,4,'2024-06-28','2024-06-30',9200,'OTHER','idk'),(26,2,9,'2024-07-08','2024-07-12',22400,'OTHER','idk'),(49,8,5,'2024-07-08','2024-07-11',13800,'OTHER','I\'m cool.'),(52,4,14,'2024-06-28','2024-06-30',16000,'GLUTEN_FREE','nothing'),(59,3,12,'2024-06-29','2024-06-30',7000,'GLUTEN_FREE','idk'),(60,10,5,'2024-06-29','2024-06-30',4600,'OTHER','gyuk'),(61,4,13,'2024-06-29','2024-06-30',16000,'GLUTEN_FREE','iuytg');
/*!40000 ALTER TABLE `reservations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rooms`
--

DROP TABLE IF EXISTS `rooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rooms` (
  `room_id` int NOT NULL AUTO_INCREMENT,
  `room_type` varchar(50) NOT NULL,
  `picture` varchar(500) NOT NULL,
  `details` varchar(250) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `occupancy_limit` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`room_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rooms`
--

LOCK TABLES `rooms` WRITE;
/*!40000 ALTER TABLE `rooms` DISABLE KEYS */;
INSERT INTO `rooms` VALUES (1,'luxury_suite','https://i.pinimg.com/474x/7f/36/34/7f36345fa22d4dc74399855820021b0b.jpg','luxury suite | Sleeps 2 | King bed, Butler, WiFi.',4100.00,2),(2,'luxury_suite','https://i.pinimg.com/474x/7f/36/34/7f36345fa22d4dc74399855820021b0b.jpg','luxury suite | Sleeps 2 | King bed, Butler, WiFi.',4100.00,2),(3,'luxury_suite','https://i.pinimg.com/474x/7f/36/34/7f36345fa22d4dc74399855820021b0b.jpg','luxury suite | Sleeps 2 | King bed, Butler, WiFi.',4100.00,2),(4,'luxury_suite','https://i.pinimg.com/474x/7f/36/34/7f36345fa22d4dc74399855820021b0b.jpg','luxury suite | Sleeps 4 | King bed, Butler, WiFi.',4600.00,4),(5,'luxury_suite','https://i.pinimg.com/474x/7f/36/34/7f36345fa22d4dc74399855820021b0b.jpg','luxury suite | Sleeps 4 | King bed, Butler, WiFi.',4600.00,4),(6,'villa_luxury_suite','https://i.pinimg.com/474x/46/f5/13/46f51372f29add02c79505afcb2da7e0.jpg','villa luxury suite | Sleeps 2 | King bed, Butler, WiFi.',5000.00,2),(7,'villa_luxury_suite','https://i.pinimg.com/474x/46/f5/13/46f51372f29add02c79505afcb2da7e0.jpg','villa luxury suite | Sleeps 2 | King bed, Butler, WiFi.',5000.00,2),(8,'villa_luxury_suite','https://i.pinimg.com/474x/46/f5/13/46f51372f29add02c79505afcb2da7e0.jpg','villa luxury suite | Sleeps 4 | King bed, Butler, WiFi.',5600.00,4),(9,'villa_luxury_suite','https://i.pinimg.com/474x/46/f5/13/46f51372f29add02c79505afcb2da7e0.jpg','villa luxury suite | Sleeps 4 | King bed, Butler, WiFi.',5600.00,4),(10,'presidential_suite','https://i.pinimg.com/474x/d3/91/f0/d391f03cb8389a2fa525547faaa08b09.jpg','presidential suite | Sleeps 2 | King bed, Butler, WiFi.',6300.00,2),(11,'presidential_suite','https://i.pinimg.com/474x/d3/91/f0/d391f03cb8389a2fa525547faaa08b09.jpg','presidential suite | Sleeps 2 | King bed, Butler, WiFi.',6300.00,2),(12,'presidential_suite','https://i.pinimg.com/474x/d3/91/f0/d391f03cb8389a2fa525547faaa08b09.jpg','presidential suite | Sleeps 4 | King bed, Butler, WiFi.',7000.00,4),(13,'villa_presidential_suite','https://i.pinimg.com/564x/1e/0e/f9/1e0ef9acd2f094ec42fdc6aec3b854a0.jpg','villa presidential suite | Sleeps 4 | King bed, Butler, WiFi.',9200.00,4),(14,'villa_presidential_suite','https://i.pinimg.com/564x/1e/0e/f9/1e0ef9acd2f094ec42fdc6aec3b854a0.jpg','villa presidential suite | Sleeps 2 | King bed, Butler, WiFi.',8000.00,2);
/*!40000 ALTER TABLE `rooms` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-28 14:04:54
