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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (2,'Staff');
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
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
INSERT INTO `auth_group_permissions` VALUES (5,2,5),(6,2,6),(7,2,7),(8,2,8),(9,2,9),(10,2,10),(11,2,11),(12,2,12),(13,2,41),(14,2,42),(15,2,43),(16,2,44),(17,2,45),(18,2,46),(19,2,47),(20,2,48),(21,2,49),(22,2,50),(23,2,51),(24,2,52),(25,2,53),(26,2,54),(27,2,55),(28,2,56),(29,2,57),(30,2,58),(31,2,59),(32,2,60);
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
INSERT INTO `auth_permission` VALUES (1,'Can add custom user',1,'add_customuser'),(2,'Can change custom user',1,'change_customuser'),(3,'Can delete custom user',1,'delete_customuser'),(4,'Can view custom user',1,'view_customuser'),(5,'Can add order',2,'add_order'),(6,'Can change order',2,'change_order'),(7,'Can delete order',2,'delete_order'),(8,'Can view order',2,'view_order'),(9,'Can add product',3,'add_product'),(10,'Can change product',3,'change_product'),(11,'Can delete product',3,'delete_product'),(12,'Can view product',3,'view_product'),(13,'Can add log entry',4,'add_logentry'),(14,'Can change log entry',4,'change_logentry'),(15,'Can delete log entry',4,'delete_logentry'),(16,'Can view log entry',4,'view_logentry'),(17,'Can add permission',5,'add_permission'),(18,'Can change permission',5,'change_permission'),(19,'Can delete permission',5,'delete_permission'),(20,'Can view permission',5,'view_permission'),(21,'Can add group',6,'add_group'),(22,'Can change group',6,'change_group'),(23,'Can delete group',6,'delete_group'),(24,'Can view group',6,'view_group'),(25,'Can add content type',7,'add_contenttype'),(26,'Can change content type',7,'change_contenttype'),(27,'Can delete content type',7,'delete_contenttype'),(28,'Can view content type',7,'view_contenttype'),(29,'Can add session',8,'add_session'),(30,'Can change session',8,'change_session'),(31,'Can delete session',8,'delete_session'),(32,'Can view session',8,'view_session'),(33,'Can add Token',9,'add_token'),(34,'Can change Token',9,'change_token'),(35,'Can delete Token',9,'delete_token'),(36,'Can view Token',9,'view_token'),(37,'Can add token',10,'add_tokenproxy'),(38,'Can change token',10,'change_tokenproxy'),(39,'Can delete token',10,'delete_tokenproxy'),(40,'Can view token',10,'view_tokenproxy'),(41,'Can add favorites',11,'add_favorites'),(42,'Can change favorites',11,'change_favorites'),(43,'Can delete favorites',11,'delete_favorites'),(44,'Can view favorites',11,'view_favorites'),(45,'Can add order item',12,'add_orderitem'),(46,'Can change order item',12,'change_orderitem'),(47,'Can delete order item',12,'delete_orderitem'),(48,'Can view order item',12,'view_orderitem'),(49,'Can add favorite',11,'add_favorite'),(50,'Can change favorite',11,'change_favorite'),(51,'Can delete favorite',11,'delete_favorite'),(52,'Can view favorite',11,'view_favorite'),(53,'Can add basket item',13,'add_basketitem'),(54,'Can change basket item',13,'change_basketitem'),(55,'Can delete basket item',13,'delete_basketitem'),(56,'Can view basket item',13,'view_basketitem'),(57,'Can add cart item',13,'add_cartitem'),(58,'Can change cart item',13,'change_cartitem'),(59,'Can delete cart item',13,'delete_cartitem'),(60,'Can view cart item',13,'view_cartitem');
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
  `user_id` bigint NOT NULL,
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
INSERT INTO `authtoken_token` VALUES ('e87ab4e5b962db47985a6dc47fed92644d468b6f','2023-08-12 08:50:05.849587',809101477187);
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
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_users_customuser_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_users_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `users_customuser` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=265 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2023-08-08 19:03:16.777396','823504809116','Product object (823504809116)',3,'',3,809101477187),(2,'2023-08-08 19:03:42.950342','434420581182','Product object (434420581182)',3,'',3,809101477187),(3,'2023-08-08 19:05:02.212560','134691869433','Product object (134691869433)',3,'',3,809101477187),(4,'2023-08-08 19:07:36.551989','362225134044','Product object (362225134044)',3,'',3,809101477187),(5,'2023-08-08 19:08:10.383840','566804380298','Product object (566804380298)',3,'',3,809101477187),(6,'2023-08-08 19:09:21.648668','279631130176','Product object (279631130176)',3,'',3,809101477187),(7,'2023-08-10 11:26:49.541510','900162430751','Product object (900162430751)',3,'',3,809101477187),(8,'2023-08-10 11:26:59.084235','777276588558','Product object (777276588558)',3,'',3,809101477187),(9,'2023-08-10 11:26:59.139080','709352859439','Product object (709352859439)',3,'',3,809101477187),(10,'2023-08-10 11:26:59.139080','671260129140','Product object (671260129140)',3,'',3,809101477187),(11,'2023-08-10 11:26:59.147111','276913517055','Product object (276913517055)',3,'',3,809101477187),(12,'2023-08-10 11:26:59.155183','185531542376','Product object (185531542376)',3,'',3,809101477187),(13,'2023-08-11 17:38:08.009340','801700874927','Product object (801700874927)',3,'',3,809101477187),(14,'2023-08-12 08:56:23.345747','970538965654','Favorite object (970538965654)',3,'',11,809101477187),(15,'2023-08-12 08:56:23.353846','947663583821','Favorite object (947663583821)',3,'',11,809101477187),(16,'2023-08-12 08:56:23.361132','892066644267','Favorite object (892066644267)',3,'',11,809101477187),(17,'2023-08-12 08:56:23.362139','891377857899','Favorite object (891377857899)',3,'',11,809101477187),(18,'2023-08-12 08:56:23.370271','890214773886','Favorite object (890214773886)',3,'',11,809101477187),(19,'2023-08-12 08:56:23.375302','847391101734','Favorite object (847391101734)',3,'',11,809101477187),(20,'2023-08-12 08:56:23.380448','842000628887','Favorite object (842000628887)',3,'',11,809101477187),(21,'2023-08-12 08:56:23.385764','828432046211','Favorite object (828432046211)',3,'',11,809101477187),(22,'2023-08-12 08:56:23.390866','826548677007','Favorite object (826548677007)',3,'',11,809101477187),(23,'2023-08-12 08:56:23.401965','754772159175','Favorite object (754772159175)',3,'',11,809101477187),(24,'2023-08-12 08:56:23.411876','733907989056','Favorite object (733907989056)',3,'',11,809101477187),(25,'2023-08-12 08:56:23.416012','729360838217','Favorite object (729360838217)',3,'',11,809101477187),(26,'2023-08-12 08:56:23.416012','649983129575','Favorite object (649983129575)',3,'',11,809101477187),(27,'2023-08-12 08:56:23.425088','570013853564','Favorite object (570013853564)',3,'',11,809101477187),(28,'2023-08-12 08:56:23.432596','546105881505','Favorite object (546105881505)',3,'',11,809101477187),(29,'2023-08-12 08:56:23.443202','533374421467','Favorite object (533374421467)',3,'',11,809101477187),(30,'2023-08-12 08:56:23.448449','531647139573','Favorite object (531647139573)',3,'',11,809101477187),(31,'2023-08-12 08:56:23.448449','458171241067','Favorite object (458171241067)',3,'',11,809101477187),(32,'2023-08-12 08:56:23.458524','384472621987','Favorite object (384472621987)',3,'',11,809101477187),(33,'2023-08-12 08:56:23.458524','377045603636','Favorite object (377045603636)',3,'',11,809101477187),(34,'2023-08-12 08:56:23.465105','375689725618','Favorite object (375689725618)',3,'',11,809101477187),(35,'2023-08-12 08:56:23.475409','369635223062','Favorite object (369635223062)',3,'',11,809101477187),(36,'2023-08-12 08:56:23.480503','344582673549','Favorite object (344582673549)',3,'',11,809101477187),(37,'2023-08-12 08:56:23.481588','286329396087','Favorite object (286329396087)',3,'',11,809101477187),(38,'2023-08-12 08:56:23.491165','257610032258','Favorite object (257610032258)',3,'',11,809101477187),(39,'2023-08-12 08:56:23.496713','252483493390','Favorite object (252483493390)',3,'',11,809101477187),(40,'2023-08-12 08:56:23.497798','236385092651','Favorite object (236385092651)',3,'',11,809101477187),(41,'2023-08-12 08:56:23.508047','193020327851','Favorite object (193020327851)',3,'',11,809101477187),(42,'2023-08-12 09:05:51.332707','972002148906','Favorite object (972002148906)',3,'',11,809101477187),(43,'2023-08-12 09:05:51.350029','946578449094','Favorite object (946578449094)',3,'',11,809101477187),(44,'2023-08-12 09:05:51.354799','938618533037','Favorite object (938618533037)',3,'',11,809101477187),(45,'2023-08-12 09:05:51.361135','895779875500','Favorite object (895779875500)',3,'',11,809101477187),(46,'2023-08-12 09:05:51.363011','857302540621','Favorite object (857302540621)',3,'',11,809101477187),(47,'2023-08-12 09:05:51.371136','853824501934','Favorite object (853824501934)',3,'',11,809101477187),(48,'2023-08-12 09:05:51.371136','826715665244','Favorite object (826715665244)',3,'',11,809101477187),(49,'2023-08-12 09:05:51.383637','817945820519','Favorite object (817945820519)',3,'',11,809101477187),(50,'2023-08-12 09:05:51.388864','758809015902','Favorite object (758809015902)',3,'',11,809101477187),(51,'2023-08-12 09:05:51.394550','682401744170','Favorite object (682401744170)',3,'',11,809101477187),(52,'2023-08-12 09:05:51.399270','675345867040','Favorite object (675345867040)',3,'',11,809101477187),(53,'2023-08-12 09:05:51.399270','650560497923','Favorite object (650560497923)',3,'',11,809101477187),(54,'2023-08-12 09:05:51.407314','610887542513','Favorite object (610887542513)',3,'',11,809101477187),(55,'2023-08-12 09:05:51.415389','542739888557','Favorite object (542739888557)',3,'',11,809101477187),(56,'2023-08-12 09:05:51.415389','482803533622','Favorite object (482803533622)',3,'',11,809101477187),(57,'2023-08-12 09:05:51.423269','475161087514','Favorite object (475161087514)',3,'',11,809101477187),(58,'2023-08-12 09:05:51.432301','473880710987','Favorite object (473880710987)',3,'',11,809101477187),(59,'2023-08-12 09:05:51.432301','470505201821','Favorite object (470505201821)',3,'',11,809101477187),(60,'2023-08-12 09:05:51.439809','417169805744','Favorite object (417169805744)',3,'',11,809101477187),(61,'2023-08-12 09:05:51.447933','388698309417','Favorite object (388698309417)',3,'',11,809101477187),(62,'2023-08-12 09:05:51.455159','368736416893','Favorite object (368736416893)',3,'',11,809101477187),(63,'2023-08-12 09:05:51.461275','300161692735','Favorite object (300161692735)',3,'',11,809101477187),(64,'2023-08-12 09:05:51.466448','283087826005','Favorite object (283087826005)',3,'',11,809101477187),(65,'2023-08-12 09:05:51.469385','215615710654','Favorite object (215615710654)',3,'',11,809101477187),(66,'2023-08-12 09:05:51.474783','206187376867','Favorite object (206187376867)',3,'',11,809101477187),(67,'2023-08-12 09:05:51.482787','187632738550','Favorite object (187632738550)',3,'',11,809101477187),(68,'2023-08-12 09:05:51.483793','168211629372','Favorite object (168211629372)',3,'',11,809101477187),(69,'2023-08-12 09:30:22.112504','953530568039','Favorite object (953530568039)',3,'',11,809101477187),(70,'2023-08-12 09:30:22.164330','882563943719','Favorite object (882563943719)',3,'',11,809101477187),(71,'2023-08-12 09:30:22.166353','818961744695','Favorite object (818961744695)',3,'',11,809101477187),(72,'2023-08-12 09:30:22.174556','796844213048','Favorite object (796844213048)',3,'',11,809101477187),(73,'2023-08-12 09:30:22.181739','780856444410','Favorite object (780856444410)',3,'',11,809101477187),(74,'2023-08-12 09:30:22.187858','687377821917','Favorite object (687377821917)',3,'',11,809101477187),(75,'2023-08-12 09:30:22.193546','534080242855','Favorite object (534080242855)',3,'',11,809101477187),(76,'2023-08-12 09:30:22.199017','334489910969','Favorite object (334489910969)',3,'',11,809101477187),(77,'2023-08-12 09:30:22.204510','290749883165','Favorite object (290749883165)',3,'',11,809101477187),(78,'2023-08-12 09:30:22.207964','247763868759','Favorite object (247763868759)',3,'',11,809101477187),(79,'2023-08-12 09:30:22.215857','247638206884','Favorite object (247638206884)',3,'',11,809101477187),(80,'2023-08-12 09:33:48.865477','809101477187','admin',2,'[{\"changed\": {\"fields\": [\"Last name\"]}}]',1,809101477187),(81,'2023-08-12 09:34:24.605642','809101477187','admin',2,'[{\"changed\": {\"fields\": [\"Last name\"]}}]',1,809101477187),(82,'2023-08-12 09:35:37.061177','343492366760','Favorite object (343492366760)',3,'',11,809101477187),(83,'2023-08-12 09:35:37.065904','221971041531','Favorite object (221971041531)',3,'',11,809101477187),(84,'2023-08-12 09:35:37.070210','137576867803','Favorite object (137576867803)',3,'',11,809101477187),(85,'2023-08-12 09:40:58.946246','981287557771','Favorite object (981287557771)',3,'',11,809101477187),(86,'2023-08-12 09:40:58.954397','815824501516','Favorite object (815824501516)',3,'',11,809101477187),(87,'2023-08-12 09:40:58.958159','581215933902','Favorite object (581215933902)',3,'',11,809101477187),(88,'2023-08-12 09:40:58.964285','534969710021','Favorite object (534969710021)',3,'',11,809101477187),(89,'2023-08-12 09:40:58.966061','298681004623','Favorite object (298681004623)',3,'',11,809101477187),(90,'2023-08-12 09:40:58.973568','110047521531','Favorite object (110047521531)',3,'',11,809101477187),(91,'2023-08-12 22:32:20.060834','466366285350','test',2,'[{\"changed\": {\"fields\": [\"Staff status\"]}}]',1,809101477187),(92,'2023-08-12 22:32:58.763828','466366285350','test',3,'',1,809101477187),(93,'2023-08-12 22:34:40.124175','958205340348','test',2,'[{\"changed\": {\"fields\": [\"User permissions\", \"Staff status\"]}}]',1,809101477187),(94,'2023-08-12 22:35:48.086797','1','staff',1,'[{\"added\": {}}]',6,809101477187),(95,'2023-08-12 22:36:02.979530','958205340348','test',2,'[{\"changed\": {\"fields\": [\"Groups\"]}}]',1,809101477187),(96,'2023-08-12 22:36:53.238633','958205340348','test',2,'[{\"changed\": {\"fields\": [\"User permissions\"]}}]',1,809101477187),(97,'2023-08-12 22:43:53.527476','958205340348','test',3,'',1,809101477187),(98,'2023-08-12 22:44:13.044627','100000000001','test',1,'[{\"added\": {}}]',1,809101477187),(99,'2023-08-12 22:46:19.791782','100000000001','test',3,'',1,809101477187),(100,'2023-08-13 17:38:17.081064','945565320652','test',3,'',1,809101477187),(101,'2023-08-13 17:38:52.837159','885971857695','BasketItem object (885971857695)',3,'',13,809101477187),(102,'2023-08-13 17:38:52.844159','706406079466','BasketItem object (706406079466)',3,'',13,809101477187),(103,'2023-08-13 17:38:52.847236','201325458839','BasketItem object (201325458839)',3,'',13,809101477187),(104,'2023-08-13 17:41:42.257747','100000000001','test',1,'[{\"added\": {}}]',1,809101477187),(105,'2023-08-14 18:03:11.293692','767694368384','BasketItem object (767694368384)',3,'',13,809101477187),(106,'2023-08-14 18:03:11.300700','700419432589','BasketItem object (700419432589)',3,'',13,809101477187),(107,'2023-08-14 18:03:11.305085','301001162943','BasketItem object (301001162943)',3,'',13,809101477187),(108,'2023-08-14 18:03:23.176678','568752428653','Favorite object (568752428653)',3,'',11,809101477187),(109,'2023-08-14 18:03:23.228099','514555562483','Favorite object (514555562483)',3,'',11,809101477187),(110,'2023-08-14 18:03:23.233369','424203204521','Favorite object (424203204521)',3,'',11,809101477187),(111,'2023-08-14 18:03:23.238680','157877937278','Favorite object (157877937278)',3,'',11,809101477187),(112,'2023-08-14 18:03:23.243280','125817804687','Favorite object (125817804687)',3,'',11,809101477187),(113,'2023-08-14 18:03:33.676751','608817558285','Product object (608817558285)',3,'',3,809101477187),(114,'2023-08-14 18:03:33.728942','548161037429','Product object (548161037429)',3,'',3,809101477187),(115,'2023-08-14 18:03:33.733352','1','Product object (1)',3,'',3,809101477187),(116,'2023-08-14 18:54:29.488639','683460019389','Product object (683460019389)',3,'',3,809101477187),(117,'2023-08-14 18:54:29.542558','375447176777','Product object (375447176777)',3,'',3,809101477187),(118,'2023-08-14 18:54:29.548536','189718542687','Product object (189718542687)',3,'',3,809101477187),(119,'2023-08-14 18:54:29.553820','150499180931','Product object (150499180931)',3,'',3,809101477187),(120,'2023-08-15 10:28:09.343851','1','Product object (1)',3,'',3,809101477187),(121,'2023-08-16 22:01:43.599305','22956feb-0e1e-4451-8f3e-c5a09b01ebe5','Product object (22956feb-0e1e-4451-8f3e-c5a09b01ebe5)',3,'',3,809101477187),(122,'2023-08-18 17:30:46.654488','9ac0df3b-0158-450e-9b2e-6aa0a0f0bd76','Order object (9ac0df3b-0158-450e-9b2e-6aa0a0f0bd76)',3,'',2,809101477187),(123,'2023-08-18 17:30:46.659144','854b5043-59ab-4712-b89a-7b9381c05098','Order object (854b5043-59ab-4712-b89a-7b9381c05098)',3,'',2,809101477187),(124,'2023-08-18 17:30:46.664161','7aac2244-003d-400b-816f-a391be2d219c','Order object (7aac2244-003d-400b-816f-a391be2d219c)',3,'',2,809101477187),(125,'2023-08-18 17:30:46.667359','5df46ff4-c963-45a0-8052-698bc8067510','Order object (5df46ff4-c963-45a0-8052-698bc8067510)',3,'',2,809101477187),(126,'2023-08-18 17:30:46.671821','4756c9ca-bce3-4c8d-aa3b-235fd8a6e1cc','Order object (4756c9ca-bce3-4c8d-aa3b-235fd8a6e1cc)',3,'',2,809101477187),(127,'2023-08-18 17:30:46.676052','422b9fb6-31d4-4582-ab73-6912b900394d','Order object (422b9fb6-31d4-4582-ab73-6912b900394d)',3,'',2,809101477187),(128,'2023-08-18 18:13:00.979780','fb68bc80-c872-405e-ba19-cbce80cad8b0','Order object (fb68bc80-c872-405e-ba19-cbce80cad8b0)',3,'',2,809101477187),(129,'2023-08-18 18:13:00.986083','fb0687cd-8c8e-4844-926c-e2c796f9a7a6','Order object (fb0687cd-8c8e-4844-926c-e2c796f9a7a6)',3,'',2,809101477187),(130,'2023-08-18 18:13:00.989826','f48c4c16-3f76-458c-931b-b9c767c74645','Order object (f48c4c16-3f76-458c-931b-b9c767c74645)',3,'',2,809101477187),(131,'2023-08-18 18:13:00.993695','e52b7a9a-b0e8-4608-acf0-d0374f717234','Order object (e52b7a9a-b0e8-4608-acf0-d0374f717234)',3,'',2,809101477187),(132,'2023-08-18 18:13:00.998202','a41d19c7-1a58-4db3-a680-66730c6c5ae6','Order object (a41d19c7-1a58-4db3-a680-66730c6c5ae6)',3,'',2,809101477187),(133,'2023-08-18 18:13:01.002064','9816ad36-28ea-4fd9-b583-501489d90770','Order object (9816ad36-28ea-4fd9-b583-501489d90770)',3,'',2,809101477187),(134,'2023-08-18 18:13:01.005285','80d94e3c-6f30-41e4-8607-48ba3d4babc4','Order object (80d94e3c-6f30-41e4-8607-48ba3d4babc4)',3,'',2,809101477187),(135,'2023-08-18 18:13:01.009318','6b642f18-0950-4855-8761-cb3ee3da41b5','Order object (6b642f18-0950-4855-8761-cb3ee3da41b5)',3,'',2,809101477187),(136,'2023-08-18 18:13:01.012270','6631f70a-dbcb-420d-ac52-3729b2afc58a','Order object (6631f70a-dbcb-420d-ac52-3729b2afc58a)',3,'',2,809101477187),(137,'2023-08-18 18:13:01.015933','4df870a3-2cb6-4d29-8e88-b013f5dbcc7b','Order object (4df870a3-2cb6-4d29-8e88-b013f5dbcc7b)',3,'',2,809101477187),(138,'2023-08-18 18:13:01.019437','48c64bbb-9744-4c0b-b575-01c57f0a7d8b','Order object (48c64bbb-9744-4c0b-b575-01c57f0a7d8b)',3,'',2,809101477187),(139,'2023-08-18 18:13:01.022559','3718e3e8-ca97-4545-8c2a-7a91c5c38682','Order object (3718e3e8-ca97-4545-8c2a-7a91c5c38682)',3,'',2,809101477187),(140,'2023-08-18 18:13:01.026964','044c9a70-ae5f-434f-99ed-fbf70faa37de','Order object (044c9a70-ae5f-434f-99ed-fbf70faa37de)',3,'',2,809101477187),(141,'2023-08-18 18:30:46.823893','fec02f30-6bcb-49c3-a1f2-c27d2500fe5e','Order object (fec02f30-6bcb-49c3-a1f2-c27d2500fe5e)',3,'',2,809101477187),(142,'2023-08-18 18:30:46.829433','ef547933-f633-4c44-8a71-9669dfc99f67','Order object (ef547933-f633-4c44-8a71-9669dfc99f67)',3,'',2,809101477187),(143,'2023-08-18 18:30:46.832876','dbc2ddee-adcc-4c1e-bc55-d13ad2933c57','Order object (dbc2ddee-adcc-4c1e-bc55-d13ad2933c57)',3,'',2,809101477187),(144,'2023-08-18 18:30:46.837116','cc2f26e5-90b5-4e0b-94f7-50373aca6de3','Order object (cc2f26e5-90b5-4e0b-94f7-50373aca6de3)',3,'',2,809101477187),(145,'2023-08-18 18:30:46.841061','c985eebf-56ae-4ef9-ac74-a79318ab9eab','Order object (c985eebf-56ae-4ef9-ac74-a79318ab9eab)',3,'',2,809101477187),(146,'2023-08-18 18:30:46.844069','be8f3caf-f5a0-4f20-9621-0247cf7b67cd','Order object (be8f3caf-f5a0-4f20-9621-0247cf7b67cd)',3,'',2,809101477187),(147,'2023-08-18 18:30:46.848097','8635c268-a676-495b-b8c6-476616378cff','Order object (8635c268-a676-495b-b8c6-476616378cff)',3,'',2,809101477187),(148,'2023-08-18 18:30:46.852321','7dd85b0b-870a-4b58-9ef9-0a8fe9ac40e2','Order object (7dd85b0b-870a-4b58-9ef9-0a8fe9ac40e2)',3,'',2,809101477187),(149,'2023-08-18 18:30:46.856022','6b46cc31-563c-4f07-86ba-6b4b35b83962','Order object (6b46cc31-563c-4f07-86ba-6b4b35b83962)',3,'',2,809101477187),(150,'2023-08-18 18:30:46.859542','5fcfa857-5e30-4964-86bb-366663e8beec','Order object (5fcfa857-5e30-4964-86bb-366663e8beec)',3,'',2,809101477187),(151,'2023-08-18 18:30:46.863529','548ac43f-c16f-445b-b3a6-a3eae19e4f2f','Order object (548ac43f-c16f-445b-b3a6-a3eae19e4f2f)',3,'',2,809101477187),(152,'2023-08-18 18:30:46.866661','43c463d5-8a50-4aa3-872d-d1b23c057421','Order object (43c463d5-8a50-4aa3-872d-d1b23c057421)',3,'',2,809101477187),(153,'2023-08-18 18:30:46.871181','3f79717a-cf23-4c61-8600-52d7a46f1914','Order object (3f79717a-cf23-4c61-8600-52d7a46f1914)',3,'',2,809101477187),(154,'2023-08-18 18:30:46.878415','24a93e18-b734-4c36-a24f-590b486a7de2','Order object (24a93e18-b734-4c36-a24f-590b486a7de2)',3,'',2,809101477187),(155,'2023-08-18 18:30:46.882594','11895cb2-025a-48e2-a10e-52a2182bd981','Order object (11895cb2-025a-48e2-a10e-52a2182bd981)',3,'',2,809101477187),(156,'2023-08-18 18:30:46.885901','04c453a8-f0e7-4f02-8393-2c22bac991c6','Order object (04c453a8-f0e7-4f02-8393-2c22bac991c6)',3,'',2,809101477187),(157,'2023-08-20 12:06:11.745556','bbbdbce4-24d7-4bf7-9107-5f827b71cf53','Order object (bbbdbce4-24d7-4bf7-9107-5f827b71cf53)',3,'',2,809101477187),(158,'2023-08-20 12:06:11.752730','b22a0350-1d1b-4699-b1c3-fb2ecf804321','Order object (b22a0350-1d1b-4699-b1c3-fb2ecf804321)',3,'',2,809101477187),(159,'2023-08-20 12:10:35.968664','c6a7e23a-bb8a-4d4c-a486-3dd0201d6423','Order object (c6a7e23a-bb8a-4d4c-a486-3dd0201d6423)',3,'',2,809101477187),(160,'2023-08-20 12:10:35.977834','6ae2bfc3-238b-4aa9-9506-cc0182e48e0d','Order object (6ae2bfc3-238b-4aa9-9506-cc0182e48e0d)',3,'',2,809101477187),(161,'2023-08-20 12:10:35.978838','6227e2d3-f5be-4d49-9d25-68f08b51b492','Order object (6227e2d3-f5be-4d49-9d25-68f08b51b492)',3,'',2,809101477187),(162,'2023-08-20 12:10:35.985687','4e302115-b419-4b4e-87c7-3272bfa7f440','Order object (4e302115-b419-4b4e-87c7-3272bfa7f440)',3,'',2,809101477187),(163,'2023-08-20 12:10:35.988698','44ce5c5e-63e5-4c04-b400-2d7b18e95eeb','Order object (44ce5c5e-63e5-4c04-b400-2d7b18e95eeb)',3,'',2,809101477187),(164,'2023-08-20 12:10:35.993714','29678f7f-1771-475d-be57-77770e78e58a','Order object (29678f7f-1771-475d-be57-77770e78e58a)',3,'',2,809101477187),(165,'2023-08-20 12:10:36.001884','1b49d6cd-75d5-4bef-a91d-10709b304736','Order object (1b49d6cd-75d5-4bef-a91d-10709b304736)',3,'',2,809101477187),(166,'2023-08-20 12:10:36.001884','16eb489d-afc7-4dec-be13-a648d311f944','Order object (16eb489d-afc7-4dec-be13-a648d311f944)',3,'',2,809101477187),(167,'2023-08-20 12:13:28.111242','1aeae829-4944-4dd5-a9fd-499339b25f7a','CartItem object (1aeae829-4944-4dd5-a9fd-499339b25f7a)',1,'[{\"added\": {}}]',13,809101477187),(168,'2023-08-20 12:20:05.850222','e98c9da1-5c05-4325-93d0-89fc3aca23c5','Order object (e98c9da1-5c05-4325-93d0-89fc3aca23c5)',3,'',2,809101477187),(169,'2023-08-20 12:20:05.854901','de8599dc-1a59-487e-bd61-6452dc9b8b99','Order object (de8599dc-1a59-487e-bd61-6452dc9b8b99)',3,'',2,809101477187),(170,'2023-08-20 12:20:05.858699','a1856d6e-8090-410f-90c2-da7b91ec781b','Order object (a1856d6e-8090-410f-90c2-da7b91ec781b)',3,'',2,809101477187),(171,'2023-08-20 12:20:05.863632','9372a123-98b4-4072-a635-6c3ec1733256','Order object (9372a123-98b4-4072-a635-6c3ec1733256)',3,'',2,809101477187),(172,'2023-08-20 12:20:05.868242','7593ce04-f302-4ed4-b84c-06a62bc551e8','Order object (7593ce04-f302-4ed4-b84c-06a62bc551e8)',3,'',2,809101477187),(173,'2023-08-20 12:20:05.873152','645faabe-8680-4307-a643-be38c80251ab','Order object (645faabe-8680-4307-a643-be38c80251ab)',3,'',2,809101477187),(174,'2023-08-20 12:20:05.879083','5eadcce1-fc3b-432b-8419-bf039b98d961','Order object (5eadcce1-fc3b-432b-8419-bf039b98d961)',3,'',2,809101477187),(175,'2023-08-20 12:20:05.884222','5d2c7d2f-548d-412e-beef-4c3e3f8291be','Order object (5d2c7d2f-548d-412e-beef-4c3e3f8291be)',3,'',2,809101477187),(176,'2023-08-20 12:20:05.888999','516514af-31e6-4c60-b280-10624ffc8276','Order object (516514af-31e6-4c60-b280-10624ffc8276)',3,'',2,809101477187),(177,'2023-08-20 12:20:05.892383','4dfea874-55ba-4f6f-83b4-12f8b8ecac46','Order object (4dfea874-55ba-4f6f-83b4-12f8b8ecac46)',3,'',2,809101477187),(178,'2023-08-20 12:20:05.896908','4c69cf23-922d-4fe8-9555-a4d5e13b746b','Order object (4c69cf23-922d-4fe8-9555-a4d5e13b746b)',3,'',2,809101477187),(179,'2023-08-20 12:20:05.901900','1fe9c898-a281-4899-86b7-f16425ff0008','Order object (1fe9c898-a281-4899-86b7-f16425ff0008)',3,'',2,809101477187),(180,'2023-08-20 12:30:03.308299','dff9e826-1cbe-4213-9f94-4452ff5567d6','Order object (dff9e826-1cbe-4213-9f94-4452ff5567d6)',3,'',2,809101477187),(181,'2023-08-20 12:30:03.315628','d85bf714-e2dd-4c75-999e-5a77e8e9f727','Order object (d85bf714-e2dd-4c75-999e-5a77e8e9f727)',3,'',2,809101477187),(182,'2023-08-20 12:30:03.320845','c2240b75-4efc-49a0-b6b1-8a94075999b0','Order object (c2240b75-4efc-49a0-b6b1-8a94075999b0)',3,'',2,809101477187),(183,'2023-08-20 12:30:03.324885','a2c923f5-dd7c-4ea3-b76f-68953695518d','Order object (a2c923f5-dd7c-4ea3-b76f-68953695518d)',3,'',2,809101477187),(184,'2023-08-20 12:30:03.329512','92028058-3e06-42a4-8835-fec7a9c212e9','Order object (92028058-3e06-42a4-8835-fec7a9c212e9)',3,'',2,809101477187),(185,'2023-08-20 12:30:03.333660','825eb52d-9a7a-403e-b885-246aeaab3e70','Order object (825eb52d-9a7a-403e-b885-246aeaab3e70)',3,'',2,809101477187),(186,'2023-08-20 12:30:03.337592','7fbc7a0f-7c8d-4794-b5b8-edfafc98f0a5','Order object (7fbc7a0f-7c8d-4794-b5b8-edfafc98f0a5)',3,'',2,809101477187),(187,'2023-08-20 12:30:03.342481','3301cf01-d7d2-46b4-aecb-75a720dc6d55','Order object (3301cf01-d7d2-46b4-aecb-75a720dc6d55)',3,'',2,809101477187),(188,'2023-08-20 12:50:50.066775','e6343f4b-52ad-4682-a1a9-21285569a454','Order object (e6343f4b-52ad-4682-a1a9-21285569a454)',3,'',2,809101477187),(189,'2023-08-20 12:50:50.071484','d508dc17-a326-47f8-bc67-bfa358f335d5','Order object (d508dc17-a326-47f8-bc67-bfa358f335d5)',3,'',2,809101477187),(190,'2023-08-20 12:50:50.075499','6078d04d-d659-4c99-ba59-346c0829c9a6','Order object (6078d04d-d659-4c99-ba59-346c0829c9a6)',3,'',2,809101477187),(191,'2023-08-20 12:50:50.079964','3fa4e9ed-59b8-429d-8df0-98813232ad0e','Order object (3fa4e9ed-59b8-429d-8df0-98813232ad0e)',3,'',2,809101477187),(192,'2023-08-20 12:50:50.089229','133e0640-110c-4d16-ad12-440537e7f3db','Order object (133e0640-110c-4d16-ad12-440537e7f3db)',3,'',2,809101477187),(193,'2023-08-20 12:50:50.093973','048afe3e-018e-4d57-a632-ff3cb2dbe8df','Order object (048afe3e-018e-4d57-a632-ff3cb2dbe8df)',3,'',2,809101477187),(194,'2023-08-20 12:51:28.282827','aa3778d6-4046-4bd1-bc86-91403a5f7741','Order object (aa3778d6-4046-4bd1-bc86-91403a5f7741)',3,'',2,809101477187),(195,'2023-08-20 12:51:28.288971','9173f5ec-65e6-4317-bb7f-5f9f3f2789ee','Order object (9173f5ec-65e6-4317-bb7f-5f9f3f2789ee)',3,'',2,809101477187),(196,'2023-08-20 12:51:28.293304','5bcd02ef-dcec-4e45-9983-c459182c4264','Order object (5bcd02ef-dcec-4e45-9983-c459182c4264)',3,'',2,809101477187),(197,'2023-08-20 12:51:28.298197','03c60daa-cc96-4a55-89fe-d83b419fcdaf','Order object (03c60daa-cc96-4a55-89fe-d83b419fcdaf)',3,'',2,809101477187),(198,'2023-08-20 12:55:24.687440','f96c65ba-ae6d-42af-9007-7ba0f15ef299','Favorite object (f96c65ba-ae6d-42af-9007-7ba0f15ef299)',3,'',11,809101477187),(199,'2023-08-20 12:55:24.693004','dc8e088f-0ec6-4ac7-9cfa-4a5e01f5bf71','Favorite object (dc8e088f-0ec6-4ac7-9cfa-4a5e01f5bf71)',3,'',11,809101477187),(200,'2023-08-20 12:55:24.698026','caa6ef72-91b6-4973-92d4-e3357dd4bb6e','Favorite object (caa6ef72-91b6-4973-92d4-e3357dd4bb6e)',3,'',11,809101477187),(201,'2023-08-20 12:55:24.702208','bf429f59-5d6c-42c5-badc-6f38c758cc19','Favorite object (bf429f59-5d6c-42c5-badc-6f38c758cc19)',3,'',11,809101477187),(202,'2023-08-20 12:55:24.706256','903a738a-6805-45c1-9c13-8155794095fe','Favorite object (903a738a-6805-45c1-9c13-8155794095fe)',3,'',11,809101477187),(203,'2023-08-20 12:55:24.710243','8fe37a44-191b-43fd-83dc-7b8b5ef82233','Favorite object (8fe37a44-191b-43fd-83dc-7b8b5ef82233)',3,'',11,809101477187),(204,'2023-08-20 12:55:24.714333','8d713cb6-1bce-4e82-88c2-99c01374ecd7','Favorite object (8d713cb6-1bce-4e82-88c2-99c01374ecd7)',3,'',11,809101477187),(205,'2023-08-20 12:55:24.722679','4556869e-c3bf-45dd-93ae-63807ee0ded3','Favorite object (4556869e-c3bf-45dd-93ae-63807ee0ded3)',3,'',11,809101477187),(206,'2023-08-20 12:55:24.727213','12c70abb-bc90-48a4-a056-b453970c2b9c','Favorite object (12c70abb-bc90-48a4-a056-b453970c2b9c)',3,'',11,809101477187),(207,'2023-08-20 12:55:34.850732','b89c0d07-78e4-4320-82a0-93c094b5527d','CartItem object (b89c0d07-78e4-4320-82a0-93c094b5527d)',3,'',13,809101477187),(208,'2023-08-20 12:55:34.855246','1aeae829-4944-4dd5-a9fd-499339b25f7a','CartItem object (1aeae829-4944-4dd5-a9fd-499339b25f7a)',3,'',13,809101477187),(209,'2023-08-20 12:55:34.859566','0040152d-8d8e-4b16-bafa-fa990373f8c2','CartItem object (0040152d-8d8e-4b16-bafa-fa990373f8c2)',3,'',13,809101477187),(210,'2023-08-20 13:02:09.281934','2a27beb8-7719-43d4-a801-388bec6c6b87','CartItem object (2a27beb8-7719-43d4-a801-388bec6c6b87)',3,'',13,809101477187),(211,'2023-08-20 13:02:16.223862','d75b5b34-1eea-4b4a-819f-ffee3b772de2','CartItem object (d75b5b34-1eea-4b4a-819f-ffee3b772de2)',1,'[{\"added\": {}}]',13,809101477187),(212,'2023-08-20 13:05:06.693567','eff3e312-40fc-4455-8520-c3d3380b427c','Order object (eff3e312-40fc-4455-8520-c3d3380b427c)',3,'',2,809101477187),(213,'2023-08-20 13:05:06.699847','e82eb767-4d02-41ff-a90b-e6c719ccf2be','Order object (e82eb767-4d02-41ff-a90b-e6c719ccf2be)',3,'',2,809101477187),(214,'2023-08-20 13:05:06.703619','47c352dc-58d2-427a-be4e-cc891525e43b','Order object (47c352dc-58d2-427a-be4e-cc891525e43b)',3,'',2,809101477187),(215,'2023-08-20 13:05:06.707807','0a561864-02ab-42b5-a386-07c7271ee4ea','Order object (0a561864-02ab-42b5-a386-07c7271ee4ea)',3,'',2,809101477187),(216,'2023-08-20 13:30:28.028536','fbee5028-be1e-4aa2-b803-411de246595f','Order object (fbee5028-be1e-4aa2-b803-411de246595f)',3,'',2,809101477187),(217,'2023-08-20 13:30:28.032848','82e6fa3f-1428-49b7-b4c0-b739398ef3df','Order object (82e6fa3f-1428-49b7-b4c0-b739398ef3df)',3,'',2,809101477187),(218,'2023-08-20 13:30:28.036785','07ecd17b-46ca-4e50-9f4c-00aec6b41a75','Order object (07ecd17b-46ca-4e50-9f4c-00aec6b41a75)',3,'',2,809101477187),(219,'2023-08-20 13:30:28.039711','010d44be-bf13-4da4-b1d7-a2c7dfd7e23c','Order object (010d44be-bf13-4da4-b1d7-a2c7dfd7e23c)',3,'',2,809101477187),(220,'2023-08-20 13:37:28.751626','0bd021b4-c0ea-488c-8c6c-abe2c4b67e6d','Order object (0bd021b4-c0ea-488c-8c6c-abe2c4b67e6d)',3,'',2,809101477187),(221,'2023-08-20 19:24:18.767712','cbfa44f4-4615-4e04-92f3-3cb9922c1955','Product object (cbfa44f4-4615-4e04-92f3-3cb9922c1955)',3,'',3,809101477187),(222,'2023-08-20 19:59:01.374079','bd091229-1d6c-43f5-97af-2f5f00daeb67','Product object (bd091229-1d6c-43f5-97af-2f5f00daeb67)',1,'[{\"added\": {}}]',3,809101477187),(223,'2023-08-20 20:11:56.739876','4b8b926e-ac9c-4539-9477-17746b5d160b','Product object (4b8b926e-ac9c-4539-9477-17746b5d160b)',3,'',3,809101477187),(224,'2023-08-20 20:58:32.415970','f542f4e1-86b6-49c7-8eb1-4faaec760e74','Favorite object (f542f4e1-86b6-49c7-8eb1-4faaec760e74)',3,'',11,809101477187),(225,'2023-08-24 19:33:08.856390','1','staff',3,'',6,809101477187),(226,'2023-08-24 19:33:50.942828','2','Staff',1,'[{\"added\": {}}]',6,809101477187),(227,'2023-08-24 19:35:13.755750','131234325231','staff',1,'[{\"added\": {}}]',1,809101477187),(228,'2023-08-24 19:37:19.393969','3','1',1,'[{\"added\": {}}]',6,809101477187),(229,'2023-08-24 19:37:34.879602','3','1',3,'',6,809101477187),(230,'2023-08-24 21:48:50.386990','d770b562-12e0-4ba9-b581-d2531e2354b3','Product object (d770b562-12e0-4ba9-b581-d2531e2354b3)',3,'',3,809101477187),(231,'2023-08-24 21:48:50.393984','564c743f-2ef6-4356-99ca-fd71b0a4a4a1','Product object (564c743f-2ef6-4356-99ca-fd71b0a4a4a1)',3,'',3,809101477187),(232,'2023-08-24 23:53:28.053503','239c0a69-37b6-48cd-89ae-5192e731ee35','Product object (239c0a69-37b6-48cd-89ae-5192e731ee35)',3,'',3,809101477187),(233,'2023-08-25 22:22:03.366103','131234325231','staff',3,'',1,809101477187),(234,'2023-09-06 07:59:04.110078','fc9bcff5-951a-45fa-a092-9a068458d9b0','Product object (fc9bcff5-951a-45fa-a092-9a068458d9b0)',2,'[{\"changed\": {\"fields\": [\"Description\", \"Content\", \"Image\"]}}]',3,809101477187),(235,'2023-09-06 07:59:13.218114','c5200d85-a4a2-4ef5-9b5a-ad7efef119f8','Product object (c5200d85-a4a2-4ef5-9b5a-ad7efef119f8)',2,'[{\"changed\": {\"fields\": [\"Description\"]}}]',3,809101477187),(236,'2023-09-06 07:59:21.461704','c5200d85-a4a2-4ef5-9b5a-ad7efef119f8','Product object (c5200d85-a4a2-4ef5-9b5a-ad7efef119f8)',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',3,809101477187),(237,'2023-09-06 07:59:26.218672','b912365d-071b-48a2-84d7-7e9157630450','Product object (b912365d-071b-48a2-84d7-7e9157630450)',2,'[]',3,809101477187),(238,'2023-09-06 08:00:02.997297','b912365d-071b-48a2-84d7-7e9157630450','Product object (b912365d-071b-48a2-84d7-7e9157630450)',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',3,809101477187),(239,'2023-09-06 08:00:12.627518','b8b02405-8720-4b1a-a1ef-7a60baad230c','Product object (b8b02405-8720-4b1a-a1ef-7a60baad230c)',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',3,809101477187),(240,'2023-09-06 08:00:18.002623','a88633db-7982-4f53-a7f0-9ab8c654f072','Product object (a88633db-7982-4f53-a7f0-9ab8c654f072)',2,'[]',3,809101477187),(241,'2023-09-06 08:00:27.324069','a88633db-7982-4f53-a7f0-9ab8c654f072','Product object (a88633db-7982-4f53-a7f0-9ab8c654f072)',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',3,809101477187),(242,'2023-09-06 08:00:37.188636','9256ad9e-bb55-4ff2-a922-f32523d564d0','Product object (9256ad9e-bb55-4ff2-a922-f32523d564d0)',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',3,809101477187),(243,'2023-09-06 08:00:45.623721','82842b44-69be-4e32-bd16-acdf4912a6f9','Product object (82842b44-69be-4e32-bd16-acdf4912a6f9)',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',3,809101477187),(244,'2023-09-06 08:01:15.866302','7ad32f1d-11b3-4cf6-90e3-5e88980eff1c','Product object (7ad32f1d-11b3-4cf6-90e3-5e88980eff1c)',2,'[{\"changed\": {\"fields\": [\"Description\", \"Image\"]}}]',3,809101477187),(245,'2023-09-06 08:01:23.892443','76fa16c5-b57c-4279-a2e9-87f56fad1537','Product object (76fa16c5-b57c-4279-a2e9-87f56fad1537)',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',3,809101477187),(246,'2023-09-06 08:01:32.287354','73c10d4a-dbd3-4f76-b75c-70c52da72ad4','Product object (73c10d4a-dbd3-4f76-b75c-70c52da72ad4)',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',3,809101477187),(247,'2023-09-06 08:02:04.406860','712bea9c-3a3b-45bf-ad52-485f1fa85ac8','Product object (712bea9c-3a3b-45bf-ad52-485f1fa85ac8)',2,'[{\"changed\": {\"fields\": [\"Description\", \"Image\"]}}]',3,809101477187),(248,'2023-09-06 08:02:18.439055','61933e5e-4052-45c9-b2ef-b746c955dd7d','Product object (61933e5e-4052-45c9-b2ef-b746c955dd7d)',2,'[{\"changed\": {\"fields\": [\"Description\", \"Image\"]}}]',3,809101477187),(249,'2023-09-06 08:02:29.730678','3e542573-038a-440b-a064-3a8746e8e01d','Product object (3e542573-038a-440b-a064-3a8746e8e01d)',2,'[{\"changed\": {\"fields\": [\"Description\", \"Image\"]}}]',3,809101477187),(250,'2023-09-06 08:02:42.607434','2de3c72a-62ec-4190-92cb-1a0d567805ff','Product object (2de3c72a-62ec-4190-92cb-1a0d567805ff)',2,'[{\"changed\": {\"fields\": [\"Description\", \"Image\"]}}]',3,809101477187),(251,'2023-09-06 08:03:02.132623','2495de94-9067-4e5a-9730-66ebd6bad3f3','Product object (2495de94-9067-4e5a-9730-66ebd6bad3f3)',2,'[{\"changed\": {\"fields\": [\"Description\", \"Image\"]}}]',3,809101477187),(252,'2023-09-06 08:03:13.313617','1f0409c9-8b3f-43a2-8c83-4449eea14c2d','Product object (1f0409c9-8b3f-43a2-8c83-4449eea14c2d)',2,'[{\"changed\": {\"fields\": [\"Description\", \"Image\"]}}]',3,809101477187),(253,'2023-09-06 08:03:25.807794','16cee55c-bd41-42b5-acb3-4bea97457b22','Product object (16cee55c-bd41-42b5-acb3-4bea97457b22)',2,'[{\"changed\": {\"fields\": [\"Description\", \"Content\", \"Image\"]}}]',3,809101477187),(254,'2023-09-06 08:12:11.939651','fc9bcff5-951a-45fa-a092-9a068458d9b0','Product object (fc9bcff5-951a-45fa-a092-9a068458d9b0)',2,'[{\"changed\": {\"fields\": [\"Description\", \"Content\"]}}]',3,809101477187),(255,'2023-09-06 08:13:11.341740','c5200d85-a4a2-4ef5-9b5a-ad7efef119f8','Product object (c5200d85-a4a2-4ef5-9b5a-ad7efef119f8)',2,'[{\"changed\": {\"fields\": [\"Description\", \"Content\"]}}]',3,809101477187),(256,'2023-09-06 08:13:32.438624','b912365d-071b-48a2-84d7-7e9157630450','Product object (b912365d-071b-48a2-84d7-7e9157630450)',2,'[{\"changed\": {\"fields\": [\"Description\", \"Content\"]}}]',3,809101477187),(257,'2023-09-06 08:14:13.809016','7ad32f1d-11b3-4cf6-90e3-5e88980eff1c','Product object (7ad32f1d-11b3-4cf6-90e3-5e88980eff1c)',2,'[{\"changed\": {\"fields\": [\"Description\", \"Content\"]}}]',3,809101477187),(258,'2023-09-06 08:14:54.368563','712bea9c-3a3b-45bf-ad52-485f1fa85ac8','Product object (712bea9c-3a3b-45bf-ad52-485f1fa85ac8)',2,'[{\"changed\": {\"fields\": [\"Description\", \"Content\"]}}]',3,809101477187),(259,'2023-09-06 08:15:38.558023','61933e5e-4052-45c9-b2ef-b746c955dd7d','Product object (61933e5e-4052-45c9-b2ef-b746c955dd7d)',2,'[{\"changed\": {\"fields\": [\"Description\", \"Content\"]}}]',3,809101477187),(260,'2023-09-06 08:16:03.591164','3e542573-038a-440b-a064-3a8746e8e01d','Product object (3e542573-038a-440b-a064-3a8746e8e01d)',2,'[{\"changed\": {\"fields\": [\"Description\", \"Content\"]}}]',3,809101477187),(261,'2023-09-06 08:16:27.276364','2de3c72a-62ec-4190-92cb-1a0d567805ff','Product object (2de3c72a-62ec-4190-92cb-1a0d567805ff)',2,'[{\"changed\": {\"fields\": [\"Description\", \"Content\"]}}]',3,809101477187),(262,'2023-09-06 08:16:51.080347','2495de94-9067-4e5a-9730-66ebd6bad3f3','Product object (2495de94-9067-4e5a-9730-66ebd6bad3f3)',2,'[{\"changed\": {\"fields\": [\"Description\", \"Content\"]}}]',3,809101477187),(263,'2023-09-06 08:17:19.900821','1f0409c9-8b3f-43a2-8c83-4449eea14c2d','Product object (1f0409c9-8b3f-43a2-8c83-4449eea14c2d)',2,'[{\"changed\": {\"fields\": [\"Description\", \"Content\"]}}]',3,809101477187),(264,'2023-09-06 08:17:45.836846','16cee55c-bd41-42b5-acb3-4bea97457b22','Product object (16cee55c-bd41-42b5-acb3-4bea97457b22)',2,'[{\"changed\": {\"fields\": [\"Description\", \"Content\"]}}]',3,809101477187);
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
INSERT INTO `django_content_type` VALUES (4,'admin','logentry'),(6,'auth','group'),(5,'auth','permission'),(9,'authtoken','token'),(10,'authtoken','tokenproxy'),(7,'contenttypes','contenttype'),(13,'products','cartitem'),(11,'products','favorite'),(2,'products','order'),(12,'products','orderitem'),(3,'products','product'),(8,'sessions','session'),(1,'users','customuser');
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
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2023-08-08 15:40:26.063177'),(2,'contenttypes','0002_remove_content_type_name','2023-08-08 15:40:26.110092'),(3,'auth','0001_initial','2023-08-08 15:40:26.326328'),(4,'auth','0002_alter_permission_name_max_length','2023-08-08 15:40:26.364747'),(5,'auth','0003_alter_user_email_max_length','2023-08-08 15:40:26.373052'),(6,'auth','0004_alter_user_username_opts','2023-08-08 15:40:26.381474'),(7,'auth','0005_alter_user_last_login_null','2023-08-08 15:40:26.390127'),(8,'auth','0006_require_contenttypes_0002','2023-08-08 15:40:26.394388'),(9,'auth','0007_alter_validators_add_error_messages','2023-08-08 15:40:26.402888'),(10,'auth','0008_alter_user_username_max_length','2023-08-08 15:40:26.411085'),(11,'auth','0009_alter_user_last_name_max_length','2023-08-08 15:40:26.419265'),(12,'auth','0010_alter_group_name_max_length','2023-08-08 15:40:26.439749'),(13,'auth','0011_update_proxy_permissions','2023-08-08 15:40:26.447880'),(14,'auth','0012_alter_user_first_name_max_length','2023-08-08 15:40:26.456245'),(15,'users','0001_initial','2023-08-08 15:40:26.747974'),(16,'admin','0001_initial','2023-08-08 15:40:27.004122'),(17,'admin','0002_logentry_remove_auto_add','2023-08-08 15:40:27.017026'),(18,'admin','0003_logentry_add_action_flag_choices','2023-08-08 15:40:27.025045'),(19,'products','0001_initial','2023-08-08 15:40:27.073751'),(20,'sessions','0001_initial','2023-08-08 15:40:27.110990'),(21,'authtoken','0001_initial','2023-08-08 15:48:07.152139'),(22,'authtoken','0002_auto_20160226_1747','2023-08-08 15:48:07.172881'),(23,'authtoken','0003_tokenproxy','2023-08-08 15:48:07.176898'),(24,'products','0002_alter_product_what_product','2023-08-08 19:21:09.909143'),(25,'products','0003_alter_product_what_product','2023-08-08 19:22:11.639620'),(26,'products','0004_order_customer','2023-08-10 11:30:45.023948'),(27,'products','0005_alter_order_customer','2023-08-10 11:30:57.487172'),(28,'products','0006_rename_customer_order_customer_id','2023-08-10 11:32:18.486358'),(29,'products','0007_favorites','2023-08-10 11:32:42.740546'),(30,'products','0008_rename_product_favorites_product_id_and_more','2023-08-10 11:33:42.696889'),(31,'products','0009_rename_product_id_favorites_product_and_more','2023-08-10 11:34:25.036398'),(32,'products','0010_order_product','2023-08-10 11:35:36.349698'),(33,'products','0011_alter_order_product','2023-08-10 11:35:44.069557'),(34,'products','0012_remove_order_price_remove_order_product_orderitem','2023-08-10 20:24:38.017426'),(35,'products','0013_alter_favorites_product','2023-08-11 08:57:54.589434'),(36,'products','0014_alter_orderitem_quantity','2023-08-11 08:57:54.604611'),(37,'products','0015_alter_favorites_user','2023-08-11 08:58:59.464794'),(38,'products','0016_rename_favorites_favorite','2023-08-11 09:03:20.639043'),(39,'products','0017_basketitem','2023-08-12 22:10:06.503608'),(40,'products','0018_alter_product_what_product','2023-08-14 17:54:52.994208'),(41,'users','0002_customuser_profile_picture','2023-08-14 17:59:40.767333'),(42,'products','0019_alter_product_what_product','2023-08-14 18:13:49.483829'),(43,'products','0020_alter_product_what_product','2023-08-14 18:14:58.058566'),(44,'products','0021_alter_product_what_product','2023-08-14 18:15:08.134917'),(45,'products','0022_alter_product_what_product','2023-08-14 18:23:34.639347'),(46,'products','0023_alter_product_what_product','2023-08-14 18:28:03.420750'),(47,'products','0024_alter_product_what_product','2023-08-14 18:38:14.198550'),(48,'products','0025_rename_what_product_product_category','2023-08-14 18:39:39.078951'),(49,'products','0026_alter_product_category','2023-08-14 19:02:21.942584'),(50,'products','0027_alter_product_category_alter_product_id','2023-08-15 10:30:24.781615'),(51,'products','0028_alter_basketitem_id_alter_favorite_id_alter_order_id_and_more','2023-08-15 10:47:05.765374'),(52,'products','0029_rename_basketitem_cartitem_alter_order_status','2023-08-16 21:56:25.487472'),(53,'products','0030_alter_product_title','2023-08-16 22:02:14.544905'),(54,'products','0031_alter_order_status_alter_orderitem_order_and_more','2023-08-17 20:02:19.908687'),(55,'products','0032_alter_order_customer','2023-08-18 16:48:52.939045'),(56,'products','0033_alter_order_status','2023-08-18 16:49:50.387022'),(57,'products','0034_alter_order_status','2023-08-18 17:28:38.884204'),(58,'products','0035_alter_order_status','2023-08-20 13:37:12.079762'),(59,'products','0036_alter_order_status','2023-08-20 13:39:17.287121'),(60,'products','0037_alter_product_category_alter_product_content_and_more','2023-08-24 23:55:49.109228');
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
INSERT INTO `django_session` VALUES ('pbiq88pg4ah7hcqkzbp0su8tika69xts','.eJxVzMsOgjAQheF36do0nV7o1KV7noHMdIpFDSQUVsZ3NyQsdP1_57zVQPtWh72VdZhEXRWaBAZ8jIBRXX4zU36W-TDyoPm-6LzM2zqxPog-a9P9IuV1O-3fQaVWj3WUkDtx4gsFKpC6MYlkR-AhOUY2LiASA4WAbrQMYhnFe7CeHRT1-QKutDpl:1qdnQu:kQqB-YZj8u3nw1dn-Ccc0vkGuk2NhArJD9kdOuoFg0E','2023-09-20 07:58:40.382914'),('yr6zeh80qm09lch95kgvaltdkualwy1w','.eJxVjksOwjAMBe-SNYpsmhCHJfueoXJslxZQK_WzQtydVuoC1jPvad6u4XXpmnW2qenVXR1BRsCQElJyp19cWJ427I4-eLiPXsZhmfrid8UfdPb1qPa6He7fQcdzt60F9FwpZBOLRBhbEQ2l0CVLjBqAQdqwVZAVRKHKgLMhWtIiFW9Vny-rOTrL:1qUxN5:FhEBgPVG8WQ8usa9caXYWAiJ9sjbJNdHtQUiLRE0VoQ','2023-08-26 22:46:11.234410');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_cartitem`
--

DROP TABLE IF EXISTS `products_cartitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products_cartitem` (
  `id` char(32) NOT NULL,
  `quantity` int unsigned NOT NULL,
  `product_id` char(32) DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `products_basketitem_user_id_5126b0e3_fk_users_customuser_id` (`user_id`),
  KEY `products_basketitem_product_id_37de396d_fk` (`product_id`),
  CONSTRAINT `products_basketitem_product_id_37de396d_fk` FOREIGN KEY (`product_id`) REFERENCES `products_product` (`id`),
  CONSTRAINT `products_basketitem_user_id_5126b0e3_fk_users_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `users_customuser` (`id`),
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
  `id` char(32) NOT NULL,
  `product_id` char(32) DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `products_favorites_user_id_1b0c1be1_fk_users_customuser_id` (`user_id`),
  KEY `products_favorite_product_id_f8265054_fk` (`product_id`),
  CONSTRAINT `products_favorite_product_id_f8265054_fk` FOREIGN KEY (`product_id`) REFERENCES `products_product` (`id`),
  CONSTRAINT `products_favorites_user_id_1b0c1be1_fk_users_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `users_customuser` (`id`)
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
  `id` char(32) NOT NULL,
  `order_date` datetime(6) NOT NULL,
  `status` varchar(30) DEFAULT NULL,
  `customer_id` bigint DEFAULT NULL,
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
INSERT INTO `products_order` VALUES ('5f421a0a437e4d10bbf65dcfe845d8bd','2023-08-20 13:39:22.852412','Pending',809101477187),('e5b6c9de22124554abe1377fd0cafa5e','2023-08-20 13:42:27.010008','Pending',809101477187);
/*!40000 ALTER TABLE `products_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_orderitem`
--

DROP TABLE IF EXISTS `products_orderitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products_orderitem` (
  `id` char(32) NOT NULL,
  `quantity` int unsigned NOT NULL,
  `order_id` char(32) DEFAULT NULL,
  `product_id` char(32) DEFAULT NULL,
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
/*!40000 ALTER TABLE `products_orderitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_product`
--

DROP TABLE IF EXISTS `products_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products_product` (
  `id` char(32) NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` longtext NOT NULL,
  `content` longtext NOT NULL,
  `category` varchar(30) NOT NULL,
  `price` decimal(7,2) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `pub_date` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `products_product_title_659cf449_uniq` (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_product`
--

LOCK TABLES `products_product` WRITE;
/*!40000 ALTER TABLE `products_product` DISABLE KEYS */;
INSERT INTO `products_product` VALUES ('16cee55cbd4142b5acb34bea97457b22','Nike Air Max 95','The upper of the shoe is made from durable materials, including mesh fabric and genuine leather, to provide you with optimal ventilation and durability. Their recognizable design includes wavy panels reflecting an atmosphere of dynamism and energy. The Nike logo on the tongue and heel gives these sneakers a signature look and feel.\r\n\r\nThe Nike Air Max 95 shoes feature a Max Air unit located in the outsole for cushioning and support. This technology allows you to feel comfortable and stable while moving, reducing stress on your joints. Combined outsole with a grooved tread pattern provides excellent traction on various surfaces and increased wear resistance. Whether you\'re training or out and about, these sneakers are the perfect complement to your look and boost your confidence.','The Nike Air Max 95 is an iconic running shoe that brings flair and innovative design to your style. Combining classic lines with modern technology, these sneakers will become an integral part of your collection and provide unparalleled comfort.\r\n\r\nThe upper of the shoe is made from durable materials, including mesh fabric and genuine leather, to provide you with optimal ventilation and durability. Their recognizable design includes wavy panels reflecting an atmosphere of dynamism and energy. The Nike logo on the tongue and heel gives these sneakers a signature look and feel.','Sneakers',99.99,'Nike_Air_Max_95.jpg','2023-08-24 23:56:12.612570'),('1f0409c98b3f43a28c834449eea14c2d','Nike Run Swift 2','The upper part of the shoe is made of breathable textile material, which provides excellent ventilation and comfort while running. Mesh inserts provide even more efficient air distribution to help keep feet cool and dry, even during strenuous activity.\r\n\r\nThe Nike Run Swift 2 features a cushioning foam midsole that absorbs impact with every step and provides comfortable cushioning. This helps reduce the risk of injury and leg fatigue while running on a variety of surfaces.\r\n\r\nThe Nike Run Swift 2 has a durable rubber outsole with a tread pattern that provides excellent traction and durability. This allows you to feel confident and safe on any type of track.','The Nike Run Swift 2 is a lightweight and functional running shoe designed for active runners. They combine comfort, support and stylish design to help you reach your running goals in the ultimate comfort.','Sneakers',99.99,'Nike_Run_Swift_2.webp','2023-08-24 23:56:20.858893'),('2495de9490674e5a973066ebd6bad3f3','Nike Renew Elevate III','The upper of the Nike Renew Elevate III is made from synthetic materials and textiles for a lightweight, breathable feel. They have supportive criss-cross straps and a lace-up closure that let you customize the fit and secure your foot.\r\n\r\nThe Nike Renew Elevate III Shoe features a cushioning midsole with Nike Renew technology that delivers soft, responsive cushioning with every step. This reduces stress on the legs and joints, preventing fatigue and increasing comfort during long workouts or games.','The Nike Renew Elevate III is a lightweight and comfortable basketball shoe specifically designed for players looking for maximum support, cushioning and responsiveness on the basketball court. These shoes combine innovative technology and stylish design to help you take your game to the next level.','Sneakers',99.99,'Nike_Renew_Elevate_III.webp','2023-08-24 23:56:29.108951'),('2de3c72a62ec419092cb1a0d567805ff','Nike Air More Uptempo \'96','The upper of the Nike Air More Uptempo \'96 is made from durable, breathable genuine leather for durability and comfort. The unique feature of these sneakers is their design, based on the expressive \"AIR\" letters, which occupy most of the side of the sneaker, emphasizing their personality and style.\r\n\r\nThe Nike Air More Uptempo \'96 delivers superior cushioning with an Air-Sole midsole. This visible air cushion extends the entire length of the outsole for maximum cushioning and shock absorption for walking and running. This makes these shoes ideal for sports training or an active lifestyle.','The Nike Air More Uptempo \'96 is a classic running shoe that draws attention with its unique design and outstanding cushioning. This model is a symbol of style and aesthetics, attracting shoe and sports lovers from all over the world.','Sneakers',99.99,'Nike_Air_More_Uptempo_96.webp','2023-08-24 23:56:27.044421'),('3e542573038a440ba0643a8746e8e01d','Nike Dunk Low Retro','The upper is made from durable leather and textile materials for durability and comfort. They feature a low profile design making them ideal for everyday use. The Nike logo on the tongue and heel gives these sneakers a signature look and feel.\r\n\r\nThe Nike Dunk Low Retro features a cushioned outsole that provides comfort and support while walking or jumping. The unique outsole with a grooved tread pattern provides excellent traction on various surfaces and additional wear resistance. Thanks to their versatile design, they are easy to pair with a variety of outfits, from casual to more formal.','The Nike Dunk Low Retro is the return of a classic and stylish sneaker that has won the hearts of fashion connoisseurs from all over the world. Their iconic design, comfort and variety of color options make them the perfect choice for anyone looking to add a unique touch to their look.','Sneakers',99.99,'Nike_Dunk_Low_Retro.jpg','2023-08-24 23:56:14.678345'),('61933e5e405245c9b2efb746c955dd7d','Nike Air Huarache','The upper of the Nike Air Huarache Shoe is made from quality synthetics and textiles for lightweight, flexible, and breathable comfort. They have a unique design that includes an external skeleton that provides excellent support and fit on the foot. Dynamic Fit technology allows the shoe to perfectly fit the shape of the foot, creating a sense of personalized fit.\r\n\r\nThe Nike Air Huarache features a removable foam unit that provides cushioning and comfort with every step. They also have a ventilation system in the form of holes and mesh panels that allow air to circulate freely, preventing excessive sweating and discomfort.\r\n\r\nThe Nike Air Huarache has a durable rubber outsole with a tread pattern that provides excellent traction and stability on various types of ground. This makes them ideal for active workouts and everyday wear.','Nike Air Huarache is an icon of style and innovation in the world of sports shoes. These sneakers are a symbol of comfort and unique design, offering an unrivaled combination of functionality and aesthetics. The Nike Air Huarache design impresses with its boldness and recognizability. A distinctive cage around the heel and a Nike logo on the tongue give these shoes a unique look.','Sneakers',99.99,'Nike_Air_Huarache.webp','2023-08-24 23:56:22.918619'),('712bea9c3a3b45bfad52485f1fa85ac8','Nike Air Force','The upper is made from durable leather and textile materials for comfort and support. They feature a low profile design for freedom of movement and styling versatility. The iconic Nike logo on the tongue and lateral side gives these sneakers a sense of identity and status.\r\nThe Nike Air 1 features a durable rubber outsole for excellent traction and durability. They\'re also packed with cushioning technology, including a foam insert and Max Air chambers to absorb shock and provide extra support as you move. These shoes are an iconic sports shoe offering comfort, support and style. Whether you\'re training or adventuring everyday, the Nike Air 1 will help you look fashionable and feel confident.','The Nike Air Force 1 is not only a stylish sneaker, but also a part of culture and heritage. They have inspired countless artists, musicians and fashion icons, and have been praised by their adherents for their iconic status and unsurpassed quality. Buying the Nike Air Force 1 is an investment in style and comfort. They are perfect for everyday wear, training or for creating a bright look for special occasions. Feel the legend on your feet and let the Nike Air Force 1 become a staple in your wardrobe.','Sneakers',99.99,'Nike_Air_Force.jpg','2023-08-24 23:56:08.479854'),('73c10d4adbd34f76b75c70c52da72ad4','Japanesse Hoodie','sdfdsfdsfdsfdsfdsfdsf','sdfsdfdsfdsf','Hoodies',99.99,'Japanesse_Hoodie.jpg','2023-08-24 23:56:31.156187'),('76fa16c5b57c4279a2e987f56fad1537','Kawaii Anime Girl Harajuku Hoodie','sdfdsfdsfdsfdsfdsfdsf','sdfsdfdsfdsf','Hoodies',99.99,'Kawaii_Anime_Girl_Harajuku_Hoodie.jpg','2023-08-24 23:56:37.329883'),('7ad32f1d11b34cf690e35e88980eff1c','Nike Air Max 97','The upper of the Nike Air Max 97 is made from synthetic materials and textiles for a durable, breathable shell. They feature a lace-up closure that allows for an adjustable fit and a secure fit.\r\n\r\nOne of the main selling points of the Nike Air Max 97 is visible cushioning. The shoe features an Air Max midsole that absorbs shock and provides maximum cushioning for walking and running. This creates a feeling of lightness and comfort even during intense workouts.','The Nike Air Max 97 is an iconic running shoe that is considered one of the most recognizable and innovative designs in footwear history. Inspired by the design of Japanese trains, these running shoes have a unique look and cutting-edge technology that make them the perfect choice for anyone who appreciates comfort and style. The Nike Air Max 97 offers an unrivaled combination of comfort, functionality and aesthetics.','Sneakers',99.99,'Nike_Air_Max_97.webp','2023-08-24 23:56:24.991032'),('82842b4469be4e32bd16acdf4912a6f9','Itachi Hoodie','sdfdsfdsfdsfdsfdsfdsf','sdfsdfdsfdsf','Hoodies',99.99,'Itachi_Hoodie.jpg','2023-08-24 23:56:41.446459'),('9256ad9ebb554ff2a922f32523d564d0','HooMeelanz Unisex Hoodie','sdfdsfdsfdsfdsfdsfdsf','sdfsdfdsfdsf','Hoodies',99.99,'HooMeelanz_Unisex_Hoodie.jpg','2023-08-24 23:56:35.272822'),('a88633db79824f53a7f09ab8c654f072','Gojo Hoodie','sdfdsfdsfdsfdsfdsfdsf','sdfsdfdsfdsf','Hoodies',99.99,'Gojo_Hoodie.jpg','2023-08-24 23:56:33.212702'),('b8b0240587204b1aa1ef7a60baad230c','Attack On Titan Hoodie Anime Oversized','sdfdsfdsfdsfdsfdsfdsf','sdfsdfdsfdsf','Hoodies',99.99,'Attack_On_Titan_Hoodie_Anime_Oversized.jpg','2023-08-24 23:56:39.387786'),('b912365d071b48a284d77e9157630450','Nike Air Force 1 AN20 (GS) (CT7724-001)','The Nike Air Force 1 AN20 features a foam midsole that provides cushioning and shock absorption as you walk. Air-Sole air chambers are located in the toe and heel of the shoe for added cushioning and support. The sole of the shoe has a ribbed pattern that provides excellent traction and stability on various types of ground. These sneakers are ideal for everyday wear, sports training or for creating stylish street looks. They are easy to match with different outfits and are suitable for different seasons.','The Nike Air Force 1 AN20 is a running shoe that combines classic style with modern technology. They provide comfort, support and aesthetic satisfaction, making them an excellent choice for all lovers of quality shoes.','Sneakers',99.99,'Nike_Air_Force_1_AN20_GS_CT7724-001.webp','2023-08-24 23:56:18.801339'),('c5200d85a4a24ef59b5aad7efef119f8','Puma Rider','The upper is made from lightweight, breathable materials for all-day comfort and ventilation. The design of the Puma Rider includes contrasting color blocks and sleek lines to highlight its sporty character. These sneakers will be a stylish addition to your wardrobe and an eye-catching accent to any outfit.\r\n\r\nThe Puma Rider features a durable rubber outsole for excellent traction and durability. They also feature state-of-the-art cushioning technologies, such as a comfortable foam unit and a cushioned midsole, that provide cushioning and support as you move. This allows you to feel comfortable and confident throughout the day.','The Puma Rider is a stylish and comfortable running shoe that combines retro running aesthetics with modern technology. Iconic and functional at the same time, these sneakers are perfect for everyday wear as well as active lifestyles.','Sneakers',99.99,'Puma_Rider.jpg','2023-08-24 23:56:10.558867'),('fc9bcff5951a45faa0929a068458d9b0','Puma Karmen Shine','The upper of the shoe is crafted from glossy synthetic leather for a sleek and fashionable look. Perforated details and contrasting details add a touch of charm to these sneakers. The Puma logo on the tongue and side adds to the overall style and underscores the brand\'s affiliation.\r\n\r\nThe Puma Karmen Shine features a rubber outsole for excellent traction and durability. This sole also provides cushioning and support so you can stay comfortable all day long. Whether you\'re out and about, meeting friends, or on a special occasion, these sneakers are the perfect addition to your wardrobe.','Puma Karmen Shine is an elegant and stylish sneaker that will add shine and sophistication to your look. The combination of modern design and high quality materials makes them a great choice for those looking for comfort and style in one shoe.\r\n\r\nThe upper of the shoe is crafted from glossy synthetic leather for a sleek and fashionable look. Perforated details and contrasting details add a touch of charm to these sneakers. The Puma logo on the tongue and side adds to the overall style and underscores the brand\'s affiliation.','Sneakers',99.99,'Puma_Karmen_Shine.jpg','2023-08-24 23:56:16.740617');
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
  `id` bigint NOT NULL,
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
INSERT INTO `users_customuser` VALUES ('test',NULL,0,'test','','','',1,1,'2023-08-13 17:38:57.000000',100000000001,NULL),('pbkdf2_sha256$390000$kA1fTb1c8EbO2YUPcJ8lfD$uxtVY2nveoRBOV/4mi2vgWTQ+ihrEHxly2vRIMf3kv4=','2023-09-06 07:58:40.377568',1,'admin','','','',1,1,'2023-08-08 15:41:28.000000',809101477187,'');
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
  `customuser_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_customuser_groups_customuser_id_group_id_76b619e3_uniq` (`customuser_id`,`group_id`),
  KEY `users_customuser_groups_group_id_01390b14_fk_auth_group_id` (`group_id`),
  CONSTRAINT `users_customuser_gro_customuser_id_958147bf_fk_users_cus` FOREIGN KEY (`customuser_id`) REFERENCES `users_customuser` (`id`),
  CONSTRAINT `users_customuser_groups_group_id_01390b14_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `customuser_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_customuser_user_pe_customuser_id_permission_7a7debf6_uniq` (`customuser_id`,`permission_id`),
  KEY `users_customuser_use_permission_id_baaa2f74_fk_auth_perm` (`permission_id`),
  CONSTRAINT `users_customuser_use_customuser_id_5771478b_fk_users_cus` FOREIGN KEY (`customuser_id`) REFERENCES `users_customuser` (`id`),
  CONSTRAINT `users_customuser_use_permission_id_baaa2f74_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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

-- Dump completed on 2023-09-09 14:57:20
