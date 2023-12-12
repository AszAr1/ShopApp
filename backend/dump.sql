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
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add user',1,'add_customuser'),(2,'Can change user',1,'change_customuser'),(3,'Can delete user',1,'delete_customuser'),(4,'Can view user',1,'view_customuser'),(5,'Can add order',2,'add_order'),(6,'Can change order',2,'change_order'),(7,'Can delete order',2,'delete_order'),(8,'Can view order',2,'view_order'),(9,'Can add product',3,'add_product'),(10,'Can change product',3,'change_product'),(11,'Can delete product',3,'delete_product'),(12,'Can view product',3,'view_product'),(13,'Can add order item',4,'add_orderitem'),(14,'Can change order item',4,'change_orderitem'),(15,'Can delete order item',4,'delete_orderitem'),(16,'Can view order item',4,'view_orderitem'),(17,'Can add favorite',5,'add_favorite'),(18,'Can change favorite',5,'change_favorite'),(19,'Can delete favorite',5,'delete_favorite'),(20,'Can view favorite',5,'view_favorite'),(21,'Can add cart item',6,'add_cartitem'),(22,'Can change cart item',6,'change_cartitem'),(23,'Can delete cart item',6,'delete_cartitem'),(24,'Can view cart item',6,'view_cartitem'),(25,'Can add Token',7,'add_token'),(26,'Can change Token',7,'change_token'),(27,'Can delete Token',7,'delete_token'),(28,'Can view Token',7,'view_token'),(29,'Can add token',8,'add_tokenproxy'),(30,'Can change token',8,'change_tokenproxy'),(31,'Can delete token',8,'delete_tokenproxy'),(32,'Can view token',8,'view_tokenproxy'),(33,'Can add log entry',9,'add_logentry'),(34,'Can change log entry',9,'change_logentry'),(35,'Can delete log entry',9,'delete_logentry'),(36,'Can view log entry',9,'view_logentry'),(37,'Can add permission',10,'add_permission'),(38,'Can change permission',10,'change_permission'),(39,'Can delete permission',10,'delete_permission'),(40,'Can view permission',10,'view_permission'),(41,'Can add group',11,'add_group'),(42,'Can change group',11,'change_group'),(43,'Can delete group',11,'delete_group'),(44,'Can view group',11,'view_group'),(45,'Can add content type',12,'add_contenttype'),(46,'Can change content type',12,'change_contenttype'),(47,'Can delete content type',12,'delete_contenttype'),(48,'Can view content type',12,'view_contenttype'),(49,'Can add session',13,'add_session'),(50,'Can change session',13,'change_session'),(51,'Can delete session',13,'delete_session'),(52,'Can view session',13,'view_session'),(53,'Can add blacklisted token',14,'add_blacklistedtoken'),(54,'Can change blacklisted token',14,'change_blacklistedtoken'),(55,'Can delete blacklisted token',14,'delete_blacklistedtoken'),(56,'Can view blacklisted token',14,'view_blacklistedtoken'),(57,'Can add outstanding token',15,'add_outstandingtoken'),(58,'Can change outstanding token',15,'change_outstandingtoken'),(59,'Can delete outstanding token',15,'delete_outstandingtoken'),(60,'Can view outstanding token',15,'view_outstandingtoken');
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
INSERT INTO `authtoken_token` VALUES ('1507ad957e07ea0f5039b3238ea2b74419775432','2023-11-01 10:08:50.752733','91efcc9aee614034924b04c70ac0f3d6'),('4bdd0ca06bedd77d93001bc9de1c94c6efe2bb52','2023-10-21 07:55:31.411645','bd77354606d04c52a59186cbc3061fb4'),('67f3c040ec8f54b955285f8df12b77713402e6eb','2023-10-21 08:07:23.753978','cc9a724228344917a9efe4433d5154c2'),('cc5ee508272d2b7bec1c4035b355f37e6878fcee','2023-10-25 16:44:19.087001','1a36bf0bf49143c8859e28f966dad70f');
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
) ENGINE=InnoDB AUTO_INCREMENT=385 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2023-10-14 20:24:24.341483','923476325699','Product object (923476325699)',2,'[{\"changed\": {\"fields\": [\"Description\", \"Image\"]}}]',3,'bd77354606d04c52a59186cbc3061fb4'),(2,'2023-10-14 20:25:07.993655','923476325699','Product object (923476325699)',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',3,'bd77354606d04c52a59186cbc3061fb4'),(3,'2023-10-14 20:25:20.579184','923476325699','Product object (923476325699)',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',3,'bd77354606d04c52a59186cbc3061fb4'),(4,'2023-10-14 20:30:58.105521','923476325699','Product object (923476325699)',3,'',3,'bd77354606d04c52a59186cbc3061fb4'),(5,'2023-10-14 20:31:28.439459','895371574125','Product object (895371574125)',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',3,'bd77354606d04c52a59186cbc3061fb4'),(6,'2023-10-14 20:38:15.225141','895371574125','Product object (895371574125)',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',3,'bd77354606d04c52a59186cbc3061fb4'),(7,'2023-10-14 20:38:19.090462','889221886234','Product object (889221886234)',2,'[{\"changed\": {\"fields\": [\"Description\"]}}]',3,'bd77354606d04c52a59186cbc3061fb4'),(8,'2023-10-14 20:38:22.088109','895371574125','Product object (895371574125)',2,'[]',3,'bd77354606d04c52a59186cbc3061fb4'),(9,'2023-10-14 20:44:59.703423','660031690164','Product object (660031690164)',2,'[{\"changed\": {\"fields\": [\"Description\"]}}]',3,'bd77354606d04c52a59186cbc3061fb4'),(10,'2023-10-14 20:45:21.886363','895371574125','Product object (895371574125)',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',3,'bd77354606d04c52a59186cbc3061fb4'),(11,'2023-10-14 20:45:52.390485','889221886234','Product object (889221886234)',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',3,'bd77354606d04c52a59186cbc3061fb4'),(12,'2023-10-14 20:46:03.748443','660031690164','Product object (660031690164)',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',3,'bd77354606d04c52a59186cbc3061fb4'),(13,'2023-10-14 20:46:13.260141','601248815524','Product object (601248815524)',2,'[{\"changed\": {\"fields\": [\"Description\", \"Image\"]}}]',3,'bd77354606d04c52a59186cbc3061fb4'),(14,'2023-10-14 20:46:29.255353','599390561004','Product object (599390561004)',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',3,'bd77354606d04c52a59186cbc3061fb4'),(15,'2023-10-14 20:46:38.403519','587142051425','Product object (587142051425)',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',3,'bd77354606d04c52a59186cbc3061fb4'),(16,'2023-10-14 20:46:45.059996','540894043802','Product object (540894043802)',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',3,'bd77354606d04c52a59186cbc3061fb4'),(17,'2023-10-14 20:46:57.027140','525448940914','Product object (525448940914)',2,'[{\"changed\": {\"fields\": [\"Description\", \"Image\"]}}]',3,'bd77354606d04c52a59186cbc3061fb4'),(18,'2023-10-14 20:47:11.898078','407935532476','Product object (407935532476)',2,'[{\"changed\": {\"fields\": [\"Description\", \"Image\"]}}]',3,'bd77354606d04c52a59186cbc3061fb4'),(19,'2023-10-14 20:47:22.227190','338881331567','Product object (338881331567)',2,'[{\"changed\": {\"fields\": [\"Description\", \"Content\", \"Image\"]}}]',3,'bd77354606d04c52a59186cbc3061fb4'),(20,'2023-10-14 20:47:36.648395','330892391382','Product object (330892391382)',2,'[{\"changed\": {\"fields\": [\"Description\", \"Content\", \"Image\"]}}]',3,'bd77354606d04c52a59186cbc3061fb4'),(21,'2023-10-14 20:47:38.877188','330892391382','Product object (330892391382)',2,'[]',3,'bd77354606d04c52a59186cbc3061fb4'),(22,'2023-10-14 20:47:48.813578','328049462781','Product object (328049462781)',2,'[{\"changed\": {\"fields\": [\"Description\", \"Image\"]}}]',3,'bd77354606d04c52a59186cbc3061fb4'),(23,'2023-10-14 20:47:57.369539','281282086525','Product object (281282086525)',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',3,'bd77354606d04c52a59186cbc3061fb4'),(24,'2023-10-14 20:48:06.186458','269695372271','Product object (269695372271)',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',3,'bd77354606d04c52a59186cbc3061fb4'),(25,'2023-10-14 20:48:16.858108','231193606723','Product object (231193606723)',2,'[{\"changed\": {\"fields\": [\"Description\", \"Image\"]}}]',3,'bd77354606d04c52a59186cbc3061fb4'),(26,'2023-10-14 20:48:24.121652','181468862549','Product object (181468862549)',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',3,'bd77354606d04c52a59186cbc3061fb4'),(27,'2023-10-14 21:04:36.161002','1','StaffGroup',1,'[{\"added\": {}}]',11,'bd77354606d04c52a59186cbc3061fb4'),(28,'2023-10-16 18:47:45.030801','1','Product object (1)',1,'[{\"added\": {}}]',3,'bd77354606d04c52a59186cbc3061fb4'),(29,'2023-10-18 12:51:09.729653','181468862549','Product object (181468862549)',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',3,'bd77354606d04c52a59186cbc3061fb4'),(30,'2023-10-18 12:55:43.325357','181468862549','Product object (181468862549)',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',3,'bd77354606d04c52a59186cbc3061fb4'),(31,'2023-10-20 15:58:21.815175','895371574125','Product object (895371574125)',3,'',3,'bd77354606d04c52a59186cbc3061fb4'),(32,'2023-10-20 15:58:21.843716','889221886234','Product object (889221886234)',3,'',3,'bd77354606d04c52a59186cbc3061fb4'),(33,'2023-10-20 15:58:21.849035','660031690164','Product object (660031690164)',3,'',3,'bd77354606d04c52a59186cbc3061fb4'),(34,'2023-10-20 15:58:21.854124','601248815524','Product object (601248815524)',3,'',3,'bd77354606d04c52a59186cbc3061fb4'),(35,'2023-10-20 15:58:21.859796','599390561004','Product object (599390561004)',3,'',3,'bd77354606d04c52a59186cbc3061fb4'),(36,'2023-10-20 15:58:21.863779','587142051425','Product object (587142051425)',3,'',3,'bd77354606d04c52a59186cbc3061fb4'),(37,'2023-10-20 15:58:21.868954','540894043802','Product object (540894043802)',3,'',3,'bd77354606d04c52a59186cbc3061fb4'),(38,'2023-10-20 15:58:21.873680','525448940914','Product object (525448940914)',3,'',3,'bd77354606d04c52a59186cbc3061fb4'),(39,'2023-10-20 15:58:21.877378','407935532476','Product object (407935532476)',3,'',3,'bd77354606d04c52a59186cbc3061fb4'),(40,'2023-10-20 15:58:21.880891','338881331567','Product object (338881331567)',3,'',3,'bd77354606d04c52a59186cbc3061fb4'),(41,'2023-10-20 15:58:21.885948','330892391382','Product object (330892391382)',3,'',3,'bd77354606d04c52a59186cbc3061fb4'),(42,'2023-10-20 15:58:21.889952','328049462781','Product object (328049462781)',3,'',3,'bd77354606d04c52a59186cbc3061fb4'),(43,'2023-10-20 15:58:21.893852','281282086525','Product object (281282086525)',3,'',3,'bd77354606d04c52a59186cbc3061fb4'),(44,'2023-10-20 15:58:21.897430','269695372271','Product object (269695372271)',3,'',3,'bd77354606d04c52a59186cbc3061fb4'),(45,'2023-10-20 15:58:21.901950','231193606723','Product object (231193606723)',3,'',3,'bd77354606d04c52a59186cbc3061fb4'),(46,'2023-10-20 15:58:21.905982','181468862549','Product object (181468862549)',3,'',3,'bd77354606d04c52a59186cbc3061fb4'),(47,'2023-10-20 16:00:26.417124','999828272852','Product object (999828272852)',2,'[{\"changed\": {\"fields\": [\"Description\", \"Image\"]}}]',3,'bd77354606d04c52a59186cbc3061fb4'),(48,'2023-10-20 16:00:34.509321','959453459383','Product object (959453459383)',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',3,'bd77354606d04c52a59186cbc3061fb4'),(49,'2023-10-20 16:00:40.217085','916797374473','Product object (916797374473)',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',3,'bd77354606d04c52a59186cbc3061fb4'),(50,'2023-10-20 16:00:49.001926','803999893579','Product object (803999893579)',2,'[{\"changed\": {\"fields\": [\"Description\", \"Image\"]}}]',3,'bd77354606d04c52a59186cbc3061fb4'),(51,'2023-10-20 16:00:56.486240','715550461997','Product object (715550461997)',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',3,'bd77354606d04c52a59186cbc3061fb4'),(52,'2023-10-20 16:01:04.513493','694574221604','Product object (694574221604)',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',3,'bd77354606d04c52a59186cbc3061fb4'),(53,'2023-10-20 16:01:11.881867','689750362357','Product object (689750362357)',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',3,'bd77354606d04c52a59186cbc3061fb4'),(54,'2023-10-20 16:01:20.920800','675800672750','Product object (675800672750)',2,'[{\"changed\": {\"fields\": [\"Description\", \"Image\"]}}]',3,'bd77354606d04c52a59186cbc3061fb4'),(55,'2023-10-20 16:01:30.824313','612598236672','Product object (612598236672)',2,'[{\"changed\": {\"fields\": [\"Description\", \"Image\"]}}]',3,'bd77354606d04c52a59186cbc3061fb4'),(56,'2023-10-20 16:01:39.631993','569307752873','Product object (569307752873)',2,'[{\"changed\": {\"fields\": [\"Description\", \"Image\"]}}]',3,'bd77354606d04c52a59186cbc3061fb4'),(57,'2023-10-20 16:04:32.717032','532698550148','Product object (532698550148)',2,'[{\"changed\": {\"fields\": [\"Description\", \"Image\"]}}]',3,'bd77354606d04c52a59186cbc3061fb4'),(58,'2023-10-20 16:04:39.952697','481665863412','Product object (481665863412)',2,'[{\"changed\": {\"fields\": [\"Description\", \"Image\"]}}]',3,'bd77354606d04c52a59186cbc3061fb4'),(59,'2023-10-20 16:04:46.397776','475080091402','Product object (475080091402)',2,'[{\"changed\": {\"fields\": [\"Description\", \"Image\"]}}]',3,'bd77354606d04c52a59186cbc3061fb4'),(60,'2023-10-20 16:04:54.839328','471706874003','Product object (471706874003)',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',3,'bd77354606d04c52a59186cbc3061fb4'),(61,'2023-10-20 16:05:04.766906','328124170781','Product object (328124170781)',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',3,'bd77354606d04c52a59186cbc3061fb4'),(62,'2023-10-20 16:05:12.204217','322127434109','Product object (322127434109)',2,'[{\"changed\": {\"fields\": [\"Description\", \"Content\", \"Image\"]}}]',3,'bd77354606d04c52a59186cbc3061fb4'),(63,'2023-10-20 16:05:20.803373','105797347223','Product object (105797347223)',2,'[{\"changed\": {\"fields\": [\"Description\", \"Content\", \"Image\"]}}]',3,'bd77354606d04c52a59186cbc3061fb4'),(64,'2023-10-20 16:08:13.567967','999828272852','Product object (999828272852)',3,'',3,'bd77354606d04c52a59186cbc3061fb4'),(65,'2023-10-20 16:08:13.573254','959453459383','Product object (959453459383)',3,'',3,'bd77354606d04c52a59186cbc3061fb4'),(66,'2023-10-20 16:08:13.577929','916797374473','Product object (916797374473)',3,'',3,'bd77354606d04c52a59186cbc3061fb4'),(67,'2023-10-20 16:08:13.582039','803999893579','Product object (803999893579)',3,'',3,'bd77354606d04c52a59186cbc3061fb4'),(68,'2023-10-20 16:08:13.585945','715550461997','Product object (715550461997)',3,'',3,'bd77354606d04c52a59186cbc3061fb4'),(69,'2023-10-20 16:08:13.590998','694574221604','Product object (694574221604)',3,'',3,'bd77354606d04c52a59186cbc3061fb4'),(70,'2023-10-20 16:08:13.595194','689750362357','Product object (689750362357)',3,'',3,'bd77354606d04c52a59186cbc3061fb4'),(71,'2023-10-20 16:08:13.599381','675800672750','Product object (675800672750)',3,'',3,'bd77354606d04c52a59186cbc3061fb4'),(72,'2023-10-20 16:08:13.603586','612598236672','Product object (612598236672)',3,'',3,'bd77354606d04c52a59186cbc3061fb4'),(73,'2023-10-20 16:08:13.607988','569307752873','Product object (569307752873)',3,'',3,'bd77354606d04c52a59186cbc3061fb4'),(74,'2023-10-20 16:08:13.612113','532698550148','Product object (532698550148)',3,'',3,'bd77354606d04c52a59186cbc3061fb4'),(75,'2023-10-20 16:08:13.616154','481665863412','Product object (481665863412)',3,'',3,'bd77354606d04c52a59186cbc3061fb4'),(76,'2023-10-20 16:08:13.621369','475080091402','Product object (475080091402)',3,'',3,'bd77354606d04c52a59186cbc3061fb4'),(77,'2023-10-20 16:08:13.627173','471706874003','Product object (471706874003)',3,'',3,'bd77354606d04c52a59186cbc3061fb4'),(78,'2023-10-20 16:08:13.630857','328124170781','Product object (328124170781)',3,'',3,'bd77354606d04c52a59186cbc3061fb4'),(79,'2023-10-20 16:08:13.634841','322127434109','Product object (322127434109)',3,'',3,'bd77354606d04c52a59186cbc3061fb4'),(80,'2023-10-20 16:08:13.640245','105797347223','Product object (105797347223)',3,'',3,'bd77354606d04c52a59186cbc3061fb4'),(81,'2023-10-20 16:11:51.918697','997710621327','Product object (997710621327)',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',3,'bd77354606d04c52a59186cbc3061fb4'),(82,'2023-10-20 16:13:04.315742','972263768435','Product object (972263768435)',2,'[{\"changed\": {\"fields\": [\"Description\", \"Image\"]}}]',3,'bd77354606d04c52a59186cbc3061fb4'),(83,'2023-10-20 16:13:11.105981','913818508974','Product object (913818508974)',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',3,'bd77354606d04c52a59186cbc3061fb4'),(84,'2023-10-20 16:13:18.358990','811294634321','Product object (811294634321)',2,'[{\"changed\": {\"fields\": [\"Description\", \"Content\", \"Image\"]}}]',3,'bd77354606d04c52a59186cbc3061fb4'),(85,'2023-10-20 16:13:26.125194','709884960065','Product object (709884960065)',2,'[{\"changed\": {\"fields\": [\"Description\", \"Image\"]}}]',3,'bd77354606d04c52a59186cbc3061fb4'),(86,'2023-10-20 16:13:35.109176','700203834923','Product object (700203834923)',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',3,'bd77354606d04c52a59186cbc3061fb4'),(87,'2023-10-20 16:13:50.625324','684927395075','Product object (684927395075)',2,'[{\"changed\": {\"fields\": [\"Description\", \"Image\"]}}]',3,'bd77354606d04c52a59186cbc3061fb4'),(88,'2023-10-20 16:14:04.712655','597699061655','Product object (597699061655)',2,'[{\"changed\": {\"fields\": [\"Description\"]}}]',3,'bd77354606d04c52a59186cbc3061fb4'),(89,'2023-10-20 16:14:11.067728','597699061655','Product object (597699061655)',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',3,'bd77354606d04c52a59186cbc3061fb4'),(90,'2023-10-20 16:14:18.067844','582210008103','Product object (582210008103)',2,'[{\"changed\": {\"fields\": [\"Description\", \"Content\", \"Image\"]}}]',3,'bd77354606d04c52a59186cbc3061fb4'),(91,'2023-10-20 16:14:25.793978','486233066360','Product object (486233066360)',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',3,'bd77354606d04c52a59186cbc3061fb4'),(92,'2023-10-20 16:14:38.285550','394238808810','Product object (394238808810)',2,'[{\"changed\": {\"fields\": [\"Description\", \"Image\"]}}]',3,'bd77354606d04c52a59186cbc3061fb4'),(93,'2023-10-20 16:14:47.667129','339741161564','Product object (339741161564)',2,'[{\"changed\": {\"fields\": [\"Description\", \"Image\"]}}]',3,'bd77354606d04c52a59186cbc3061fb4'),(94,'2023-10-20 16:14:54.548664','249088026957','Product object (249088026957)',2,'[{\"changed\": {\"fields\": [\"Description\", \"Image\"]}}]',3,'bd77354606d04c52a59186cbc3061fb4'),(95,'2023-10-20 16:15:00.527023','237713749889','Product object (237713749889)',2,'[{\"changed\": {\"fields\": [\"Description\", \"Image\"]}}]',3,'bd77354606d04c52a59186cbc3061fb4'),(96,'2023-10-20 16:15:10.731771','155242430672','Product object (155242430672)',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',3,'bd77354606d04c52a59186cbc3061fb4'),(97,'2023-10-20 16:15:16.407813','147085468981','Product object (147085468981)',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',3,'bd77354606d04c52a59186cbc3061fb4'),(98,'2023-10-20 16:15:26.820879','145323452557','Product object (145323452557)',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',3,'bd77354606d04c52a59186cbc3061fb4'),(99,'2023-10-21 08:08:37.271838','650e89e5-fea1-46b0-a720-a509ce42b01f','staff',1,'[{\"added\": {}}]',1,'bd77354606d04c52a59186cbc3061fb4'),(100,'2023-10-21 08:20:25.115205','650e89e5-fea1-46b0-a720-a509ce42b01f','staff',3,'',1,'bd77354606d04c52a59186cbc3061fb4'),(101,'2023-10-21 08:21:02.216562','1a36bf0b-f491-43c8-859e-28f966dad70f','staff',1,'[{\"added\": {}}]',1,'bd77354606d04c52a59186cbc3061fb4'),(102,'2023-10-21 08:21:26.151801','1a36bf0b-f491-43c8-859e-28f966dad70f','staff',2,'[{\"changed\": {\"fields\": [\"Staff status\", \"Groups\"]}}]',1,'bd77354606d04c52a59186cbc3061fb4'),(103,'2023-10-21 09:44:59.875393','211378a7-6d37-4d6c-b74f-ce1aefe84104','new_user',3,'',1,'bd77354606d04c52a59186cbc3061fb4'),(104,'2023-10-23 12:50:04.006580','643999871733','None - Nike Run Swift 2',3,'',5,'bd77354606d04c52a59186cbc3061fb4'),(105,'2023-10-23 12:50:04.066212','618461413990','None - Nike Air Force',3,'',5,'bd77354606d04c52a59186cbc3061fb4'),(106,'2023-10-23 12:50:04.072191','543626765203','None - Gojo Hoodie',3,'',5,'bd77354606d04c52a59186cbc3061fb4'),(107,'2023-10-23 12:50:04.077531','169567110515','None - Japanesse Hoodie',3,'',5,'bd77354606d04c52a59186cbc3061fb4'),(108,'2023-10-23 12:50:04.084559','163399980031','None - Nike Air Force',3,'',5,'bd77354606d04c52a59186cbc3061fb4'),(109,'2023-10-23 12:57:53.425707','848362298544','None - Nike Air More Uptempo \'96',3,'',5,'bd77354606d04c52a59186cbc3061fb4'),(110,'2023-10-23 12:57:53.432708','611333800495','None - Puma Karmen Shine',3,'',5,'bd77354606d04c52a59186cbc3061fb4'),(111,'2023-10-23 12:57:53.446409','350622456259','None - Nike Air Max 97',3,'',5,'bd77354606d04c52a59186cbc3061fb4'),(112,'2023-10-23 12:57:53.451957','270781665953','None - Nike Air More Uptempo \'96',3,'',5,'bd77354606d04c52a59186cbc3061fb4'),(113,'2023-10-23 13:16:27.402474','933882154435','admin - HooMeelanz Unisex Hoodie',3,'',5,'bd77354606d04c52a59186cbc3061fb4'),(114,'2023-10-23 13:16:27.411142','928854523416','None - HooMeelanz Unisex Hoodie',3,'',5,'bd77354606d04c52a59186cbc3061fb4'),(115,'2023-10-23 13:16:27.417043','805191589977','None - Japanesse Hoodie',3,'',5,'bd77354606d04c52a59186cbc3061fb4'),(116,'2023-10-23 13:16:27.422564','799070671976','None - Puma Rider',3,'',5,'bd77354606d04c52a59186cbc3061fb4'),(117,'2023-10-23 13:16:27.428700','592738353263','None - Puma Rider',3,'',5,'bd77354606d04c52a59186cbc3061fb4'),(118,'2023-10-23 13:16:27.436407','570824478895','None - Japanesse Hoodie',3,'',5,'bd77354606d04c52a59186cbc3061fb4'),(119,'2023-10-23 13:16:27.442407','261659590556','None - Nike Renew Elevate III',3,'',5,'bd77354606d04c52a59186cbc3061fb4'),(120,'2023-10-23 16:36:55.053153','968688200503','None - 968688200503',3,'',2,'bd77354606d04c52a59186cbc3061fb4'),(121,'2023-10-23 16:36:55.060757','261283656301','None - 261283656301',3,'',2,'bd77354606d04c52a59186cbc3061fb4'),(122,'2023-10-23 16:38:20.965702','535194788171','admin - 535194788171',3,'',2,'bd77354606d04c52a59186cbc3061fb4'),(123,'2023-10-23 16:39:04.581381','844246990631','None - 844246990631',3,'',2,'bd77354606d04c52a59186cbc3061fb4'),(124,'2023-10-23 16:39:04.585573','579265481475','None - 579265481475',3,'',2,'bd77354606d04c52a59186cbc3061fb4'),(125,'2023-10-23 16:39:04.590116','163146952707','admin - 163146952707',3,'',2,'bd77354606d04c52a59186cbc3061fb4'),(126,'2023-10-23 16:39:51.510486','979212044684','admin - 979212044684',3,'',2,'bd77354606d04c52a59186cbc3061fb4'),(127,'2023-10-23 16:39:51.515122','576429664586','None - 576429664586',3,'',2,'bd77354606d04c52a59186cbc3061fb4'),(128,'2023-10-23 16:39:51.518903','183462489080','None - 183462489080',3,'',2,'bd77354606d04c52a59186cbc3061fb4'),(129,'2023-10-23 16:40:45.960380','600401145490','None - 600401145490',3,'',2,'bd77354606d04c52a59186cbc3061fb4'),(130,'2023-10-23 16:40:45.965126','485466003450','admin - 485466003450',3,'',2,'bd77354606d04c52a59186cbc3061fb4'),(131,'2023-10-23 16:40:45.969656','381125900783','None - 381125900783',3,'',2,'bd77354606d04c52a59186cbc3061fb4'),(132,'2023-10-23 16:43:53.087130','974489667724','admin - 974489667724',3,'',2,'bd77354606d04c52a59186cbc3061fb4'),(133,'2023-10-23 16:43:53.093813','962222162465','None - 962222162465',3,'',2,'bd77354606d04c52a59186cbc3061fb4'),(134,'2023-10-23 16:43:53.098175','142474209596','None - 142474209596',3,'',2,'bd77354606d04c52a59186cbc3061fb4'),(135,'2023-10-23 16:44:13.422162','636156944808','None - 636156944808',3,'',2,'bd77354606d04c52a59186cbc3061fb4'),(136,'2023-10-23 16:44:13.427958','572709948590','admin - 572709948590',3,'',2,'bd77354606d04c52a59186cbc3061fb4'),(137,'2023-10-23 16:44:13.432072','410488573289','None - 410488573289',3,'',2,'bd77354606d04c52a59186cbc3061fb4'),(138,'2023-10-23 16:50:01.924926','926873894805','None - 926873894805',3,'',2,'bd77354606d04c52a59186cbc3061fb4'),(139,'2023-10-23 16:50:01.930115','706798678127','admin - 706798678127',3,'',2,'bd77354606d04c52a59186cbc3061fb4'),(140,'2023-10-23 16:50:01.934160','292333101007','None - 292333101007',3,'',2,'bd77354606d04c52a59186cbc3061fb4'),(141,'2023-10-23 16:50:01.938538','114130960136','admin - 114130960136',3,'',2,'bd77354606d04c52a59186cbc3061fb4'),(142,'2023-10-23 16:55:30.729646','944797290744','None - 944797290744',3,'',2,'bd77354606d04c52a59186cbc3061fb4'),(143,'2023-10-23 16:55:30.736220','678709534754','None - 678709534754',3,'',2,'bd77354606d04c52a59186cbc3061fb4'),(144,'2023-10-23 16:55:30.740935','248979726578','admin - 248979726578',3,'',2,'bd77354606d04c52a59186cbc3061fb4'),(145,'2023-10-23 16:59:46.292054','847160308245','None - 847160308245',3,'',2,'bd77354606d04c52a59186cbc3061fb4'),(146,'2023-10-23 16:59:46.299263','674108063224','admin - 674108063224',3,'',2,'bd77354606d04c52a59186cbc3061fb4'),(147,'2023-10-23 16:59:46.303281','144749489182','None - 144749489182',3,'',2,'bd77354606d04c52a59186cbc3061fb4'),(148,'2023-10-23 17:03:06.946857','549960077367','None - 549960077367',3,'',2,'bd77354606d04c52a59186cbc3061fb4'),(149,'2023-10-23 17:03:06.953313','483578250016','None - 483578250016',3,'',2,'bd77354606d04c52a59186cbc3061fb4'),(150,'2023-10-23 17:03:06.957825','249075151604','admin - 249075151604',3,'',2,'bd77354606d04c52a59186cbc3061fb4'),(151,'2023-10-23 17:06:01.397038','846061413873','None - 846061413873',3,'',2,'bd77354606d04c52a59186cbc3061fb4'),(152,'2023-10-23 17:06:01.401036','796602410183','None - 796602410183',3,'',2,'bd77354606d04c52a59186cbc3061fb4'),(153,'2023-10-23 17:06:01.405657','132013270113','admin - 132013270113',3,'',2,'bd77354606d04c52a59186cbc3061fb4'),(154,'2023-10-23 17:07:33.431094','900323810077','None - 900323810077',3,'',2,'bd77354606d04c52a59186cbc3061fb4'),(155,'2023-10-23 17:07:33.437238','843652389603','None - 843652389603',3,'',2,'bd77354606d04c52a59186cbc3061fb4'),(156,'2023-10-23 17:07:33.441806','217317198205','admin - 217317198205',3,'',2,'bd77354606d04c52a59186cbc3061fb4'),(157,'2023-10-23 17:08:06.183766','618245671740','None - 618245671740',3,'',2,'bd77354606d04c52a59186cbc3061fb4'),(158,'2023-10-23 17:08:06.189100','460088049248','None - 460088049248',3,'',2,'bd77354606d04c52a59186cbc3061fb4'),(159,'2023-10-23 17:08:06.193134','119693564270','admin - 119693564270',3,'',2,'bd77354606d04c52a59186cbc3061fb4'),(160,'2023-10-23 17:10:34.802616','616195088859','None - 616195088859',3,'',2,'bd77354606d04c52a59186cbc3061fb4'),(161,'2023-10-23 17:10:34.807914','381317391963','None - 381317391963',3,'',2,'bd77354606d04c52a59186cbc3061fb4'),(162,'2023-10-23 17:10:34.811928','251420027623','admin - 251420027623',3,'',2,'bd77354606d04c52a59186cbc3061fb4'),(163,'2023-10-23 17:13:49.754965','858045301119','None - 858045301119',3,'',2,'bd77354606d04c52a59186cbc3061fb4'),(164,'2023-10-23 17:13:49.760530','555866232653','None - 555866232653',3,'',2,'bd77354606d04c52a59186cbc3061fb4'),(165,'2023-10-23 17:13:49.764537','301105862077','admin - 301105862077',3,'',2,'bd77354606d04c52a59186cbc3061fb4'),(166,'2023-10-23 17:16:59.885515','604824870798','None - 604824870798',3,'',2,'bd77354606d04c52a59186cbc3061fb4'),(167,'2023-10-23 17:16:59.891270','555545682916','None - 555545682916',3,'',2,'bd77354606d04c52a59186cbc3061fb4'),(168,'2023-10-23 17:16:59.895322','426205947021','None - 426205947021',3,'',2,'bd77354606d04c52a59186cbc3061fb4'),(169,'2023-10-23 17:16:59.898581','408233289961','admin - 408233289961',3,'',2,'bd77354606d04c52a59186cbc3061fb4'),(170,'2023-10-23 17:16:59.901643','369830205038','admin - 369830205038',3,'',2,'bd77354606d04c52a59186cbc3061fb4'),(171,'2023-10-23 17:16:59.905599','131361866569','None - 131361866569',3,'',2,'bd77354606d04c52a59186cbc3061fb4'),(172,'2023-10-23 17:21:48.756719','961716093865','admin - 961716093865',3,'',2,'bd77354606d04c52a59186cbc3061fb4'),(173,'2023-10-23 17:21:48.762323','579267061754','None - 579267061754',3,'',2,'bd77354606d04c52a59186cbc3061fb4'),(174,'2023-10-23 17:21:48.766295','465074789965','None - 465074789965',3,'',2,'bd77354606d04c52a59186cbc3061fb4'),(175,'2023-10-23 17:21:48.770808','464502171239','None - 464502171239',3,'',2,'bd77354606d04c52a59186cbc3061fb4'),(176,'2023-10-23 17:21:48.773808','328443630822','admin - 328443630822',3,'',2,'bd77354606d04c52a59186cbc3061fb4'),(177,'2023-10-23 17:21:48.777758','126303986377','None - 126303986377',3,'',2,'bd77354606d04c52a59186cbc3061fb4'),(178,'2023-10-23 17:22:44.655360','562376051280','None - 562376051280',3,'',2,'bd77354606d04c52a59186cbc3061fb4'),(179,'2023-10-23 17:22:44.661604','353030895373','None - 353030895373',3,'',2,'bd77354606d04c52a59186cbc3061fb4'),(180,'2023-10-23 17:22:44.666611','100575233271','admin - 100575233271',3,'',2,'bd77354606d04c52a59186cbc3061fb4'),(181,'2023-10-23 17:25:01.623722','952170131994','None - 952170131994',3,'',2,'bd77354606d04c52a59186cbc3061fb4'),(182,'2023-10-23 17:25:01.630854','826975313155','admin - 826975313155',3,'',2,'bd77354606d04c52a59186cbc3061fb4'),(183,'2023-10-23 17:25:01.639055','323548768304','None - 323548768304',3,'',2,'bd77354606d04c52a59186cbc3061fb4'),(184,'2023-10-23 17:25:33.941834','977882923272','admin - 977882923272',3,'',2,'bd77354606d04c52a59186cbc3061fb4'),(185,'2023-10-23 17:25:33.945554','944079842252','None - 944079842252',3,'',2,'bd77354606d04c52a59186cbc3061fb4'),(186,'2023-10-23 17:25:33.949529','104933688260','None - 104933688260',3,'',2,'bd77354606d04c52a59186cbc3061fb4'),(187,'2023-10-23 17:30:48.697454','705947705293','admin - Nike Dunk Low Retro',3,'',6,'bd77354606d04c52a59186cbc3061fb4'),(188,'2023-10-23 17:32:28.609885','962392321147','None - 962392321147',3,'',2,'bd77354606d04c52a59186cbc3061fb4'),(189,'2023-10-23 17:32:28.615882','823546220862','None - 823546220862',3,'',2,'bd77354606d04c52a59186cbc3061fb4'),(190,'2023-10-23 17:33:30.922383','884289657692','None - 884289657692',3,'',2,'bd77354606d04c52a59186cbc3061fb4'),(191,'2023-10-23 17:33:30.927936','768039258466','None - 768039258466',3,'',2,'bd77354606d04c52a59186cbc3061fb4'),(192,'2023-10-23 17:33:30.931954','338246893139','None - 338246893139',3,'',2,'bd77354606d04c52a59186cbc3061fb4'),(193,'2023-10-23 17:33:30.934974','173311776035','None - 173311776035',3,'',2,'bd77354606d04c52a59186cbc3061fb4'),(194,'2023-10-23 17:33:30.938568','103905789761','admin - 103905789761',3,'',2,'bd77354606d04c52a59186cbc3061fb4'),(195,'2023-10-23 17:33:30.942674','100759574807','None - 100759574807',3,'',2,'bd77354606d04c52a59186cbc3061fb4'),(196,'2023-10-23 17:34:42.152985','908701684550','admin - 908701684550',3,'',2,'bd77354606d04c52a59186cbc3061fb4'),(197,'2023-10-23 17:34:42.158730','836745212426','admin - 836745212426',3,'',2,'bd77354606d04c52a59186cbc3061fb4'),(198,'2023-10-23 17:34:42.162866','711052259914','admin - 711052259914',3,'',2,'bd77354606d04c52a59186cbc3061fb4'),(199,'2023-10-23 18:40:37.809506','827148921878','admin - 827148921878',3,'',2,'bd77354606d04c52a59186cbc3061fb4'),(200,'2023-10-23 18:40:37.814469','692215880285','None - 692215880285',3,'',2,'bd77354606d04c52a59186cbc3061fb4'),(201,'2023-10-23 18:40:37.818630','355658310608','None - 355658310608',3,'',2,'bd77354606d04c52a59186cbc3061fb4'),(202,'2023-10-23 18:41:12.040272','713833347728','admin - 713833347728',3,'',2,'bd77354606d04c52a59186cbc3061fb4'),(203,'2023-10-23 18:41:42.974282','583122726703','None - Nike Air Force 1 AN20 (GS) (CT7724-001)',3,'',6,'bd77354606d04c52a59186cbc3061fb4'),(204,'2023-10-23 18:41:42.980331','114501662203','None - Attack On Titan Hoodie Anime Oversized',3,'',6,'bd77354606d04c52a59186cbc3061fb4'),(205,'2023-10-23 18:42:15.422122','636614735623','admin - 636614735623',3,'',2,'bd77354606d04c52a59186cbc3061fb4'),(206,'2023-10-25 13:08:33.415354','23','staff - Nike Air More Uptempo \'96',1,'[{\"added\": {}}]',5,'bd77354606d04c52a59186cbc3061fb4'),(207,'2023-11-03 11:03:26.655384','b925ac99-dc1c-473c-bcf4-667656ee9579','slava',3,'',1,'91efcc9aee614034924b04c70ac0f3d6'),(208,'2023-11-03 19:16:07.999477','5b55e5e1-5d8c-4551-8ec6-dcddb5e581f7','slava',3,'',1,'91efcc9aee614034924b04c70ac0f3d6'),(209,'2023-11-10 17:12:41.412336','80b4b21b-4d06-4894-ae62-f7ccd8bf4c4a','test',3,'',1,'91efcc9aee614034924b04c70ac0f3d6'),(210,'2023-11-10 17:12:41.417490','7799b80a-f505-41d5-9ef7-3df2bd76f057','slava',3,'',1,'91efcc9aee614034924b04c70ac0f3d6'),(211,'2023-11-10 17:22:28.559329','f4769b65-6191-4d95-baba-c8df5b491ebc','slava',3,'',1,'91efcc9aee614034924b04c70ac0f3d6'),(212,'2023-11-10 17:23:19.498618','2b18e61a-4331-47ac-97fe-9ef91083eb05','slava',3,'',1,'91efcc9aee614034924b04c70ac0f3d6'),(213,'2023-11-15 11:12:52.421917','160933208627','None - Nike Air Force 1 AN20 (GS) (CT7724-001)',3,'',5,'91efcc9aee614034924b04c70ac0f3d6'),(214,'2023-11-15 11:28:05.908292','932006032225','None - Kawaii Anime Girl Harajuku Hoodie',3,'',5,'91efcc9aee614034924b04c70ac0f3d6'),(215,'2023-11-15 11:29:52.572792','259422739158','slava - Nike Renew Elevate III',1,'[{\"added\": {}}]',5,'91efcc9aee614034924b04c70ac0f3d6'),(216,'2023-11-15 11:29:59.667930','550028294206','admin - Nike Air Force 1 AN20 (GS) (CT7724-001)',3,'',5,'91efcc9aee614034924b04c70ac0f3d6'),(217,'2023-11-15 11:30:03.850740','695769321162','admin - Nike Air Force 1 AN20 (GS) (CT7724-001)',3,'',5,'91efcc9aee614034924b04c70ac0f3d6'),(218,'2023-11-15 11:30:08.796212','749429738158','admin - Nike Air Force 1 AN20 (GS) (CT7724-001)',3,'',5,'91efcc9aee614034924b04c70ac0f3d6'),(219,'2023-11-16 18:56:11.815623','7d95c470-89b6-468f-abd0-c06770ca698e','test2',3,'',1,'91efcc9aee614034924b04c70ac0f3d6'),(220,'2023-11-16 19:00:58.142544','90bec951-c1a4-49e3-9294-3e22554c3d89','test',3,'',1,'91efcc9aee614034924b04c70ac0f3d6'),(221,'2023-11-17 09:13:47.199362','9d7574e2-fb85-4183-a3ce-734e2e47f66f','test',3,'',1,'91efcc9aee614034924b04c70ac0f3d6'),(222,'2023-11-17 09:17:00.167861','f2d0989b-1ecd-4448-9e2a-12584675dbfd','test',3,'',1,'91efcc9aee614034924b04c70ac0f3d6'),(223,'2023-11-17 09:17:40.354852','c5cdb1d6-b07f-4fe2-a924-387cb3f21808','test',3,'',1,'91efcc9aee614034924b04c70ac0f3d6'),(224,'2023-11-17 09:18:34.148325','12e2745d-ddff-4ba5-b1a4-be455a808f09','test',3,'',1,'91efcc9aee614034924b04c70ac0f3d6'),(225,'2023-11-17 09:19:39.064289','78ea1f83-30a6-41f0-8915-9d846bd71d8a','test',3,'',1,'91efcc9aee614034924b04c70ac0f3d6'),(226,'2023-11-17 09:22:40.381569','615f7ad5-351e-4c18-a487-03048deae217','test',3,'',1,'91efcc9aee614034924b04c70ac0f3d6'),(227,'2023-11-17 09:25:08.061621','8d85b138-5e21-44d1-8f47-a96858d24e72','test',3,'',1,'91efcc9aee614034924b04c70ac0f3d6'),(228,'2023-11-17 09:35:35.652734','1eabfd4c-c024-49de-b5f0-e4bc9d65696b','test',3,'',1,'91efcc9aee614034924b04c70ac0f3d6'),(229,'2023-11-17 09:35:55.942959','7a50b8a2-a11a-42a5-85b9-bf9235b55f99','test',3,'',1,'91efcc9aee614034924b04c70ac0f3d6'),(230,'2023-11-17 09:36:39.257625','8ee0696a-9c1a-425c-b8c1-0fe565406670','test',3,'',1,'91efcc9aee614034924b04c70ac0f3d6'),(231,'2023-11-17 09:37:02.663982','9d436278-13d8-4176-8f38-b003db5d5ddf','test',3,'',1,'91efcc9aee614034924b04c70ac0f3d6'),(232,'2023-11-17 09:37:21.996525','c9bfab61-db07-4e9c-82ff-1bce9592e081','test',3,'',1,'91efcc9aee614034924b04c70ac0f3d6'),(233,'2023-11-17 15:51:50.379928','454150553327','None - None',3,'',6,'91efcc9aee614034924b04c70ac0f3d6'),(234,'2023-11-17 17:14:02.514301','866442029046','None - Attack On Titan Hoodie Anime Oversized',3,'',6,'91efcc9aee614034924b04c70ac0f3d6'),(235,'2023-11-17 17:14:02.526262','769963894975','None - Nike Run Swift 2',3,'',6,'91efcc9aee614034924b04c70ac0f3d6'),(236,'2023-11-17 17:19:16.505724','320469287706','admin - 320469287706',3,'',2,'91efcc9aee614034924b04c70ac0f3d6'),(237,'2023-11-17 17:19:59.083553','286994604091','admin - 286994604091',3,'',2,'91efcc9aee614034924b04c70ac0f3d6'),(238,'2023-11-17 17:20:22.973860','886592241750','admin - 886592241750',3,'',2,'91efcc9aee614034924b04c70ac0f3d6'),(239,'2023-11-17 17:22:47.155943','392503613686','admin - 392503613686',3,'',2,'91efcc9aee614034924b04c70ac0f3d6'),(240,'2023-11-17 17:23:48.567070','277619237096','admin - 277619237096',3,'',2,'91efcc9aee614034924b04c70ac0f3d6'),(241,'2023-11-17 17:27:17.839155','774433559496','admin - 774433559496',3,'',2,'91efcc9aee614034924b04c70ac0f3d6'),(242,'2023-11-17 17:27:17.892144','645464874365','admin - 645464874365',3,'',2,'91efcc9aee614034924b04c70ac0f3d6'),(243,'2023-11-17 17:27:43.823268','415043041231','admin - 415043041231',3,'',2,'91efcc9aee614034924b04c70ac0f3d6'),(244,'2023-11-17 17:29:11.806902','504297855027','admin - 504297855027',3,'',2,'91efcc9aee614034924b04c70ac0f3d6'),(245,'2023-11-17 17:30:36.081109','964768276276','admin - 964768276276',3,'',2,'91efcc9aee614034924b04c70ac0f3d6'),(246,'2023-11-17 17:32:51.823272','968021058312','admin - 968021058312',3,'',2,'91efcc9aee614034924b04c70ac0f3d6'),(247,'2023-11-17 17:34:34.478541','468560993584','admin - 468560993584',3,'',2,'91efcc9aee614034924b04c70ac0f3d6'),(248,'2023-11-17 17:38:32.719178','923006018497','admin - 995656684935 - Nike Run Swift 2',3,'',4,'91efcc9aee614034924b04c70ac0f3d6'),(249,'2023-11-17 17:38:32.725141','775496309151','admin - 995656684935 - Nike Run Swift 2',3,'',4,'91efcc9aee614034924b04c70ac0f3d6'),(250,'2023-11-17 17:38:32.731293','739842638015','admin - 995656684935 - Nike Run Swift 2',3,'',4,'91efcc9aee614034924b04c70ac0f3d6'),(251,'2023-11-17 17:38:32.737358','655458530772','admin - 995656684935 - Nike Run Swift 2',3,'',4,'91efcc9aee614034924b04c70ac0f3d6'),(252,'2023-11-17 17:38:32.742375','610164589306','admin - 995656684935 - Nike Run Swift 2',3,'',4,'91efcc9aee614034924b04c70ac0f3d6'),(253,'2023-11-17 17:38:32.748639','593547397418','admin - 995656684935 - Nike Run Swift 2',3,'',4,'91efcc9aee614034924b04c70ac0f3d6'),(254,'2023-11-17 17:38:32.753656','557226373848','admin - 995656684935 - Nike Run Swift 2',3,'',4,'91efcc9aee614034924b04c70ac0f3d6'),(255,'2023-11-17 17:38:40.072057','995656684935','admin - 995656684935',3,'',2,'91efcc9aee614034924b04c70ac0f3d6'),(256,'2023-11-17 17:38:40.080179','819806935973','admin - 819806935973',3,'',2,'91efcc9aee614034924b04c70ac0f3d6'),(257,'2023-11-17 17:38:40.085175','690209979143','admin - 690209979143',3,'',2,'91efcc9aee614034924b04c70ac0f3d6'),(258,'2023-11-17 17:38:40.090425','490886381387','admin - 490886381387',3,'',2,'91efcc9aee614034924b04c70ac0f3d6'),(259,'2023-11-17 17:38:40.097952','390872479640','admin - 390872479640',3,'',2,'91efcc9aee614034924b04c70ac0f3d6'),(260,'2023-11-17 17:38:40.103036','315746670148','admin - 315746670148',3,'',2,'91efcc9aee614034924b04c70ac0f3d6'),(261,'2023-11-17 17:38:40.109259','228189121602','admin - 228189121602',3,'',2,'91efcc9aee614034924b04c70ac0f3d6'),(262,'2023-11-17 17:43:25.660642','415820129418','admin - 759454944150 - Nike Run Swift 2',3,'',4,'91efcc9aee614034924b04c70ac0f3d6'),(263,'2023-11-17 17:43:25.667721','386782789834','admin - 759454944150 - Nike Run Swift 2',3,'',4,'91efcc9aee614034924b04c70ac0f3d6'),(264,'2023-11-17 17:43:25.675324','372994220233','admin - 759454944150 - Nike Run Swift 2',3,'',4,'91efcc9aee614034924b04c70ac0f3d6'),(265,'2023-11-17 17:43:32.491411','759454944150','admin - 759454944150',3,'',2,'91efcc9aee614034924b04c70ac0f3d6'),(266,'2023-11-17 17:43:32.547514','656112441209','admin - 656112441209',3,'',2,'91efcc9aee614034924b04c70ac0f3d6'),(267,'2023-11-17 17:43:32.552823','280994341247','admin - 280994341247',3,'',2,'91efcc9aee614034924b04c70ac0f3d6'),(268,'2023-11-18 08:23:57.886585','1ee06e22-dde7-4cf3-9ab0-b81f50500f03','alex',3,'',1,'91efcc9aee614034924b04c70ac0f3d6'),(269,'2023-11-18 08:30:38.290973','0685294e-cf83-4db0-a210-dd1ff62e83ae','alex',3,'',1,'91efcc9aee614034924b04c70ac0f3d6'),(270,'2023-11-18 08:31:54.773744','413964b3-d75e-4e28-920f-c852117564d4','alex',3,'',1,'91efcc9aee614034924b04c70ac0f3d6'),(271,'2023-11-18 09:44:26.142305','3ad881d8-4a0d-4fac-857c-518b28987e6e','slava',3,'',1,'91efcc9aee614034924b04c70ac0f3d6'),(272,'2023-11-18 09:44:26.196560','cf0ef2b3-7d12-452b-996a-04432634a8e2','test',3,'',1,'91efcc9aee614034924b04c70ac0f3d6'),(273,'2023-11-18 11:36:08.990416','852322156577','admin - Nike Run Swift 2',3,'',6,'91efcc9aee614034924b04c70ac0f3d6'),(274,'2023-11-18 11:36:09.016082','231114642812','admin - Nike Run Swift 2',3,'',6,'91efcc9aee614034924b04c70ac0f3d6'),(275,'2023-11-18 11:36:22.474060','289585436665','admin - Puma Karmen Shine',3,'',5,'91efcc9aee614034924b04c70ac0f3d6'),(276,'2023-11-18 11:37:55.915497','675088109388','admin - Nike Run Swift 2',3,'',5,'91efcc9aee614034924b04c70ac0f3d6'),(277,'2023-11-18 11:51:20.972957','277228148406','test',3,'',3,'91efcc9aee614034924b04c70ac0f3d6'),(278,'2023-11-18 11:52:18.596840','3241221234','slava - Nike Air More Uptempo \'96',1,'[{\"added\": {}}]',6,'91efcc9aee614034924b04c70ac0f3d6'),(279,'2023-11-22 11:23:45.490911','991506444855','admin - 969246005654 - Nike Run Swift 2',3,'',4,'91efcc9aee614034924b04c70ac0f3d6'),(280,'2023-11-22 11:23:45.533756','414772175211','admin - 969246005654 - Nike Run Swift 2',3,'',4,'91efcc9aee614034924b04c70ac0f3d6'),(281,'2023-11-22 11:23:45.539562','244493794686','admin - 893425326334 - Nike Run Swift 2',3,'',4,'91efcc9aee614034924b04c70ac0f3d6'),(282,'2023-11-22 11:23:53.223134','969246005654','admin - 969246005654',3,'',2,'91efcc9aee614034924b04c70ac0f3d6'),(283,'2023-11-22 11:23:53.233040','893425326334','admin - 893425326334',3,'',2,'91efcc9aee614034924b04c70ac0f3d6'),(284,'2023-11-24 20:07:14.050237','c7c205be-c31f-4efd-b469-611f0121cda6','alex',3,'',1,'91efcc9aee614034924b04c70ac0f3d6'),(285,'2023-11-24 20:08:17.149181','f8319042-6129-4a82-b36e-9efc92961e8f','alex',3,'',1,'91efcc9aee614034924b04c70ac0f3d6'),(286,'2023-11-24 20:09:38.285901','6fa04ee3-b083-4893-8934-a4b40378e966','alex',3,'',1,'91efcc9aee614034924b04c70ac0f3d6'),(287,'2023-11-24 20:10:28.096221','24c5ff86-2347-40fb-a8df-e7e0195fb2d6','alex',3,'',1,'91efcc9aee614034924b04c70ac0f3d6'),(288,'2023-11-24 20:12:22.219081','132fd915-f6de-4150-a9f4-dab5ce5cdc44','alex',3,'',1,'91efcc9aee614034924b04c70ac0f3d6'),(289,'2023-11-24 20:12:34.631097','e9db4237-0645-4764-b138-6e08b8b7e568','alex',3,'',1,'91efcc9aee614034924b04c70ac0f3d6'),(290,'2023-11-25 08:26:50.586245','173600472102','admin - Nike Run Swift 2',3,'',6,'91efcc9aee614034924b04c70ac0f3d6'),(291,'2023-11-25 08:49:26.763458','472311217932','admin - 472311217932',3,'',2,'91efcc9aee614034924b04c70ac0f3d6'),(292,'2023-11-29 05:50:03.285783','746555723083','admin - Nike Run Swift 2',3,'',5,'91efcc9aee614034924b04c70ac0f3d6'),(293,'2023-11-29 05:50:03.299963','370411141717','slava - Nike Air Force 1 AN20 (GS) (CT7724-001)',3,'',5,'91efcc9aee614034924b04c70ac0f3d6'),(294,'2023-11-29 11:08:53.688418','619851324729','admin - Nike Run Swift 2',3,'',5,'91efcc9aee614034924b04c70ac0f3d6'),(295,'2023-11-29 11:08:53.705133','253546862836','admin - Nike Run Swift 2',3,'',5,'91efcc9aee614034924b04c70ac0f3d6'),(296,'2023-11-29 11:08:53.718238','136804861463','admin - Nike Run Swift 2',3,'',5,'91efcc9aee614034924b04c70ac0f3d6'),(297,'2023-12-02 04:34:50.988465','397877611814','admin - Nike Run Swift 2',3,'',5,'91efcc9aee614034924b04c70ac0f3d6'),(298,'2023-12-02 04:39:54.865269','878106212058','admin - Nike Run Swift 2',3,'',5,'91efcc9aee614034924b04c70ac0f3d6'),(299,'2023-12-02 04:39:54.914866','871930438010','admin - Nike Run Swift 2',3,'',5,'91efcc9aee614034924b04c70ac0f3d6'),(300,'2023-12-02 04:39:54.921543','777086090999','admin - Nike Run Swift 2',3,'',5,'91efcc9aee614034924b04c70ac0f3d6'),(301,'2023-12-02 04:39:54.931161','662777842172','admin - Nike Run Swift 2',3,'',5,'91efcc9aee614034924b04c70ac0f3d6'),(302,'2023-12-02 04:39:54.931161','527663821294','admin - Nike Run Swift 2',3,'',5,'91efcc9aee614034924b04c70ac0f3d6'),(303,'2023-12-02 04:39:54.939999','268242262631','admin - Nike Run Swift 2',3,'',5,'91efcc9aee614034924b04c70ac0f3d6'),(304,'2023-12-02 04:39:54.946981','260332321712','admin - Nike Run Swift 2',3,'',5,'91efcc9aee614034924b04c70ac0f3d6'),(305,'2023-12-02 04:39:54.952779','256333271265','admin - Nike Run Swift 2',3,'',5,'91efcc9aee614034924b04c70ac0f3d6'),(306,'2023-12-02 04:39:54.959961','174177027724','admin - Nike Run Swift 2',3,'',5,'91efcc9aee614034924b04c70ac0f3d6'),(307,'2023-12-02 04:39:54.963569','151140403516','admin - Nike Run Swift 2',3,'',5,'91efcc9aee614034924b04c70ac0f3d6'),(308,'2023-12-02 04:39:54.970112','101331476092','admin - Nike Run Swift 2',3,'',5,'91efcc9aee614034924b04c70ac0f3d6'),(309,'2023-12-02 07:18:47.745500','865809890881','admin - Nike Run Swift 2',3,'',6,'91efcc9aee614034924b04c70ac0f3d6'),(310,'2023-12-02 07:18:47.757243','684340241364','admin - Nike Run Swift 2',3,'',6,'91efcc9aee614034924b04c70ac0f3d6'),(311,'2023-12-02 07:18:47.757243','386527982213','admin - Nike Run Swift 2',3,'',6,'91efcc9aee614034924b04c70ac0f3d6'),(312,'2023-12-02 07:18:47.772032','215509945865','admin - Nike Run Swift 2',3,'',6,'91efcc9aee614034924b04c70ac0f3d6'),(313,'2023-12-02 07:18:47.775416','208845067205','admin - Nike Run Swift 2',3,'',6,'91efcc9aee614034924b04c70ac0f3d6'),(314,'2023-12-02 07:25:29.145610','384495390376','admin - 225668854430 - Nike Run Swift 2',3,'',4,'91efcc9aee614034924b04c70ac0f3d6'),(315,'2023-12-03 17:28:40.368567','657225111734','admin - 120320314344 - Nike Dunk Low Retro',3,'',4,'91efcc9aee614034924b04c70ac0f3d6'),(316,'2023-12-03 17:28:40.375566','469890175624','test - 425977252617 - HooMeelanz Unisex Hoodie',3,'',4,'91efcc9aee614034924b04c70ac0f3d6'),(317,'2023-12-03 17:28:40.381104','339674344157','admin - 120320314344 - Nike Run Swift 2',3,'',4,'91efcc9aee614034924b04c70ac0f3d6'),(318,'2023-12-03 17:28:47.253855','425977252617','test - 425977252617',3,'',2,'91efcc9aee614034924b04c70ac0f3d6'),(319,'2023-12-03 17:28:47.259881','225668854430','admin - 225668854430',3,'',2,'91efcc9aee614034924b04c70ac0f3d6'),(320,'2023-12-03 17:28:47.264950','120320314344','admin - 120320314344',3,'',2,'91efcc9aee614034924b04c70ac0f3d6'),(321,'2023-12-03 17:29:14.621392','754687073840','slava - 869337849674 - Nike Air Max 97',3,'',4,'91efcc9aee614034924b04c70ac0f3d6'),(322,'2023-12-03 17:29:14.625976','751728902401','slava - 869337849674 - Nike Air Force 1 AN20 (GS) (CT7724-001)',3,'',4,'91efcc9aee614034924b04c70ac0f3d6'),(323,'2023-12-03 17:29:14.630097','606570463727','slava - 869337849674 - Nike Air Force 1 AN20 (GS) (CT7724-001)',3,'',4,'91efcc9aee614034924b04c70ac0f3d6'),(324,'2023-12-03 17:29:14.634236','422953674070','slava - 869337849674 - Nike Air Force 1 AN20 (GS) (CT7724-001)',3,'',4,'91efcc9aee614034924b04c70ac0f3d6'),(325,'2023-12-03 17:29:14.638102','287695164141','slava - 869337849674 - Nike Air More Uptempo \'96',3,'',4,'91efcc9aee614034924b04c70ac0f3d6'),(326,'2023-12-03 17:29:22.708050','651868516948','slava - 651868516948',3,'',2,'91efcc9aee614034924b04c70ac0f3d6'),(327,'2023-12-03 17:29:22.712607','175030142300','slava - 175030142300',3,'',2,'91efcc9aee614034924b04c70ac0f3d6'),(328,'2023-12-08 10:09:23.587527','434706558424','None - Nike Air Force 1 AN20 (GS) (CT7724-001)',3,'',5,'91efcc9aee614034924b04c70ac0f3d6'),(329,'2023-12-08 10:15:33.040350','419371356909','admin - 419371356909',3,'',2,'91efcc9aee614034924b04c70ac0f3d6'),(330,'2023-12-08 10:15:44.486721','330553207786','admin - 330553207786',3,'',2,'91efcc9aee614034924b04c70ac0f3d6'),(331,'2023-12-08 10:35:31.936020','957911971761','admin - 957911971761',3,'',2,'91efcc9aee614034924b04c70ac0f3d6'),(332,'2023-12-08 10:35:31.987360','852694228569','admin - 852694228569',3,'',2,'91efcc9aee614034924b04c70ac0f3d6'),(333,'2023-12-08 10:35:31.996879','680605720578','admin - 680605720578',3,'',2,'91efcc9aee614034924b04c70ac0f3d6'),(334,'2023-12-08 10:35:32.001853','607479852366','admin - 607479852366',3,'',2,'91efcc9aee614034924b04c70ac0f3d6'),(335,'2023-12-08 10:35:32.005740','579822344897','admin - 579822344897',3,'',2,'91efcc9aee614034924b04c70ac0f3d6'),(336,'2023-12-08 10:35:32.012708','186757241430','admin - 186757241430',3,'',2,'91efcc9aee614034924b04c70ac0f3d6'),(337,'2023-12-08 16:26:28.057021','15cabb9a-95ab-432c-86ac-01802064d089','dsfdsf',3,'',1,'91efcc9aee614034924b04c70ac0f3d6'),(338,'2023-12-08 16:30:23.844882','91efcc9a-ee61-4034-924b-04c70ac0f3d6','admin',2,'[{\"changed\": {\"fields\": [\"Profile picture\"]}}]',1,'91efcc9aee614034924b04c70ac0f3d6'),(339,'2023-12-08 17:13:31.573607','91efcc9a-ee61-4034-924b-04c70ac0f3d6','admin',2,'[{\"changed\": {\"fields\": [\"Profile picture\"]}}]',1,'91efcc9aee614034924b04c70ac0f3d6'),(340,'2023-12-08 17:28:06.074280','91efcc9a-ee61-4034-924b-04c70ac0f3d6','admin',2,'[{\"changed\": {\"fields\": [\"Profile picture\"]}}]',1,'91efcc9aee614034924b04c70ac0f3d6'),(341,'2023-12-08 17:49:40.028616','91efcc9a-ee61-4034-924b-04c70ac0f3d6','admin',2,'[{\"changed\": {\"fields\": [\"Profile picture\"]}}]',1,'91efcc9aee614034924b04c70ac0f3d6'),(342,'2023-12-08 17:53:12.049915','91efcc9a-ee61-4034-924b-04c70ac0f3d6','admin',2,'[{\"changed\": {\"fields\": [\"Profile picture\"]}}]',1,'91efcc9aee614034924b04c70ac0f3d6'),(343,'2023-12-08 17:55:44.061611','91efcc9a-ee61-4034-924b-04c70ac0f3d6','admin',2,'[{\"changed\": {\"fields\": [\"Profile picture\"]}}]',1,'91efcc9aee614034924b04c70ac0f3d6'),(344,'2023-12-09 10:08:39.961103','91efcc9a-ee61-4034-924b-04c70ac0f3d6','admin',2,'[{\"changed\": {\"fields\": [\"Profile picture\"]}}]',1,'91efcc9aee614034924b04c70ac0f3d6'),(345,'2023-12-09 10:08:51.503736','9ee852f1-9df9-400a-9b48-cc2ffb89abc6','gojo',2,'[{\"changed\": {\"fields\": [\"Profile picture\"]}}]',1,'91efcc9aee614034924b04c70ac0f3d6'),(346,'2023-12-11 05:44:05.559236','353209055857','admin - Nike Air Force 1 AN20 (GS) (CT7724-001)',3,'',5,'91efcc9aee614034924b04c70ac0f3d6'),(347,'2023-12-11 06:03:10.530664','9ee852f1-9df9-400a-9b48-cc2ffb89abc6','slava',2,'[{\"changed\": {\"fields\": [\"Username\"]}}]',1,'91efcc9aee614034924b04c70ac0f3d6'),(348,'2023-12-11 06:11:40.046642','643b0424-70af-4232-bce3-7fe2f459d701','alex',3,'',1,'91efcc9aee614034924b04c70ac0f3d6'),(349,'2023-12-11 06:13:03.944628','0d8fda73-a83e-4ac9-b90c-8548bed8814c','alex',3,'',1,'91efcc9aee614034924b04c70ac0f3d6'),(350,'2023-12-11 06:14:46.408846','cdb465c4-acac-41bd-9a8e-9f91208c724f','alex',3,'',1,'91efcc9aee614034924b04c70ac0f3d6'),(351,'2023-12-11 06:15:34.887678','9605623d-4fb2-4095-b642-51c1fcd445d0','alex',3,'',1,'91efcc9aee614034924b04c70ac0f3d6'),(352,'2023-12-11 06:16:15.052816','0adf4f66-a7eb-49f6-98be-31995861541a','alex',3,'',1,'91efcc9aee614034924b04c70ac0f3d6'),(353,'2023-12-11 06:16:32.358608','3306230b-19a5-4bb8-a140-a3da5a6128c9','alex',3,'',1,'91efcc9aee614034924b04c70ac0f3d6'),(354,'2023-12-11 06:24:35.937283','c632a8de-6ac2-47e6-b2db-83b731b3611c','alex',3,'',1,'91efcc9aee614034924b04c70ac0f3d6'),(355,'2023-12-11 06:26:23.157694','ae576620-2896-4990-8134-612a09988fb4','alex',3,'',1,'91efcc9aee614034924b04c70ac0f3d6'),(356,'2023-12-11 06:28:47.000089','8a0b5ab1-520b-4bd1-8304-5e9d55cc021f','alex',3,'',1,'91efcc9aee614034924b04c70ac0f3d6'),(357,'2023-12-11 06:58:47.969491','4dcc57e8-0292-4815-a373-1870a278ec66','alex',3,'',1,'91efcc9aee614034924b04c70ac0f3d6'),(358,'2023-12-11 06:59:40.610456','ba6dc699-b653-4117-9b2f-142fcb86ad69','alex',3,'',1,'91efcc9aee614034924b04c70ac0f3d6'),(359,'2023-12-11 07:00:32.320469','5d09ddab-6e50-4dd1-a5b4-87f5c15a201d','alex',3,'',1,'91efcc9aee614034924b04c70ac0f3d6'),(360,'2023-12-11 07:02:20.872785','d0c24f88-ab59-451d-a30f-0ef755ca4311','alex',3,'',1,'91efcc9aee614034924b04c70ac0f3d6'),(361,'2023-12-11 07:05:02.650212','371b83fa-d426-4b62-8f17-ea0b5fd0753f','alex',3,'',1,'91efcc9aee614034924b04c70ac0f3d6'),(362,'2023-12-11 07:07:27.526053','c4cc93ea-63e9-4585-98c3-315248464eda','alex',3,'',1,'91efcc9aee614034924b04c70ac0f3d6'),(363,'2023-12-11 07:09:43.624045','7fe20b65-e6a5-41c6-b9f7-2fb9bd631f21','alex',3,'',1,'91efcc9aee614034924b04c70ac0f3d6'),(364,'2023-12-11 07:13:13.489641','2e9980a9-5c8e-41ae-bf49-2fff18664718','alex',3,'',1,'91efcc9aee614034924b04c70ac0f3d6'),(365,'2023-12-11 07:13:27.190007','32ec882a-3098-4efb-8822-9f4e264560c5','alex',3,'',1,'91efcc9aee614034924b04c70ac0f3d6'),(366,'2023-12-11 07:14:15.549110','acf5833e-44a7-4d3d-aad0-99e81f433d01','alex',3,'',1,'91efcc9aee614034924b04c70ac0f3d6'),(367,'2023-12-11 07:15:08.628774','eecc79c0-26fe-4a05-baa6-c818adb960bf','alex',3,'',1,'91efcc9aee614034924b04c70ac0f3d6'),(368,'2023-12-11 07:16:11.778241','c3d65c1d-464d-4a3d-83f0-d918955bb05a','alex',3,'',1,'91efcc9aee614034924b04c70ac0f3d6'),(369,'2023-12-11 07:17:00.563380','26793922-e7e8-4d26-9a18-b79ff3468346','alex',3,'',1,'91efcc9aee614034924b04c70ac0f3d6'),(370,'2023-12-11 07:18:49.829687','773c6754-5d8e-4a1b-8889-79766af62c97','alex',3,'',1,'91efcc9aee614034924b04c70ac0f3d6'),(371,'2023-12-11 07:19:28.445965','fd8e2b3b-94d2-4b20-91a7-9955f0c441ae','alex',3,'',1,'91efcc9aee614034924b04c70ac0f3d6'),(372,'2023-12-11 07:20:10.993300','4123c755-a196-473c-8148-28f1684e5f1a','alex',3,'',1,'91efcc9aee614034924b04c70ac0f3d6'),(373,'2023-12-11 07:26:49.857590','9e093743-3b34-4d91-8d4e-b258891b03e0','alex',3,'',1,'91efcc9aee614034924b04c70ac0f3d6'),(374,'2023-12-11 07:27:25.873759','1b5d8955-5e07-4310-9fae-9b0d4f104d26','alex',3,'',1,'91efcc9aee614034924b04c70ac0f3d6'),(375,'2023-12-11 08:06:50.775352','6c1379c7-0530-47a6-829c-7a33accf9044','alex',3,'',1,'91efcc9aee614034924b04c70ac0f3d6'),(376,'2023-12-11 08:07:45.588720','615053850537','admin - Nike Air Force 1 AN20 (GS) (CT7724-001)',3,'',5,'91efcc9aee614034924b04c70ac0f3d6'),(377,'2023-12-11 08:28:38.234390','e60e8203-357e-4eeb-a650-7b7bbdabd2d1','alex',3,'',1,'91efcc9aee614034924b04c70ac0f3d6'),(378,'2023-12-11 20:16:56.206160','83f44f82-e1b5-485e-99a8-85f5f90feb33','alex',3,'',1,'91efcc9aee614034924b04c70ac0f3d6'),(379,'2023-12-11 20:17:21.073492','35e85c75-cc25-48e0-8642-5d0adc645db0','alex',3,'',1,'91efcc9aee614034924b04c70ac0f3d6'),(380,'2023-12-11 20:23:25.045351','129fbeb0-e012-498b-bee1-e39ef472b021','alex',3,'',1,'91efcc9aee614034924b04c70ac0f3d6'),(381,'2023-12-11 20:23:47.046189','580b0ef6-baed-4673-9b8f-2da12f936b5c','alex',3,'',1,'91efcc9aee614034924b04c70ac0f3d6'),(382,'2023-12-12 06:57:34.728905','869337849674','slava - 869337849674',3,'',2,'91efcc9aee614034924b04c70ac0f3d6'),(383,'2023-12-12 07:04:04.899377','9ee852f1-9df9-400a-9b48-cc2ffb89abc6','slava',2,'[{\"changed\": {\"fields\": [\"Staff status\", \"Groups\"]}}]',1,'91efcc9aee614034924b04c70ac0f3d6'),(384,'2023-12-12 07:04:42.765181','9ee852f1-9df9-400a-9b48-cc2ffb89abc6','slava',2,'[{\"changed\": {\"fields\": [\"Staff status\", \"Groups\"]}}]',1,'91efcc9aee614034924b04c70ac0f3d6');
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (9,'admin','logentry'),(11,'auth','group'),(10,'auth','permission'),(7,'authtoken','token'),(8,'authtoken','tokenproxy'),(12,'contenttypes','contenttype'),(6,'products','cartitem'),(5,'products','favorite'),(2,'products','order'),(4,'products','orderitem'),(3,'products','product'),(13,'sessions','session'),(14,'token_blacklist','blacklistedtoken'),(15,'token_blacklist','outstandingtoken'),(1,'users','customuser');
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
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2023-10-14 20:19:11.069381'),(2,'contenttypes','0002_remove_content_type_name','2023-10-14 20:19:11.120961'),(3,'auth','0001_initial','2023-10-14 20:19:11.317584'),(4,'auth','0002_alter_permission_name_max_length','2023-10-14 20:19:11.366200'),(5,'auth','0003_alter_user_email_max_length','2023-10-14 20:19:11.377375'),(6,'auth','0004_alter_user_username_opts','2023-10-14 20:19:11.388066'),(7,'auth','0005_alter_user_last_login_null','2023-10-14 20:19:11.397584'),(8,'auth','0006_require_contenttypes_0002','2023-10-14 20:19:11.403185'),(9,'auth','0007_alter_validators_add_error_messages','2023-10-14 20:19:11.413236'),(10,'auth','0008_alter_user_username_max_length','2023-10-14 20:19:11.425354'),(11,'auth','0009_alter_user_last_name_max_length','2023-10-14 20:19:11.436475'),(12,'auth','0010_alter_group_name_max_length','2023-10-14 20:19:11.459410'),(13,'auth','0011_update_proxy_permissions','2023-10-14 20:19:11.469438'),(14,'auth','0012_alter_user_first_name_max_length','2023-10-14 20:19:11.479778'),(15,'users','0001_initial','2023-10-14 20:19:11.715122'),(16,'admin','0001_initial','2023-10-14 20:19:11.845826'),(17,'admin','0002_logentry_remove_auto_add','2023-10-14 20:19:11.855719'),(18,'admin','0003_logentry_add_action_flag_choices','2023-10-14 20:19:11.865795'),(19,'authtoken','0001_initial','2023-10-14 20:19:11.984135'),(20,'authtoken','0002_auto_20160226_1747','2023-10-14 20:19:12.012935'),(21,'authtoken','0003_tokenproxy','2023-10-14 20:19:12.019470'),(22,'products','0001_initial','2023-10-14 20:19:12.470372'),(23,'products','0002_alter_cartitem_id_alter_favorite_id_alter_order_id_and_more','2023-10-14 20:19:13.090340'),(24,'sessions','0001_initial','2023-10-14 20:19:13.130099'),(25,'products','0003_alter_product_image','2023-10-14 20:37:56.140738'),(26,'products','0004_alter_product_image','2023-10-20 16:10:24.820033'),(27,'products','0005_alter_cartitem_options_alter_favorite_options_and_more','2023-10-23 12:13:32.700658'),(28,'products','0006_alter_order_status','2023-10-25 18:33:08.981255'),(29,'users','0002_alter_customuser_email','2023-10-31 20:28:12.083090'),(30,'token_blacklist','0001_initial','2023-11-03 09:41:17.269485'),(31,'token_blacklist','0002_outstandingtoken_jti_hex','2023-11-03 09:41:17.317703'),(32,'token_blacklist','0003_auto_20171017_2007','2023-11-03 09:41:17.353634'),(33,'token_blacklist','0004_auto_20171017_2013','2023-11-03 09:41:17.489535'),(34,'token_blacklist','0005_remove_outstandingtoken_jti','2023-11-03 09:41:17.551244'),(35,'token_blacklist','0006_auto_20171017_2113','2023-11-03 09:41:17.605727'),(36,'token_blacklist','0007_auto_20171017_2214','2023-11-03 09:41:17.853807'),(37,'token_blacklist','0008_migrate_to_bigautofield','2023-11-03 09:41:18.140325'),(38,'token_blacklist','0010_fix_migrate_to_bigautofield','2023-11-03 09:41:18.181988'),(39,'token_blacklist','0011_linearizes_history','2023-11-03 09:41:18.181988'),(40,'token_blacklist','0012_alter_outstandingtoken_user','2023-11-03 09:41:18.219078'),(41,'products','0007_rename_customer_order_user','2023-11-25 18:04:25.667618'),(42,'products','0008_alter_cartitem_product_alter_cartitem_user_and_more','2023-12-11 20:16:30.988475');
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
INSERT INTO `django_session` VALUES ('3ok26qxb3qpl6oaniglj7wuxj1nhq6v6','.eJxVzMsOwiAQheF3YS1kBkYEl-59hmYYwFZNSXpZGd9dm3Sh6_N_56U6Xpe-W-cydUNWZxWxVJHIuhSPmsCRjpaSBpITsEB12avDL0ssjzJuNt95vDUjbVymIZktMfs6m2vL5XnZ27-Dnuf-qwGRrZUohIkQXCUmJwhEMYtkF6I9Vh8gVIBcEbEE8hyRqiWPwur9AeuZQFg:1r0h1Y:LhaA-QvMVmrT0MkCiehc3FCOVERbkLv141hClq2H9O8','2023-11-22 11:47:08.347961'),('3urci4tbn0xa93sshsghi2g0gg1voyqi','.eJxVjjsOwjAQBe_imlgOu-sPJT1niLzrDQmgRMqnQtydREoB9ZsZvbdp8rp0zTrr1PTFXAyXEIDQV84XV6HQucqU6ip6YQHn65bRnH41zvLUYXfLIw_30co4LFPPdkfssc72NhZ9XQ_2L9DludtsjD6hY8kAQqqACVNMQJw0M7mSt1euJQraJlLSkEQCQGTCmrSQ-XwBncFAcg:1qrlAb:U8vcjEkUQoOT2HCIF8UoSfefLGhW4OSJSEKwEFQZvtw','2023-10-28 20:23:33.906044'),('6a0x98l10zog08tqckmm6zelsozknzia','.eJxVzMsOwiAQheF3YS1kBkYEl-59hmYYwFZNSXpZGd9dm3Sh6_N_56U6Xpe-W-cydUNWZxWxVJHIuhSPmsCRjpaSBpITsEB12avDL0ssjzJuNt95vDUjbVymIZktMfs6m2vL5XnZ27-Dnuf-qwGRrZUohIkQXCUmJwhEMYtkF6I9Vh8gVIBcEbEE8hyRqiWPwur9AeuZQFg:1qyBbu:RGdoAe5BaDv52XakAfw9BRLW7kHMs5tGE1hkijwDVsc','2023-11-15 13:50:18.671362'),('ab3x1y3zfj9jk4rclwddhab3e3oyskav','.eJxVzMsOwiAQheF3YS1kBkYEl-59hmYYwFZNSXpZGd9dm3Sh6_N_56U6Xpe-W-cydUNWZxWxVJHIuhSPmsCRjpaSBpITsEB12avDL0ssjzJuNt95vDUjbVymIZktMfs6m2vL5XnZ27-Dnuf-qwGRrZUohIkQXCUmJwhEMYtkF6I9Vh8gVIBcEbEE8hyRqiWPwur9AeuZQFg:1r9qEU:WUM2QB2E7u61LveSyW9M2jV9bQRNd_BSdYNm1jE3WNk','2023-12-17 17:26:18.197787'),('lp57acr8au9wv88h8bodgeqaksbszjd3','.eJxVjjsOwjAQBe_imlgOu-sPJT1niLzrDQmgRMqnQtydREoB9ZsZvbdp8rp0zTrr1PTFXAyXEIDQV84XV6HQucqU6ip6YQHn65bRnH41zvLUYXfLIw_30co4LFPPdkfssc72NhZ9XQ_2L9DludtsjD6hY8kAQqqACVNMQJw0M7mSt1euJQraJlLSkEQCQGTCmrSQ-XwBncFAcg:1qu7F6:84598dLzHZmLgcCz2avA_VwBoLbxmmvRq7Ly-1UG_aQ','2023-11-04 08:21:56.660646'),('ow9td1gdqudv4yerjbrvsnj6usywt910','.eJxVzMsOwiAQheF3YS1kBkYEl-59hmYYwFZNSXpZGd9dm3Sh6_N_56U6Xpe-W-cydUNWZxWxVJHIuhSPmsCRjpaSBpITsEB12avDL0ssjzJuNt95vDUjbVymIZktMfs6m2vL5XnZ27-Dnuf-qwGRrZUohIkQXCUmJwhEMYtkF6I9Vh8gVIBcEbEE8hyRqiWPwur9AeuZQFg:1rCwoe:Lk5-lFR8ZdMwERaljhfIXl-8w0PxxCOyub0Fm-Vw_HI','2023-12-26 07:04:28.042253'),('prxsr2rf03nbwy40dc87ftndkcs1ykuq','.eJxVzMsOwiAQheF3YS1kBkYEl-59hmYYwFZNSXpZGd9dm3Sh6_N_56U6Xpe-W-cydUNWZxWxVJHIuhSPmsCRjpaSBpITsEB12avDL0ssjzJuNt95vDUjbVymIZktMfs6m2vL5XnZ27-Dnuf-qwGRrZUohIkQXCUmJwhEMYtkF6I9Vh8gVIBcEbEE8hyRqiWPwur9AeuZQFg:1r0gxn:XG783SzHEp0nRQrSUnn3bL4WpEW2Dipkxu5nFGLJX4k','2023-11-22 11:43:15.190013'),('w4okxtko9ab244r1s3rjqfumbwkhqi0x','.eJxVzMsOwiAQheF3YS1kBkYEl-59hmYYwFZNSXpZGd9dm3Sh6_N_56U6Xpe-W-cydUNWZxWxVJHIuhSPmsCRjpaSBpITsEB12avDL0ssjzJuNt95vDUjbVymIZktMfs6m2vL5XnZ27-Dnuf-qwGRrZUohIkQXCUmJwhEMYtkF6I9Vh8gVIBcEbEE8hyRqiWPwur9AeuZQFg:1r6cRn:J07jihx6AJINy0Uqtr8e8YM3q9aVGg5oFkQk7Bm6NsE','2023-12-08 20:06:43.259419'),('xe1ncndl6v92auvnvlzlgr4upg5fftv2','.eJxVzMsOwiAQheF3YS1kBkYEl-59hmYYwFZNSXpZGd9dm3Sh6_N_56U6Xpe-W-cydUNWZxWxVJHIuhSPmsCRjpaSBpITsEB12avDL0ssjzJuNt95vDUjbVymIZktMfs6m2vL5XnZ27-Dnuf-qwGRrZUohIkQXCUmJwhEMYtkF6I9Vh8gVIBcEbEE8hyRqiWPwur9AeuZQFg:1rBuFv:1sQq9ixfkliW-ISvm14DDj70fPMCAtFbTH-fsdVyFzg','2023-12-23 10:08:19.937446'),('y2jahrt79oufan0vh9tbxweb6e1i62ps','.eJxVzMsOwiAQheF3YS1kBkYEl-59hmYYwFZNSXpZGd9dm3Sh6_N_56U6Xpe-W-cydUNWZxWxVJHIuhSPmsCRjpaSBpITsEB12avDL0ssjzJuNt95vDUjbVymIZktMfs6m2vL5XnZ27-Dnuf-qwGRrZUohIkQXCUmJwhEMYtkF6I9Vh8gVIBcEbEE8hyRqiWPwur9AeuZQFg:1r1mje:Zty-ybWLHDrii8JKAyQW4hE4t0ZGrNtXXXq-C0JrFkQ','2023-11-25 12:05:10.241325'),('yifn7h16zufbybzfz702wxif879rmo8w','.eJxVzMsOwiAQheF3YS1kBkYEl-59hmYYwFZNSXpZGd9dm3Sh6_N_56U6Xpe-W-cydUNWZxWxVJHIuhSPmsCRjpaSBpITsEB12avDL0ssjzJuNt95vDUjbVymIZktMfs6m2vL5XnZ27-Dnuf-qwGRrZUohIkQXCUmJwhEMYtkF6I9Vh8gVIBcEbEE8hyRqiWPwur9AeuZQFg:1r1VMu:Igcmv_c0n5V2RSZUn6JtTUIoBWi0nLxGWoQgS60ZtZ4','2023-11-24 17:32:32.784607');
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
  `product_id` bigint NOT NULL,
  `user_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `products_cartitem_product_id_e735c06a_fk_products_product_id` (`product_id`),
  KEY `products_cartitem_user_id_c496ef06_fk_users_customuser_id` (`user_id`),
  CONSTRAINT `products_cartitem_product_id_e735c06a_fk_products_product_id` FOREIGN KEY (`product_id`) REFERENCES `products_product` (`id`),
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
  `product_id` bigint NOT NULL,
  `user_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `products_favorite_product_id_f8265054_fk_products_product_id` (`product_id`),
  KEY `products_favorite_user_id_cd8466da_fk_users_customuser_id` (`user_id`),
  CONSTRAINT `products_favorite_product_id_f8265054_fk_products_product_id` FOREIGN KEY (`product_id`) REFERENCES `products_product` (`id`),
  CONSTRAINT `products_favorite_user_id_cd8466da_fk_users_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `users_customuser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_favorite`
--

LOCK TABLES `products_favorite` WRITE;
/*!40000 ALTER TABLE `products_favorite` DISABLE KEYS */;
INSERT INTO `products_favorite` VALUES (115940200252,597699061655,'9ee852f19df9400a9b48cc2ffb89abc6'),(292367593774,155242430672,'9ee852f19df9400a9b48cc2ffb89abc6'),(360579934185,145323452557,'9ee852f19df9400a9b48cc2ffb89abc6'),(418737225085,145323452557,'91efcc9aee614034924b04c70ac0f3d6'),(808421586385,913818508974,'eef622ee707243b0a2393c8ba3f47940'),(885869633355,394238808810,'91efcc9aee614034924b04c70ac0f3d6');
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
  `status` varchar(30) NOT NULL,
  `user_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `products_order_user_id_dfb540d8_fk_users_customuser_id` (`user_id`),
  CONSTRAINT `products_order_user_id_dfb540d8_fk_users_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `users_customuser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_order`
--

LOCK TABLES `products_order` WRITE;
/*!40000 ALTER TABLE `products_order` DISABLE KEYS */;
INSERT INTO `products_order` VALUES (812174529904,'2023-12-08 10:36:05.623891','Pending','91efcc9aee614034924b04c70ac0f3d6');
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
  `order_id` bigint NOT NULL,
  `product_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `products_orderitem_order_id_09ecb3c7_fk_products_order_id` (`order_id`),
  KEY `products_orderitem_product_id_60e2b174_fk_products_product_id` (`product_id`),
  CONSTRAINT `products_orderitem_order_id_09ecb3c7_fk_products_order_id` FOREIGN KEY (`order_id`) REFERENCES `products_order` (`id`),
  CONSTRAINT `products_orderitem_product_id_60e2b174_fk_products_product_id` FOREIGN KEY (`product_id`) REFERENCES `products_product` (`id`),
  CONSTRAINT `products_orderitem_chk_1` CHECK ((`quantity` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_orderitem`
--

LOCK TABLES `products_orderitem` WRITE;
/*!40000 ALTER TABLE `products_orderitem` DISABLE KEYS */;
INSERT INTO `products_orderitem` VALUES (694642194199,1,812174529904,394238808810);
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
-- Table structure for table `token_blacklist_blacklistedtoken`
--

DROP TABLE IF EXISTS `token_blacklist_blacklistedtoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `token_blacklist_blacklistedtoken` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `blacklisted_at` datetime(6) NOT NULL,
  `token_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `token_id` (`token_id`),
  CONSTRAINT `token_blacklist_blacklistedtoken_token_id_3cc7fe56_fk` FOREIGN KEY (`token_id`) REFERENCES `token_blacklist_outstandingtoken` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `token_blacklist_outstandingtoken` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `token` longtext NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `expires_at` datetime(6) NOT NULL,
  `user_id` char(32) DEFAULT NULL,
  `jti` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `token_blacklist_outstandingtoken_jti_hex_d9bdf6f7_uniq` (`jti`),
  KEY `token_blacklist_outs_user_id_83bc629a_fk_users_cus` (`user_id`),
  CONSTRAINT `token_blacklist_outs_user_id_83bc629a_fk_users_cus` FOREIGN KEY (`user_id`) REFERENCES `users_customuser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=260 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `token_blacklist_outstandingtoken`
--

LOCK TABLES `token_blacklist_outstandingtoken` WRITE;
/*!40000 ALTER TABLE `token_blacklist_outstandingtoken` DISABLE KEYS */;
/*!40000 ALTER TABLE `token_blacklist_outstandingtoken` ENABLE KEYS */;
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
INSERT INTO `users_customuser` VALUES ('pbkdf2_sha256$390000$JyaqFIcMY4silZIAa9uSm0$ufF5mYWRcZVoTVLCCuvLj/AWYaPrBfGIP1rfFS5Zoik=','2023-12-12 07:04:28.039318',1,'admin','','','aszaslavagutkovski1605@gmail.com',1,1,'2023-10-31 20:29:13.000000','91efcc9aee614034924b04c70ac0f3d6',''),('pbkdf2_sha256$390000$yZOBKROrTvpXpDUuWIcWRI$bAiKRdxyKJAliRx1mGDm8sBu/LbFTFbkDa6hj4Jkbtw=','2023-12-12 07:04:17.000000',0,'slava','','','slava@gmail.com',0,1,'2023-11-18 10:53:14.000000','9ee852f19df9400a9b48cc2ffb89abc6',''),('pbkdf2_sha256$390000$jUFDO3kNwAnBz46OqhwxvP$/0i556HuNgpThyKbYdTJBDC9CSfWSxORG1MxaGlyK5g=',NULL,0,'test','','','test@gmail.com',0,1,'2023-11-18 11:05:48.549159','eef622ee707243b0a2393c8ba3f47940','');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_customuser_groups`
--

LOCK TABLES `users_customuser_groups` WRITE;
/*!40000 ALTER TABLE `users_customuser_groups` DISABLE KEYS */;
INSERT INTO `users_customuser_groups` VALUES (2,'1a36bf0bf49143c8859e28f966dad70f',1);
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

-- Dump completed on 2023-12-12 10:16:12
