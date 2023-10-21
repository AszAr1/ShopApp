-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: shopdb
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (1,'StaffGroup');
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
INSERT INTO `auth_group_permissions` VALUES (6,1,4),(8,1,8),(10,1,12),(12,1,16),(13,1,20),(15,1,24),(1,1,32),(2,1,33),(3,1,34),(4,1,35),(5,1,36),(7,1,40),(9,1,44),(11,1,48),(14,1,52);
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add user',1,'add_customuser'),(2,'Can change user',1,'change_customuser'),(3,'Can delete user',1,'delete_customuser'),(4,'Can view user',1,'view_customuser'),(5,'Can add order',2,'add_order'),(6,'Can change order',2,'change_order'),(7,'Can delete order',2,'delete_order'),(8,'Can view order',2,'view_order'),(9,'Can add product',3,'add_product'),(10,'Can change product',3,'change_product'),(11,'Can delete product',3,'delete_product'),(12,'Can view product',3,'view_product'),(13,'Can add order item',4,'add_orderitem'),(14,'Can change order item',4,'change_orderitem'),(15,'Can delete order item',4,'delete_orderitem'),(16,'Can view order item',4,'view_orderitem'),(17,'Can add favorite',5,'add_favorite'),(18,'Can change favorite',5,'change_favorite'),(19,'Can delete favorite',5,'delete_favorite'),(20,'Can view favorite',5,'view_favorite'),(21,'Can add cart item',6,'add_cartitem'),(22,'Can change cart item',6,'change_cartitem'),(23,'Can delete cart item',6,'delete_cartitem'),(24,'Can view cart item',6,'view_cartitem'),(25,'Can add Token',7,'add_token'),(26,'Can change Token',7,'change_token'),(27,'Can delete Token',7,'delete_token'),(28,'Can view Token',7,'view_token'),(29,'Can add token',8,'add_tokenproxy'),(30,'Can change token',8,'change_tokenproxy'),(31,'Can delete token',8,'delete_tokenproxy'),(32,'Can view token',8,'view_tokenproxy'),(33,'Can add log entry',9,'add_logentry'),(34,'Can change log entry',9,'change_logentry'),(35,'Can delete log entry',9,'delete_logentry'),(36,'Can view log entry',9,'view_logentry'),(37,'Can add permission',10,'add_permission'),(38,'Can change permission',10,'change_permission'),(39,'Can delete permission',10,'delete_permission'),(40,'Can view permission',10,'view_permission'),(41,'Can add group',11,'add_group'),(42,'Can change group',11,'change_group'),(43,'Can delete group',11,'delete_group'),(44,'Can view group',11,'view_group'),(45,'Can add content type',12,'add_contenttype'),(46,'Can change content type',12,'change_contenttype'),(47,'Can delete content type',12,'delete_contenttype'),(48,'Can view content type',12,'view_contenttype'),(49,'Can add session',13,'add_session'),(50,'Can change session',13,'change_session'),(51,'Can delete session',13,'delete_session'),(52,'Can view session',13,'view_session');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authtoken_token`
--

DROP TABLE IF EXISTS `authtoken_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authtoken_token` (
  `key` varchar(40) NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` char(32) NOT NULL,
  PRIMARY KEY (`key`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `authtoken_token_user_id_35299eff_fk_users_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `users_customuser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authtoken_token`
--

LOCK TABLES `authtoken_token` WRITE;
/*!40000 ALTER TABLE `authtoken_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `authtoken_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_users_customuser_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_users_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `users_customuser` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2023-10-14 20:24:24.341483','923476325699','Product object (923476325699)',2,'[{\"changed\": {\"fields\": [\"Description\", \"Image\"]}}]',3,'bd77354606d04c52a59186cbc3061fb4'),(2,'2023-10-14 20:25:07.993655','923476325699','Product object (923476325699)',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',3,'bd77354606d04c52a59186cbc3061fb4'),(3,'2023-10-14 20:25:20.579184','923476325699','Product object (923476325699)',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',3,'bd77354606d04c52a59186cbc3061fb4'),(4,'2023-10-14 20:30:58.105521','923476325699','Product object (923476325699)',3,'',3,'bd77354606d04c52a59186cbc3061fb4'),(5,'2023-10-14 20:31:28.439459','895371574125','Product object (895371574125)',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',3,'bd77354606d04c52a59186cbc3061fb4'),(6,'2023-10-14 20:38:15.225141','895371574125','Product object (895371574125)',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',3,'bd77354606d04c52a59186cbc3061fb4'),(7,'2023-10-14 20:38:19.090462','889221886234','Product object (889221886234)',2,'[{\"changed\": {\"fields\": [\"Description\"]}}]',3,'bd77354606d04c52a59186cbc3061fb4'),(8,'2023-10-14 20:38:22.088109','895371574125','Product object (895371574125)',2,'[]',3,'bd77354606d04c52a59186cbc3061fb4'),(9,'2023-10-14 20:44:59.703423','660031690164','Product object (660031690164)',2,'[{\"changed\": {\"fields\": [\"Description\"]}}]',3,'bd77354606d04c52a59186cbc3061fb4'),(10,'2023-10-14 20:45:21.886363','895371574125','Product object (895371574125)',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',3,'bd77354606d04c52a59186cbc3061fb4'),(11,'2023-10-14 20:45:52.390485','889221886234','Product object (889221886234)',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',3,'bd77354606d04c52a59186cbc3061fb4'),(12,'2023-10-14 20:46:03.748443','660031690164','Product object (660031690164)',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',3,'bd77354606d04c52a59186cbc3061fb4'),(13,'2023-10-14 20:46:13.260141','601248815524','Product object (601248815524)',2,'[{\"changed\": {\"fields\": [\"Description\", \"Image\"]}}]',3,'bd77354606d04c52a59186cbc3061fb4'),(14,'2023-10-14 20:46:29.255353','599390561004','Product object (599390561004)',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',3,'bd77354606d04c52a59186cbc3061fb4'),(15,'2023-10-14 20:46:38.403519','587142051425','Product object (587142051425)',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',3,'bd77354606d04c52a59186cbc3061fb4'),(16,'2023-10-14 20:46:45.059996','540894043802','Product object (540894043802)',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',3,'bd77354606d04c52a59186cbc3061fb4'),(17,'2023-10-14 20:46:57.027140','525448940914','Product object (525448940914)',2,'[{\"changed\": {\"fields\": [\"Description\", \"Image\"]}}]',3,'bd77354606d04c52a59186cbc3061fb4'),(18,'2023-10-14 20:47:11.898078','407935532476','Product object (407935532476)',2,'[{\"changed\": {\"fields\": [\"Description\", \"Image\"]}}]',3,'bd77354606d04c52a59186cbc3061fb4'),(19,'2023-10-14 20:47:22.227190','338881331567','Product object (338881331567)',2,'[{\"changed\": {\"fields\": [\"Description\", \"Content\", \"Image\"]}}]',3,'bd77354606d04c52a59186cbc3061fb4'),(20,'2023-10-14 20:47:36.648395','330892391382','Product object (330892391382)',2,'[{\"changed\": {\"fields\": [\"Description\", \"Content\", \"Image\"]}}]',3,'bd77354606d04c52a59186cbc3061fb4'),(21,'2023-10-14 20:47:38.877188','330892391382','Product object (330892391382)',2,'[]',3,'bd77354606d04c52a59186cbc3061fb4'),(22,'2023-10-14 20:47:48.813578','328049462781','Product object (328049462781)',2,'[{\"changed\": {\"fields\": [\"Description\", \"Image\"]}}]',3,'bd77354606d04c52a59186cbc3061fb4'),(23,'2023-10-14 20:47:57.369539','281282086525','Product object (281282086525)',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',3,'bd77354606d04c52a59186cbc3061fb4'),(24,'2023-10-14 20:48:06.186458','269695372271','Product object (269695372271)',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',3,'bd77354606d04c52a59186cbc3061fb4'),(25,'2023-10-14 20:48:16.858108','231193606723','Product object (231193606723)',2,'[{\"changed\": {\"fields\": [\"Description\", \"Image\"]}}]',3,'bd77354606d04c52a59186cbc3061fb4'),(26,'2023-10-14 20:48:24.121652','181468862549','Product object (181468862549)',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',3,'bd77354606d04c52a59186cbc3061fb4'),(27,'2023-10-14 21:04:36.161002','1','StaffGroup',1,'[{\"added\": {}}]',11,'bd77354606d04c52a59186cbc3061fb4'),(28,'2023-10-16 18:47:45.030801','1','Product object (1)',1,'[{\"added\": {}}]',3,'bd77354606d04c52a59186cbc3061fb4'),(29,'2023-10-18 12:51:09.729653','181468862549','Product object (181468862549)',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',3,'bd77354606d04c52a59186cbc3061fb4'),(30,'2023-10-18 12:55:43.325357','181468862549','Product object (181468862549)',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',3,'bd77354606d04c52a59186cbc3061fb4'),(31,'2023-10-20 15:58:21.815175','895371574125','Product object (895371574125)',3,'',3,'bd77354606d04c52a59186cbc3061fb4'),(32,'2023-10-20 15:58:21.843716','889221886234','Product object (889221886234)',3,'',3,'bd77354606d04c52a59186cbc3061fb4'),(33,'2023-10-20 15:58:21.849035','660031690164','Product object (660031690164)',3,'',3,'bd77354606d04c52a59186cbc3061fb4'),(34,'2023-10-20 15:58:21.854124','601248815524','Product object (601248815524)',3,'',3,'bd77354606d04c52a59186cbc3061fb4'),(35,'2023-10-20 15:58:21.859796','599390561004','Product object (599390561004)',3,'',3,'bd77354606d04c52a59186cbc3061fb4'),(36,'2023-10-20 15:58:21.863779','587142051425','Product object (587142051425)',3,'',3,'bd77354606d04c52a59186cbc3061fb4'),(37,'2023-10-20 15:58:21.868954','540894043802','Product object (540894043802)',3,'',3,'bd77354606d04c52a59186cbc3061fb4'),(38,'2023-10-20 15:58:21.873680','525448940914','Product object (525448940914)',3,'',3,'bd77354606d04c52a59186cbc3061fb4'),(39,'2023-10-20 15:58:21.877378','407935532476','Product object (407935532476)',3,'',3,'bd77354606d04c52a59186cbc3061fb4'),(40,'2023-10-20 15:58:21.880891','338881331567','Product object (338881331567)',3,'',3,'bd77354606d04c52a59186cbc3061fb4'),(41,'2023-10-20 15:58:21.885948','330892391382','Product object (330892391382)',3,'',3,'bd77354606d04c52a59186cbc3061fb4'),(42,'2023-10-20 15:58:21.889952','328049462781','Product object (328049462781)',3,'',3,'bd77354606d04c52a59186cbc3061fb4'),(43,'2023-10-20 15:58:21.893852','281282086525','Product object (281282086525)',3,'',3,'bd77354606d04c52a59186cbc3061fb4'),(44,'2023-10-20 15:58:21.897430','269695372271','Product object (269695372271)',3,'',3,'bd77354606d04c52a59186cbc3061fb4'),(45,'2023-10-20 15:58:21.901950','231193606723','Product object (231193606723)',3,'',3,'bd77354606d04c52a59186cbc3061fb4'),(46,'2023-10-20 15:58:21.905982','181468862549','Product object (181468862549)',3,'',3,'bd77354606d04c52a59186cbc3061fb4'),(47,'2023-10-20 16:00:26.417124','999828272852','Product object (999828272852)',2,'[{\"changed\": {\"fields\": [\"Description\", \"Image\"]}}]',3,'bd77354606d04c52a59186cbc3061fb4'),(48,'2023-10-20 16:00:34.509321','959453459383','Product object (959453459383)',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',3,'bd77354606d04c52a59186cbc3061fb4'),(49,'2023-10-20 16:00:40.217085','916797374473','Product object (916797374473)',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',3,'bd77354606d04c52a59186cbc3061fb4'),(50,'2023-10-20 16:00:49.001926','803999893579','Product object (803999893579)',2,'[{\"changed\": {\"fields\": [\"Description\", \"Image\"]}}]',3,'bd77354606d04c52a59186cbc3061fb4'),(51,'2023-10-20 16:00:56.486240','715550461997','Product object (715550461997)',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',3,'bd77354606d04c52a59186cbc3061fb4'),(52,'2023-10-20 16:01:04.513493','694574221604','Product object (694574221604)',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',3,'bd77354606d04c52a59186cbc3061fb4'),(53,'2023-10-20 16:01:11.881867','689750362357','Product object (689750362357)',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',3,'bd77354606d04c52a59186cbc3061fb4'),(54,'2023-10-20 16:01:20.920800','675800672750','Product object (675800672750)',2,'[{\"changed\": {\"fields\": [\"Description\", \"Image\"]}}]',3,'bd77354606d04c52a59186cbc3061fb4'),(55,'2023-10-20 16:01:30.824313','612598236672','Product object (612598236672)',2,'[{\"changed\": {\"fields\": [\"Description\", \"Image\"]}}]',3,'bd77354606d04c52a59186cbc3061fb4'),(56,'2023-10-20 16:01:39.631993','569307752873','Product object (569307752873)',2,'[{\"changed\": {\"fields\": [\"Description\", \"Image\"]}}]',3,'bd77354606d04c52a59186cbc3061fb4'),(57,'2023-10-20 16:04:32.717032','532698550148','Product object (532698550148)',2,'[{\"changed\": {\"fields\": [\"Description\", \"Image\"]}}]',3,'bd77354606d04c52a59186cbc3061fb4'),(58,'2023-10-20 16:04:39.952697','481665863412','Product object (481665863412)',2,'[{\"changed\": {\"fields\": [\"Description\", \"Image\"]}}]',3,'bd77354606d04c52a59186cbc3061fb4'),(59,'2023-10-20 16:04:46.397776','475080091402','Product object (475080091402)',2,'[{\"changed\": {\"fields\": [\"Description\", \"Image\"]}}]',3,'bd77354606d04c52a59186cbc3061fb4'),(60,'2023-10-20 16:04:54.839328','471706874003','Product object (471706874003)',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',3,'bd77354606d04c52a59186cbc3061fb4'),(61,'2023-10-20 16:05:04.766906','328124170781','Product object (328124170781)',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',3,'bd77354606d04c52a59186cbc3061fb4'),(62,'2023-10-20 16:05:12.204217','322127434109','Product object (322127434109)',2,'[{\"changed\": {\"fields\": [\"Description\", \"Content\", \"Image\"]}}]',3,'bd77354606d04c52a59186cbc3061fb4'),(63,'2023-10-20 16:05:20.803373','105797347223','Product object (105797347223)',2,'[{\"changed\": {\"fields\": [\"Description\", \"Content\", \"Image\"]}}]',3,'bd77354606d04c52a59186cbc3061fb4'),(64,'2023-10-20 16:08:13.567967','999828272852','Product object (999828272852)',3,'',3,'bd77354606d04c52a59186cbc3061fb4'),(65,'2023-10-20 16:08:13.573254','959453459383','Product object (959453459383)',3,'',3,'bd77354606d04c52a59186cbc3061fb4'),(66,'2023-10-20 16:08:13.577929','916797374473','Product object (916797374473)',3,'',3,'bd77354606d04c52a59186cbc3061fb4'),(67,'2023-10-20 16:08:13.582039','803999893579','Product object (803999893579)',3,'',3,'bd77354606d04c52a59186cbc3061fb4'),(68,'2023-10-20 16:08:13.585945','715550461997','Product object (715550461997)',3,'',3,'bd77354606d04c52a59186cbc3061fb4'),(69,'2023-10-20 16:08:13.590998','694574221604','Product object (694574221604)',3,'',3,'bd77354606d04c52a59186cbc3061fb4'),(70,'2023-10-20 16:08:13.595194','689750362357','Product object (689750362357)',3,'',3,'bd77354606d04c52a59186cbc3061fb4'),(71,'2023-10-20 16:08:13.599381','675800672750','Product object (675800672750)',3,'',3,'bd77354606d04c52a59186cbc3061fb4'),(72,'2023-10-20 16:08:13.603586','612598236672','Product object (612598236672)',3,'',3,'bd77354606d04c52a59186cbc3061fb4'),(73,'2023-10-20 16:08:13.607988','569307752873','Product object (569307752873)',3,'',3,'bd77354606d04c52a59186cbc3061fb4'),(74,'2023-10-20 16:08:13.612113','532698550148','Product object (532698550148)',3,'',3,'bd77354606d04c52a59186cbc3061fb4'),(75,'2023-10-20 16:08:13.616154','481665863412','Product object (481665863412)',3,'',3,'bd77354606d04c52a59186cbc3061fb4'),(76,'2023-10-20 16:08:13.621369','475080091402','Product object (475080091402)',3,'',3,'bd77354606d04c52a59186cbc3061fb4'),(77,'2023-10-20 16:08:13.627173','471706874003','Product object (471706874003)',3,'',3,'bd77354606d04c52a59186cbc3061fb4'),(78,'2023-10-20 16:08:13.630857','328124170781','Product object (328124170781)',3,'',3,'bd77354606d04c52a59186cbc3061fb4'),(79,'2023-10-20 16:08:13.634841','322127434109','Product object (322127434109)',3,'',3,'bd77354606d04c52a59186cbc3061fb4'),(80,'2023-10-20 16:08:13.640245','105797347223','Product object (105797347223)',3,'',3,'bd77354606d04c52a59186cbc3061fb4'),(81,'2023-10-20 16:11:51.918697','997710621327','Product object (997710621327)',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',3,'bd77354606d04c52a59186cbc3061fb4'),(82,'2023-10-20 16:13:04.315742','972263768435','Product object (972263768435)',2,'[{\"changed\": {\"fields\": [\"Description\", \"Image\"]}}]',3,'bd77354606d04c52a59186cbc3061fb4'),(83,'2023-10-20 16:13:11.105981','913818508974','Product object (913818508974)',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',3,'bd77354606d04c52a59186cbc3061fb4'),(84,'2023-10-20 16:13:18.358990','811294634321','Product object (811294634321)',2,'[{\"changed\": {\"fields\": [\"Description\", \"Content\", \"Image\"]}}]',3,'bd77354606d04c52a59186cbc3061fb4'),(85,'2023-10-20 16:13:26.125194','709884960065','Product object (709884960065)',2,'[{\"changed\": {\"fields\": [\"Description\", \"Image\"]}}]',3,'bd77354606d04c52a59186cbc3061fb4'),(86,'2023-10-20 16:13:35.109176','700203834923','Product object (700203834923)',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',3,'bd77354606d04c52a59186cbc3061fb4'),(87,'2023-10-20 16:13:50.625324','684927395075','Product object (684927395075)',2,'[{\"changed\": {\"fields\": [\"Description\", \"Image\"]}}]',3,'bd77354606d04c52a59186cbc3061fb4'),(88,'2023-10-20 16:14:04.712655','597699061655','Product object (597699061655)',2,'[{\"changed\": {\"fields\": [\"Description\"]}}]',3,'bd77354606d04c52a59186cbc3061fb4'),(89,'2023-10-20 16:14:11.067728','597699061655','Product object (597699061655)',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',3,'bd77354606d04c52a59186cbc3061fb4'),(90,'2023-10-20 16:14:18.067844','582210008103','Product object (582210008103)',2,'[{\"changed\": {\"fields\": [\"Description\", \"Content\", \"Image\"]}}]',3,'bd77354606d04c52a59186cbc3061fb4'),(91,'2023-10-20 16:14:25.793978','486233066360','Product object (486233066360)',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',3,'bd77354606d04c52a59186cbc3061fb4'),(92,'2023-10-20 16:14:38.285550','394238808810','Product object (394238808810)',2,'[{\"changed\": {\"fields\": [\"Description\", \"Image\"]}}]',3,'bd77354606d04c52a59186cbc3061fb4'),(93,'2023-10-20 16:14:47.667129','339741161564','Product object (339741161564)',2,'[{\"changed\": {\"fields\": [\"Description\", \"Image\"]}}]',3,'bd77354606d04c52a59186cbc3061fb4'),(94,'2023-10-20 16:14:54.548664','249088026957','Product object (249088026957)',2,'[{\"changed\": {\"fields\": [\"Description\", \"Image\"]}}]',3,'bd77354606d04c52a59186cbc3061fb4'),(95,'2023-10-20 16:15:00.527023','237713749889','Product object (237713749889)',2,'[{\"changed\": {\"fields\": [\"Description\", \"Image\"]}}]',3,'bd77354606d04c52a59186cbc3061fb4'),(96,'2023-10-20 16:15:10.731771','155242430672','Product object (155242430672)',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',3,'bd77354606d04c52a59186cbc3061fb4'),(97,'2023-10-20 16:15:16.407813','147085468981','Product object (147085468981)',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',3,'bd77354606d04c52a59186cbc3061fb4'),(98,'2023-10-20 16:15:26.820879','145323452557','Product object (145323452557)',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',3,'bd77354606d04c52a59186cbc3061fb4');
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (9,'admin','logentry'),(11,'auth','group'),(10,'auth','permission'),(7,'authtoken','token'),(8,'authtoken','tokenproxy'),(12,'contenttypes','contenttype'),(6,'products','cartitem'),(5,'products','favorite'),(2,'products','order'),(4,'products','orderitem'),(3,'products','product'),(13,'sessions','session'),(1,'users','customuser');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2023-10-14 20:19:11.069381'),(2,'contenttypes','0002_remove_content_type_name','2023-10-14 20:19:11.120961'),(3,'auth','0001_initial','2023-10-14 20:19:11.317584'),(4,'auth','0002_alter_permission_name_max_length','2023-10-14 20:19:11.366200'),(5,'auth','0003_alter_user_email_max_length','2023-10-14 20:19:11.377375'),(6,'auth','0004_alter_user_username_opts','2023-10-14 20:19:11.388066'),(7,'auth','0005_alter_user_last_login_null','2023-10-14 20:19:11.397584'),(8,'auth','0006_require_contenttypes_0002','2023-10-14 20:19:11.403185'),(9,'auth','0007_alter_validators_add_error_messages','2023-10-14 20:19:11.413236'),(10,'auth','0008_alter_user_username_max_length','2023-10-14 20:19:11.425354'),(11,'auth','0009_alter_user_last_name_max_length','2023-10-14 20:19:11.436475'),(12,'auth','0010_alter_group_name_max_length','2023-10-14 20:19:11.459410'),(13,'auth','0011_update_proxy_permissions','2023-10-14 20:19:11.469438'),(14,'auth','0012_alter_user_first_name_max_length','2023-10-14 20:19:11.479778'),(15,'users','0001_initial','2023-10-14 20:19:11.715122'),(16,'admin','0001_initial','2023-10-14 20:19:11.845826'),(17,'admin','0002_logentry_remove_auto_add','2023-10-14 20:19:11.855719'),(18,'admin','0003_logentry_add_action_flag_choices','2023-10-14 20:19:11.865795'),(19,'authtoken','0001_initial','2023-10-14 20:19:11.984135'),(20,'authtoken','0002_auto_20160226_1747','2023-10-14 20:19:12.012935'),(21,'authtoken','0003_tokenproxy','2023-10-14 20:19:12.019470'),(22,'products','0001_initial','2023-10-14 20:19:12.470372'),(23,'products','0002_alter_cartitem_id_alter_favorite_id_alter_order_id_and_more','2023-10-14 20:19:13.090340'),(24,'sessions','0001_initial','2023-10-14 20:19:13.130099'),(25,'products','0003_alter_product_image','2023-10-14 20:37:56.140738'),(26,'products','0004_alter_product_image','2023-10-20 16:10:24.820033');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('3urci4tbn0xa93sshsghi2g0gg1voyqi','.eJxVjjsOwjAQBe_imlgOu-sPJT1niLzrDQmgRMqnQtydREoB9ZsZvbdp8rp0zTrr1PTFXAyXEIDQV84XV6HQucqU6ip6YQHn65bRnH41zvLUYXfLIw_30co4LFPPdkfssc72NhZ9XQ_2L9DludtsjD6hY8kAQqqACVNMQJw0M7mSt1euJQraJlLSkEQCQGTCmrSQ-XwBncFAcg:1qrlAb:U8vcjEkUQoOT2HCIF8UoSfefLGhW4OSJSEKwEFQZvtw','2023-10-28 20:23:33.906044');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_cartitem`
--

DROP TABLE IF EXISTS `products_cartitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products_cartitem` (
  `id` bigint NOT NULL,
  `quantity` int unsigned NOT NULL,
  `product_id` bigint DEFAULT NULL,
  `user_id` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `products_cartitem_user_id_c496ef06_fk_users_customuser_id` (`user_id`),
  KEY `products_cartitem_product_id_e735c06a_fk` (`product_id`),
  CONSTRAINT `products_cartitem_product_id_e735c06a_fk` FOREIGN KEY (`product_id`) REFERENCES `products_product` (`id`),
  CONSTRAINT `products_cartitem_user_id_c496ef06_fk_users_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `users_customuser` (`id`),
  CONSTRAINT `products_cartitem_chk_1` CHECK ((`quantity` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_cartitem`
--

LOCK TABLES `products_cartitem` WRITE;
/*!40000 ALTER TABLE `products_cartitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `products_cartitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_favorite`
--

DROP TABLE IF EXISTS `products_favorite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products_favorite` (
  `id` bigint NOT NULL,
  `product_id` bigint DEFAULT NULL,
  `user_id` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `products_favorite_user_id_cd8466da_fk_users_customuser_id` (`user_id`),
  KEY `products_favorite_product_id_f8265054_fk` (`product_id`),
  CONSTRAINT `products_favorite_product_id_f8265054_fk` FOREIGN KEY (`product_id`) REFERENCES `products_product` (`id`),
  CONSTRAINT `products_favorite_user_id_cd8466da_fk_users_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `users_customuser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_favorite`
--

LOCK TABLES `products_favorite` WRITE;
/*!40000 ALTER TABLE `products_favorite` DISABLE KEYS */;
/*!40000 ALTER TABLE `products_favorite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_order`
--

DROP TABLE IF EXISTS `products_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products_order` (
  `id` bigint NOT NULL,
  `order_date` datetime(6) NOT NULL,
  `status` varchar(30) DEFAULT NULL,
  `customer_id` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `products_order_customer_id_6cb09035_fk_users_customuser_id` (`customer_id`),
  CONSTRAINT `products_order_customer_id_6cb09035_fk_users_customuser_id` FOREIGN KEY (`customer_id`) REFERENCES `users_customuser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_order`
--

LOCK TABLES `products_order` WRITE;
/*!40000 ALTER TABLE `products_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `products_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_orderitem`
--

DROP TABLE IF EXISTS `products_orderitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products_orderitem` (
  `id` bigint NOT NULL,
  `quantity` int unsigned NOT NULL,
  `order_id` bigint DEFAULT NULL,
  `product_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `products_orderitem_order_id_09ecb3c7_fk` (`order_id`),
  KEY `products_orderitem_product_id_60e2b174_fk` (`product_id`),
  CONSTRAINT `products_orderitem_order_id_09ecb3c7_fk` FOREIGN KEY (`order_id`) REFERENCES `products_order` (`id`),
  CONSTRAINT `products_orderitem_product_id_60e2b174_fk` FOREIGN KEY (`product_id`) REFERENCES `products_product` (`id`),
  CONSTRAINT `products_orderitem_chk_1` CHECK ((`quantity` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_orderitem`
--

LOCK TABLES `products_orderitem` WRITE;
/*!40000 ALTER TABLE `products_orderitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `products_orderitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_product`
--

DROP TABLE IF EXISTS `products_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products_product` (
  `id` bigint NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` longtext NOT NULL,
  `content` longtext NOT NULL,
  `category` varchar(30) NOT NULL,
  `price` decimal(7,2) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `pub_date` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_product`
--

LOCK TABLES `products_product` WRITE;
/*!40000 ALTER TABLE `products_product` DISABLE KEYS */;
INSERT INTO `products_product` VALUES (145323452557,'Nike Air Force 1 AN20 (GS) (CT7724-001)','Nike Air Force 1 AN20 обладают промежуточной подошвой из пеноматериала, которая обеспечивает амортизацию и смягчение ударов при ходьбе. В носочной и пяточной части кроссовок расположены воздушные камеры Air-Sole, которые повышают амортизацию и поддержку. Подошва кроссовок имеет рифленый рисунок, который обеспечивает отличное сцепление с поверхностью и устойчивость на различных типах грунта.  Эти кроссовки идеально подходят для повседневной носки, спортивных тренировок или для создания стильных уличных образов. Они легко сочетаются с различными нарядами и подходят для различных сезонов.','Nike Air Force 1 AN20 - это кроссовки, которые сочетают в себе классический стиль и современные технологии. Они обеспечивают комфорт, поддержку и эстетическое удовлетворение, делая их отличным выбором для всех любителей качественной обуви.','Sneakers',99.99,'Nike_Air_Force_1_AN20_GS_CT7724-001.png','2023-10-20 16:08:36.994062'),(147085468981,'Attack On Titan Hoodie Anime Oversized','sdfdsfdsfdsfdsfdsfdsf','sdfsdfdsfdsf','Hoodies',99.99,'Attack_On_Titan_Hoodie_Anime_Oversized.png','2023-10-20 16:08:57.671046'),(155242430672,'Itachi Hoodie','sdfdsfdsfdsfdsfdsfdsf','sdfsdfdsfdsf','Hoodies',99.99,'Itachi_Hoodie.png','2023-10-20 16:08:59.724358'),(237713749889,'Nike Air Force','Верхняя часть кроссовок выполнена из прочной кожи и текстильных материалов, обеспечивая комфорт и поддержку. Они имеют низкую профильную конструкцию, что обеспечивает свободу движений и универсальность в стилизации. Легендарный логотип Nike на язычке и боковой стороне придают этим кроссовкам узнаваемость и статусность.\r\n                        Nike Air 1 оснащены прочной резиновой подошвой, которая обеспечивает отличное сцепление с поверхностью и износостойкость. Они также оснащены технологией амортизации, включая вставку из пеноматериала и воздушные камеры Max Air, которые поглощают удары и обеспечивают дополнительную поддержку во время движения.Эти кроссовки являются иконой спортивной обуви, предлагающей комфорт, поддержку и стиль. Будь вы на тренировке или в повседневных приключениях, Nike Air 1 помогут вам выглядеть модно и чувствовать себя уверенно.','Nike Air Force 1 – это не только стильные кроссовки, но и часть культуры и наследия. Они стали вдохновением для множества художников, музыкантов и модных икон, их приверженцы по достоинству оценили их иконический статус и непревзойденное качество. Покупка Nike Air Force 1 – это инвестиция в стиль и комфорт. Они превосходно подойдут для повседневной носки, тренировок или для создания яркого образа на особые случаи. Ощутите легенду на своих ногах и позвольте Nike Air Force 1 стать неотъемлемой частью вашего гардероба.','Sneakers',99.99,'Nike_Air_Force.png','2023-10-20 16:08:26.678675'),(249088026957,'Nike Dunk Low Retro','Верхняя часть кроссовок выполнена из прочной кожи и текстильных материалов, обеспечивая долговечность и комфорт. Они имеют низкую профильную конструкцию, что делает их идеальными для повседневного использования. Логотип Nike на язычке и заднике придают этим кроссовкам фирменный стиль и узнаваемость.\r\n\r\nNike Dunk Low Retro оснащены подошвой с амортизацией, которая обеспечивает комфорт и поддержку во время ходьбы или прыжков. Уникальная подошва с рифленым рисунком протектора обеспечивает отличное сцепление с различными поверхностями и дополнительную износостойкость. Благодаря их универсальному дизайну, они легко сочетаются с различными нарядами, от повседневных до более формальных.','Nike Dunk Low Retro - это возвращение классических и стильных кроссовок, которые завоевали сердца модных ценителей со всего мира. Их иконический дизайн, комфорт и разнообразие цветовых вариантов делают их идеальным выбором для всех, кто хочет добавить уникальный акцент в свой образ.','Sneakers',99.99,'Nike_Dunk_Low_Retro.png','2023-10-20 16:08:32.879572'),(339741161564,'Nike Air More Uptempo \'96','Верхняя часть кроссовок Nike Air More Uptempo \'96 выполнена из прочной и дышащей натуральной кожи, которая обеспечивает долговечность и комфорт. Уникальной особенностью этих кроссовок является их дизайн, основанный на выразительных \"AIR\" буквах, которые занимают большую часть боковой стороны кроссовок, подчеркивая их индивидуальность и стиль.\r\n\r\nNike Air More Uptempo \'96 обладает превосходной амортизацией благодаря промежуточной подошве с технологией Air-Sole. Эта видимая воздушная подушка простирается по всей длине подошвы, обеспечивая максимальную амортизацию и смягчение ударов при ходьбе и беге. Это делает эти кроссовки идеальными для спортивных тренировок или активного образа жизни.','Nike Air More Uptempo \'96 - это классические кроссовки, которые привлекают внимание своим уникальным дизайном и выдающейся амортизацией. Эта модель представляет собой символ стиля и эстетики, привлекая любителей обуви и спорта со всего мира.','Sneakers',99.99,'Nike_Air_More_Uptempo_96.png','2023-10-20 16:08:45.267689'),(394238808810,'Nike Run Swift 2','Верхняя часть кроссовок выполнена из дышащего текстильного материала, который обеспечивает отличную вентиляцию и комфорт во время бега. Сетчатые вставки способствуют еще более эффективному распределению воздуха, помогая ногам оставаться прохладными и сухими даже при интенсивной нагрузке.\r\n\r\nNike Run Swift 2 оснащены амортизирующей промежуточной подошвой из пеноматериала, которая смягчает удары при каждом шаге и обеспечивает комфортную амортизацию. Это помогает снизить риск травм и усталости ног во время бега на различных поверхностях.\r\n\r\nКроссовки Nike Run Swift 2 имеют прочную резиновую подошву с протектором, который обеспечивает отличное сцепление с поверхностью и хорошую износостойкость. Это позволяет вам чувствовать себя уверенно и безопасно на любом типе трассы.','Nike Run Swift 2 - это легкие и функциональные кроссовки, созданные для активных любителей бега. Они сочетают в себе комфорт, поддержку и стильный дизайн, позволяя вам достичь своих беговых целей с максимальным комфортом.','Sneakers',99.99,'Nike_Run_Swift_2.png','2023-10-20 16:08:39.066024'),(486233066360,'Japanesse Hoodie','sdfdsfdsfdsfdsfdsfdsf','sdfsdfdsfdsf','Hoodies',99.99,'Japanesse_Hoodie.png','2023-10-20 16:08:49.405657'),(582210008103,'Nike Air Max 95','Верхняя часть кроссовок выполнена из прочных материалов, включая сетчатую ткань и натуральную кожу, обеспечивая вам оптимальную вентиляцию и долговечность. Их узнаваемый дизайн включает в себя волнистые панели, отражающие атмосферу динамичности и энергии. Логотип Nike на язычке и заднике придают этим кроссовкам фирменный стиль и узнаваемость.\r\n\r\nКроссовки Nike Air Max 95 оснащены воздушной подушкой Max Air, которая расположена в подошве для обеспечения амортизации и поддержки. Эта технология позволяет вам чувствовать себя комфортно и стабильно во время движения, снижая нагрузку на суставы. Комбинированная подошва с рифленым рисунком протектора обеспечивает отличное сцепление с различными поверхностями и повышенную износостойкость. Будь вы на тренировке или в повседневных прогулках, эти кроссовки прекрасно дополнят ваш образ и добавят уверенности.','Nike Air Max 95 - это эмблематические кроссовки, которые привносят в ваш стиль яркость и инновационный дизайн. Сочетая в себе классические линии и современные технологии, эти кроссовки станут неотъемлемой частью вашей коллекции и обеспечат непревзойденный комфорт.\r\n\r\nВерхняя часть кроссовок выполнена из прочных материалов, включая сетчатую ткань и натуральную кожу, обеспечивая вам оптимальную вентиляцию и долговечность. Их узнаваемый дизайн включает в себя волнистые панели, отражающие атмосферу динамичности и энергии. Логотип Nike на язычке и заднике придают этим кроссовкам фирменный стиль и узнаваемость.','Sneakers',99.99,'Nike_Air_Max_95.png','2023-10-20 16:08:30.810269'),(597699061655,'Nike Air Max 97','Верхняя часть кроссовок Nike Air Max 97 выполнена из синтетического материала и текстиля, создавая прочную и дышащую оболочку. Они имеют застежку на шнуровке, которая позволяет регулировать посадку и обеспечивает надежную фиксацию на ноге.\r\n\r\nОдним из основных преимуществ Nike Air Max 97 является видимая амортизация. Кроссовки оснащены промежуточной подошвой с системой воздушных камер Air Max, которые поглощают удары и обеспечивают максимальную амортизацию при ходьбе и беге. Это создает ощущение легкости и комфорта даже во время интенсивных тренировок.','Nike Air Max 97 - это легендарные кроссовки, которые считаются одними из самых узнаваемых и инновационных моделей в истории обуви. Вдохновленные дизайном японских поездов, эти кроссовки обладают уникальным внешним видом и передовыми технологиями, которые делают их идеальным выбором для всех, кто ценит комфорт и стиль. Nike Air Max 97 предлагают непревзойденное сочетание комфорта, функциональности и эстетики.','Sneakers',99.99,'Nike_Air_Max_97.png','2023-10-20 16:08:43.197541'),(684927395075,'Nike Renew Elevate III','Верхняя часть кроссовок Nike Renew Elevate III изготовлена из синтетического материала и текстиля, обеспечивая легкость и дышащие свойства. Они имеют поддерживающую конструкцию в виде перекрещивающихся ремешков и застежку на шнуровке, которые позволяют вам настроить посадку и обеспечить надежную фиксацию на ноге.\r\n\r\nКроссовки Nike Renew Elevate III оснащены амортизирующей промежуточной подошвой с технологией Nike Renew, которая обеспечивает мягкую и отзывчивую амортизацию при каждом шаге. Это позволяет снизить нагрузку на ноги и суставы, предотвращая усталость и повышая комфорт во время длительных тренировок или игр.','Nike Renew Elevate III - это легкие и удобные баскетбольные кроссовки, специально разработанные для игроков, стремящихся к максимальной поддержке, амортизации и отзывчивости на баскетбольном поле. Эти кроссовки сочетают в себе инновационные технологии и стильный дизайн, чтобы помочь вам достичь новых высот в игре.','Sneakers',99.99,'Nike_Renew_Elevate_III.png','2023-10-20 16:08:47.335155'),(700203834923,'Gojo Hoodie','sdfdsfdsfdsfdsfdsfdsf','sdfsdfdsfdsf','Hoodies',99.99,'Gojo_Hoodie.png','2023-10-20 16:08:51.467974'),(709884960065,'Puma Rider','Верхняя часть кроссовок выполнена из легких и дышащих материалов, обеспечивающих комфорт и вентиляцию в течение всего дня. Дизайн Puma Rider включает в себя контрастные цветовые блоки и элегантные линии, подчеркивающие их спортивный характер. Эти кроссовки станут стильным дополнением к вашему гардеробу и привлекательным акцентом любого наряда.\r\n\r\nPuma Rider оснащены прочной подошвой из резины, обеспечивающей отличное сцепление с поверхностью и долговечность. Они также имеют современные технологии амортизации, такие как удобная вставка из пеноматериала и амортизационная подошва, которые обеспечивают амортизацию и поддержку во время движения. Это позволяет вам чувствовать себя комфортно и уверенно на протяжении всего дня.','Puma Rider - это стильные и комфортные кроссовки, которые сочетают в себе эстетику ретро-беговых моделей с современными технологиями. Эти кроссовки являются одновременно иконичными и функциональными, и подойдут как для повседневного ношения, так и для активного образа жизни.','Sneakers',99.99,'Puma_Rider.png','2023-10-20 16:08:28.749206'),(811294634321,'Puma Karmen Shine','Верхняя часть кроссовок выполнена из глянцевой синтетической кожи, создавая элегантный и модный внешний вид. Детали в виде перфорации и контрастных элементов придают этим кроссовкам особый шарм. Логотип Puma на язычке и боковой стороне дополняет общий стиль и подчеркивает принадлежность к популярному бренду.\r\n\r\nPuma Karmen Shine оснащены подошвой из резины, обеспечивающей отличную сцепление с поверхностью и долговечность. Эта подошва также обеспечивает амортизацию и поддержку, чтобы вы могли чувствовать себя комфортно в течение всего дня. Будь вы на прогулке, встрече с друзьями или на особом случае, эти кроссовки станут идеальным дополнением вашего гардероба.','Puma Karmen Shine - это элегантные и стильные кроссовки, которые добавят блеска и изысканности в ваш образ. Сочетание современного дизайна и высококачественных материалов делает их отличным выбором для тех, кто ищет удобство и стиль в одной обуви.\r\n\r\nВерхняя часть кроссовок выполнена из глянцевой синтетической кожи, создавая элегантный и модный внешний вид. Детали в виде перфорации и контрастных элементов придают этим кроссовкам особый шарм. Логотип Puma на язычке и боковой стороне дополняет общий стиль и подчеркивает принадлежность к популярному бренду.','Sneakers',99.99,'Puma_Karmen_Shine.png','2023-10-20 16:08:34.936963'),(913818508974,'HooMeelanz Unisex Hoodie','sdfdsfdsfdsfdsfdsfdsf','sdfsdfdsfdsf','Hoodies',99.99,'HooMeelanz_Unisex_Hoodie.png','2023-10-20 16:08:53.536895'),(972263768435,'Nike Air Huarache','Верхняя часть кроссовок Nike Air Huarache выполнена из качественного синтетического материала и текстиля, обеспечивая легкость, гибкость и вентиляцию. Они обладают уникальной конструкцией, включающей в себя внешний скелет, который обеспечивает отличную поддержку и посадку на ноге. Технология Dynamic Fit позволяет кроссовкам идеально облегать форму стопы, создавая ощущение индивидуальной посадки.\r\n\r\nNike Air Huarache оснащены съемной вставкой из пеноматериала, которая обеспечивает амортизацию и комфорт при каждом шаге. Они также имеют систему вентиляции в виде отверстий и сетчатых панелей, которые позволяют воздуху свободно циркулировать, предотвращая излишнюю потливость и дискомфорт.\r\n\r\nКроссовки Nike Air Huarache имеют прочную резиновую подошву с рифленым протектором, который обеспечивает отличное сцепление с поверхностью и устойчивость на различных типах грунта. Это делает их идеальными для активных тренировок и повседневной носки.','Nike Air Huarache - это икона стиля и инновации в мире спортивной обуви. Эти кроссовки являются символом комфорта и уникального дизайна, предлагая непревзойденное сочетание функциональности и эстетики. Дизайн Nike Air Huarache впечатляет своей смелостью и узнаваемостью. Характерный каркас вокруг задника и логотип Nike на язычке придают этим кроссовкам неповторимый вид.','Sneakers',99.99,'Nike_Air_Huarache.png','2023-10-20 16:08:41.137661'),(997710621327,'Kawaii Anime Girl Harajuku Hoodie','sdfdsfdsfdsfdsfdsfdsf','sdfsdfdsfdsf','Hoodies',99.99,'Kawaii_Anime_Girl_Harajuku_Hoodie.png','2023-10-20 16:08:55.587014');
/*!40000 ALTER TABLE `products_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_customuser`
--

DROP TABLE IF EXISTS `users_customuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_customuser` (
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
  `id` char(32) NOT NULL,
  `profile_picture` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_customuser`
--

LOCK TABLES `users_customuser` WRITE;
/*!40000 ALTER TABLE `users_customuser` DISABLE KEYS */;
INSERT INTO `users_customuser` VALUES ('pbkdf2_sha256$390000$5QugxIBzkHn8Gd3n020DG4$/7Wm5e2UKJlU8XBt+0aybmtDk0ZF6v2hirxl4WsNEag=','2023-10-14 20:23:33.899046',1,'admin','','','',1,1,'2023-10-14 20:23:25.892379','bd77354606d04c52a59186cbc3061fb4','');
/*!40000 ALTER TABLE `users_customuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_customuser_groups`
--

DROP TABLE IF EXISTS `users_customuser_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_customuser_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `customuser_id` char(32) NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_customuser_groups_customuser_id_group_id_76b619e3_uniq` (`customuser_id`,`group_id`),
  KEY `users_customuser_groups_group_id_01390b14_fk_auth_group_id` (`group_id`),
  CONSTRAINT `users_customuser_gro_customuser_id_958147bf_fk_users_cus` FOREIGN KEY (`customuser_id`) REFERENCES `users_customuser` (`id`),
  CONSTRAINT `users_customuser_groups_group_id_01390b14_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_customuser_groups`
--

LOCK TABLES `users_customuser_groups` WRITE;
/*!40000 ALTER TABLE `users_customuser_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_customuser_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_customuser_user_permissions`
--

DROP TABLE IF EXISTS `users_customuser_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_customuser_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `customuser_id` char(32) NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_customuser_user_pe_customuser_id_permission_7a7debf6_uniq` (`customuser_id`,`permission_id`),
  KEY `users_customuser_use_permission_id_baaa2f74_fk_auth_perm` (`permission_id`),
  CONSTRAINT `users_customuser_use_customuser_id_5771478b_fk_users_cus` FOREIGN KEY (`customuser_id`) REFERENCES `users_customuser` (`id`),
  CONSTRAINT `users_customuser_use_permission_id_baaa2f74_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_customuser_user_permissions`
--

LOCK TABLES `users_customuser_user_permissions` WRITE;
/*!40000 ALTER TABLE `users_customuser_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_customuser_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-20 20:34:42
