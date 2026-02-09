/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.5.29-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: spmvv_results
-- ------------------------------------------------------
-- Server version	10.5.29-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `audit_logs`
--

DROP TABLE IF EXISTS `audit_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `audit_logs` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `action` varchar(50) NOT NULL,
  `details` longtext NOT NULL,
  `ip_address` char(39) DEFAULT NULL,
  `timestamp` datetime(6) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `audit_logs_user_id_88267f_idx` (`user_id`,`timestamp`),
  KEY `audit_logs_action_474804_idx` (`action`,`timestamp`),
  CONSTRAINT `audit_logs_user_id_752b0e2b_fk_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=230 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_logs`
--

LOCK TABLES `audit_logs` WRITE;
/*!40000 ALTER TABLE `audit_logs` DISABLE KEYS */;
INSERT INTO `audit_logs` VALUES (1,'login','Successful login from 127.0.0.1','127.0.0.1','2026-02-07 08:38:43.660821',1),(2,'login','Successful login from 10.189.129.238','10.189.129.238','2026-02-07 10:59:14.115872',1),(3,'login','Successful login from 10.189.129.238','10.189.129.238','2026-02-07 11:04:26.521073',1),(4,'login','Successful login from 10.189.129.238','10.189.129.238','2026-02-07 11:04:34.271137',1),(5,'login','Successful login from 10.189.129.238','10.189.129.238','2026-02-07 11:14:02.806530',1),(6,'user_registration','Student registered: TEST001','10.189.129.238','2026-02-07 11:14:09.704574',NULL),(7,'login','Successful login from 10.127.248.83','10.127.248.83','2026-02-07 11:17:17.736013',1),(8,'user_registration','Student registered: TEST123','10.127.248.83','2026-02-07 11:17:17.794444',NULL),(9,'login','Successful login from 10.127.248.83','10.127.248.83','2026-02-07 11:17:17.859602',NULL),(10,'login','Successful login from 10.127.248.83','10.127.248.83','2026-02-07 11:17:48.702492',1),(11,'user_registration','Student registered: STU1770463068','10.127.248.83','2026-02-07 11:17:48.761766',NULL),(12,'login','Successful login from 10.189.129.238','10.189.129.238','2026-02-07 11:23:04.028311',1),(13,'login','Successful login from 10.189.129.238','10.189.129.238','2026-02-07 11:39:21.679314',1),(14,'login','Successful login from 10.189.129.238','10.189.129.238','2026-02-07 11:50:03.788280',1),(15,'login','Successful login from 10.189.129.238','10.189.129.238','2026-02-07 11:50:11.383908',1),(16,'login','Successful login from 10.189.129.238','10.189.129.238','2026-02-07 11:56:20.578758',1),(17,'login','Successful login from 10.189.129.238','10.189.129.238','2026-02-07 11:56:25.182420',1),(18,'result_upload','Uploaded results: 3 created, 0 updated','10.127.248.83','2026-02-07 11:57:06.984791',1),(19,'result_view','Viewed results: 3 records','10.127.248.83','2026-02-07 11:57:14.508606',1),(20,'login','Successful login from 10.127.248.83','10.127.248.83','2026-02-07 11:57:22.251461',NULL),(21,'result_view','Viewed results: 1 records','10.127.248.83','2026-02-07 11:58:22.160088',NULL),(22,'login','Successful login from 10.189.129.238','10.189.129.238','2026-02-07 12:00:13.857441',1),(23,'login','Successful login from 10.189.129.238','10.189.129.238','2026-02-07 12:15:42.655473',NULL),(24,'logout','Logout from 10.189.129.238','10.189.129.238','2026-02-07 12:15:52.200310',NULL),(25,'login','Successful login from 10.189.129.238','10.189.129.238','2026-02-07 12:17:18.277765',1),(26,'login','Successful login from 10.189.129.238','10.189.129.238','2026-02-07 12:54:00.471163',1),(27,'logout','Logout from 10.189.129.238','10.189.129.238','2026-02-07 12:55:24.720262',1),(28,'login','Successful login from 10.189.129.238','10.189.129.238','2026-02-07 12:55:44.147191',NULL),(29,'result_view','Viewed results: 1 records','10.189.129.238','2026-02-07 12:55:44.756304',NULL),(30,'result_view','Viewed results: 1 records','10.189.129.238','2026-02-07 12:55:44.840199',NULL),(31,'login','Successful login from 127.0.0.1','127.0.0.1','2026-02-07 12:58:53.815458',1),(32,'login','Successful login from 127.0.0.1','127.0.0.1','2026-02-07 12:59:02.752240',1),(33,'result_upload','Uploaded results: 2 created, 1 updated','127.0.0.1','2026-02-07 12:59:02.794418',1),(34,'logout','Logout from 10.189.129.238','10.189.129.238','2026-02-07 13:00:02.508585',NULL),(35,'login','Successful login from 10.189.129.238','10.189.129.238','2026-02-07 13:00:19.507988',1),(36,'login','Successful login from 10.189.129.238','10.189.129.238','2026-02-07 13:06:44.580001',1),(37,'login','Successful login from 127.0.0.1','127.0.0.1','2026-02-07 13:30:24.055386',1),(38,'login','Successful login from 10.189.129.238','10.189.129.238','2026-02-07 13:33:09.742638',1),(39,'login','Successful login from 10.189.129.238','10.189.129.238','2026-02-07 13:33:32.726877',1),(40,'login','Successful login from 127.0.0.1','127.0.0.1','2026-02-07 13:35:15.160911',1),(41,'result_view','Viewed results: 5 records','127.0.0.1','2026-02-07 13:35:15.176485',1),(42,'login','Successful login from 10.189.129.238','10.189.129.238','2026-02-07 13:42:51.042684',1),(43,'result_view','Viewed results: 5 records','10.189.129.238','2026-02-07 13:44:07.921639',1),(44,'result_view','Viewed results: 5 records','10.189.129.238','2026-02-07 13:44:08.102396',1),(45,'result_view','Viewed results: 5 records','10.189.129.238','2026-02-07 13:44:39.761334',1),(46,'result_view','Viewed results: 5 records','10.189.129.238','2026-02-07 13:49:16.838069',1),(47,'result_view','Viewed results: 5 records','10.189.129.238','2026-02-07 13:49:16.839784',1),(48,'result_upload','Uploaded results: 1 created, 0 updated','10.189.129.238','2026-02-07 13:49:37.485171',1),(49,'result_view','Viewed results: 6 records','10.189.129.238','2026-02-07 13:49:37.747268',1),(50,'logout','Logout from 10.189.129.238','10.189.129.238','2026-02-07 13:50:16.775519',1),(51,'login','Successful login from 10.189.129.238','10.189.129.238','2026-02-07 13:50:28.487047',NULL),(52,'result_view','Viewed results: 1 records','10.189.129.238','2026-02-07 13:50:29.246427',NULL),(53,'result_view','Viewed results: 1 records','10.189.129.238','2026-02-07 13:50:29.249376',NULL),(54,'logout','Logout from 10.189.129.238','10.189.129.238','2026-02-07 13:51:00.949742',NULL),(55,'login','Successful login from 10.189.129.238','10.189.129.238','2026-02-07 13:51:14.106344',1),(56,'result_view','Viewed results: 6 records','10.189.129.238','2026-02-07 13:51:14.621821',1),(57,'result_view','Viewed results: 6 records','10.189.129.238','2026-02-07 13:51:14.636642',1),(58,'result_upload','Uploaded results: 1 created, 0 updated','10.189.129.238','2026-02-07 13:51:40.599341',1),(59,'result_view','Viewed results: 7 records','10.189.129.238','2026-02-07 13:51:40.861363',1),(60,'logout','Logout from 10.189.129.238','10.189.129.238','2026-02-07 13:51:46.347077',1),(61,'login','Successful login from 10.189.129.238','10.189.129.238','2026-02-07 13:51:55.253898',NULL),(62,'result_view','Viewed results: 1 records','10.189.129.238','2026-02-07 13:51:55.894541',NULL),(63,'result_view','Viewed results: 1 records','10.189.129.238','2026-02-07 13:51:55.898040',NULL),(64,'logout','Logout from 10.189.129.238','10.189.129.238','2026-02-07 13:52:06.100496',NULL),(65,'login','Successful login from 10.189.129.238','10.189.129.238','2026-02-07 13:52:19.365804',1),(66,'result_view','Viewed results: 7 records','10.189.129.238','2026-02-07 13:52:19.903781',1),(67,'result_view','Viewed results: 7 records','10.189.129.238','2026-02-07 13:52:19.904300',1),(68,'login','Successful login from 127.0.0.1','127.0.0.1','2026-02-07 14:09:23.947713',1),(69,'result_view','Viewed results: 7 records','10.189.129.238','2026-02-07 14:10:11.648203',1),(70,'login','Successful login from 10.189.129.238','10.189.129.238','2026-02-07 14:12:52.070859',1),(71,'result_upload','Uploaded results: 1 created, 0 updated','10.189.129.238','2026-02-07 14:22:42.357705',1),(72,'login','Successful login from 127.0.0.1','127.0.0.1','2026-02-07 14:26:37.144023',1),(73,'login','Successful login from 127.0.0.1','127.0.0.1','2026-02-07 14:34:13.809397',1),(74,'DELETE_EXAM','Deleted exam: B.Tech III year II Semester Supplementary Exam Results December 2026 (1 students, 1 total records)','127.0.0.1','2026-02-07 14:39:08.596721',1),(75,'DELETE_EXAM','Deleted exam: B.Tech II year I Semester Regular Exam Results June 2026 (1 students, 1 total records)','127.0.0.1','2026-02-07 14:40:08.894685',1),(76,'login','Successful login from 10.189.129.238','10.189.129.238','2026-02-07 14:47:59.529132',1),(77,'result_upload','Uploaded results: 0 created, 1 updated','10.189.129.238','2026-02-07 14:49:02.458019',1),(78,'result_upload','Uploaded results: 1 created, 0 updated','10.189.129.238','2026-02-07 14:49:37.563698',1),(79,'DELETE_EXAM','Deleted exam: B.Tech I year II Semester Regular Exam Results February 2026 (3 students, 3 total records)','10.189.129.238','2026-02-07 14:50:03.528077',1),(80,'DELETE_EXAM','Deleted exam: M.Tech I year I Semester Regular Exam Results January 2028 (1 students, 1 total records)','10.189.129.238','2026-02-07 14:50:08.231891',1),(81,'DELETE_EXAM','Deleted exam: B.Tech III year II Semester Supplementary Exam Results July 2026 (1 students, 1 total records)','10.189.129.238','2026-02-07 14:50:12.050584',1),(82,'DELETE_EXAM','Deleted exam: M.Tech III year I Semester Supplementary Exam Results April 2024 (1 students, 1 total records)','10.189.129.238','2026-02-07 14:50:17.865567',1),(83,'result_upload','Uploaded results: 3 created, 0 updated','10.189.129.238','2026-02-07 15:23:21.686601',1),(84,'result_upload','Uploaded results: 3 created, 0 updated','10.189.129.238','2026-02-07 15:42:47.172676',1),(85,'login','Successful login from 10.189.129.238','10.189.129.238','2026-02-07 16:23:37.964091',1),(86,'DELETE_EXAM','Deleted exam: B.Tech I year I Semester Regular Exam Results January 2024 (3 students, 3 total records)','10.189.129.238','2026-02-07 16:26:19.712181',1),(87,'login','Successful login from 127.0.0.1','127.0.0.1','2026-02-07 17:46:18.322638',1),(88,'login','Successful login from 127.0.0.1','127.0.0.1','2026-02-07 18:05:50.444880',1),(89,'login','Successful login from 127.0.0.1','127.0.0.1','2026-02-07 18:05:59.645798',1),(90,'login','Successful login from 127.0.0.1','127.0.0.1','2026-02-07 18:06:09.591372',1),(91,'login','Successful login from 10.189.129.238','10.189.129.238','2026-02-07 18:26:44.311059',1),(92,'login','Successful login from 10.189.129.238','10.189.129.238','2026-02-07 18:27:35.820819',1),(93,'login','Successful login from 10.189.129.238','10.189.129.238','2026-02-07 18:34:41.469239',1),(94,'DELETE_EXAM','Deleted exam: B.Tech II year I Semester Regular and Supplementary Exam Results April 2025 (3 students, 3 total records)','10.189.129.238','2026-02-07 19:04:07.792127',1),(95,'login','Successful login from 10.189.129.238','10.189.129.238','2026-02-08 01:35:21.552769',1),(96,'result_upload','Uploaded results: 3 created, 0 updated, Branches: [\'mech\', \'eee\', \'cse\']','10.189.129.238','2026-02-08 01:36:11.683748',1),(97,'result_upload','Uploaded results: 3 created, 0 updated, Branches: [\'mech\', \'eee\', \'cse\']','10.189.129.238','2026-02-08 01:46:19.205732',1),(98,'login','Successful login from 10.189.159.226','10.189.159.226','2026-02-08 15:35:10.875042',1),(99,'login','Successful login from 127.0.0.1','127.0.0.1','2026-02-08 16:26:16.282129',1),(100,'login','Successful login from 127.0.0.1','127.0.0.1','2026-02-08 16:47:08.988902',1),(101,'login','Successful login from 127.0.0.1','127.0.0.1','2026-02-08 16:54:39.329894',1),(102,'login','Successful login from 127.0.0.1','127.0.0.1','2026-02-08 16:55:33.779672',NULL),(103,'login','Successful login from 127.0.0.1','127.0.0.1','2026-02-08 16:59:58.338461',1),(104,'login','Successful login from 127.0.0.1','127.0.0.1','2026-02-08 17:00:09.486933',NULL),(105,'login','Successful login from 10.189.159.226','10.189.159.226','2026-02-08 17:03:27.846961',1),(106,'login','Successful login from 10.189.159.226','10.189.159.226','2026-02-08 17:15:12.142061',1),(107,'login','Successful login from 127.0.0.1','127.0.0.1','2026-02-08 17:15:18.889507',1),(108,'login','Successful login from 127.0.0.1','127.0.0.1','2026-02-08 17:15:25.920941',1),(109,'login','Successful login from 127.0.0.1','127.0.0.1','2026-02-08 17:15:34.084759',NULL),(110,'login','Successful login from 127.0.0.1','127.0.0.1','2026-02-08 17:15:41.675921',NULL),(111,'login','Successful login from 127.0.0.1','127.0.0.1','2026-02-08 17:15:49.256192',NULL),(112,'login','Successful login from 127.0.0.1','127.0.0.1','2026-02-08 17:26:52.348108',1),(113,'login','Successful login from 127.0.0.1','127.0.0.1','2026-02-08 17:32:34.454278',1),(114,'login','Successful login from 127.0.0.1','127.0.0.1','2026-02-08 17:40:43.550928',1),(115,'login','Successful login from 127.0.0.1','127.0.0.1','2026-02-08 17:40:52.730810',1),(116,'DELETE_EXAM','Deleted exam: B.Tech I year II Semester Regular and Supplementary Exam Results November 2026 (3 students, 3 total records)','10.189.159.226','2026-02-08 17:48:41.199864',1),(117,'login','Successful login from 127.0.0.1','127.0.0.1','2026-02-08 17:52:04.573210',1),(118,'login','Successful login from 127.0.0.1','127.0.0.1','2026-02-08 17:52:14.659835',1),(119,'login','Successful login from 127.0.0.1','127.0.0.1','2026-02-08 17:52:25.742264',1),(120,'result_upload','Uploaded results: 3 created, 0 updated, Branches: [\'mech\', \'cse\', \'eee\']','10.189.159.226','2026-02-08 17:54:33.675375',1),(121,'result_upload','Uploaded results: 3 created, 0 updated, Branches: [\'mech\', \'cse\', \'eee\']','10.189.159.226','2026-02-08 17:58:25.198297',1),(122,'DELETE_EXAM','Deleted exam: B.Tech IV year I Semester Regular and Supplementary Exam Results September 2024 (3 students, 3 total records)','10.189.159.226','2026-02-08 18:00:29.831893',1),(123,'result_upload','Uploaded results: 3 created, 0 updated, Branches: [\'mech\', \'cse\', \'eee\']','10.189.159.226','2026-02-08 18:00:50.059201',1),(124,'login','Successful login from 10.189.159.226','10.189.159.226','2026-02-08 18:09:58.892017',1),(125,'DELETE_EXAM','Deleted exam: B.Tech II year I Semester Regular Exam Results October 2025 (3 students, 3 total records)','10.189.159.226','2026-02-08 18:10:05.382889',1),(126,'DELETE_EXAM','Deleted exam: B.Tech IV year II Semester Regular and Supplementary Exam Results March 2026 (3 students, 3 total records)','10.189.159.226','2026-02-08 18:10:11.029284',1),(127,'login','Successful login from 127.0.0.1','127.0.0.1','2026-02-08 18:12:22.973152',1),(128,'login','Successful login from 127.0.0.1','127.0.0.1','2026-02-08 18:12:36.539303',1),(129,'login','Successful login from 127.0.0.1','127.0.0.1','2026-02-08 18:12:47.588226',1),(130,'result_upload','Uploaded results: 5 created, 0 updated, Branches: [\'mech\', \'cse\', \'eee\']','10.189.159.226','2026-02-08 18:13:16.090975',1),(131,'result_edit','Updated marks for CS101 - TEST125 Year 1 Sem 1','10.189.159.226','2026-02-08 18:18:51.379262',1),(132,'result_edit','Updated marks for CS101 - TEST125 Year 1 Sem 1','10.189.159.226','2026-02-08 18:19:08.490922',1),(133,'result_edit','Updated marks for CS101 - TEST125 Year 1 Sem 1','10.189.159.226','2026-02-08 18:19:25.479376',1),(134,'login','Successful login from 10.127.248.83','10.127.248.83','2026-02-08 18:35:15.810735',1),(135,'login','Successful login from 10.127.248.83','10.127.248.83','2026-02-08 18:35:27.269393',1),(136,'login','Successful login from 10.127.248.83','10.127.248.83','2026-02-08 18:35:39.414985',1),(137,'login','Successful login from 10.127.248.83','10.127.248.83','2026-02-08 18:39:18.421470',1),(138,'login','Successful login from 10.127.248.83','10.127.248.83','2026-02-08 18:39:28.233711',1),(139,'login','Successful login from 10.127.248.83','10.127.248.83','2026-02-08 18:39:38.281345',1),(140,'login','Successful login from 10.189.159.226','10.189.159.226','2026-02-08 18:42:57.306410',1),(141,'logout','Logout from 10.189.159.226','10.189.159.226','2026-02-08 18:43:04.011955',1),(142,'login','Successful login from 127.0.0.1','127.0.0.1','2026-02-08 18:45:22.945056',1),(143,'login','Successful login from 10.189.159.226','10.189.159.226','2026-02-08 18:45:26.017297',1),(144,'login','Successful login from 127.0.0.1','127.0.0.1','2026-02-08 18:45:32.339188',1),(145,'login','Successful login from 127.0.0.1','127.0.0.1','2026-02-08 18:46:19.914165',1),(146,'result_view','Viewed results: 0 records','127.0.0.1','2026-02-08 18:46:19.932088',1),(147,'login','Successful login from 127.0.0.1','127.0.0.1','2026-02-08 18:46:31.786761',1),(148,'result_view','Viewed results: 0 records','127.0.0.1','2026-02-08 18:46:31.807805',1),(149,'login','Successful login from 127.0.0.1','127.0.0.1','2026-02-08 18:46:48.775550',1),(150,'login','Successful login from 127.0.0.1','127.0.0.1','2026-02-08 18:46:58.437325',1),(151,'login','Successful login from 127.0.0.1','127.0.0.1','2026-02-08 18:47:08.351953',1),(152,'login','Successful login from 127.0.0.1','127.0.0.1','2026-02-08 18:54:18.096382',1),(153,'login','Successful login from 127.0.0.1','127.0.0.1','2026-02-08 18:59:12.152953',1),(154,'login','Successful login from 127.0.0.1','127.0.0.1','2026-02-08 18:59:31.736304',1),(155,'login','Successful login from 127.0.0.1','127.0.0.1','2026-02-08 19:17:35.089933',1),(156,'login','Successful login from 127.0.0.1','127.0.0.1','2026-02-08 19:25:28.765368',1),(157,'login','Successful login from 127.0.0.1','127.0.0.1','2026-02-08 19:28:52.841356',1),(158,'login','Successful login from 127.0.0.1','127.0.0.1','2026-02-08 19:28:54.927098',1),(159,'login','Successful login from 127.0.0.1','127.0.0.1','2026-02-08 19:29:14.157767',1),(160,'login','Successful login from 127.0.0.1','127.0.0.1','2026-02-08 19:29:24.376975',1),(161,'login','Successful login from 127.0.0.1','127.0.0.1','2026-02-08 19:30:05.272504',1),(162,'login','Successful login from 10.127.248.83','10.127.248.83','2026-02-08 19:52:28.057773',1),(163,'login','Successful login from 10.127.248.83','10.127.248.83','2026-02-08 19:52:37.999933',1),(164,'login','Successful login from 10.127.248.83','10.127.248.83','2026-02-08 19:52:47.310731',1),(165,'login','Successful login from 10.189.159.226','10.189.159.226','2026-02-08 19:53:02.033940',1),(166,'login','Successful login from 10.127.248.83','10.127.248.83','2026-02-08 19:54:10.146960',1),(167,'login','Successful login from 10.127.248.83','10.127.248.83','2026-02-08 19:54:19.469983',1),(168,'login','Successful login from 10.189.136.127','10.189.136.127','2026-02-08 20:19:10.712221',1),(169,'login','Successful login from 10.189.136.127','10.189.136.127','2026-02-08 20:23:27.707832',1),(170,'login','Successful login from 127.0.0.1','127.0.0.1','2026-02-08 20:23:39.531902',1),(171,'login','Successful login from 127.0.0.1','127.0.0.1','2026-02-08 20:29:44.816147',1),(172,'login','Successful login from 127.0.0.1','127.0.0.1','2026-02-08 20:34:18.432295',1),(173,'result_upload','Uploaded results: 1 created, 0 updated, Branches: [\'cse\']','127.0.0.1','2026-02-08 20:34:18.469637',1),(174,'login','Successful login from 127.0.0.1','127.0.0.1','2026-02-08 20:35:06.909142',1),(175,'result_upload','Uploaded results: 0 created, 1 updated, Branches: [\'cse\']','127.0.0.1','2026-02-08 20:35:06.954126',1),(176,'login','Successful login from 10.189.136.127','10.189.136.127','2026-02-09 01:41:33.145653',1),(177,'DELETE_EXAM','Deleted exam: B.Tech I year I Semester Regular Exam Results February 2026 (1 students, 1 total records)','10.189.136.127','2026-02-09 01:41:41.227546',1),(178,'result_upload','Uploaded results: 5 created, 0 updated, Branches: [\'mech\', \'eee\', \'cse\']','10.189.136.127','2026-02-09 01:42:03.253800',1),(179,'result_upload','Uploaded results: 1 created, 0 updated, Branches: [\'cse\']','10.189.136.127','2026-02-09 01:56:15.211252',1),(180,'DELETE_EXAM','Deleted exam: B.Tech II year I Semester Regular and Supplementary Exam Results January 2025 (1 students, 1 total records)','10.189.136.127','2026-02-09 02:25:40.016768',1),(181,'DELETE_EXAM','Deleted exam: B.Tech I year I Semester Regular and Supplementary Exam Results November 2026 (5 students, 5 total records)','10.189.136.127','2026-02-09 02:25:50.342505',1),(182,'result_upload','Uploaded results: 5 created, 0 updated, Branches: [\'mech\', \'eee\', \'cse\']','10.189.136.127','2026-02-09 02:26:19.566711',1),(183,'result_upload','Uploaded results: 0 created, 1 updated, Branches: [\'eee\']','10.189.136.127','2026-02-09 02:37:32.437161',1),(184,'result_upload','Uploaded results: 1 created, 0 updated, Branches: [\'eee\']','10.189.136.127','2026-02-09 02:39:01.315399',1),(185,'DELETE_EXAM','Deleted exam: B.Tech I year I Semester Supplementary Exam Results January 2026 (1 students, 1 total records)','10.189.136.127','2026-02-09 02:40:43.182528',1),(186,'login','Successful login from 10.189.136.127','10.189.136.127','2026-02-09 02:44:33.801364',1),(187,'DELETE_EXAM','Deleted exam: B.Tech I year I Semester Regular and Supplementary Exam Results December 2025 (4 students, 4 total records)','10.189.136.127','2026-02-09 02:45:46.070600',1),(188,'DELETE_EXAM','Deleted exam: B.Tech I year II Semester Regular Exam Results January 2026 (1 students, 1 total records)','10.189.136.127','2026-02-09 02:45:49.472538',1),(189,'result_upload','Uploaded results: 5 created, 0 updated, Branches: [\'mech\', \'eee\', \'cse\']','10.189.136.127','2026-02-09 02:46:07.246138',1),(190,'result_upload','Uploaded results: 0 created, 1 updated, Branches: [\'eee\']','10.189.136.127','2026-02-09 02:57:38.846918',1),(191,'login','Successful login from 10.189.149.235','10.189.149.235','2026-02-09 03:48:25.523075',1),(192,'DELETE_EXAM','Deleted exam: B.Tech I year I Semester Regular and Supplementary Exam Results December 2025 (4 students, 4 total records)','10.189.149.235','2026-02-09 03:48:51.185507',1),(193,'DELETE_EXAM','Deleted exam: B.Tech I year I Semester Supplementary Exam Results December 2025 (1 students, 1 total records)','10.189.149.235','2026-02-09 03:48:54.226644',1),(194,'result_upload','Uploaded results: 5 created, 0 updated, Branches: [\'eee\', \'mech\', \'cse\']','10.189.149.235','2026-02-09 03:50:13.504093',1),(195,'result_upload','Uploaded results: 0 created, 1 updated, Branches: [\'eee\']','10.189.149.235','2026-02-09 03:50:33.932376',1),(196,'login','Successful login from 10.189.149.235','10.189.149.235','2026-02-09 04:52:59.519066',1),(197,'DELETE_EXAM','Deleted exam: B.Tech I year I Semester Regular and Supplementary Exam Results December 2025 (4 students, 4 total records)','10.189.149.235','2026-02-09 05:26:34.399456',1),(198,'DELETE_EXAM','Deleted exam: B.Tech I year I Semester Supplementary Exam Results January 2026 (1 students, 1 total records)','10.189.149.235','2026-02-09 05:26:45.306498',1),(199,'result_upload','Uploaded results: 5 created, 0 updated, Branches: [\'mech\', \'cse\', \'eee\']','10.189.149.235','2026-02-09 05:27:19.340967',1),(200,'result_upload','Uploaded results: 0 created, 1 updated, Branches: [\'eee\']','10.189.149.235','2026-02-09 05:27:49.321204',1),(201,'DELETE_EXAM','Deleted exam: B.Tech I year I Semester Regular and Supplementary Exam Results December 2025 (5 students, 5 total records)','10.189.149.235','2026-02-09 05:40:29.014193',1),(202,'DELETE_EXAM','Deleted exam: B.Tech I year I Semester Supplementary Exam Results January 2026 (1 students, 1 total records)','10.189.149.235','2026-02-09 05:40:32.965584',1),(203,'result_upload','Uploaded results: 5 created, 0 updated, Branches: [\'mech\', \'cse\', \'eee\']','10.189.149.235','2026-02-09 05:41:07.178182',1),(204,'result_upload','Uploaded results: 0 created, 1 updated, Branches: [\'eee\']','10.189.149.235','2026-02-09 05:42:09.411283',1),(205,'login','Successful login from 10.189.149.235','10.189.149.235','2026-02-09 06:03:19.522855',1),(206,'DELETE_EXAM','Deleted exam: B.Tech I year I Semester Regular and Supplementary Exam Results December 2025 (4 students, 4 total records)','10.189.149.235','2026-02-09 06:03:25.233159',1),(207,'DELETE_EXAM','Deleted exam: B.Tech I year I Semester Supplementary Exam Results January 2026 (1 students, 1 total records)','10.189.149.235','2026-02-09 06:03:28.702794',1),(208,'result_upload','Uploaded results: 5 created, 0 updated, Branches: [\'cse\', \'mech\', \'eee\']','10.189.149.235','2026-02-09 06:03:48.557907',1),(209,'result_upload','Uploaded results: 0 created, 1 updated, Branches: [\'eee\']','10.189.149.235','2026-02-09 06:04:10.760971',1),(210,'DELETE_EXAM','Deleted exam: B.Tech I year I Semester Regular and Supplementary Exam Results December 2015 (4 students, 4 total records)','10.189.149.235','2026-02-09 06:15:07.518564',1),(211,'DELETE_EXAM','Deleted exam: B.Tech I year I Semester Supplementary Exam Results January 2026 (1 students, 1 total records)','10.189.149.235','2026-02-09 06:15:11.779947',1),(212,'result_upload','Uploaded results: 5 created, 0 updated, Branches: [\'cse\', \'eee\', \'mech\']','10.189.149.235','2026-02-09 06:15:30.187116',1),(213,'result_upload','Uploaded results: 0 created, 1 updated, Branches: [\'eee\']','10.189.149.235','2026-02-09 06:15:51.509271',1),(214,'DELETE_EXAM','Deleted exam: B.Tech I year I Semester Regular and Supplementary Exam Results December 2025 (4 students, 4 total records)','10.189.149.235','2026-02-09 06:33:10.372456',1),(215,'DELETE_EXAM','Deleted exam: B.Tech I year I Semester Supplementary Exam Results January 2026 (1 students, 1 total records)','10.189.149.235','2026-02-09 06:33:14.304195',1),(216,'login','Successful login from 10.127.248.83','10.127.248.83','2026-02-09 06:39:13.666299',1),(217,'login','Successful login from 10.127.248.83','10.127.248.83','2026-02-09 06:39:24.482242',1),(218,'login','Successful login from 10.127.248.83','10.127.248.83','2026-02-09 06:39:32.718592',1),(219,'login','Successful login from 10.127.248.83','10.127.248.83','2026-02-09 06:39:54.876618',1),(220,'login','Successful login from 10.127.248.83','10.127.248.83','2026-02-09 06:51:56.528792',1),(221,'result_upload','Uploaded results: 5 created, 0 updated, Branches: [\'cse\']','10.127.248.83','2026-02-09 06:51:56.591326',1),(222,'login','Successful login from 10.127.248.83','10.127.248.83','2026-02-09 06:52:35.937622',1),(223,'result_upload','Uploaded results: 2 created, 0 updated, Branches: [\'cse\']','10.127.248.83','2026-02-09 06:52:36.000073',1),(224,'login','Successful login from 10.127.248.83','10.127.248.83','2026-02-09 06:53:19.694301',1),(225,'login','Successful login from 10.189.210.217','10.189.210.217','2026-02-09 06:58:48.962421',1),(226,'result_upload','Uploaded results: 5 created, 0 updated, Branches: [\'mech\', \'cse\', \'eee\']','10.189.210.217','2026-02-09 06:59:25.091376',1),(227,'result_upload','Uploaded results: 1 created, 0 updated, Branches: [\'eee\']','10.189.210.217','2026-02-09 06:59:49.929734',1),(228,'DELETE_EXAM','Deleted exam: B.Tech I year I Semester Supplementary Exam Results February 2026 (1 students, 1 total records)','10.189.210.217','2026-02-09 07:02:04.870851',1),(229,'result_upload','Uploaded results: 1 created, 0 updated, Branches: [\'eee\']','10.189.210.217','2026-02-09 07:02:55.674444',1);
/*!40000 ALTER TABLE `audit_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add Blacklisted Token',6,'add_blacklistedtoken'),(22,'Can change Blacklisted Token',6,'change_blacklistedtoken'),(23,'Can delete Blacklisted Token',6,'delete_blacklistedtoken'),(24,'Can view Blacklisted Token',6,'view_blacklistedtoken'),(25,'Can add Outstanding Token',7,'add_outstandingtoken'),(26,'Can change Outstanding Token',7,'change_outstandingtoken'),(27,'Can delete Outstanding Token',7,'delete_outstandingtoken'),(28,'Can view Outstanding Token',7,'view_outstandingtoken'),(29,'Can add user',8,'add_user'),(30,'Can change user',8,'change_user'),(31,'Can delete user',8,'delete_user'),(32,'Can view user',8,'view_user'),(33,'Can add result',9,'add_result'),(34,'Can change result',9,'change_result'),(35,'Can delete result',9,'delete_result'),(36,'Can view result',9,'view_result'),(37,'Can add notification',10,'add_notification'),(38,'Can change notification',10,'change_notification'),(39,'Can delete notification',10,'delete_notification'),(40,'Can view notification',10,'view_notification'),(41,'Can add login attempt',11,'add_loginattempt'),(42,'Can change login attempt',11,'change_loginattempt'),(43,'Can delete login attempt',11,'delete_loginattempt'),(44,'Can view login attempt',11,'view_loginattempt'),(45,'Can add audit log',12,'add_auditlog'),(46,'Can change audit log',12,'change_auditlog'),(47,'Can delete audit log',12,'delete_auditlog'),(48,'Can view audit log',12,'view_auditlog'),(49,'Can add subject',13,'add_subject'),(50,'Can change subject',13,'change_subject'),(51,'Can delete subject',13,'delete_subject'),(52,'Can view subject',13,'view_subject'),(53,'Can add blacklisted token',14,'add_blacklistedtoken'),(54,'Can change blacklisted token',14,'change_blacklistedtoken'),(55,'Can delete blacklisted token',14,'delete_blacklistedtoken'),(56,'Can view blacklisted token',14,'view_blacklistedtoken');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blacklisted_tokens`
--

DROP TABLE IF EXISTS `blacklisted_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `blacklisted_tokens` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `token` longtext NOT NULL,
  `blacklisted_at` datetime(6) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `token` (`token`) USING HASH,
  KEY `blacklisted_tokens_user_id_ed5237da_fk_users_id` (`user_id`),
  KEY `blacklisted_token_d070ae_idx` (`token`(768)),
  KEY `blacklisted_blackli_bd04a9_idx` (`blacklisted_at`),
  CONSTRAINT `blacklisted_tokens_user_id_ed5237da_fk_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blacklisted_tokens`
--

LOCK TABLES `blacklisted_tokens` WRITE;
/*!40000 ALTER TABLE `blacklisted_tokens` DISABLE KEYS */;
INSERT INTO `blacklisted_tokens` VALUES (3,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc3MDU1NTI0MCwiaWF0IjoxNzcwNDY4ODQwLCJqdGkiOiI3MjNiZTRjYjdlMTU0MmM0ODUwNTQ0YjNjNzI1ODVmOCIsInVzZXJfaWQiOiIxIn0.fqJJvraxXLzgqCPRTsz6gAmMPHnLhxu4-Gr6P-QfP1Y','2026-02-07 12:55:24.715818',1),(4,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzcwNDcyNDQwLCJpYXQiOjE3NzA0Njg4NDAsImp0aSI6Ijk1MTA3N2RmYjExNjRjZjJiYmFhNDUyMzU3OTFhN2M5IiwidXNlcl9pZCI6IjEifQ.mHbhWHFE1Ki57TnGx_zRP1eioEbYGGG_JJHD6RbcPvw','2026-02-07 12:55:24.718618',1),(7,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc3MDU1ODE3MSwiaWF0IjoxNzcwNDcxNzcxLCJqdGkiOiJjZGQ3YzRlMWEwOGQ0OGM1OGY0ZGFlMDhjZTJiMDg4MCIsInVzZXJfaWQiOiIxIn0.9gp4YsChHdXjvsfsNMm6cflIJFs_LR6g8WwUqvImSVM','2026-02-07 13:50:16.772571',1),(8,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzcwNDc1MzcxLCJpYXQiOjE3NzA0NzE3NzEsImp0aSI6IjBlMTkzZmRlMzU4MzRjZGE4NzliMTYyY2I5ODRjZGFhIiwidXNlcl9pZCI6IjEifQ.BkvcsEwqy4tqubK8TLPxKWslWAs-EbpGMCpUvaVJ5-c','2026-02-07 13:50:16.774568',1),(11,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc3MDU1ODY3NCwiaWF0IjoxNzcwNDcyMjc0LCJqdGkiOiI4YmJhYjA3MGFkYzI0MGUxODEzNWEzZjU0YWNjZjc4NiIsInVzZXJfaWQiOiIxIn0.Ro1OXc-1eY6p3Kl68ZLvM96SfQG2O1o8-auXdfaZ14U','2026-02-07 13:51:46.342588',1),(12,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzcwNDc1ODc0LCJpYXQiOjE3NzA0NzIyNzQsImp0aSI6ImIxOWNiN2ExNjNlZDQ3YzJiMTEwMTdmOTdmODUyYmM1IiwidXNlcl9pZCI6IjEifQ.KRFoBWdRxh_mwBIXIYuZNBkdl8aPYglb24A4j2BQ-Gs','2026-02-07 13:51:46.346106',1),(15,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc3MDY2MjU3NywiaWF0IjoxNzcwNTc2MTc3LCJqdGkiOiI2YjBjMGVjYWE2ODk0YzJjODNlZWM0MWJlNjk1YTE0MCIsInVzZXJfaWQiOiIxIn0.qnr6Vw14KTnxDNR-9W9uXwz05uIAqkVyQIewa89ujQc','2026-02-08 18:43:04.008850',1),(16,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzcwNTc5Nzc3LCJpYXQiOjE3NzA1NzYxNzcsImp0aSI6ImFkMTdmNDc4YTI5NTQ0NTRhNDVmOWJlYjQxYTM4N2MxIiwidXNlcl9pZCI6IjEifQ.K6C9Byn0aLwDXL0SEw7FhzdpSLWsh2kQ0XWYsYIQp7E','2026-02-08 18:43:04.010917',1);
/*!40000 ALTER TABLE `blacklisted_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_users_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'contenttypes','contenttype'),(12,'results','auditlog'),(14,'results','blacklistedtoken'),(11,'results','loginattempt'),(10,'results','notification'),(9,'results','result'),(13,'results','subject'),(8,'results','user'),(5,'sessions','session'),(6,'token_blacklist','blacklistedtoken'),(7,'token_blacklist','outstandingtoken');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2026-02-07 08:33:30.035852'),(2,'contenttypes','0002_remove_content_type_name','2026-02-07 08:33:30.057790'),(3,'auth','0001_initial','2026-02-07 08:33:30.151219'),(4,'auth','0002_alter_permission_name_max_length','2026-02-07 08:33:30.171777'),(5,'auth','0003_alter_user_email_max_length','2026-02-07 08:33:30.176244'),(6,'auth','0004_alter_user_username_opts','2026-02-07 08:33:30.181131'),(7,'auth','0005_alter_user_last_login_null','2026-02-07 08:33:30.185547'),(8,'auth','0006_require_contenttypes_0002','2026-02-07 08:33:30.187325'),(9,'auth','0007_alter_validators_add_error_messages','2026-02-07 08:33:30.191125'),(10,'auth','0008_alter_user_username_max_length','2026-02-07 08:33:30.194381'),(11,'auth','0009_alter_user_last_name_max_length','2026-02-07 08:33:30.198114'),(12,'auth','0010_alter_group_name_max_length','2026-02-07 08:33:30.203769'),(13,'auth','0011_update_proxy_permissions','2026-02-07 08:33:30.207838'),(14,'auth','0012_alter_user_first_name_max_length','2026-02-07 08:33:30.211711'),(15,'results','0001_initial','2026-02-07 08:33:30.527045'),(16,'admin','0001_initial','2026-02-07 08:33:30.587587'),(17,'admin','0002_logentry_remove_auto_add','2026-02-07 08:33:30.595691'),(18,'admin','0003_logentry_add_action_flag_choices','2026-02-07 08:33:30.602738'),(19,'sessions','0001_initial','2026-02-07 08:33:30.618040'),(20,'token_blacklist','0001_initial','2026-02-07 08:33:30.700861'),(21,'token_blacklist','0002_outstandingtoken_jti_hex','2026-02-07 08:33:30.715223'),(22,'token_blacklist','0003_auto_20171017_2007','2026-02-07 08:33:30.726603'),(23,'token_blacklist','0004_auto_20171017_2013','2026-02-07 08:33:30.770433'),(24,'token_blacklist','0005_remove_outstandingtoken_jti','2026-02-07 08:33:30.807192'),(25,'token_blacklist','0006_auto_20171017_2113','2026-02-07 08:33:30.819575'),(26,'token_blacklist','0007_auto_20171017_2214','2026-02-07 08:33:30.910847'),(27,'token_blacklist','0008_migrate_to_bigautofield','2026-02-07 08:33:30.991442'),(28,'token_blacklist','0010_fix_migrate_to_bigautofield','2026-02-07 08:33:31.003525'),(29,'token_blacklist','0011_linearizes_history','2026-02-07 08:33:31.005202'),(30,'token_blacklist','0012_alter_outstandingtoken_user','2026-02-07 08:33:31.012601'),(31,'token_blacklist','0013_alter_blacklistedtoken_options_and_more','2026-02-07 08:33:31.022260'),(32,'results','0002_remove_result_results_roll_nu_3f83e5_idx_and_more','2026-02-07 11:45:24.561869'),(33,'results','0003_user_failed_login_attempts_user_locked_until_and_more','2026-02-07 12:06:42.050803'),(34,'results','0004_notification_exam_name_notification_result_and_more','2026-02-07 12:26:58.717177'),(35,'results','0005_result_course','2026-02-07 14:28:44.033193'),(36,'results','0006_result_branch','2026-02-07 16:10:31.380866'),(37,'results','0007_subject_attempts','2026-02-07 17:48:26.488557'),(38,'results','0008_result_percentage','2026-02-07 18:55:29.560207'),(39,'results','0009_user_branch_user_can_manage_users_and_more','2026-02-08 16:12:33.800295'),(40,'results','0010_user_can_delete_results_user_can_upload_results_and_more','2026-02-08 16:34:07.986749'),(42,'results','0011_fix_student_null_constraint','2026-02-08 19:11:48.944448'),(43,'results','0012_result_completion_date','2026-02-09 03:25:25.877377'),(44,'results','0013_alter_result_unique_together_and_more','2026-02-09 05:22:07.247993');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_attempts`
--

DROP TABLE IF EXISTS `login_attempts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `login_attempts` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(150) NOT NULL,
  `ip_address` char(39) NOT NULL,
  `timestamp` datetime(6) NOT NULL,
  `success` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `login_attem_usernam_ece61f_idx` (`username`,`timestamp`),
  KEY `login_attem_ip_addr_340a7c_idx` (`ip_address`,`timestamp`)
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_attempts`
--

LOCK TABLES `login_attempts` WRITE;
/*!40000 ALTER TABLE `login_attempts` DISABLE KEYS */;
INSERT INTO `login_attempts` VALUES (1,'admin','127.0.0.1','2026-02-07 08:38:43.641409',1),(2,'admin','10.189.129.238','2026-02-07 10:59:14.110279',1),(4,'admin','10.189.129.238','2026-02-07 11:04:34.268650',1),(7,'TEST123','10.127.248.83','2026-02-07 11:17:17.857736',1),(8,'admin','10.127.248.83','2026-02-07 11:17:48.699918',1),(9,'admin','10.189.129.238','2026-02-07 11:23:04.024993',1),(10,'admin','10.189.129.238','2026-02-07 11:39:21.660573',1),(12,'admin','10.189.129.238','2026-02-07 11:50:11.378008',1),(15,'TEST123','10.127.248.83','2026-02-07 11:57:22.248641',1),(16,'admin','10.189.129.238','2026-02-07 12:00:13.845211',1),(22,'TEST123','10.189.129.238','2026-02-07 12:15:42.634999',1),(23,'admin','10.189.129.238','2026-02-07 12:17:18.273139',1),(25,'TEST123','10.189.129.238','2026-02-07 12:55:44.143988',1),(28,'admin','10.189.129.238','2026-02-07 13:00:19.487819',1),(29,'admin','10.189.129.238','2026-02-07 13:06:44.577573',1),(33,'admin','127.0.0.1','2026-02-07 13:35:15.141488',1),(34,'admin','10.189.129.238','2026-02-07 13:42:51.039322',1),(37,'TEST123','10.189.129.238','2026-02-07 13:51:55.252092',1),(38,'admin','10.189.129.238','2026-02-07 13:52:19.363644',1),(40,'admin','10.189.129.238','2026-02-07 14:12:52.068294',1),(41,'admin','127.0.0.1','2026-02-07 14:26:37.126742',1),(42,'admin','127.0.0.1','2026-02-07 14:34:13.791959',1),(43,'admin','10.189.129.238','2026-02-07 14:47:59.525883',1),(44,'admin','10.189.129.238','2026-02-07 16:23:37.944953',1),(45,'admin','127.0.0.1','2026-02-07 17:46:18.301213',1),(48,'admin','127.0.0.1','2026-02-07 18:06:09.582748',1),(50,'admin','10.189.129.238','2026-02-07 18:27:35.819225',1),(51,'admin','10.189.129.238','2026-02-07 18:34:41.466028',1),(52,'admin','10.189.129.238','2026-02-08 01:35:21.545062',1),(53,'admin','10.189.159.226','2026-02-08 15:35:10.827802',1),(54,'admin','127.0.0.1','2026-02-08 16:26:16.262168',1),(55,'admin','127.0.0.1','2026-02-08 16:47:08.970165',1),(56,'admin','127.0.0.1','2026-02-08 16:54:39.325443',1),(59,'dean_admin','127.0.0.1','2026-02-08 17:00:09.475622',1),(60,'admin','10.189.159.226','2026-02-08 17:03:27.843380',1),(63,'admin','127.0.0.1','2026-02-08 17:15:25.902157',1),(64,'hod_ece','127.0.0.1','2026-02-08 17:15:34.082781',1),(65,'dean_admin','127.0.0.1','2026-02-08 17:15:41.672762',1),(66,'faculty_cse','127.0.0.1','2026-02-08 17:15:49.253527',1),(67,'admin','127.0.0.1','2026-02-08 17:26:52.345905',1),(68,'admin','127.0.0.1','2026-02-08 17:32:34.452451',1),(70,'admin','127.0.0.1','2026-02-08 17:40:52.728255',1),(73,'admin','127.0.0.1','2026-02-08 17:52:25.740245',1),(77,'admin','127.0.0.1','2026-02-08 18:12:47.586237',1),(92,'admin','127.0.0.1','2026-02-08 18:47:08.349599',1),(95,'admin','127.0.0.1','2026-02-08 18:59:31.733153',1),(96,'admin','127.0.0.1','2026-02-08 19:17:35.071005',1),(102,'admin','127.0.0.1','2026-02-08 19:30:05.252582',1),(108,'admin','10.127.248.83','2026-02-08 19:54:19.459718',1),(111,'admin','127.0.0.1','2026-02-08 20:23:39.528560',1),(114,'admin','127.0.0.1','2026-02-08 20:35:06.902780',1),(115,'admin','10.189.136.127','2026-02-09 01:41:33.141682',1),(116,'admin','10.189.136.127','2026-02-09 02:44:33.799373',1),(117,'admin','10.189.149.235','2026-02-09 03:48:25.504235',1),(118,'admin','10.189.149.235','2026-02-09 04:52:59.500727',1),(119,'admin','10.189.149.235','2026-02-09 06:03:19.502428',1),(123,'admin','10.127.248.83','2026-02-09 06:39:54.874202',1),(126,'admin','10.127.248.83','2026-02-09 06:53:19.691129',1),(127,'admin','10.189.210.217','2026-02-09 06:58:48.957196',1);
/*!40000 ALTER TABLE `login_attempts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `message` longtext NOT NULL,
  `is_read` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `student_id` bigint(20) NOT NULL,
  `exam_name` varchar(300) NOT NULL,
  `result_id` bigint(20) DEFAULT NULL,
  `results_published_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notificatio_student_c24e79_idx` (`student_id`,`is_read`,`created_at`),
  KEY `notifications_result_id_a327b8a3_fk_results_id` (`result_id`),
  CONSTRAINT `notifications_result_id_a327b8a3_fk_results_id` FOREIGN KEY (`result_id`) REFERENCES `results` (`id`),
  CONSTRAINT `notifications_student_id_b0783b27_fk_users_id` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `results`
--

DROP TABLE IF EXISTS `results`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `results` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `roll_number` varchar(50) NOT NULL,
  `student_name` varchar(200) NOT NULL,
  `semester` int(11) NOT NULL,
  `result_type` varchar(20) NOT NULL,
  `overall_result` varchar(50) NOT NULL,
  `overall_grade` varchar(10) NOT NULL,
  `uploaded_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `student_id` bigint(20) DEFAULT NULL,
  `uploaded_by_id` bigint(20) DEFAULT NULL,
  `exam_name` varchar(300) NOT NULL,
  `year` int(11) NOT NULL,
  `exam_held_date` date DEFAULT NULL,
  `course` varchar(10) NOT NULL,
  `branch` varchar(50) NOT NULL,
  `percentage` decimal(5,2) DEFAULT NULL,
  `completion_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `results_roll_number_exam_name_ec547c53_uniq` (`roll_number`,`exam_name`),
  KEY `results_uploade_02ae38_idx` (`uploaded_at`),
  KEY `results_uploaded_by_id_754a31c6_fk_users_id` (`uploaded_by_id`),
  KEY `results_roll_number_a5653931` (`roll_number`),
  KEY `results_roll_nu_81cd94_idx` (`roll_number`,`year`,`semester`),
  KEY `results_student_id_d573a18f_fk_users_id` (`student_id`),
  KEY `results_exam_na_181198_idx` (`exam_name`),
  CONSTRAINT `results_student_id_d573a18f_fk_users_id` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`),
  CONSTRAINT `results_uploaded_by_id_754a31c6_fk_users_id` FOREIGN KEY (`uploaded_by_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `results`
--

LOCK TABLES `results` WRITE;
/*!40000 ALTER TABLE `results` DISABLE KEYS */;
INSERT INTO `results` VALUES (110,'TEST123','John Doe',1,'supplementary','Pass','A','2026-02-09 06:59:25.055983','2026-02-09 06:59:25.063446',NULL,1,'B.Tech I year I Semester Regular Exam Results January 2026',1,'2026-01-01','btech','eee',18.00,NULL),(111,'TEST124','Jane Smith',1,'regular','Pass','B','2026-02-09 06:59:25.066686','2026-02-09 06:59:25.071345',NULL,1,'B.Tech I year I Semester Regular Exam Results January 2026',1,'2026-01-01','btech','cse',35.00,'2026-02-09'),(112,'TEST125','Bob Johnson',1,'regular','Pass','C','2026-02-09 06:59:25.073311','2026-02-09 06:59:25.077464',NULL,1,'B.Tech I year I Semester Regular Exam Results January 2026',1,'2026-01-01','btech','mech',23.00,'2026-02-09'),(113,'TEST126','John reg',1,'regular','Pass','A','2026-02-09 06:59:25.079588','2026-02-09 06:59:25.084018',NULL,1,'B.Tech I year I Semester Regular Exam Results January 2026',1,'2026-01-01','btech','eee',18.00,'2026-02-09'),(114,'TEST127','John reg fail',1,'regular','Pass','A','2026-02-09 06:59:25.086335','2026-02-09 06:59:25.090809',NULL,1,'B.Tech I year I Semester Regular Exam Results January 2026',1,'2026-01-01','btech','eee',18.00,'2026-02-09'),(116,'TEST123','John Doe',1,'supplementary','Pass','A','2026-02-09 07:02:55.669138','2026-02-09 07:02:55.673817',NULL,1,'B.Tech I year I Semester Supplementary Exam Results February 2026',1,'2026-02-01','btech','eee',18.00,'2026-02-09');
/*!40000 ALTER TABLE `results` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subjects`
--

DROP TABLE IF EXISTS `subjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `subjects` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `subject_code` varchar(50) NOT NULL,
  `subject_name` varchar(200) NOT NULL,
  `internal_marks` int(11) DEFAULT NULL,
  `external_marks` int(11) DEFAULT NULL,
  `total_marks` int(11) DEFAULT NULL,
  `subject_result` varchar(20) NOT NULL,
  `grade` varchar(10) NOT NULL,
  `result_id` bigint(20) NOT NULL,
  `attempts` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `subjects_result_id_56492fb3_fk_results_id` (`result_id`),
  KEY `subjects_subject_e16b01_idx` (`subject_code`),
  CONSTRAINT `subjects_result_id_56492fb3_fk_results_id` FOREIGN KEY (`result_id`) REFERENCES `results` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=409 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subjects`
--

LOCK TABLES `subjects` WRITE;
/*!40000 ALTER TABLE `subjects` DISABLE KEYS */;
INSERT INTO `subjects` VALUES (387,'CS101','Programming Fundamentals',18,65,83,'pass','A',110,1),(388,'CS102','Digital Logic Design',19,70,89,'pass','A',110,1),(389,'CS103','Data Structures',17,60,77,'pass','B+',110,1),(390,'CS104','C-Language',17,60,77,'fail','B+',110,1),(391,'CS101','Programming Fundamentals',20,75,95,'pass','A+',111,1),(392,'CS102','Digital Logic Design',18,68,86,'pass','A',111,1),(393,'CS103','Data Structures',19,72,91,'pass','A+',111,1),(394,'CS104','C-Language',19,72,91,'pass','A+',111,1),(395,'CS101','Programming Fundamentals',15,50,65,'pass','B',112,1),(396,'CS102','Digital Logic Design',16,55,71,'pass','B+',112,1),(397,'CS103','Data Structures',14,45,59,'pass','C',112,1),(398,'CS104','C-Language',14,45,59,'pass','C',112,1),(399,'CS101','Programming Fundamentals',18,65,83,'pass','A',113,1),(400,'CS102','Digital Logic Design',19,70,89,'pass','A',113,1),(401,'CS103','Data Structures',17,60,77,'pass','B+',113,1),(402,'CS104','C-Language',17,60,77,'pass','B+',113,1),(403,'CS101','Programming Fundamentals',18,65,83,'pass','A',114,1),(404,'CS102','Digital Logic Design',19,70,89,'pass','A',114,1),(405,'CS103','Data Structures',17,60,77,'pass','B+',114,1),(406,'CS104','C-Language',17,60,77,'pass','B+',114,1),(408,'CS104','C-Language',17,65,82,'pass','B+',116,1);
/*!40000 ALTER TABLE `subjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `token_blacklist_blacklistedtoken`
--

DROP TABLE IF EXISTS `token_blacklist_blacklistedtoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `token_blacklist_blacklistedtoken` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `blacklisted_at` datetime(6) NOT NULL,
  `token_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `token_id` (`token_id`),
  CONSTRAINT `token_blacklist_blacklistedtoken_token_id_3cc7fe56_fk` FOREIGN KEY (`token_id`) REFERENCES `token_blacklist_outstandingtoken` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `token_blacklist_blacklistedtoken`
--

LOCK TABLES `token_blacklist_blacklistedtoken` WRITE;
/*!40000 ALTER TABLE `token_blacklist_blacklistedtoken` DISABLE KEYS */;
/*!40000 ALTER TABLE `token_blacklist_blacklistedtoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `token_blacklist_outstandingtoken`
--

DROP TABLE IF EXISTS `token_blacklist_outstandingtoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `token_blacklist_outstandingtoken` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `token` longtext NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `expires_at` datetime(6) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `jti` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `token_blacklist_outstandingtoken_jti_hex_d9bdf6f7_uniq` (`jti`),
  KEY `token_blacklist_outstandingtoken_user_id_83bc629a_fk_users_id` (`user_id`),
  CONSTRAINT `token_blacklist_outstandingtoken_user_id_83bc629a_fk_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=123 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `token_blacklist_outstandingtoken`
--

LOCK TABLES `token_blacklist_outstandingtoken` WRITE;
/*!40000 ALTER TABLE `token_blacklist_outstandingtoken` DISABLE KEYS */;
INSERT INTO `token_blacklist_outstandingtoken` VALUES (1,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc3MDUzOTkyMywiaWF0IjoxNzcwNDUzNTIzLCJqdGkiOiI3NWRiMDI1YjQ4YmU0MDBkYjA4YWQ3MGQ2Y2I4MWYyZiIsInVzZXJfaWQiOiIxIn0.73L38NM3QHGqH1KnW4DWB3FRLLJzkpBBIucUo5CEDaA','2026-02-07 08:38:43.642935','2026-02-08 08:38:43.000000',1,'75db025b48be400db08ad70d6cb81f2f'),(2,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc3MDU0ODM1NCwiaWF0IjoxNzcwNDYxOTU0LCJqdGkiOiI5ZGVkMzBmYzc1OTg0YmI2ODRiMjA1MTBkMjM1MjJkMiIsInVzZXJfaWQiOiIxIn0.-CFwucmuJwk7Klk2aAxYo0i9IQzZK41wNFvQhtCaq0g','2026-02-07 10:59:14.112709','2026-02-08 10:59:14.000000',1,'9ded30fc75984bb684b20510d23522d2'),(3,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc3MDU0ODY2NiwiaWF0IjoxNzcwNDYyMjY2LCJqdGkiOiJiMWVmY2JlNTc4ZWQ0Nzg3OTU5OTQ5ZjRhNmI1OTRlOCIsInVzZXJfaWQiOiIxIn0.JSRojZ34EykcALXoo6WBTwyaV2miE3GWrQtJjDaLuYQ','2026-02-07 11:04:26.503555','2026-02-08 11:04:26.000000',1,'b1efcbe578ed4787959949f4a6b594e8'),(4,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc3MDU0ODY3NCwiaWF0IjoxNzcwNDYyMjc0LCJqdGkiOiJlZjI5MTVhZGNmNmY0MjMwYTk5OGVjYWE4MTlmNTI0MiIsInVzZXJfaWQiOiIxIn0.nzhdxpbLHFJJShYedLj1UM9uS6SBxcq9xzeC0lT4Ups','2026-02-07 11:04:34.269853','2026-02-08 11:04:34.000000',1,'ef2915adcf6f4230a998ecaa819f5242'),(5,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc3MDU0OTI0MiwiaWF0IjoxNzcwNDYyODQyLCJqdGkiOiJmMzNjNTJiYzdkZTM0ZGExYTU5MDlkNzgzN2ZjZTg5YSIsInVzZXJfaWQiOiIxIn0.XLdG7u8_rCbMU4sw8UjqbizvQ18447zIJ_1VaW9WIg4','2026-02-07 11:14:02.804523','2026-02-08 11:14:02.000000',1,'f33c52bc7de34da1a5909d7837fce89a'),(6,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc3MDU0OTQzNywiaWF0IjoxNzcwNDYzMDM3LCJqdGkiOiI3ZDMxZTQ5NmMzZTg0MmJmYTU2ZTZiMzU1OWE3ZDA3OSIsInVzZXJfaWQiOiIxIn0.d3P8B1_LCr8uvOISgU9Td8L4feuRi_bkb3UX4a2uKgM','2026-02-07 11:17:17.733594','2026-02-08 11:17:17.000000',1,'7d31e496c3e842bfa56e6b3559a7d079'),(7,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc3MDU0OTQzNywiaWF0IjoxNzcwNDYzMDM3LCJqdGkiOiI3YmRjNWQ2YzhhM2Q0MjVmYTI1ZTk0M2QwNDg3OTI2NiIsInVzZXJfaWQiOiIzIn0.8wEru1d1mJNVKB8StJoeKSl8cRw-cxkJnClLcHuvam8','2026-02-07 11:17:17.858468','2026-02-08 11:17:17.000000',NULL,'7bdc5d6c8a3d425fa25e943d04879266'),(8,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc3MDU0OTQ2OCwiaWF0IjoxNzcwNDYzMDY4LCJqdGkiOiIyYTljN2JmOTEzYTA0M2YyYWY5YzY5NTQ4OTY1MmZmZCIsInVzZXJfaWQiOiIxIn0.lJCRgpv7woC9_IFwU_6-9JqyitcV7bdTVHo2uvV7IP4','2026-02-07 11:17:48.700790','2026-02-08 11:17:48.000000',1,'2a9c7bf913a043f2af9c695489652ffd'),(9,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc3MDU0OTc4NCwiaWF0IjoxNzcwNDYzMzg0LCJqdGkiOiI3MDY3ZTBmZGZlMGI0MTNiOGMyMDkxMjc2OTI3YTcxZiIsInVzZXJfaWQiOiIxIn0.e2plMym394kOt_B9-dcq4LO7nldUk1wuB3qPpIMwvVQ','2026-02-07 11:23:04.026347','2026-02-08 11:23:04.000000',1,'7067e0fdfe0b413b8c2091276927a71f'),(10,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc3MDU1MDc2MSwiaWF0IjoxNzcwNDY0MzYxLCJqdGkiOiIwMWNmNGMwMzgyOGQ0OGYyYjNhMTkzMzQ1Zjg2YTI5MCIsInVzZXJfaWQiOiIxIn0.MHuTtmW5XjXKi7_xuD1O82zYPbnuYfPbYm9kMampJow','2026-02-07 11:39:21.662354','2026-02-08 11:39:21.000000',1,'01cf4c03828d48f2b3a193345f86a290'),(11,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc3MDU1MTQwMywiaWF0IjoxNzcwNDY1MDAzLCJqdGkiOiI1MDI1MWUwNzU0MmQ0ZTBlOGE2ZGQ2YTY0Zjk4MWY2NyIsInVzZXJfaWQiOiIxIn0.v-W_itf_h46UeqYDFPQUDJJVSalS0KzgnfHFY17IHrE','2026-02-07 11:50:03.765385','2026-02-08 11:50:03.000000',1,'50251e07542d4e0e8a6dd6a64f981f67'),(12,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc3MDU1MTQxMSwiaWF0IjoxNzcwNDY1MDExLCJqdGkiOiIyMzJhZjMyMmM1MGM0NTA2YWE3ZWMzM2E3NTAxNmQ3YiIsInVzZXJfaWQiOiIxIn0.MPAAaNaKOrbIETObS-vvckNt-MCtV67bsBPrhnt8lAQ','2026-02-07 11:50:11.382095','2026-02-08 11:50:11.000000',1,'232af322c50c4506aa7ec33a75016d7b'),(13,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc3MDU1MTc4MCwiaWF0IjoxNzcwNDY1MzgwLCJqdGkiOiJkN2Q1ZWQwNjZkYmY0MTJmODIxNjE3NmU4NTNhNDM1YyIsInVzZXJfaWQiOiIxIn0.32-auyPVKPDGUB11c_GTR9OsmMAzdBW_PmGTHwonVdA','2026-02-07 11:56:20.577478','2026-02-08 11:56:20.000000',1,'d7d5ed066dbf412f8216176e853a435c'),(14,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc3MDU1MTc4NSwiaWF0IjoxNzcwNDY1Mzg1LCJqdGkiOiI5MzU5NjAyMjVhODE0ZGMzYmQ3ZGY2OTkwMzcyNmYwYyIsInVzZXJfaWQiOiIxIn0.XjBqLSNRhsN1l9aBBTGqR9Yo-O9APKonBBbyIksWIOs','2026-02-07 11:56:25.180632','2026-02-08 11:56:25.000000',1,'935960225a814dc3bd7df69903726f0c'),(15,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc3MDU1MTg0MiwiaWF0IjoxNzcwNDY1NDQyLCJqdGkiOiIwY2YxNDNiZGU3ZDU0OWNlYWQ0NDQwMmNjZTA5OTdlYSIsInVzZXJfaWQiOiIzIn0.yToXTTioDCVR4aFb-mUqZ2NhvYzZ0mHAy32_BRV37xA','2026-02-07 11:57:22.250344','2026-02-08 11:57:22.000000',NULL,'0cf143bde7d549cead44402cce0997ea'),(16,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc3MDU1MjAxMywiaWF0IjoxNzcwNDY1NjEzLCJqdGkiOiJhZDE0YTBhYTc3Njc0MzU5OTJjM2RmYTE1ZWJhNDhkYyIsInVzZXJfaWQiOiIxIn0.Tqdx5ek-63-FnLM4zQ2n2jOMHUzMBrV_TcvuIlop7gw','2026-02-07 12:00:13.848890','2026-02-08 12:00:13.000000',1,'ad14a0aa7767435992c3dfa15eba48dc'),(17,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc3MDU1Mjk0MiwiaWF0IjoxNzcwNDY2NTQyLCJqdGkiOiJkMWQ5M2RhZThmNDk0NDQ5YTc4NGEwNDY0NWIxNGI2NiIsInVzZXJfaWQiOiIzIn0.TO3x2vy8RCoTufDj2ydngDzxGvtRcPjBDQrNFkraZVU','2026-02-07 12:15:42.638503','2026-02-08 12:15:42.000000',NULL,'d1d93dae8f494449a784a04645b14b66'),(18,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc3MDU1MzAzOCwiaWF0IjoxNzcwNDY2NjM4LCJqdGkiOiJlZTE3ODI4OTY5MTk0YWZhYTBmNWU0NzJkZTY1Y2RjMyIsInVzZXJfaWQiOiIxIn0.lPdyghzwXF_jP14KQhcJ7iLr26LbilxUAGVaveWMiwU','2026-02-07 12:17:18.276154','2026-02-08 12:17:18.000000',1,'ee17828969194afaa0f5e472de65cdc3'),(19,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc3MDU1NTI0MCwiaWF0IjoxNzcwNDY4ODQwLCJqdGkiOiI3MjNiZTRjYjdlMTU0MmM0ODUwNTQ0YjNjNzI1ODVmOCIsInVzZXJfaWQiOiIxIn0.fqJJvraxXLzgqCPRTsz6gAmMPHnLhxu4-Gr6P-QfP1Y','2026-02-07 12:54:00.459923','2026-02-08 12:54:00.000000',1,'723be4cb7e1542c4850544b3c72585f8'),(20,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc3MDU1NTM0NCwiaWF0IjoxNzcwNDY4OTQ0LCJqdGkiOiIwNDVhYzgxZTUyZjA0MWIzYWY4MDhjMTA2YzM4ODIzNCIsInVzZXJfaWQiOiIzIn0.kQtVIeOMeLkaYvocizq57XbgBlK33VIf8XJf6y4G9Lo','2026-02-07 12:55:44.145579','2026-02-08 12:55:44.000000',NULL,'045ac81e52f041b3af808c106c388234'),(21,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc3MDU1NTUzMywiaWF0IjoxNzcwNDY5MTMzLCJqdGkiOiI3YjUwMmMxZGVhMzk0YjdhODRhNDRmYmNmOTkzOGFiOSIsInVzZXJfaWQiOiIxIn0.SYS7k6EoHYW3wT7c-JYYXOL1NCXYkkjYV9phn8bzbZY','2026-02-07 12:58:53.813698','2026-02-08 12:58:53.000000',1,'7b502c1dea394b7a84a44fbcf9938ab9'),(22,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc3MDU1NTU0MiwiaWF0IjoxNzcwNDY5MTQyLCJqdGkiOiI0ODM3YWE1N2YzMTQ0ODY5YTM0NTk0MmQwNTY3ZGNkOSIsInVzZXJfaWQiOiIxIn0.-6DCwxZMsgl6N-FJ5l86FxJNnMlUHU7ENFGvgM1bxIU','2026-02-07 12:59:02.751074','2026-02-08 12:59:02.000000',1,'4837aa57f3144869a345942d0567dcd9'),(23,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc3MDU1NTYxOSwiaWF0IjoxNzcwNDY5MjE5LCJqdGkiOiI3NDc4Mjc1YmVhNzk0ZDAzODdjYzYxMzc4YjYxNTQxZiIsInVzZXJfaWQiOiIxIn0.rw9X0RKM63P_ZrAKaliuJi3aJHVeVskQwX2cU6P3b6Q','2026-02-07 13:00:19.497274','2026-02-08 13:00:19.000000',1,'7478275bea794d0387cc61378b61541f'),(24,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc3MDU1NjAwNCwiaWF0IjoxNzcwNDY5NjA0LCJqdGkiOiIwZTBhZmY3ZTJlYWU0YWE5OGI5NzkyZThiNmI0OGVjZCIsInVzZXJfaWQiOiIxIn0.pBikXmnzKJUTwckrX_5swcOhr7T7yrSZJX2UDWsw5u0','2026-02-07 13:06:44.578590','2026-02-08 13:06:44.000000',1,'0e0aff7e2eae4aa98b9792e8b6b48ecd'),(25,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc3MDU1NzQyNCwiaWF0IjoxNzcwNDcxMDI0LCJqdGkiOiI4MGEzM2JmZGVlM2I0MDhkYWM3MTUwZGM5NjUxODQ0YiIsInVzZXJfaWQiOiIxIn0.Vk-EN5DwA6bhEgkNgBO1ebqpqQz-QfGAX7xpwieXmh0','2026-02-07 13:30:24.031978','2026-02-08 13:30:24.000000',1,'80a33bfdee3b408dac7150dc9651844b'),(26,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc3MDU1NzU4OSwiaWF0IjoxNzcwNDcxMTg5LCJqdGkiOiJmMTZiYTYyYTY2NTA0MjcyYmRlNDcwOGRjMjMyYmYxYSIsInVzZXJfaWQiOiIxIn0.1T0jbecsmvt7rRHg40vGC7KmIeOGjJV7avwfWm-WDRg','2026-02-07 13:33:09.738341','2026-02-08 13:33:09.000000',1,'f16ba62a66504272bde4708dc232bf1a'),(27,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc3MDU1NzYxMiwiaWF0IjoxNzcwNDcxMjEyLCJqdGkiOiIzNjdkNjhiZjdhOTY0NmI4YTVmNWRjYzkyOTBlNzk5ZiIsInVzZXJfaWQiOiIxIn0.ZzpZ91Qj7VhvrMudJi2zVZ-VSnOwGoCs0R6ZM2MaH9k','2026-02-07 13:33:32.725430','2026-02-08 13:33:32.000000',1,'367d68bf7a9646b8a5f5dcc9290e799f'),(28,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc3MDU1NzcxNSwiaWF0IjoxNzcwNDcxMzE1LCJqdGkiOiJjODI2MzRjNmYyMTY0N2RhYmJiNTg2NDEzMTBlZjA3YyIsInVzZXJfaWQiOiIxIn0.W9jlIY7R6e-6jwUcTgknzATiifeaxykcM9JaUWCyiL4','2026-02-07 13:35:15.142805','2026-02-08 13:35:15.000000',1,'c82634c6f21647dabbb58641310ef07c'),(29,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc3MDU1ODE3MSwiaWF0IjoxNzcwNDcxNzcxLCJqdGkiOiJjZGQ3YzRlMWEwOGQ0OGM1OGY0ZGFlMDhjZTJiMDg4MCIsInVzZXJfaWQiOiIxIn0.9gp4YsChHdXjvsfsNMm6cflIJFs_LR6g8WwUqvImSVM','2026-02-07 13:42:51.041337','2026-02-08 13:42:51.000000',1,'cdd7c4e1a08d48c58f4dae08ce2b0880'),(30,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc3MDU1ODYyOCwiaWF0IjoxNzcwNDcyMjI4LCJqdGkiOiI1YWRiNmIyOTgxNDk0ZTkyYjAyNTM5YzFjMTI4Y2IwNSIsInVzZXJfaWQiOiIzIn0.Bfi5KVjgiCRbtO61BNCS2Yh_DlvF2r7-dcMWNylp54k','2026-02-07 13:50:28.485804','2026-02-08 13:50:28.000000',NULL,'5adb6b2981494e92b02539c1c128cb05'),(31,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc3MDU1ODY3NCwiaWF0IjoxNzcwNDcyMjc0LCJqdGkiOiI4YmJhYjA3MGFkYzI0MGUxODEzNWEzZjU0YWNjZjc4NiIsInVzZXJfaWQiOiIxIn0.Ro1OXc-1eY6p3Kl68ZLvM96SfQG2O1o8-auXdfaZ14U','2026-02-07 13:51:14.103725','2026-02-08 13:51:14.000000',1,'8bbab070adc240e18135a3f54accf786'),(32,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc3MDU1ODcxNSwiaWF0IjoxNzcwNDcyMzE1LCJqdGkiOiJkNmQ3Yjc5ZWFmZWE0ZWI1YmVmMWM2NDY5MzBiMjUwMiIsInVzZXJfaWQiOiIzIn0.DagjNUZgWPcwWNBXMZBBp7X_DssbIrMkw1dBSS7OJQ4','2026-02-07 13:51:55.252821','2026-02-08 13:51:55.000000',NULL,'d6d7b79eafea4eb5bef1c646930b2502'),(33,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc3MDU1ODczOSwiaWF0IjoxNzcwNDcyMzM5LCJqdGkiOiJkZGViZTU1NmI4NGE0OTE4YjZkMTA4OTZkM2U4NDYzZSIsInVzZXJfaWQiOiIxIn0.TQyh-uzKXPOm_1m09HSEoyMZBYkY1rLWxEEJjfhn7Ds','2026-02-07 13:52:19.364730','2026-02-08 13:52:19.000000',1,'ddebe556b84a4918b6d10896d3e8463e'),(34,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc3MDU1OTc2MywiaWF0IjoxNzcwNDczMzYzLCJqdGkiOiJkMTNhOTMyNGI3Y2Y0MWZlYjA3OTMwNjI3N2ZhMzlkZiIsInVzZXJfaWQiOiIxIn0.hswy-yeoKaqWcehZUZCZUswiuXofaY3gFsIPz4MJLFk','2026-02-07 14:09:23.929353','2026-02-08 14:09:23.000000',1,'d13a9324b7cf41feb079306277fa39df'),(35,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc3MDU1OTk3MiwiaWF0IjoxNzcwNDczNTcyLCJqdGkiOiI5Zjg1YTRmZDU2N2I0NzQ4YWY1OTkyZjllOTA1M2QzYiIsInVzZXJfaWQiOiIxIn0.X91eLmF6atNc5iNEUNsNVS9IUDtIFVufPXnkf_FuCNs','2026-02-07 14:12:52.068994','2026-02-08 14:12:52.000000',1,'9f85a4fd567b4748af5992f9e9053d3b'),(36,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc3MDU2MDc5NywiaWF0IjoxNzcwNDc0Mzk3LCJqdGkiOiJlMDBlNDgxZGJlYjQ0ODhmOTdmMThjOGZkN2I1Yjc0YSIsInVzZXJfaWQiOiIxIn0.-boxnf5I-F4RtUqwI2bGU03wxl4fU34UP9TErnympMo','2026-02-07 14:26:37.127945','2026-02-08 14:26:37.000000',1,'e00e481dbeb4488f97f18c8fd7b5b74a'),(37,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc3MDU2MTI1MywiaWF0IjoxNzcwNDc0ODUzLCJqdGkiOiIxMDE5NDVhOTAxNDg0NzBkYmVhZTE5MDc4MzZiZTUyMCIsInVzZXJfaWQiOiIxIn0.mffABGloY2BNkyHcP6HCNWolAOAPbROpjgNCUNsfbzc','2026-02-07 14:34:13.792786','2026-02-08 14:34:13.000000',1,'101945a90148470dbeae1907836be520'),(38,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc3MDU2MjA3OSwiaWF0IjoxNzcwNDc1Njc5LCJqdGkiOiI4MzQwNTMzOTYzMTc0YjBmOTJkMjRkZmU5OTgyNzk0YiIsInVzZXJfaWQiOiIxIn0.WSIFmv1hcva6N_rTrhcddiHCstm2KkOE9pcGj6XZohI','2026-02-07 14:47:59.527076','2026-02-08 14:47:59.000000',1,'8340533963174b0f92d24dfe9982794b'),(39,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc3MDU2NzgxNywiaWF0IjoxNzcwNDgxNDE3LCJqdGkiOiIxYjE3NzIyNWRmZTA0ZTg3OTExOWNkYzRhZjk5ZTI0MyIsInVzZXJfaWQiOiIxIn0.erh7yZFWRQBoapjB4jn9GKZN2Ai9svzVEHfsGXCymyM','2026-02-07 16:23:37.945975','2026-02-08 16:23:37.000000',1,'1b177225dfe04e879119cdc4af99e243'),(40,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc3MDU3Mjc3OCwiaWF0IjoxNzcwNDg2Mzc4LCJqdGkiOiIzYTRhZmZkNjhkZjk0OGZiYTM5MjdjN2NlMWEzZWM5ZiIsInVzZXJfaWQiOiIxIn0.TIQkm6M6Mv9BwGK2onfmUMDEsU4tp7J_cbHjgWFpRNM','2026-02-07 17:46:18.303374','2026-02-08 17:46:18.000000',1,'3a4affd68df948fba3927c7ce1a3ec9f'),(41,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc3MDU3Mzk1MCwiaWF0IjoxNzcwNDg3NTUwLCJqdGkiOiI3Y2NhNDRkYjUxYjU0YTY3YWI5MDg5YzZkMDY4OTdhZSIsInVzZXJfaWQiOiIxIn0.5NyU_Y3T0NLMKVjMdsgUinbAEpoa1p9YtpZDOcepYus','2026-02-07 18:05:50.408956','2026-02-08 18:05:50.000000',1,'7cca44db51b54a67ab9089c6d06897ae'),(42,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc3MDU3Mzk1OSwiaWF0IjoxNzcwNDg3NTU5LCJqdGkiOiI4Y2U1YzMwNDg5YjU0NGQxODA5N2U5MmRiZWUyZjA0YyIsInVzZXJfaWQiOiIxIn0.y3gsA6-FAP-pBayH_Bk5QCoDQYQgkEWqZMIFtYkvMns','2026-02-07 18:05:59.641475','2026-02-08 18:05:59.000000',1,'8ce5c30489b544d18097e92dbee2f04c'),(43,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc3MDU3Mzk2OSwiaWF0IjoxNzcwNDg3NTY5LCJqdGkiOiI4YjEwYzdmMGFiYjY0ZjRkODBhY2UxYTFkYTQ0MmVjNyIsInVzZXJfaWQiOiIxIn0.3uW6hWZVwwaAvXK6LXhE_zAIEk6g8O7BBHLL90fGc3c','2026-02-07 18:06:09.588085','2026-02-08 18:06:09.000000',1,'8b10c7f0abb64f4d80ace1a1da442ec7'),(44,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc3MDU3NTIwNCwiaWF0IjoxNzcwNDg4ODA0LCJqdGkiOiIyMTE5YjdlYmRmZjY0MWIxYmU4NmRhYjc0YWU2MjBlNSIsInVzZXJfaWQiOiIxIn0.EMxkEUNPKuMPJ_kg-3U9RXneUM1WssH3-rcEgyKhFz8','2026-02-07 18:26:44.309610','2026-02-08 18:26:44.000000',1,'2119b7ebdff641b1be86dab74ae620e5'),(45,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc3MDU3NTI1NSwiaWF0IjoxNzcwNDg4ODU1LCJqdGkiOiJmM2VlZDFmMDVlNmU0N2QwOTIzZWZlMGI4Y2U2NDg2NyIsInVzZXJfaWQiOiIxIn0.-b7NU60eBxfQSsje7Lq_1VLGcSP-ux7DFazi9dLHIi0','2026-02-07 18:27:35.819802','2026-02-08 18:27:35.000000',1,'f3eed1f05e6e47d0923efe0b8ce64867'),(46,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc3MDU3NTY4MSwiaWF0IjoxNzcwNDg5MjgxLCJqdGkiOiI3ZDAzMDIwNTFjMjA0NDEyYWU4ZDYyNjZjZDU3ZTMwYyIsInVzZXJfaWQiOiIxIn0.LKOXcL4vMrKK0LGlRyYzSnoUP8H9mPV8pTLozN4d3CE','2026-02-07 18:34:41.468027','2026-02-08 18:34:41.000000',1,'7d0302051c204412ae8d6266cd57e30c'),(47,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc3MDYwMDkyMSwiaWF0IjoxNzcwNTE0NTIxLCJqdGkiOiIwNWNhNmQwYzMxMGY0ZTdkYWEwZTMwM2JmYTI5ZDk0MSIsInVzZXJfaWQiOiIxIn0.1nKRnlT9E6X_rWlu4VhU9vOSdaPdWnK_CUkFLjiXqBo','2026-02-08 01:35:21.548827','2026-02-09 01:35:21.000000',1,'05ca6d0c310f4e7daa0e303bfa29d941'),(48,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc3MDY1MTMxMCwiaWF0IjoxNzcwNTY0OTEwLCJqdGkiOiJmZDBiNjRkMWQ4YjU0MmI3YWI4ZjVhMGUyYjY4NTk1MiIsInVzZXJfaWQiOiIxIn0.OJWr1nlnIxI4JNV7dN51GbDq9ffNF9bzd_GYKJB64qY','2026-02-08 15:35:10.849691','2026-02-09 15:35:10.000000',1,'fd0b64d1d8b542b7ab8f5a0e2b685952'),(49,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc3MDY1NDM3NiwiaWF0IjoxNzcwNTY3OTc2LCJqdGkiOiJhMjBhMDkzN2UzMDg0NmRjOTQxOTkyZDc0ZGVlY2RjZiIsInVzZXJfaWQiOiIxIn0._zutMPWBQxDrwS4DV0-a1Blvg0PaySQxXDnMnbTDnz4','2026-02-08 16:26:16.264076','2026-02-09 16:26:16.000000',1,'a20a0937e30846dc941992d74deecdcf'),(50,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc3MDY1NTYyOCwiaWF0IjoxNzcwNTY5MjI4LCJqdGkiOiIyYjA2MmVlNWNlN2Q0NTU1YTgxMzM5M2Y1MTNjZTg0YiIsInVzZXJfaWQiOiIxIn0.jOvsxPBEE27Xn4XrokLgyh1tWNE9Msnc4pHZDRvrsw0','2026-02-08 16:47:08.972328','2026-02-09 16:47:08.000000',1,'2b062ee5ce7d4555a813393f513ce84b'),(51,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc3MDY1NjA3OSwiaWF0IjoxNzcwNTY5Njc5LCJqdGkiOiJmOTRlYjczYTY4MWM0ZWVmODE3NGFjZGMyMmFkYjkxYiIsInVzZXJfaWQiOiIxIn0.NRfx6lpyNYKtGAAfx7_8VOQsZVIEQTE58uXcnW20VPE','2026-02-08 16:54:39.328632','2026-02-09 16:54:39.000000',1,'f94eb73a681c4eef8174acdc22adb91b'),(52,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc3MDY1NjEzMywiaWF0IjoxNzcwNTY5NzMzLCJqdGkiOiJlZWY1NmI2MzhjYmI0NjViYTM2N2RhYzU1MWM5Y2ViZCIsInVzZXJfaWQiOiIxNCJ9._h62zwXaoZenFSbapwEyHsga1JZyu_ukNMCvBmZmcYc','2026-02-08 16:55:33.775931','2026-02-09 16:55:33.000000',NULL,'eef56b638cbb465ba367dac551c9cebd'),(53,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc3MDY1NjM5OCwiaWF0IjoxNzcwNTY5OTk4LCJqdGkiOiJhNThmM2M0Zjk2Nzk0ZjIwYjBjNzE2MDdiZTYyNmY1ZSIsInVzZXJfaWQiOiIxIn0.vqN_t7t8haL5UOeRL1Kbo_A52ibKUQTtISWoN0kNsBg','2026-02-08 16:59:58.322036','2026-02-09 16:59:58.000000',1,'a58f3c4f96794f20b0c71607be626f5e'),(54,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc3MDY1NjQwOSwiaWF0IjoxNzcwNTcwMDA5LCJqdGkiOiI2ZDM2NzhhNmZmNDI0MWIwOWY3YWY4YzE4NWRlOGEyOCIsInVzZXJfaWQiOiIxOCJ9.xTO3nspXEn0PM1ZbT0Aon6F4jg-y2Pvf-XFhO-nwl4k','2026-02-08 17:00:09.479324','2026-02-09 17:00:09.000000',NULL,'6d3678a6ff4241b09f7af8c185de8a28'),(55,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc3MDY1NjYwNywiaWF0IjoxNzcwNTcwMjA3LCJqdGkiOiJjNWU5NTk1Mjk4MDI0ZDliYTRkMzcwMTVmMWY2OWQ3OCIsInVzZXJfaWQiOiIxIn0.DxQWms3LPhtCq1hfLBqX8FK_Eu_hXpAZksrsmSSVNcA','2026-02-08 17:03:27.844072','2026-02-09 17:03:27.000000',1,'c5e9595298024d9ba4d37015f1f69d78'),(56,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc3MDY1NzMxMiwiaWF0IjoxNzcwNTcwOTEyLCJqdGkiOiI2NTg4MmExNTFmMWY0ZjIzYjQ3YzYxN2ZkNzk5ZDg4MSIsInVzZXJfaWQiOiIxIn0.-dPq_SAm1oA0COi-qPJ4ftxDMFGtf7pn3TUChDQwXkY','2026-02-08 17:15:12.122371','2026-02-09 17:15:12.000000',1,'65882a151f1f4f23b47c617fd799d881'),(57,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc3MDY1NzMxOCwiaWF0IjoxNzcwNTcwOTE4LCJqdGkiOiI4ZTUxZWMxNDZmZDM0YWZiYmE0OWZkYjZmMjAyMmNhMiIsInVzZXJfaWQiOiIxIn0.XrC-LUkMIgneisuMxVM7zqHi9rXnIxDkfRXDLZyR4h8','2026-02-08 17:15:18.886625','2026-02-09 17:15:18.000000',1,'8e51ec146fd34afbba49fdb6f2022ca2'),(58,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc3MDY1NzMyNSwiaWF0IjoxNzcwNTcwOTI1LCJqdGkiOiIxMjUxODI2ZjJjZjQ0ZjMxOGJhYjZhYjFlOGQ3MTI0MSIsInVzZXJfaWQiOiIxIn0.Sx5ektLOX35zRBh6kwZpG7XdPKr7_4_SQeaL5vDHQ6c','2026-02-08 17:15:25.907589','2026-02-09 17:15:25.000000',1,'1251826f2cf44f318bab6ab1e8d71241'),(59,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc3MDY1NzMzNCwiaWF0IjoxNzcwNTcwOTM0LCJqdGkiOiI1MDgzZjEyZjg1ZTg0OGNkYWNkMjkyNmFiY2FlNGFjYyIsInVzZXJfaWQiOiIxOSJ9.9P-44N2qsWJuJiht5UmZUy7qLv7vIa1mIdByhSL3_d4','2026-02-08 17:15:34.083489','2026-02-09 17:15:34.000000',NULL,'5083f12f85e848cdacd2926abcae4acc'),(60,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc3MDY1NzM0MSwiaWF0IjoxNzcwNTcwOTQxLCJqdGkiOiI2MDZkODRiZTM3ZjQ0OTY3YTQzMTFjYjk2YWI5ZTk4NCIsInVzZXJfaWQiOiIxOCJ9.mCNMEMbrKzOaugTWbiGSn-vEtVHosN4m-__ZNosFnRQ','2026-02-08 17:15:41.674101','2026-02-09 17:15:41.000000',NULL,'606d84be37f44967a4311cb96ab9e984'),(61,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc3MDY1NzM0OSwiaWF0IjoxNzcwNTcwOTQ5LCJqdGkiOiIzNjBkOTZiYjI2YWY0NjliYmIzNTQyMTUwN2U5OWZlZCIsInVzZXJfaWQiOiIyMSJ9.mNZIqiBpKXQ_IQYpCxC0DUzhi7dII2BRwfEuKEstTxQ','2026-02-08 17:15:49.254987','2026-02-09 17:15:49.000000',NULL,'360d96bb26af469bbb35421507e99fed'),(62,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc3MDY1ODAxMiwiaWF0IjoxNzcwNTcxNjEyLCJqdGkiOiI1ZDVlOTc3MjZjM2Q0NmVmOTY0MDkzODljM2NjZWExYiIsInVzZXJfaWQiOiIxIn0.fps8hM1UnQNBYQnonBx-IW4nZvWc6ydGP73W-h3uyXM','2026-02-08 17:26:52.346980','2026-02-09 17:26:52.000000',1,'5d5e97726c3d46ef96409389c3ccea1b'),(63,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc3MDY1ODM1NCwiaWF0IjoxNzcwNTcxOTU0LCJqdGkiOiIzOTViOWE4NDc3MjM0MGNlYjcyMWI0MTIwYjNlNjJjNyIsInVzZXJfaWQiOiIxIn0.y_cPwKRrV_yOCE7GwyVnFOT-YKloetIE3ITzYzYH2JA','2026-02-08 17:32:34.453245','2026-02-09 17:32:34.000000',1,'395b9a84772340ceb721b4120b3e62c7'),(64,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc3MDY1ODg0MywiaWF0IjoxNzcwNTcyNDQzLCJqdGkiOiJhMzg3MmZlNjZjN2E0Y2M3YjVhOTdiMzY5Y2RjNDFlYiIsInVzZXJfaWQiOiIxIn0.2WtnsRimmD6IS0tPi9yKspvjoMuKRsqwrAVHjHAYeX4','2026-02-08 17:40:43.545166','2026-02-09 17:40:43.000000',1,'a3872fe66c7a4cc7b5a97b369cdc41eb'),(65,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc3MDY1ODg1MiwiaWF0IjoxNzcwNTcyNDUyLCJqdGkiOiJkMDA4ODM5YWYyYTc0MjI4OThmNWVhYmQ5MTQ5ZDM3MCIsInVzZXJfaWQiOiIxIn0.uu2Xd_1Nr1Umf4ccrfGUmLk8Mct0PX3g5FqfIfquESw','2026-02-08 17:40:52.729494','2026-02-09 17:40:52.000000',1,'d008839af2a7422898f5eabd9149d370'),(66,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc3MDY1OTUyNCwiaWF0IjoxNzcwNTczMTI0LCJqdGkiOiJiYmQ5OGNmMWRlNjU0NDk0OWRlZDM1N2EyNGEwMGE5ZSIsInVzZXJfaWQiOiIxIn0.Wukkxgc2XyLvenrkMQCDlKlPViUXOhbr8Loghor6YJs','2026-02-08 17:52:04.554173','2026-02-09 17:52:04.000000',1,'bbd98cf1de6544949ded357a24a00a9e'),(67,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc3MDY1OTUzNCwiaWF0IjoxNzcwNTczMTM0LCJqdGkiOiI2YzZmZmU5NjNmMjE0ODBiOWEzOTBiMTNkMjhhMGY0YiIsInVzZXJfaWQiOiIxIn0.dZbrNECJx3aWRopdAA7TI1rA_ffNhZCtseXDjjk6Juo','2026-02-08 17:52:14.658503','2026-02-09 17:52:14.000000',1,'6c6ffe963f21480b9a390b13d28a0f4b'),(68,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc3MDY1OTU0NSwiaWF0IjoxNzcwNTczMTQ1LCJqdGkiOiIxYjY4ZjJlMjcyZmY0NWU2ODZjOGQ4ZDIyZTg2ODIwYSIsInVzZXJfaWQiOiIxIn0.323sSUUzvoACVstyHDBVOs0BwlYZ_eB86dkNYdFPV7w','2026-02-08 17:52:25.741254','2026-02-09 17:52:25.000000',1,'1b68f2e272ff45e686c8d8d22e86820a'),(69,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc3MDY2MDU5OCwiaWF0IjoxNzcwNTc0MTk4LCJqdGkiOiIzMmM2YzdjZDQ5OTM0NGM3OTlhZWZkN2M3N2Y3ZDVhMCIsInVzZXJfaWQiOiIxIn0.7m4LJdrw_3yljEphtbsj8mldSj1_6YORwh9UmQE3XYo','2026-02-08 18:09:58.889675','2026-02-09 18:09:58.000000',1,'32c6c7cd499344c799aefd7c77f7d5a0'),(70,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc3MDY2MDc0MiwiaWF0IjoxNzcwNTc0MzQyLCJqdGkiOiI1MjcwOTVhMjcwMzc0MWVhODhkMzNiNTFhMzMyZTZlZiIsInVzZXJfaWQiOiIxIn0.2haeXO2NMczQCAXBbGL8VIknuIsUftS1bjAzvV3JP9A','2026-02-08 18:12:22.971606','2026-02-09 18:12:22.000000',1,'527095a2703741ea88d33b51a332e6ef'),(71,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc3MDY2MDc1NiwiaWF0IjoxNzcwNTc0MzU2LCJqdGkiOiJhMjRmMzE2NDA1MGU0YjQxOWMwMGFlZmYyYzMyNGQxZSIsInVzZXJfaWQiOiIxIn0.9DnsmyFu1RBv_daqJTzvCTlKXXc1phLKNuXL43HSOok','2026-02-08 18:12:36.531775','2026-02-09 18:12:36.000000',1,'a24f3164050e4b419c00aeff2c324d1e'),(72,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc3MDY2MDc2NywiaWF0IjoxNzcwNTc0MzY3LCJqdGkiOiIwODYwN2Y1ZDBhNTA0ODdmYTRkMDY2Zjc3MjcwYzlkNCIsInVzZXJfaWQiOiIxIn0.e8wiwXRGOLsJRLhauMShdl7ds6YQ5z6H10EwQI_NWa8','2026-02-08 18:12:47.587086','2026-02-09 18:12:47.000000',1,'08607f5d0a50487fa4d066f77270c9d4'),(73,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc3MDY2MjExNSwiaWF0IjoxNzcwNTc1NzE1LCJqdGkiOiJmYWM0MDg5NjA5MTY0MTNkOThmZmFkODM1ODc2MDU5NSIsInVzZXJfaWQiOiIxIn0.QgFYjlADXNmmesmrfTH_Q6aaO6uyfoNcZcwFP_-dIM4','2026-02-08 18:35:15.808695','2026-02-09 18:35:15.000000',1,'fac408960916413d98ffad8358760595'),(74,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc3MDY2MjEyNywiaWF0IjoxNzcwNTc1NzI3LCJqdGkiOiI2MjBlNjRkMGQ4ZWY0OTA4OGFlN2ZmMzA3ZDA0MGY4NSIsInVzZXJfaWQiOiIxIn0.VCpFwR3LOk0NNlqjazM-adElzTuFPbMsMstV8mVSrGE','2026-02-08 18:35:27.266130','2026-02-09 18:35:27.000000',1,'620e64d0d8ef49088ae7ff307d040f85'),(75,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc3MDY2MjEzOSwiaWF0IjoxNzcwNTc1NzM5LCJqdGkiOiI0OGZlNDA5MzZjYjY0YTg0YWMwNDI3ZjJlNTcxN2IzZCIsInVzZXJfaWQiOiIxIn0.IvnAv2H4JDN6VBh3RaMuvYMOf2E47XSPQacqTOCO94k','2026-02-08 18:35:39.413591','2026-02-09 18:35:39.000000',1,'48fe40936cb64a84ac0427f2e5717b3d'),(76,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc3MDY2MjM1OCwiaWF0IjoxNzcwNTc1OTU4LCJqdGkiOiIwMzg2ODQwZjYzOTQ0MWQ1OTU3OWJmOTM1ZjFkOTYyZSIsInVzZXJfaWQiOiIxIn0.AxJQ5ucKfrabREW7XW0Ftk6D7MwJGJ9uFFX0Eyv-czo','2026-02-08 18:39:18.417248','2026-02-09 18:39:18.000000',1,'0386840f639441d59579bf935f1d962e'),(77,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc3MDY2MjM2OCwiaWF0IjoxNzcwNTc1OTY4LCJqdGkiOiI5ZDFkZGI0MjcxYjc0YjA2ODAwM2IxYzU5NWNiOTQ0NyIsInVzZXJfaWQiOiIxIn0.n6HfRTx1Fgh4sXGk4o0q8YdkYOxxIIpKR2jOJqOT6EI','2026-02-08 18:39:28.229394','2026-02-09 18:39:28.000000',1,'9d1ddb4271b74b068003b1c595cb9447'),(78,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc3MDY2MjM3OCwiaWF0IjoxNzcwNTc1OTc4LCJqdGkiOiJjODRjOWU2MGQ5M2Q0OTBmYjJiYmIwMzRlMWQxZmI0MiIsInVzZXJfaWQiOiIxIn0.I84gU9vAk2i2xyH7WWHLMtRHOIRBDRSMCoWxpa84ta8','2026-02-08 18:39:38.280015','2026-02-09 18:39:38.000000',1,'c84c9e60d93d490fb2bbb034e1d1fb42'),(79,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc3MDY2MjU3NywiaWF0IjoxNzcwNTc2MTc3LCJqdGkiOiI2YjBjMGVjYWE2ODk0YzJjODNlZWM0MWJlNjk1YTE0MCIsInVzZXJfaWQiOiIxIn0.qnr6Vw14KTnxDNR-9W9uXwz05uIAqkVyQIewa89ujQc','2026-02-08 18:42:57.289702','2026-02-09 18:42:57.000000',1,'6b0c0ecaa6894c2c83eec41be695a140'),(80,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc3MDY2MjcyMiwiaWF0IjoxNzcwNTc2MzIyLCJqdGkiOiI5Y2FhNGNiMDQ5OGM0MzgxYjk1ODQzNzgyMDUzY2E5ZCIsInVzZXJfaWQiOiIxIn0.S3BknTlFXGZz4HyIGltXXsLeWTZGr1PnHiVt0s3TyYg','2026-02-08 18:45:22.943183','2026-02-09 18:45:22.000000',1,'9caa4cb0498c4381b95843782053ca9d'),(81,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc3MDY2MjcyNiwiaWF0IjoxNzcwNTc2MzI2LCJqdGkiOiIxYzFiNjEzYjdkZTk0NjgyYWU0YjcyNWJlYWIzYzI5MCIsInVzZXJfaWQiOiIxIn0.-FS4UoH4HYbGDF-GK0hhXwCxGkwLNIoDBOdbgdQ203o','2026-02-08 18:45:26.015556','2026-02-09 18:45:26.000000',1,'1c1b613b7de94682ae4b725beab3c290'),(82,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc3MDY2MjczMiwiaWF0IjoxNzcwNTc2MzMyLCJqdGkiOiJjYzBiZTc1ZTE4MTU0NGI0OGNiOGRmNjQwOTk3NDI1YiIsInVzZXJfaWQiOiIxIn0._BsrveUmVvjBbXFMXaLH293r8TWzVf-o3_XHWCcY5rQ','2026-02-08 18:45:32.337707','2026-02-09 18:45:32.000000',1,'cc0be75e181544b48cb8df640997425b'),(83,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc3MDY2Mjc3OSwiaWF0IjoxNzcwNTc2Mzc5LCJqdGkiOiI0ZDNkN2FhYjY0NWM0NTBkYjgzNmVlZjMzODI5ZWZmNSIsInVzZXJfaWQiOiIxIn0.X8eJTo9v0H4qoUWG66lvYZTjEjKHU1MeBYdzJFv42xQ','2026-02-08 18:46:19.912790','2026-02-09 18:46:19.000000',1,'4d3d7aab645c450db836eef33829eff5'),(84,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc3MDY2Mjc5MSwiaWF0IjoxNzcwNTc2MzkxLCJqdGkiOiI2NjBhZjY0YmUzZjU0MDU4OWE0OWI4ODdmNDE5MTBkNiIsInVzZXJfaWQiOiIxIn0.XF-HBPO9MPJOQBF1as0sIB74184oafXbjJ5W-90GlU8','2026-02-08 18:46:31.785555','2026-02-09 18:46:31.000000',1,'660af64be3f540589a49b887f41910d6'),(85,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc3MDY2MjgwOCwiaWF0IjoxNzcwNTc2NDA4LCJqdGkiOiJlOWQ4YmNhODk4MDI0NGQxOTcxNDcwOTllZGZmM2E3NSIsInVzZXJfaWQiOiIxIn0.W0lXhsPS4HRrkZEi8W3G_XfM3w5FD0KF06adF8PyVk4','2026-02-08 18:46:48.773591','2026-02-09 18:46:48.000000',1,'e9d8bca8980244d197147099edff3a75'),(86,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc3MDY2MjgxOCwiaWF0IjoxNzcwNTc2NDE4LCJqdGkiOiI0OTIwMjZmNDI3ZmQ0MTA1OGRlYTZmYmE0NjI1MDU2NSIsInVzZXJfaWQiOiIxIn0.nDQG8NKqU7prtN8SnqeVFw1RdSJBARA4308ZAn71g-Q','2026-02-08 18:46:58.436088','2026-02-09 18:46:58.000000',1,'492026f427fd41058dea6fba46250565'),(87,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc3MDY2MjgyOCwiaWF0IjoxNzcwNTc2NDI4LCJqdGkiOiIyOGI5MzA5YzQ1MmM0MjI4YjBmMjYxNDBhMTE2ZjA5YSIsInVzZXJfaWQiOiIxIn0.PhP4F9CQY5ZsCrT7dtkTrUSj6YE0THDWNJR_SYvI9GA','2026-02-08 18:47:08.350624','2026-02-09 18:47:08.000000',1,'28b9309c452c4228b0f26140a116f09a'),(88,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc3MDY2MzI1OCwiaWF0IjoxNzcwNTc2ODU4LCJqdGkiOiI4ZjlhMzBjYjVmZTg0ZTA0YWU1NTMyNDRhYTY0ZDM0NCIsInVzZXJfaWQiOiIxIn0.JDyttKo5AKcd6CvlF4Kfc9O5GC-Q9rAG2z9w7Am3IRU','2026-02-08 18:54:18.078248','2026-02-09 18:54:18.000000',1,'8f9a30cb5fe84e04ae553244aa64d344'),(89,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc3MDY2MzU1MiwiaWF0IjoxNzcwNTc3MTUyLCJqdGkiOiI2MWNhMDFkY2JmOGY0MjNjOGRjZWM1MzU0YWE2N2RhOSIsInVzZXJfaWQiOiIxIn0.FaHTH1OqqtUQ29-2qH7HEveS_p0ygY5nSn80mCZQx1M','2026-02-08 18:59:12.136117','2026-02-09 18:59:12.000000',1,'61ca01dcbf8f423c8dcec5354aa67da9'),(90,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc3MDY2MzU3MSwiaWF0IjoxNzcwNTc3MTcxLCJqdGkiOiI1NjVmY2NjNzNlYTE0NjgzYmIwNGY5MDNiNzNjODdiMSIsInVzZXJfaWQiOiIxIn0.pBPXpN4LPeAcY4F5ODZHcxoiI6AZaXlnDXWwY0JIQ20','2026-02-08 18:59:31.733937','2026-02-09 18:59:31.000000',1,'565fccc73ea14683bb04f903b73c87b1'),(91,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc3MDY2NDY1NSwiaWF0IjoxNzcwNTc4MjU1LCJqdGkiOiJiMjNiNjY1ODRkN2M0NDk0OGQ0NzVlNWQ5OTRlY2QxNCIsInVzZXJfaWQiOiIxIn0.YHm8XLi3E_X78RISO6IJXXBot3e-P6hmhN6X0qxy_jM','2026-02-08 19:17:35.073254','2026-02-09 19:17:35.000000',1,'b23b66584d7c44948d475e5d994ecd14'),(92,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc3MDY2NTEyOCwiaWF0IjoxNzcwNTc4NzI4LCJqdGkiOiJjZTQwNDFlZjgzOTU0MDM4YjVkZmQwYWMzOTJkMDAyYiIsInVzZXJfaWQiOiIxIn0.Zuj4X9vwasbaFeexYG7FHJVKzwM8yfW-TANK7GMOGc0','2026-02-08 19:25:28.748768','2026-02-09 19:25:28.000000',1,'ce4041ef83954038b5dfd0ac392d002b'),(93,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc3MDY2NTMzMiwiaWF0IjoxNzcwNTc4OTMyLCJqdGkiOiIxYjVmNDJjZWMwMWQ0N2RiYTg1ZmM4YTUxZWEzMWU2ZiIsInVzZXJfaWQiOiIxIn0.8HA2aL6tmzvsx19lxOkxUp-9z7tVcVIazFR4XzUEGi8','2026-02-08 19:28:52.839766','2026-02-09 19:28:52.000000',1,'1b5f42cec01d47dba85fc8a51ea31e6f'),(94,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc3MDY2NTMzNCwiaWF0IjoxNzcwNTc4OTM0LCJqdGkiOiI3OTg1OTJhYTczMTQ0NzYwOGJkMjQyNjhmYjkxYjJmYiIsInVzZXJfaWQiOiIxIn0.qOoTTpH-9zGoud1pEkJl8fjX3wUSKyT6wnfqSsDK8s8','2026-02-08 19:28:54.921743','2026-02-09 19:28:54.000000',1,'798592aa731447608bd24268fb91b2fb'),(95,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc3MDY2NTM1NCwiaWF0IjoxNzcwNTc4OTU0LCJqdGkiOiJhYjFkMjU2NGIzOGQ0YzEzYTYyMzFmMTc3YmQ2ZTVmYSIsInVzZXJfaWQiOiIxIn0.RiV5Tyr0m5hV7Ciy_XprobbxXYDnLDL7z36PL2nISV0','2026-02-08 19:29:14.156422','2026-02-09 19:29:14.000000',1,'ab1d2564b38d4c13a6231f177bd6e5fa'),(96,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc3MDY2NTM2NCwiaWF0IjoxNzcwNTc4OTY0LCJqdGkiOiJiYmVkMTkzNjIxOTE0MTBlODEwY2RmZjkxZjRkY2Y0YiIsInVzZXJfaWQiOiIxIn0.8igfep1nNzhsy65aBwq7V0x3MEu86prTs4OJlKrqt38','2026-02-08 19:29:24.375751','2026-02-09 19:29:24.000000',1,'bbed19362191410e810cdff91f4dcf4b'),(97,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc3MDY2NTQwNSwiaWF0IjoxNzcwNTc5MDA1LCJqdGkiOiJhYzQ1NzczYzNlZjI0ZGU4YjQwNjBlYTNiYzA0OTRjYyIsInVzZXJfaWQiOiIxIn0.2sodCBeTu_0_IbleIenYoqibuOKL0NJmhORa56gm0v4','2026-02-08 19:30:05.260427','2026-02-09 19:30:05.000000',1,'ac45773c3ef24de8b4060ea3bc0494cc'),(98,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc3MDY2Njc0OCwiaWF0IjoxNzcwNTgwMzQ4LCJqdGkiOiI2ZmIzYzdjZjJlMzU0NDQ5YWQ3ZjU0MWEyODUxYjA2MCIsInVzZXJfaWQiOiIxIn0.3vdcybRDcfiRQXL_OBf9Df0TybyiPkVpirtB6mN7xWw','2026-02-08 19:52:28.056264','2026-02-09 19:52:28.000000',1,'6fb3c7cf2e354449ad7f541a2851b060'),(99,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc3MDY2Njc1NywiaWF0IjoxNzcwNTgwMzU3LCJqdGkiOiIzYTA5YWZhNTJhN2Q0ZTFlOTgxMzQ3YzE2YzRkODBjOSIsInVzZXJfaWQiOiIxIn0.rwZ6wvhDNQqe4bpfHUsXXT1ObnbaLRHem8BlXknMJCo','2026-02-08 19:52:37.998853','2026-02-09 19:52:37.000000',1,'3a09afa52a7d4e1e981347c16c4d80c9'),(100,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc3MDY2Njc2NywiaWF0IjoxNzcwNTgwMzY3LCJqdGkiOiJmNzhiNzlkYTEyMTM0ZTM3OTk1YTRmNjRhY2U2ZTg1NyIsInVzZXJfaWQiOiIxIn0.jyXQnW4kYTGCVegxnZ3aO7_7bTrFasdhPelbA7tdj_4','2026-02-08 19:52:47.309454','2026-02-09 19:52:47.000000',1,'f78b79da12134e37995a4f64ace6e857'),(101,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc3MDY2Njc4MiwiaWF0IjoxNzcwNTgwMzgyLCJqdGkiOiI1YzA0N2Q5MTVhMWM0ZWExOWNmYmU4ZTE2MzZhNzU4MSIsInVzZXJfaWQiOiIxIn0.cBvb9P_tcNFaDbau8CoDDk1kuvvKFNklNtFQ8iEbnKc','2026-02-08 19:53:02.032706','2026-02-09 19:53:02.000000',1,'5c047d915a1c4ea19cfbe8e1636a7581'),(102,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc3MDY2Njg1MCwiaWF0IjoxNzcwNTgwNDUwLCJqdGkiOiJiNzJlMTBlNDY4YTU0M2I2OGRiYjliNTVhODk2ZDU0OSIsInVzZXJfaWQiOiIxIn0.idmEiqLw-hhsAj4pS9rTRJnwybNbhd_7Oq-XU8dYyVU','2026-02-08 19:54:10.143298','2026-02-09 19:54:10.000000',1,'b72e10e468a543b68dbb9b55a896d549'),(103,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc3MDY2Njg1OSwiaWF0IjoxNzcwNTgwNDU5LCJqdGkiOiIyNmQ0MmMyNDA4MGQ0YjA1YWExY2M2NmVjMTkxZmY0MSIsInVzZXJfaWQiOiIxIn0.nbmcSbRxjv53VkwQdLYdF1_rZ5D9LwTgYTxDhnQm3ao','2026-02-08 19:54:19.464548','2026-02-09 19:54:19.000000',1,'26d42c24080d4b05aa1cc66ec191ff41'),(104,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc3MDY2ODM1MCwiaWF0IjoxNzcwNTgxOTUwLCJqdGkiOiJiNTYzMDMzNzVhNWQ0MzAxYmNmYWMwOTAzMzAzNmMwMiIsInVzZXJfaWQiOiIxIn0.kXW_1YFvTr8l2B9ymMKt5u95lAVNMeI6SBaPWb5w2W4','2026-02-08 20:19:10.692540','2026-02-09 20:19:10.000000',1,'b56303375a5d4301bcfac09033036c02'),(105,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc3MDY2ODYwNywiaWF0IjoxNzcwNTgyMjA3LCJqdGkiOiIzNDkwYmMxNDc3NGY0NDhkYWRlMmIyZDc3ZGE0NTBkOCIsInVzZXJfaWQiOiIxIn0.LOX79nneAljs7Sz10Ty3NbQaZvhD72mPYOQZeK8YRwM','2026-02-08 20:23:27.690296','2026-02-09 20:23:27.000000',1,'3490bc14774f448dade2b2d77da450d8'),(106,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc3MDY2ODYxOSwiaWF0IjoxNzcwNTgyMjE5LCJqdGkiOiI2ZGU5ZTViOTU1NjU0ZWU0YWM5MDk4MDQyZmE0MjE5YSIsInVzZXJfaWQiOiIxIn0.vdVccD7rytNRD_t4z4tR4kU3xi7LcfZfAzim5gqbRtA','2026-02-08 20:23:39.530125','2026-02-09 20:23:39.000000',1,'6de9e5b955654ee4ac9098042fa4219a'),(107,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc3MDY2ODk4NCwiaWF0IjoxNzcwNTgyNTg0LCJqdGkiOiJiYmU2Nzg2MjkyODM0NDFlOGRhMzk2NGU1NzNiZDhjMyIsInVzZXJfaWQiOiIxIn0.oy995ohDQ-FiuwIaoSFTnnJ2ltriotoVime7OUs5EoM','2026-02-08 20:29:44.797977','2026-02-09 20:29:44.000000',1,'bbe678629283441e8da3964e573bd8c3'),(108,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc3MDY2OTI1OCwiaWF0IjoxNzcwNTgyODU4LCJqdGkiOiJiODI2NTg5NDgzNmU0YjRiYTJkZDRlM2U2MTc3ZGQ1ZSIsInVzZXJfaWQiOiIxIn0.NWr_gSCoJemXGvXYHCuO1gS-OaeehGtx7eua2bKkRfI','2026-02-08 20:34:18.415382','2026-02-09 20:34:18.000000',1,'b8265894836e4b4ba2dd4e3e6177dd5e'),(109,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc3MDY2OTMwNiwiaWF0IjoxNzcwNTgyOTA2LCJqdGkiOiI5ODJkZTk4MWFhMjI0NzRlOWZlOWJjMzgxZmJhYzE5MSIsInVzZXJfaWQiOiIxIn0.PA1ZLXW9i-4an5hABStpAlJe1Pwe-GmcM3mWhbM6Mew','2026-02-08 20:35:06.903687','2026-02-09 20:35:06.000000',1,'982de981aa22474e9fe9bc381fbac191'),(110,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc3MDY4NzY5MywiaWF0IjoxNzcwNjAxMjkzLCJqdGkiOiJiMjM3NzVjMDA5Zjk0NGY1YTBmNmQ4NmVmN2RjOTAwYSIsInVzZXJfaWQiOiIxIn0.AhhkpdPgb6gbP3DF0it8mQEUivhkxkoJ55yOzdMEPRw','2026-02-09 01:41:33.144402','2026-02-10 01:41:33.000000',1,'b23775c009f944f5a0f6d86ef7dc900a'),(111,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc3MDY5MTQ3MywiaWF0IjoxNzcwNjA1MDczLCJqdGkiOiIyNTI1ZGJhNjMyNzU0MjE5ODI2ODM1ZDAwNTg5ODhjMSIsInVzZXJfaWQiOiIxIn0.GFWcq7pZthoWukHTRsKPBKSEZFnKNmpp7J1Z6xbPt5Y','2026-02-09 02:44:33.800288','2026-02-10 02:44:33.000000',1,'2525dba632754219826835d0058988c1'),(112,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc3MDY5NTMwNSwiaWF0IjoxNzcwNjA4OTA1LCJqdGkiOiI5YTI3NzgwMjgxM2I0Zjc1YTIwM2Y1YWZjOTk2OWVhZSIsInVzZXJfaWQiOiIxIn0.l9Au_x32hjOg-WQ6HIkYJ6jCnFuM8LjNZWHGhyH34p8','2026-02-09 03:48:25.505939','2026-02-10 03:48:25.000000',1,'9a277802813b4f75a203f5afc9969eae'),(113,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc3MDY5OTE3OSwiaWF0IjoxNzcwNjEyNzc5LCJqdGkiOiI2NTY2MjgxZTMyNmM0YmY5YWRlZjc0NTkzZmJmOTA1MiIsInVzZXJfaWQiOiIxIn0.4FC2goNcZT802-Pq4hel3Wfx2PrKW7rYMgCgaTHUgfU','2026-02-09 04:52:59.502645','2026-02-10 04:52:59.000000',1,'6566281e326c4bf9adef74593fbf9052'),(114,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc3MDcwMzM5OSwiaWF0IjoxNzcwNjE2OTk5LCJqdGkiOiJhMTgwNmI3YThiMDU0ZDdjYjdlMmU1MWQ0YWRmOTEzMyIsInVzZXJfaWQiOiIxIn0.nUCPoJ6DXCYE4gE1IpzN1Gc4j07eeVKfl9ynueM4LMQ','2026-02-09 06:03:19.505578','2026-02-10 06:03:19.000000',1,'a1806b7a8b054d7cb7e2e51d4adf9133'),(115,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc3MDcwNTU1MywiaWF0IjoxNzcwNjE5MTUzLCJqdGkiOiJlOGE3MTNkOGYxYTM0NGFhODkwNGM0MzQxNmYxZTk5MSIsInVzZXJfaWQiOiIxIn0.w0BhGsK8Huz0lxXrX0S9hioVALkL_1Zq8k5gk32kEhQ','2026-02-09 06:39:13.664752','2026-02-10 06:39:13.000000',1,'e8a713d8f1a344aa8904c43416f1e991'),(116,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc3MDcwNTU2NCwiaWF0IjoxNzcwNjE5MTY0LCJqdGkiOiIxNDk4ZTcxNjlmZGE0NTM3YTNmNWQ3NjNhNDE5ZjUwOCIsInVzZXJfaWQiOiIxIn0.rOd74uWPACSh2-A8Qph6LjceI_YtKsfC0_VaO5I_8Ss','2026-02-09 06:39:24.481025','2026-02-10 06:39:24.000000',1,'1498e7169fda4537a3f5d763a419f508'),(117,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc3MDcwNTU3MiwiaWF0IjoxNzcwNjE5MTcyLCJqdGkiOiJiOGI1NzAzYzZjOWQ0NmY5OTBlZjIxMDYzYzk5YjU0ZiIsInVzZXJfaWQiOiIxIn0.9PeXPwTjWJyJnZ5uivHBvEKYmIvq5ZDdI7L4aSvFObY','2026-02-09 06:39:32.717052','2026-02-10 06:39:32.000000',1,'b8b5703c6c9d46f990ef21063c99b54f'),(118,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc3MDcwNTU5NCwiaWF0IjoxNzcwNjE5MTk0LCJqdGkiOiI4YmM4YjM5MmI0NjI0NTEzYTUyZjcwNDYyOTQwY2MyMCIsInVzZXJfaWQiOiIxIn0.juLzjq2oa_NnqtzpkzWeWUqMNTWjOjQa5xNHH5Dqt3I','2026-02-09 06:39:54.874875','2026-02-10 06:39:54.000000',1,'8bc8b392b4624513a52f70462940cc20'),(119,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc3MDcwNjMxNiwiaWF0IjoxNzcwNjE5OTE2LCJqdGkiOiI2MDU1OThhMGJlM2M0YzZiOTA2MDg0N2NjNThkZGI4ZSIsInVzZXJfaWQiOiIxIn0.TCs7txF0h3XTBm3Th3k1V94Hlx5bgkLAVvqROKwbuqo','2026-02-09 06:51:56.527169','2026-02-10 06:51:56.000000',1,'605598a0be3c4c6b9060847cc58ddb8e'),(120,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc3MDcwNjM1NSwiaWF0IjoxNzcwNjE5OTU1LCJqdGkiOiI3MzMzYjgwOTUxYjI0NGI1OWQwZWFhZDNhYWNkYTY4OSIsInVzZXJfaWQiOiIxIn0.eU9wAKSqMzCuAemLzNUIrxqpWvVKxnrRc-GmGTVvCc8','2026-02-09 06:52:35.935607','2026-02-10 06:52:35.000000',1,'7333b80951b244b59d0eaad3aacda689'),(121,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc3MDcwNjM5OSwiaWF0IjoxNzcwNjE5OTk5LCJqdGkiOiJiOGNlNzA1NDhlZjg0MjBhOWY1YWIyOWU1NjA1YTlhNCIsInVzZXJfaWQiOiIxIn0.m_qU4xefbwNYMZLq7Mo7s8kRfBaQEqquCksditXRd5k','2026-02-09 06:53:19.692712','2026-02-10 06:53:19.000000',1,'b8ce70548ef8420a9f5ab29e5605a9a4'),(122,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc3MDcwNjcyOCwiaWF0IjoxNzcwNjIwMzI4LCJqdGkiOiIyOGRhYzZhZDg4Mjg0ZDA0OGNlNGQwODU3OWNiNzNlNiIsInVzZXJfaWQiOiIxIn0.rI9pwPP0mlWp4pmthOeVKxo6swwEe61yU0rZpLhuKXM','2026-02-09 06:58:48.958336','2026-02-10 06:58:48.000000',1,'28dac6ad88284d048ce4d08579cb73e6');
/*!40000 ALTER TABLE `token_blacklist_outstandingtoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `role` varchar(30) NOT NULL,
  `roll_number` varchar(50) DEFAULT NULL,
  `failed_login_attempts` int(11) NOT NULL,
  `locked_until` datetime(6) DEFAULT NULL,
  `branch` varchar(50) DEFAULT NULL,
  `can_manage_users` tinyint(1) NOT NULL,
  `can_view_all_branches` tinyint(1) NOT NULL,
  `department` varchar(100) DEFAULT NULL,
  `is_active_user` tinyint(1) NOT NULL,
  `can_delete_results` tinyint(1) NOT NULL,
  `can_upload_results` tinyint(1) NOT NULL,
  `can_view_statistics` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `roll_number` (`roll_number`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'argon2$argon2id$v=19$m=102400,t=2,p=8$bkp5U3MwM1h6OGEzNDN1V04xY2kxRQ$oqs9Ww1QffOn2jB5NIQEACKXg5YOVQYzLL9nBuI5654',NULL,1,'admin','','','admin@spmvv.edu',1,1,'2026-02-07 08:33:40.530157','admin',NULL,0,NULL,NULL,1,1,NULL,1,1,1,1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_groups`
--

DROP TABLE IF EXISTS `users_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_groups_user_id_group_id_fc7788e8_uniq` (`user_id`,`group_id`),
  KEY `users_groups_group_id_2f3517aa_fk_auth_group_id` (`group_id`),
  CONSTRAINT `users_groups_group_id_2f3517aa_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `users_groups_user_id_f500bee5_fk_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_groups`
--

LOCK TABLES `users_groups` WRITE;
/*!40000 ALTER TABLE `users_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_user_permissions`
--

DROP TABLE IF EXISTS `users_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_user_permissions_user_id_permission_id_3b86cbdf_uniq` (`user_id`,`permission_id`),
  KEY `users_user_permissio_permission_id_6d08dcd2_fk_auth_perm` (`permission_id`),
  CONSTRAINT `users_user_permissio_permission_id_6d08dcd2_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `users_user_permissions_user_id_92473840_fk_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_user_permissions`
--

LOCK TABLES `users_user_permissions` WRITE;
/*!40000 ALTER TABLE `users_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-02-09  2:15:01
