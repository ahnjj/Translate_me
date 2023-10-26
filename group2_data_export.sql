-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: translate_db
-- ------------------------------------------------------
-- Server version	8.0.33

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add user',6,'add_user'),(22,'Can change user',6,'change_user'),(23,'Can delete user',6,'delete_user'),(24,'Can view user',6,'view_user'),(25,'Can add vocabulary',7,'add_vocabulary'),(26,'Can change vocabulary',7,'change_vocabulary'),(27,'Can delete vocabulary',7,'delete_vocabulary'),(28,'Can view vocabulary',7,'view_vocabulary'),(29,'Can add board',8,'add_board'),(30,'Can change board',8,'change_board'),(31,'Can delete board',8,'delete_board'),(32,'Can view board',8,'view_board'),(33,'Can add board comment',9,'add_boardcomment'),(34,'Can change board comment',9,'change_boardcomment'),(35,'Can delete board comment',9,'delete_boardcomment'),(36,'Can view board comment',9,'view_boardcomment'),(37,'Can add category',10,'add_category'),(38,'Can change category',10,'change_category'),(39,'Can delete category',10,'delete_category'),(40,'Can view category',10,'view_category'),(41,'Can add language code',11,'add_languagecode'),(42,'Can change language code',11,'change_languagecode'),(43,'Can delete language code',11,'delete_languagecode'),(44,'Can view language code',11,'view_languagecode'),(45,'Can add user info',12,'add_userinfo'),(46,'Can change user info',12,'change_userinfo'),(47,'Can delete user info',12,'delete_userinfo'),(48,'Can view user info',12,'view_userinfo'),(49,'Can add language_ code',13,'add_language_code'),(50,'Can change language_ code',13,'change_language_code'),(51,'Can delete language_ code',13,'delete_language_code'),(52,'Can view language_ code',13,'view_language_code'),(53,'Can add users_app_user',14,'add_users_app_user'),(54,'Can change users_app_user',14,'change_users_app_user'),(55,'Can delete users_app_user',14,'delete_users_app_user'),(56,'Can view users_app_user',14,'view_users_app_user'),(57,'Can add gamevocab',15,'add_gamevocab'),(58,'Can change gamevocab',15,'change_gamevocab'),(59,'Can delete gamevocab',15,'delete_gamevocab'),(60,'Can view gamevocab',15,'view_gamevocab'),(61,'Can add role playing room',16,'add_roleplayingroom'),(62,'Can change role playing room',16,'change_roleplayingroom'),(63,'Can delete role playing room',16,'delete_roleplayingroom'),(64,'Can view role playing room',16,'view_roleplayingroom'),(65,'Can add user_test_result',17,'add_user_test_result'),(66,'Can change user_test_result',17,'change_user_test_result'),(67,'Can delete user_test_result',17,'delete_user_test_result'),(68,'Can view user_test_result',17,'view_user_test_result');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `board`
--

DROP TABLE IF EXISTS `board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `board` (
  `board_id` int NOT NULL AUTO_INCREMENT,
  `board_title` varchar(100) DEFAULT NULL,
  `board_main_txt` longtext,
  `category_id` varchar(10) DEFAULT NULL,
  `language_id` varchar(10) DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  `reg_date` datetime DEFAULT NULL,
  `lst_chg_date` datetime DEFAULT NULL,
  PRIMARY KEY (`board_id`),
  KEY `board_language` (`language_id`),
  KEY `board_users_app` (`user_id`),
  KEY `board_category` (`category_id`),
  CONSTRAINT `board_category` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`),
  CONSTRAINT `board_language` FOREIGN KEY (`language_id`) REFERENCES `language_code` (`language_id`),
  CONSTRAINT `board_users_app` FOREIGN KEY (`user_id`) REFERENCES `users_app_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `board`
--

LOCK TABLES `board` WRITE;
/*!40000 ALTER TABLE `board` DISABLE KEYS */;
INSERT INTO `board` VALUES (3,'단어 학습','식당에 가면 많이 쓰는 단어','2','2',1,'2023-10-25 06:30:21','2023-10-25 06:30:21');
/*!40000 ALTER TABLE `board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `board_comment`
--

DROP TABLE IF EXISTS `board_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `board_comment` (
  `comment_id` int NOT NULL AUTO_INCREMENT,
  `board_id` int NOT NULL,
  `user_id` bigint NOT NULL,
  `comment_text` varchar(200) DEFAULT NULL,
  `reg_date` datetime DEFAULT NULL,
  `lst_chg_date` datetime DEFAULT NULL,
  PRIMARY KEY (`comment_id`,`board_id`,`user_id`),
  KEY `board_comment_users_app` (`user_id`),
  KEY `board_comment_board` (`board_id`),
  CONSTRAINT `board_comment_board` FOREIGN KEY (`board_id`) REFERENCES `board` (`board_id`),
  CONSTRAINT `board_comment_users_app` FOREIGN KEY (`user_id`) REFERENCES `users_app_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `board_comment`
--

LOCK TABLES `board_comment` WRITE;
/*!40000 ALTER TABLE `board_comment` DISABLE KEYS */;
INSERT INTO `board_comment` VALUES (2,3,1,'order','2023-10-25 06:30:51','2023-10-25 06:30:51');
/*!40000 ALTER TABLE `board_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `category_id` varchar(10) NOT NULL,
  `category_name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES ('1','정보제공'),('2','질문');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
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
  KEY `django_admin_log_user_id_c564eba6_fk_users_app_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_users_app_user_id` FOREIGN KEY (`user_id`) REFERENCES `users_app_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(8,'board_app','board'),(9,'board_app','boardcomment'),(10,'board_app','category'),(11,'board_app','languagecode'),(12,'board_app','userinfo'),(4,'contenttypes','contenttype'),(15,'game_app','gamevocab'),(16,'roleplay_game_app','roleplayingroom'),(5,'sessions','session'),(6,'users_app','user'),(13,'vocabulary_app','language_code'),(17,'vocabulary_app','user_test_result'),(14,'vocabulary_app','users_app_user'),(7,'vocabulary_app','vocabulary');
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
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2023-10-16 10:13:35.205821'),(2,'contenttypes','0002_remove_content_type_name','2023-10-16 10:13:35.234758'),(3,'auth','0001_initial','2023-10-16 10:13:35.394592'),(4,'auth','0002_alter_permission_name_max_length','2023-10-16 10:13:35.451596'),(5,'auth','0003_alter_user_email_max_length','2023-10-16 10:13:35.456583'),(6,'auth','0004_alter_user_username_opts','2023-10-16 10:13:35.462567'),(7,'auth','0005_alter_user_last_login_null','2023-10-16 10:13:35.467554'),(8,'auth','0006_require_contenttypes_0002','2023-10-16 10:13:35.469548'),(9,'auth','0007_alter_validators_add_error_messages','2023-10-16 10:13:35.474535'),(10,'auth','0008_alter_user_username_max_length','2023-10-16 10:13:35.479522'),(11,'auth','0009_alter_user_last_name_max_length','2023-10-16 10:13:35.484508'),(12,'auth','0010_alter_group_name_max_length','2023-10-16 10:13:35.495480'),(13,'auth','0011_update_proxy_permissions','2023-10-16 10:13:35.501463'),(14,'auth','0012_alter_user_first_name_max_length','2023-10-16 10:13:35.506475'),(15,'users_app','0001_initial','2023-10-16 10:13:35.648205'),(16,'admin','0001_initial','2023-10-16 10:13:35.715056'),(17,'admin','0002_logentry_remove_auto_add','2023-10-16 10:13:35.721039'),(18,'admin','0003_logentry_add_action_flag_choices','2023-10-16 10:13:35.728020'),(19,'sessions','0001_initial','2023-10-16 10:13:35.748964'),(20,'board_app','0001_initial','2023-10-17 05:20:27.812656'),(21,'vocabulary_app','0001_initial','2023-10-17 05:20:27.818639'),(22,'vocabulary_app','0002_language_code','2023-10-18 02:03:51.257849'),(23,'vocabulary_app','0003_users_app_user','2023-10-18 10:22:46.274717'),(24,'users_app','0002_alter_user_user_level','2023-10-19 05:44:27.899177'),(25,'roleplay_game_app','0001_initial','2023-10-23 00:24:58.062414'),(26,'roleplay_game_app','0002_alter_roleplayingroom_helper_role','2023-10-24 02:22:40.972743'),(27,'vocabulary_app','0004_user_test_result','2023-10-24 02:22:40.977731');
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
INSERT INTO `django_session` VALUES ('aonr8dng6wvvffqkvbqj8rppxh9guuzi','.eJxVjDEOAiEQRe9CbQgwsKClvWcgzDDKqoFk2a2Md1eSLbT9773_EjFta4lb5yXOWZyEFoffDRM9uA6Q76nemqRW12VGORS50y4vLfPzvLt_ByX18q0hZG8mDQzOHh0TkmeltDE2aw_WMk5JkzdKeQxBAzEEuJqAxg1M4v0BuNc2ow:1qsL4j:4M5U0LR1-ZJyxRBpb_otkGk6JGJ-te5XjKDl9FX8tNk','2023-10-30 10:43:53.695389'),('b3m0w4ouadqcc9yvlp5renukcqj56yk4','.eJxVjDEOAiEQRe9CbQgwsKClvWcgzDDKqoFk2a2Md1eSLbT9773_EjFta4lb5yXOWZyEFoffDRM9uA6Q76nemqRW12VGORS50y4vLfPzvLt_ByX18q0hZG8mDQzOHh0TkmeltDE2aw_WMk5JkzdKeQxBAzEEuJqAxg1M4v0BuNc2ow:1qvpxf:FlFD1IqXnkx76y-Xe0Omc2LEgUI0zKX35KUAETkJHMc','2023-11-09 02:19:03.849339'),('n80bssrlhvma424u7ztvpdowic6we3k2','.eJxVjDEOAiEQRe9CbQgwsKClvWcgzDDKqoFk2a2Md1eSLbT9773_EjFta4lb5yXOWZyEFoffDRM9uA6Q76nemqRW12VGORS50y4vLfPzvLt_ByX18q0hZG8mDQzOHh0TkmeltDE2aw_WMk5JkzdKeQxBAzEEuJqAxg1M4v0BuNc2ow:1qund5:xn1IsZHBtiCdVWTsr52nMsh_ZPbYCnLcCXpSGQ7JCR4','2023-11-06 05:37:31.145448'),('yk0wbwb35incymv69g5tnjpvwkkr0x4i','.eJxVjDEOAiEQRe9CbQgwsKClvWcgzDDKqoFk2a2Md1eSLbT9773_EjFta4lb5yXOWZyEFoffDRM9uA6Q76nemqRW12VGORS50y4vLfPzvLt_ByX18q0hZG8mDQzOHh0TkmeltDE2aw_WMk5JkzdKeQxBAzEEuJqAxg1M4v0BuNc2ow:1qt3kQ:1-1SUjcROJltuSeM0PmcBV0vy5t0y86Zt-nyyqD_vqg','2023-11-01 10:25:54.392093');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `language_code`
--

DROP TABLE IF EXISTS `language_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `language_code` (
  `language_id` varchar(10) NOT NULL,
  `language_name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `language_code`
--

LOCK TABLES `language_code` WRITE;
/*!40000 ALTER TABLE `language_code` DISABLE KEYS */;
INSERT INTO `language_code` VALUES ('1','korean'),('2','english'),('3','japanese'),('4','chinese');
/*!40000 ALTER TABLE `language_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roleplay_game_app_roleplayingroom`
--

DROP TABLE IF EXISTS `roleplay_game_app_roleplayingroom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roleplay_game_app_roleplayingroom` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `language` varchar(10) NOT NULL,
  `level` smallint NOT NULL,
  `situation` varchar(100) NOT NULL,
  `situation_en` varchar(100) NOT NULL,
  `my_role` varchar(100) NOT NULL,
  `my_role_en` varchar(100) NOT NULL,
  `helper_role` varchar(100) NOT NULL,
  `helper_role_en` varchar(100) NOT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `roleplay_game_app_ro_user_id_a5c71914_fk_users_app` (`user_id`),
  CONSTRAINT `roleplay_game_app_ro_user_id_a5c71914_fk_users_app` FOREIGN KEY (`user_id`) REFERENCES `users_app_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roleplay_game_app_roleplayingroom`
--

LOCK TABLES `roleplay_game_app_roleplayingroom` WRITE;
/*!40000 ALTER TABLE `roleplay_game_app_roleplayingroom` DISABLE KEYS */;
INSERT INTO `roleplay_game_app_roleplayingroom` VALUES (1,'en-US',1,'면접보는 상황','Interview situation','지원자','applicant','면접관','interviewer',1);
/*!40000 ALTER TABLE `roleplay_game_app_roleplayingroom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_test_result`
--

DROP TABLE IF EXISTS `user_test_result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_test_result` (
  `test_id` bigint NOT NULL AUTO_INCREMENT,
  `id` bigint DEFAULT NULL,
  `user_score` int DEFAULT NULL,
  `user_test` varchar(100) DEFAULT NULL,
  `test_date` datetime DEFAULT NULL,
  PRIMARY KEY (`test_id`),
  KEY `test_user_info` (`id`),
  CONSTRAINT `test_user_info` FOREIGN KEY (`id`) REFERENCES `users_app_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_test_result`
--

LOCK TABLES `user_test_result` WRITE;
/*!40000 ALTER TABLE `user_test_result` DISABLE KEYS */;
INSERT INTO `user_test_result` VALUES (1,1,70,'7/10','2023-10-05 10:29:53'),(2,1,40,'4/10','2023-10-25 10:30:17'),(3,1,60,'6/10','2023-10-25 10:30:47'),(4,1,80,'8/10','2023-10-05 10:35:59'),(13,1,30,'3/10','2023-10-05 10:45:57'),(14,1,100,'10/10','2023-10-02 10:53:09'),(15,1,40,'4/10','2023-10-25 14:53:50'),(16,1,70,'7/10','2023-10-25 15:23:25'),(17,1,0,'0/10','2023-10-26 00:52:45'),(18,1,0,'0/10','2023-10-26 12:46:36'),(19,1,0,'0/10','2023-10-26 12:53:49'),(20,1,40,'4/10','2023-10-26 12:56:37');
/*!40000 ALTER TABLE `user_test_result` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_app_user`
--

DROP TABLE IF EXISTS `users_app_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_app_user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
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
  `website_url` varchar(200) NOT NULL,
  `user_language` varchar(10) NOT NULL,
  `user_level` varchar(10) NOT NULL,
  `avatar` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_app_user`
--

LOCK TABLES `users_app_user` WRITE;
/*!40000 ALTER TABLE `users_app_user` DISABLE KEYS */;
INSERT INTO `users_app_user` VALUES (1,'pbkdf2_sha256$600000$eptAukXJPxwGRndg9SZpvP$ivK2O94YchrqMD7pVrvHBs4LkqEPKLpPT91PrUxmfOg=','2023-10-26 02:19:03.842357',0,'lim','','','limforever00@naver.com',0,1,'2023-10-16 10:15:45.593121','','en-US','beginner',''),(2,'pbkdf2_sha256$600000$HCbWbOxwyzqL756TBL9zL6$mYwNZZdhKXW63U+2TBSYC3WV829Wo5IrfW0bU7BWESY=',NULL,1,'admin','','','111@111.com',1,1,'2023-10-16 10:25:39.391043','','en-US','beginner','');
/*!40000 ALTER TABLE `users_app_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_app_user_groups`
--

DROP TABLE IF EXISTS `users_app_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_app_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_app_user_groups_user_id_group_id_b9b6bdae_uniq` (`user_id`,`group_id`),
  KEY `users_app_user_groups_group_id_a248c506_fk_auth_group_id` (`group_id`),
  CONSTRAINT `users_app_user_groups_group_id_a248c506_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `users_app_user_groups_user_id_0fb09204_fk_users_app_user_id` FOREIGN KEY (`user_id`) REFERENCES `users_app_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_app_user_groups`
--

LOCK TABLES `users_app_user_groups` WRITE;
/*!40000 ALTER TABLE `users_app_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_app_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_app_user_user_permissions`
--

DROP TABLE IF EXISTS `users_app_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_app_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_app_user_user_perm_user_id_permission_id_46656a4a_uniq` (`user_id`,`permission_id`),
  KEY `users_app_user_user__permission_id_61fe1390_fk_auth_perm` (`permission_id`),
  CONSTRAINT `users_app_user_user__permission_id_61fe1390_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `users_app_user_user__user_id_ed0fe1b8_fk_users_app` FOREIGN KEY (`user_id`) REFERENCES `users_app_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_app_user_user_permissions`
--

LOCK TABLES `users_app_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `users_app_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_app_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vocabulary`
--

DROP TABLE IF EXISTS `vocabulary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vocabulary` (
  `vocabulary_id` bigint NOT NULL AUTO_INCREMENT,
  `vocabulary_name` varchar(100) DEFAULT NULL,
  `vocabulary_meaning` longtext,
  `vocabulary_level` int DEFAULT NULL,
  `language_id` varchar(10) DEFAULT NULL,
  `reg_date` date DEFAULT NULL,
  `train_yn` tinyint(1) DEFAULT NULL,
  `id` bigint DEFAULT NULL,
  PRIMARY KEY (`vocabulary_id`),
  KEY `vocabulary_user_info` (`id`),
  KEY `vocabulary_language` (`language_id`),
  CONSTRAINT `vocabulary_language` FOREIGN KEY (`language_id`) REFERENCES `language_code` (`language_id`),
  CONSTRAINT `vocabulary_user_info` FOREIGN KEY (`id`) REFERENCES `users_app_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13482 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vocabulary`
--

LOCK TABLES `vocabulary` WRITE;
/*!40000 ALTER TABLE `vocabulary` DISABLE KEYS */;
INSERT INTO `vocabulary` VALUES (12254,'フットボール','축구',3,'3','2023-10-26',0,1),(12255,'python','혼(spirit), 악마나 귀신이 들린 사람, (pythons) (속어) 크고 잘 발달된 이두근, 악마(demon)',3,'2','2023-10-26',0,1),(12256,'mushroom','버섯',3,'2','2023-10-26',0,1),(12257,'<地理> 中国[Zhōngguó]','중국',3,'4','2023-10-26',0,1),(12258,'国[guó]','나라',3,'4','2023-10-26',0,1),(12259,'<国名> 日本[にほん·にっぽん]','일본',3,'3','2023-10-26',0,1),(12260,'resume','이력서',1,'2','2023-10-26',1,1),(12261,'applicant','지원자, 신청자',1,'2','2023-10-26',1,1),(12262,'requirement','필요조건, 요건',1,'2','2023-10-26',1,1),(12263,'meet','(필요,요구 등을)만족시키다',1,'2','2023-10-26',1,1),(12264,'qualified','자격있는, 적격의',1,'2','2023-10-26',1,1),(12265,'candidate','후보자, 지원자',1,'2','2023-10-26',1,1),(12266,'confidence','확신, 자신, 신임',1,'2','2023-10-26',1,1),(12267,'highly','매우, 대단히',1,'2','2023-10-26',1,1),(12268,'professional','전문적인, 직업의, 전문가',1,'2','2023-10-26',1,1),(12269,'interview','면접, 면접을 보다',1,'2','2023-10-26',1,1),(12270,'hire','고용하다',1,'2','2023-10-26',1,1),(12271,'training','교육, 훈련',1,'2','2023-10-26',1,1),(12272,'reference','추천서, 참고',1,'2','2023-10-26',1,1),(12273,'position','일자리, 직책, 두다',1,'2','2023-10-26',1,1),(12274,'achievement','성취, 달성',1,'2','2023-10-26',1,1),(12275,'impressed','인상 깊게 생각하는, 감명을 받은',1,'2','2023-10-26',1,1),(12276,'excellent','훌륭한',1,'2','2023-10-26',1,1),(12277,'eligible','자격이 있는, 적격의',1,'2','2023-10-26',1,1),(12278,'identify','알아보다, 확인하다',1,'2','2023-10-26',1,1),(12279,'associate','관련시키다',1,'2','2023-10-26',1,1),(12280,'condition','조건',1,'2','2023-10-26',1,1),(12281,'employment','고용',1,'2','2023-10-26',1,1),(12282,'lack','~이 없다, 부족',1,'2','2023-10-26',1,1),(12283,'managerial','관리의',1,'2','2023-10-26',1,1),(12284,'diligent','성실한',1,'2','2023-10-26',1,1),(12285,'familiar','익숙한, 친숙한',1,'2','2023-10-26',1,1),(12286,'proficiency','숙달, 능숙',1,'2','2023-10-26',1,1),(12287,'prospective','장래의, 미래의',1,'2','2023-10-26',1,1),(12288,'appeal','관심을 끌다, 매력적이다',1,'2','2023-10-26',1,1),(12289,'specialize','~을 전공하다, 전문적으로 다루다',1,'2','2023-10-26',1,1),(12290,'apprehensive','걱정하는, 염려하는',1,'2','2023-10-26',1,1),(12291,'consultant','고문, 컨설턴트',1,'2','2023-10-26',1,1),(12292,'entitle','자격을 주다',1,'2','2023-10-26',1,1),(12293,'degree','학위',1,'2','2023-10-26',1,1),(12294,'payroll','임금대장, 금료명부',1,'2','2023-10-26',1,1),(12295,'recruit','(신입사원등을)모집하다',1,'2','2023-10-26',1,1),(12296,'certification','증명서, 증명',1,'2','2023-10-26',1,1),(12297,'occupation','직업',1,'2','2023-10-26',1,1),(12298,'wage','임금, 급료',1,'2','2023-10-26',1,1),(12299,'attire','복장, 옷차림새',1,'2','2023-10-26',1,1),(12300,'code','규범, 관례;암호',1,'2','2023-10-26',1,1),(12301,'concern','우려, 걱정, 문제, 일, ~을 걱정스럽게 하다; 영향을 미치다, 관련되다.',1,'2','2023-10-26',1,1),(12302,'policy','규정; 보험, 증권',1,'2','2023-10-26',1,1),(12303,'comply','준수하다, 따르다',1,'2','2023-10-26',1,1),(12304,'regulation','규정',1,'2','2023-10-26',1,1),(12305,'exception','예외',1,'2','2023-10-26',1,1),(12306,'adhere','지키다, 고수하다',1,'2','2023-10-26',1,1),(12307,'severely','엄격하게, 심하게',1,'2','2023-10-26',1,1),(12308,'refrain','자제하다, 삼가다',1,'2','2023-10-26',1,1),(12309,'permission','허락, 허가',1,'2','2023-10-26',1,1),(12310,'access','이용권한, 접근;통로, ~에 접근하다, 도달하다',1,'2','2023-10-26',1,1),(12311,'thoroughly','철저하게, 완전히, 대단히',1,'2','2023-10-26',1,1),(12312,'revise','(의견, 계획을)수정하다, 변경하다',1,'2','2023-10-26',1,1),(12313,'approach','접근법, 처리방법',1,'2','2023-10-26',1,1),(12314,'approval','승인, 인가',1,'2','2023-10-26',1,1),(12315,'form','종류, 유형, 양식',1,'2','2023-10-26',1,1),(12316,'immediately','즉시, 곧',1,'2','2023-10-26',1,1),(12317,'inspection','점검, 검사',1,'2','2023-10-26',1,1),(12318,'arrangement','준비, 마련, 주선',1,'2','2023-10-26',1,1),(12319,'procedure','절차',1,'2','2023-10-26',1,1),(12320,'negative','부정적인, 비관적인',1,'2','2023-10-26',1,1),(12321,'mandate','명령하다, 지시하다, 권한, 지시, 명령',1,'2','2023-10-26',1,1),(12322,'effect','(법률등의)효력, 효과, 영향, 결과로서 ~을 가져오다',1,'2','2023-10-26',1,1),(12323,'drastically','심하게, 과감하게, 철저하게',1,'2','2023-10-26',1,1),(12324,'according to','~에 따라',1,'2','2023-10-26',1,1),(12325,'enable','(무엇을)가능하게 하다',1,'2','2023-10-26',1,1),(12326,'standard','기준, 표준',1,'2','2023-10-26',1,1),(12327,'constant','지속적인, 끊임없이 계속하는',1,'2','2023-10-26',1,1),(12328,'act','법령, 결의서; 행위, 행동, 결정하다, 판결을 내리다, 행동하다',1,'2','2023-10-26',1,1),(12329,'compensation','보상금, 보상',1,'2','2023-10-26',1,1),(12330,'ban','금지, 금지하다',1,'2','2023-10-26',1,1),(12331,'obligation','의무, 책임',1,'2','2023-10-26',1,1),(12332,'authorize','~을 인가하다, 권한을 부여하다.',1,'2','2023-10-26',1,1),(12333,'prohibit','금지하다',1,'2','2023-10-26',1,1),(12334,'abolish','(제도, 법률등을)폐지하다',1,'2','2023-10-26',1,1),(12335,'enforce','(법률을)시행하다, 집행하다',1,'2','2023-10-26',1,1),(12336,'habit','습관, 버릇',1,'2','2023-10-26',1,1),(12337,'lagislation','법률, 법규',1,'2','2023-10-26',1,1),(12338,'restrict','한정하다, 제한하다',1,'2','2023-10-26',1,1),(12339,'accustomed','익숙한',1,'2','2023-10-26',1,1),(12340,'corporatiion','주식회사, 법인',1,'2','2023-10-26',1,1),(12341,'demanding','요구가 많은, 힘든',1,'2','2023-10-26',1,1),(12342,'colleague','동료',1,'2','2023-10-26',1,1),(12343,'division','부서',1,'2','2023-10-26',1,1),(12344,'request','요청, 요청하다',1,'2','2023-10-26',1,1),(12345,'efficiently','효율적으로',1,'2','2023-10-26',1,1),(12346,'manage','~을 경영하다; 가까스로 하다',1,'2','2023-10-26',1,1),(12347,'submit','제출하다',1,'2','2023-10-26',1,1),(12348,'directly','곧바로',1,'2','2023-10-26',1,1),(12349,'remind','~에게 상기시키다, 일깨우다',1,'2','2023-10-26',1,1),(12350,'instruct','지시하다, 가르치다',1,'2','2023-10-26',1,1),(12351,'deadline','마감일, 마감 시간',1,'2','2023-10-26',1,1),(12352,'sample','견본, 샘플, 표본\n시식하다, (견본으로 질을)시험하다',1,'2','2023-10-26',1,1),(12353,'notify','~에게 통지하다, 알리다',1,'2','2023-10-26',1,1),(12354,'perform','행하다, 실행하다',1,'2','2023-10-26',1,1),(12355,'monitor','감독하다, 감시하다, 실행하다',1,'2','2023-10-26',1,1),(12356,'deserve','~할 만하다, ~할 가치가 있다',1,'2','2023-10-26',1,1),(12357,'assignment','일, 임무, 과제',1,'2','2023-10-26',1,1),(12358,'entire','전체의',1,'2','2023-10-26',1,1),(12359,'release','발표하다, 공개하다, 출시, 발매',1,'2','2023-10-26',1,1),(12360,'extension','연장, 연기; (전화의)내선',1,'2','2023-10-26',1,1),(12361,'electronically','컴퓨터 통신망으로, 컴퓨터로',1,'2','2023-10-26',1,1),(12362,'attendance','출석, 출근',1,'2','2023-10-26',1,1),(12363,'absolutely','절대적으로, 완전히',1,'2','2023-10-26',1,1),(12364,'delegate','(권한등을)위임하다. 대표',1,'2','2023-10-26',1,1),(12365,'attentively','주의 깊게, 조심스럽게',1,'2','2023-10-26',1,1),(12366,'supervision','감독',1,'2','2023-10-26',1,1),(12367,'workshop','워크숍, 연수',1,'2','2023-10-26',1,1),(12368,'draw','끌다, 끌어당기다',1,'2','2023-10-26',1,1),(12369,'revision','수정, 개정',1,'2','2023-10-26',1,1),(12370,'reluctantly','마지못해, 꺼려하여',1,'2','2023-10-26',1,1),(12371,'acquaint','~에게 숙지시키다, 잘 알게 하다',1,'2','2023-10-26',1,1),(12372,'convey','(용건을)전달하다',1,'2','2023-10-26',1,1),(12373,'check','검사하다, 조사하다, 확인하다',1,'2','2023-10-26',1,1),(12374,'headquarters','본부',1,'2','2023-10-26',1,1),(12375,'file','(서류를)정리하다, 철하다;\n(서류, 신청, 고소 등을)정식으로 제기하다, 제출하다',1,'2','2023-10-26',1,1),(12376,'oversee','감독하다 (foresee예견하다, oversea해외의)',1,'2','2023-10-26',1,1),(12377,'involved','관여하는, 관계된, 연루된',1,'2','2023-10-26',1,1),(12378,'concentrate','집중하다, 집중시키다',1,'2','2023-10-26',1,1),(12379,'lax','(행동 등이)느슨한, 규율에 못 미치는',1,'2','2023-10-26',1,1),(12380,'procrastinate','미루다, 꾸물거리다',1,'2','2023-10-26',1,1),(12381,'combined','결합된, 합동의',1,'2','2023-10-26',1,1),(12382,'accomplish','성취하다',1,'2','2023-10-26',1,1),(12383,'voluntarily','자발적으로',1,'2','2023-10-26',1,1),(12384,'undertake','(일을)떠맡다',1,'2','2023-10-26',1,1),(12385,'assume','(증거는 없으나)사실이라고 생각하다;\n(책임,역할을)맡다',1,'2','2023-10-26',1,1),(12386,'occasionally','가끔, 때때로',1,'2','2023-10-26',1,1),(12387,'employee','직원, 고용인',1,'2','2023-10-26',1,1),(12388,'assist','돕다, 조력하다',1,'2','2023-10-26',1,1),(12389,'satisfied','만족하는, 만족스러워하는',1,'2','2023-10-26',1,1),(12390,'manner','방식, 태도',1,'2','2023-10-26',1,1),(12391,'responsible','책임이 있는, 책임져야 할',1,'2','2023-10-26',1,1),(12392,'conduct','(업무 등을)수행하다',1,'2','2023-10-26',1,1),(12393,'adjust','적응하다',1,'2','2023-10-26',1,1),(12394,'personnel','(집합적)직원, 인원; 인사과',1,'2','2023-10-26',1,1),(12395,'agree','동의하다',1,'2','2023-10-26',1,1),(12396,'supervise','감독하다, 지도하다',1,'2','2023-10-26',1,1),(12397,'coworker','동료, 협력자',1,'2','2023-10-26',1,1),(12398,'direct','~에게 길을 안내하다, 가르쳐 주다',1,'2','2023-10-26',1,1),(12399,'confidential','기밀의, 내밀한',1,'2','2023-10-26',1,1),(12400,'assign','배정하다, 할당하다',1,'2','2023-10-26',1,1),(12401,'leading','선도적인, 일류의, 가장 중요한, 선두적인',1,'2','2023-10-26',1,1),(12402,'formal','격식을 갖춘',1,'2','2023-10-26',1,1),(12403,'remove','해임하다, 제거하다',1,'2','2023-10-26',1,1),(12404,'collect','모으다',1,'2','2023-10-26',1,1),(12405,'coordinate','조정하다',1,'2','2023-10-26',1,1),(12406,'hardly','거의~하지않다',1,'2','2023-10-26',1,1),(12407,'abstract','추상적인, 막연한',1,'2','2023-10-26',1,1),(12408,'directory','주소록',1,'2','2023-10-26',1,1),(12409,'accountable','책임이 있는',1,'2','2023-10-26',1,1),(12410,'skillfully','능숙하게, 솜씨있게',1,'2','2023-10-26',1,1),(12411,'exclusive','독점적인, 배타적인',1,'2','2023-10-26',1,1),(12412,'intention','의지, 의향',1,'2','2023-10-26',1,1),(12413,'transform','바꾸다, 변모시키다',1,'2','2023-10-26',1,1),(12414,'respectful','정중한, 존중하는',1,'2','2023-10-26',1,1),(12415,'duplicate','사본',1,'2','2023-10-26',1,1),(12416,'contrary','반대',1,'2','2023-10-26',1,1),(12417,'disturbing','충격적인, 불안감을 주는, 방해하는',1,'2','2023-10-26',1,1),(12418,'engage','관여하다, 종사하다',1,'2','2023-10-26',1,1),(12419,'foster','촉진하다, 육성하다',1,'2','2023-10-26',1,1),(12420,'neutrality','중립성, 중립',1,'2','2023-10-26',1,1),(12421,'widely','널리',1,'2','2023-10-26',1,1),(12422,'sophisticated','(기계가)정교한, 복잡한; 세련된',1,'2','2023-10-26',1,1),(12423,'timely','시기적절한, 때를 맞춘',1,'2','2023-10-26',1,1),(12424,'realistically','현실적으로',1,'2','2023-10-26',1,1),(12425,'promptly','즉시; 정각에',1,'2','2023-10-26',1,1),(12426,'accessible','출입할 수 있는; 이용할 수 있는',1,'2','2023-10-26',1,1),(12427,'implement','실시하다, 실행하다',1,'2','2023-10-26',1,1),(12428,'feedback','의견, 반응',1,'2','2023-10-26',1,1),(12429,'outstanding','우수한; (부채 등이)미지불된',1,'2','2023-10-26',1,1),(12430,'inform','~에게 알리다',1,'2','2023-10-26',1,1),(12431,'replacement','교체, 후임자',1,'2','2023-10-26',1,1),(12432,'announcement','공고, 발표',1,'2','2023-10-26',1,1),(12433,'department','(조직, 기구의)부서',1,'2','2023-10-26',1,1),(12434,'permanently','영구적으로, 불변으로',1,'2','2023-10-26',1,1),(12435,'fulfill','(조건을)만족시키다, (약속, 의무등을)지키다, 이행하다',1,'2','2023-10-26',1,1),(12436,'outline','개요, 설명하다, 약술하다',1,'2','2023-10-26',1,1),(12437,'explain','설명하다',1,'2','2023-10-26',1,1),(12438,'contain','포함하다',1,'2','2023-10-26',1,1),(12439,'compile','(자료 등을)편집하다; 모으다',1,'2','2023-10-26',1,1),(12440,'subsequent','차후의, 그 다음의',1,'2','2023-10-26',1,1),(12441,'overview','개요, 개관',1,'2','2023-10-26',1,1),(12442,'provider','공급자, 제공자',1,'2','2023-10-26',1,1),(12443,'matter','문제, 일',1,'2','2023-10-26',1,1),(12444,'expertise','전문지식, 전문기술',1,'2','2023-10-26',1,1),(12445,'demonstrate','증명하다; (모형, 실험등으로)설명하다',1,'2','2023-10-26',1,1),(12446,'remainder','나머지',1,'2','2023-10-26',1,1),(12447,'essential','필수적인, 극히 중요한, 본질적인',1,'2','2023-10-26',1,1),(12448,'divide','분배하다, 나누다',1,'2','2023-10-26',1,1),(12449,'major','주요한, 중대한',1,'2','2023-10-26',1,1),(12450,'compliance','(명령, 법규에의)준수',1,'2','2023-10-26',1,1),(12451,'clarify','명확하게 하다',1,'2','2023-10-26',1,1),(12452,'face','(문제 등에)직면하다; 향하다, 마주보다',1,'2','2023-10-26',1,1),(12453,'follow','~을 따라가다; 주시하다; (분명히)이해하다',1,'2','2023-10-26',1,1),(12454,'aspect','관점, 국면',1,'2','2023-10-26',1,1),(12455,'apparently','보기에 ~한 듯한, 외관상으로는',1,'2','2023-10-26',1,1),(12456,'aware','알고 있는, 인식하고 있는',1,'2','2023-10-26',1,1),(12457,'extended','(기간 등을)연장한, 장기간에 걸친',1,'2','2023-10-26',1,1),(12458,'accidentally','뜻하지 않게, 우연히',1,'2','2023-10-26',1,1),(12459,'advisable','바람직한, 합당한',1,'2','2023-10-26',1,1),(12460,'concerned','염려하는, 걱정하는; 관련된',1,'2','2023-10-26',1,1),(12461,'speak','이야기 하다',1,'2','2023-10-26',1,1),(12462,'collection','소장품, 수집물; 징수, 수금',1,'2','2023-10-26',1,1),(12463,'exhibition','전시회',1,'2','2023-10-26',1,1),(12464,'celebrity','유명인사, 명사',1,'2','2023-10-26',1,1),(12465,'live','(라디오, TV가)생방송인',1,'2','2023-10-26',1,1),(12466,'improvise','(연주, 연설 등을)즉흥적으로 하다, 즉석에서 만들다.',1,'2','2023-10-26',1,1),(12467,'popular','인기있는',1,'2','2023-10-26',1,1),(12468,'donation','기증, 기부',1,'2','2023-10-26',1,1),(12469,'alumni','동창생들, 졸업생들',1,'2','2023-10-26',1,1),(12470,'present','제시하다, 현재의, 참석한',1,'2','2023-10-26',1,1),(12471,'admission','입장',1,'2','2023-10-26',1,1),(12472,'banquet','연회, 만찬',1,'2','2023-10-26',1,1),(12473,'anniversary','기념일',1,'2','2023-10-26',1,1),(12474,'required','필수의, 의무적인',1,'2','2023-10-26',1,1),(12475,'succeed','성공하다, 뒤를 잇다',1,'2','2023-10-26',1,1),(12476,'rest','쉬다,휴식, 나머지',1,'2','2023-10-26',1,1),(12477,'fund-raising','모금',1,'2','2023-10-26',1,1),(12478,'resume','재개하다, 다시 시작하다',1,'2','2023-10-26',1,1),(12479,'issue','(출판물의)제 ~호; 문제, 쟁점',1,'2','2023-10-26',1,1),(12480,'subscription','(정기발행물의) 구독',1,'2','2023-10-26',1,1),(12481,'appear','나타나다, 출현하다',1,'2','2023-10-26',1,1),(12482,'accompany','동행하다, 동반하다',1,'2','2023-10-26',1,1),(12483,'edition','(간행물의)판',1,'2','2023-10-26',1,1),(12484,'specifically','명확하게, 분명히; 특히, 특별히',1,'2','2023-10-26',1,1),(12485,'anonymous','익명의, 이름을 모르는',1,'2','2023-10-26',1,1),(12486,'commit','헌신하다, 전념하다',1,'2','2023-10-26',1,1),(12487,'information','유익한, 정보를 주는',1,'2','2023-10-26',1,1),(12488,'audience','청중, 관중',1,'2','2023-10-26',1,1),(12489,'author','작가, 저자',1,'2','2023-10-26',1,1),(12490,'note','주목하다; 특별히 언급하다.',1,'2','2023-10-26',1,1),(12491,'antique','골동품',1,'2','2023-10-26',1,1),(12492,'manuscript','원고',1,'2','2023-10-26',1,1),(12493,'beneficial','유익한, 이로운',1,'2','2023-10-26',1,1),(12494,'upcoming','곧 있을, 다가오는',1,'2','2023-10-26',1,1),(12495,'lend','빌려주다',1,'2','2023-10-26',1,1),(12496,'current','현재의,; 현행의, 통용되는',1,'2','2023-10-26',1,1),(12497,'local','지방의, 고장의',1,'2','2023-10-26',1,1),(12498,'variety','다양성, 변화',1,'2','2023-10-26',1,1),(12499,'advocate','옹호자',1,'2','2023-10-26',1,1),(12500,'contributor','기고가, 공헌자',1,'2','2023-10-26',1,1),(12501,'defy','저항하다; (설명,묘사등이)거의 불가능하다',1,'2','2023-10-26',1,1),(12502,'fascinating','매혹적인, 황홀한',1,'2','2023-10-26',1,1),(12503,'showing','(영화, 연극의)상영; 전시',1,'2','2023-10-26',1,1),(12504,'survey','설문조사',1,'2','2023-10-26',1,1),(12505,'analysis','분석',1,'2','2023-10-26',1,1),(12506,'respondent','응답자',1,'2','2023-10-26',1,1),(12507,'competition','경쟁',1,'2','2023-10-26',1,1),(12508,'consistently','항상, 일관되게',1,'2','2023-10-26',1,1),(12509,'demand','수요, 요구하다',1,'2','2023-10-26',1,1),(12510,'do one\'s utmost','전력을 다하다',1,'2','2023-10-26',1,1),(12511,'expand','확장하다, 확대하다',1,'2','2023-10-26',1,1),(12512,'advanced','고급의; 진보한, 앞선',1,'2','2023-10-26',1,1),(12513,'postpone','연기하다, 뒤로 미루다',1,'2','2023-10-26',1,1),(12514,'additional','추가의, 부가적인',1,'2','2023-10-26',1,1),(12515,'appreciate','고맙게 생각하다; 높이 평가하다; 감상하다',1,'2','2023-10-26',1,1),(12516,'demonstration','설명; 드러냄, 시연',1,'2','2023-10-26',1,1),(12517,'buy','사다, 구입하다',1,'2','2023-10-26',1,1),(12518,'examine','조사하다',1,'2','2023-10-26',1,1),(12519,'effective','효과적인; (법률 등이)발표되는, 시행되는',1,'2','2023-10-26',1,1),(12520,'like','좋아하다',1,'2','2023-10-26',1,1),(12521,'especially','특히',1,'2','2023-10-26',1,1),(12522,'closely','면밀히, 엄밀히',1,'2','2023-10-26',1,1),(12523,'reserve','예약하다, 지정하다; 보존하다',1,'2','2023-10-26',1,1),(12524,'cooperate','협력하다, 협동하다',1,'2','2023-10-26',1,1),(12525,'very','매우, 대단히, 아주',1,'2','2023-10-26',1,1),(12526,'consecutive','연속적인',1,'2','2023-10-26',1,1),(12527,'expectation','예상, 기대',1,'2','2023-10-26',1,1),(12528,'publicize','공표하다; 광고하다, 선전하다',1,'2','2023-10-26',1,1),(12529,'raise','높이다, 올리다; (의문을)제기하다',1,'2','2023-10-26',1,1),(12530,'extremely','극도로, 대단히',1,'2','2023-10-26',1,1),(12531,'affect','~에 영향을 미치다, 불리하게 작용하다',1,'2','2023-10-26',1,1),(12532,'target','목표, 목표로 삼다',1,'2','2023-10-26',1,1),(12533,'campaign','운동, 캠페인',1,'2','2023-10-26',1,1),(12534,'probable','개연성이 높은, 유망한',1,'2','2023-10-26',1,1),(12535,'focus','집중시키다, 집중하다',1,'2','2023-10-26',1,1),(12536,'seasonal','계절의, 계절적인',1,'2','2023-10-26',1,1),(12537,'impact','영향, 충격',1,'2','2023-10-26',1,1),(12538,'comparison','비교',1,'2','2023-10-26',1,1),(12539,'gap','격차',1,'2','2023-10-26',1,1),(12540,'mounting','증가하는, 오르는',1,'2','2023-10-26',1,1),(12541,'reflective','반영하는',2,'2','2023-10-26',1,1),(12542,'advertisement','광고',1,'2','2023-10-26',1,1),(12543,'marginal','약간의; 주변의',1,'2','2023-10-26',1,1),(12544,'customer','고객',1,'2','2023-10-26',1,1),(12545,'influence','~에 영향을 주다, 영향',1,'2','2023-10-26',1,1),(12546,'instantly','즉각적으로, 즉시',1,'2','2023-10-26',1,1),(12547,'creative','창조적인, 독창적인',1,'2','2023-10-26',1,1),(12548,'aggressively','적극적으로',1,'2','2023-10-26',1,1),(12549,'aim','~을 겨누다, 목표, 목적',1,'2','2023-10-26',1,1),(12550,'strategy','전략',1,'2','2023-10-26',1,1),(12551,'indicate','보여주다, 나타내다',1,'2','2023-10-26',1,1),(12552,'attract','끌다, 유인하다',1,'2','2023-10-26',1,1),(12553,'experience','경험, 체험, 체험하다, 경험하다',1,'2','2023-10-26',1,1),(12554,'analyze','분석하다, 분석적으로 검토하다',1,'2','2023-10-26',1,1),(12555,'introduce','(신제품을)발표하다, 소개하다',1,'2','2023-10-26',1,1),(12556,'advise','조언해주다, 충고하다',1,'2','2023-10-26',1,1),(12557,'subscribe','구독하다',1,'2','2023-10-26',1,1),(12558,'absence','부재; 결근, 결석',1,'2','2023-10-26',1,1),(12559,'means','방법, 수단',1,'2','2023-10-26',1,1),(12560,'prefer','(다른 것보다)~을 더 좋아하다, 선호하다',1,'2','2023-10-26',1,1),(12561,'advantage','이점, 강점',1,'2','2023-10-26',1,1),(12562,'forward','앞으로, (물건, 정보를)보내다',1,'2','2023-10-26',1,1),(12563,'contemporary','동시대의; 현대의, 당대의',1,'2','2023-10-26',1,1),(12564,'discussion','토론, 토의',1,'2','2023-10-26',1,1),(12565,'initial','처음의, 최초의',1,'2','2023-10-26',1,1),(12566,'steadily','착실하게; 꾸준히',1,'2','2023-10-26',1,1),(12567,'necessarily','반드시',1,'2','2023-10-26',1,1),(12568,'resolve','(문제 등을)해결하다',1,'2','2023-10-26',1,1),(12569,'detect','간파하다, 탐지하다',1,'2','2023-10-26',1,1),(12570,'intensify','강화하다, 증대하다, 강렬하게 만들다.',1,'2','2023-10-26',1,1),(12571,'favorably','호의적으로; 순조롭게',1,'2','2023-10-26',1,1),(12572,'cover','포함하다; 지불하다; 덮다',1,'2','2023-10-26',1,1),(12573,'less','보다 적은, 덜한',1,'2','2023-10-26',1,1),(12574,'majority','대부분, 대다수',1,'2','2023-10-26',1,1),(12575,'adopt','채택하다',1,'2','2023-10-26',1,1),(12576,'largely','주로, 대부분',1,'2','2023-10-26',1,1),(12577,'disregard','소홀히 하다, 무시하다',1,'2','2023-10-26',1,1),(12578,'effort','노력',1,'2','2023-10-26',1,1),(12579,'incentive','혜택, 장려금',1,'2','2023-10-26',1,1),(12580,'need','필요, 요구, 욕구, ~할 필요가 있다.',1,'2','2023-10-26',1,1),(12581,'mastermind','(계획 등의)입안자, 지도자',1,'2','2023-10-26',1,1),(12582,'stagnant','침체된, 불경기의, (stagnance침체, 정체, 불황)',1,'2','2023-10-26',1,1),(12583,'dramatically','극적으로',1,'2','2023-10-26',1,1),(12584,'brisk','활발한, 호황의',1,'2','2023-10-26',1,1),(12585,'unstable','불안정한, 변하기 쉬운',1,'2','2023-10-26',1,1),(12586,'rapidly','급속히, 빨리',1,'2','2023-10-26',1,1),(12587,'soar','(물가 등이)폭등하다, 높이 치솟다',1,'2','2023-10-26',1,1),(12588,'assert','단언하다, 주장하다 (assertion 단언, 주장)',1,'2','2023-10-26',1,1),(12589,'boost','(경기를)부양시키다, 상승시키다',1,'2','2023-10-26',1,1),(12590,'analyst','분석가',1,'2','2023-10-26',1,1),(12591,'potential','잠재적인',1,'2','2023-10-26',1,1),(12592,'pleased','만족해하는, 기쁜',1,'2','2023-10-26',1,1),(12593,'remain','계속~한 상태이다; 아직 ~해야한다',1,'2','2023-10-26',1,1),(12594,'limited','제한된, 한정된',1,'2','2023-10-26',1,1),(12595,'costly','비용이 많이 드는, 손실이 큰',1,'2','2023-10-26',1,1),(12596,'particular','특정한, 독특한, 세심한 (partocularly 특히)',1,'2','2023-10-26',1,1),(12597,'drastic','과감한, 급격한',1,'2','2023-10-26',1,1),(12598,'evenly','고르게, 균등하게',1,'2','2023-10-26',1,1),(12599,'evidence','증거',1,'2','2023-10-26',1,1),(12600,'prospect','전망, 예상 (prospective 장래의, 미래의, 기대되는)',1,'2','2023-10-26',1,1),(12601,'lead','이글다, 지휘하다; (어떤 결과에)이르다',1,'2','2023-10-26',1,1),(12602,'fall','(값, 가치가)하락하다',1,'2','2023-10-26',1,1),(12603,'period','기간, 시기',1,'2','2023-10-26',1,1),(12604,'indicator','지표, 지수',1,'2','2023-10-26',1,1),(12605,'industry','산업',1,'2','2023-10-26',1,1),(12606,'likely','~할 것 같은',1,'2','2023-10-26',1,1),(12607,'boom','붐, 호황',1,'2','2023-10-26',1,1),(12608,'director','임원, 책임자',1,'2','2023-10-26',1,1),(12609,'substitute','대용품, 대신하다(substitution 대용, 대체)',1,'2','2023-10-26',1,1),(12610,'consequence','결과',1,'2','2023-10-26',1,1),(12611,'fairly','상당히, 꽤',1,'2','2023-10-26',1,1),(12612,'economical','경제적인, 절약되는',1,'2','2023-10-26',1,1),(12613,'thrive','번영하다, 성공하다',1,'2','2023-10-26',1,1),(12614,'implication','영향, 밀접한 관계 (implicate 관련시키다, 관련되었음을 나타내다)',1,'2','2023-10-26',1,1),(12615,'wane','감소, 감퇴',1,'2','2023-10-26',1,1),(12616,'prosperity','번영 (prosper 번영하다)',1,'2','2023-10-26',1,1),(12617,'depression','불황 (depress 하락시키다, 약하게하다)',1,'2','2023-10-26',1,1),(12618,'dwindle','줄어들다, 감소되다',1,'2','2023-10-26',1,1),(12619,'impede','저해하다, 방해하다',1,'2','2023-10-26',1,1),(12620,'promising','유망한, 전망이 좋은',1,'2','2023-10-26',1,1),(12621,'adversity','역경, 불운',1,'2','2023-10-26',1,1),(12622,'purchase','구매하다, 구매',1,'2','2023-10-26',1,1),(12623,'installment','할부',1,'2','2023-10-26',1,1),(12624,'affordable','(가격이)알맞은, 감당할 수 있는',1,'2','2023-10-26',1,1),(12625,'exactly','정확히',1,'2','2023-10-26',1,1),(12626,'auction','경매',1,'2','2023-10-26',1,1),(12627,'authentic','진정한, 진짜의, 진품의',1,'2','2023-10-26',1,1),(12628,'charge','요금,청구,금액;책임,의무\n~을 청구하다; (외상으로)달아놓다',1,'2','2023-10-26',1,1),(12629,'notice','통지, 공고',1,'2','2023-10-26',1,1),(12630,'experienced','경험이 있는, 노련한, 능숙한',1,'2','2023-10-26',1,1),(12631,'instruction','설명, 지시 (instruct 가르치다, 지시하다, instructor교사, 강사)',1,'2','2023-10-26',1,1),(12632,'expert','전문가, 전문가의, 전문적인',1,'2','2023-10-26',1,1),(12633,'warranty','(품질 등의)보증, 보증서',1,'2','2023-10-26',1,1),(12634,'refund','환불, 환불금',1,'2','2023-10-26',1,1),(12635,'subscriber','가입자, 구독자',1,'2','2023-10-26',1,1),(12636,'delivery','배달',1,'2','2023-10-26',1,1),(12637,'price','가격',1,'2','2023-10-26',1,1),(12638,'receipt','영수증',1,'2','2023-10-26',1,1),(12639,'offer','제공하다, 제공,오퍼',1,'2','2023-10-26',1,1),(12640,'carefully','주의깊게, 신중히',1,'2','2023-10-26',1,1),(12641,'benefit','혜택, 이익, 혜택을 보다, 이익을 얻다',1,'2','2023-10-26',1,1),(12642,'exclusively','오로지, 독점적으로',1,'2','2023-10-26',1,1),(12643,'description','(제품등의)설명, 해설',1,'2','2023-10-26',1,1),(12644,'relatively','상대적으로',1,'2','2023-10-26',1,1),(12645,'spare','아끼다, 할애하다, 예비의, 여분의',1,'2','2023-10-26',1,1),(12646,'preparation','준비, 대비',1,'2','2023-10-26',1,1),(12647,'area','지역, 구역',1,'2','2023-10-26',1,1),(12648,'clearance','정리, 없애기; 허가',1,'2','2023-10-26',1,1),(12649,'alter','(성질, 형상을)고치다, 바꾸다',1,'2','2023-10-26',1,1),(12650,'apply','적용하다; 지원하다',1,'2','2023-10-26',1,1),(12651,'mutually','서로, 상호 간에 (mutuality 상호관계, 상호의존)',1,'2','2023-10-26',1,1),(12652,'method','방식, 방법',1,'2','2023-10-26',1,1),(12653,'acceptable','용인되는, 받아들일 수 있는;\n훌륭한, 만족스러운',1,'2','2023-10-26',1,1),(12654,'desire','욕구, 갈망, 원하다, 바라다',1,'2','2023-10-26',1,1),(12655,'redeemable','(현금,상품과)교환할 수 있는, 환급할 수 있는( redeem 상환하다)',1,'2','2023-10-26',1,1),(12656,'officially','공식적으로',1,'2','2023-10-26',1,1),(12657,'consumption','소비(량), 소모 (consumptive 소모적인)',1,'2','2023-10-26',1,1),(12658,'qualify','~의 자격을 얻다',1,'2','2023-10-26',1,1),(12659,'fabric','섬유, 천',1,'2','2023-10-26',1,1),(12660,'valid','유효한',1,'2','2023-10-26',1,1),(12661,'vendor','노점상, 가판대; 판매업체',1,'2','2023-10-26',1,1),(12662,'research','연구, 조사',1,'2','2023-10-26',1,1),(12663,'devise','고안하다, 발명하다',1,'2','2023-10-26',1,1),(12664,'revolutionary','혁명적인',1,'2','2023-10-26',1,1),(12665,'innovative','혁신적인',1,'2','2023-10-26',1,1),(12666,'feature','특징, 특색, 특징으로 삼다, 특별히 포함하다',1,'2','2023-10-26',1,1),(12667,'inspiration','영감',1,'2','2023-10-26',1,1),(12668,'sufficiently','충분히(sufficient 충분한, 충분)',1,'2','2023-10-26',1,1),(12669,'patent','특허, 특허권, 특허품',1,'2','2023-10-26',1,1),(12670,'envision','(장래의 일 등을)계획하다, 상상하다',1,'2','2023-10-26',1,1),(12671,'extend','연장하다; (기간을)늘리다;\n(감사의 뜻을)말하다, 베풀다',1,'2','2023-10-26',1,1),(12672,'following','~후에, 다음의, 다음에 오는',1,'2','2023-10-26',1,1),(12673,'intend','~할 작정이다; 의도하다',1,'2','2023-10-26',1,1),(12674,'grant','(인정하여 정식으로)수여하다, 주다,\n(연구비, 장학금등의)보조금',1,'2','2023-10-26',1,1),(12675,'allow','~하게 하다, ~을 허락하다',1,'2','2023-10-26',1,1),(12676,'inspect','~을 검사하다, 조사하다',1,'2','2023-10-26',1,1),(12677,'improve','향상시키다, 개선하다',1,'2','2023-10-26',1,1),(12678,'increasingly','점점, 더욱 더',1,'2','2023-10-26',1,1),(12679,'invest','투자하다, 운용하다',1,'2','2023-10-26',1,1),(12680,'various','여러 가지의, 가지각색의',1,'2','2023-10-26',1,1),(12681,'upgrade','업그레이드, 개량형\n업그레이드하다, 개선하다',1,'2','2023-10-26',1,1),(12682,'manual','설명서, 안내서',1,'2','2023-10-26',1,1),(12683,'explore','조사하다, 탐구하다',1,'2','2023-10-26',1,1),(12684,'response','응답, 대답',1,'2','2023-10-26',1,1),(12685,'appearance','외관, 외모',1,'2','2023-10-26',1,1),(12686,'successful','성공적인, 성공한',1,'2','2023-10-26',1,1),(12687,'hold','~을 수용하다, ~을 담다;\n(회의 등을)개최하다, 열다',1,'2','2023-10-26',1,1),(12688,'advance','진보, 전진',1,'2','2023-10-26',1,1),(12689,'reliable','믿을 만한, 신뢰할 수 있는',1,'2','2023-10-26',1,1),(12690,'quality','품질, 질',1,'2','2023-10-26',1,1),(12691,'domestic','국내의, 국산의',1,'2','2023-10-26',1,1),(12692,'development','개발, 발전',1,'2','2023-10-26',1,1),(12693,'availability','(입수)가능성, 유효성, 유용성',1,'2','2023-10-26',1,1),(12694,'update','갱신, 개정, 갱신하다,\n최신의 것으로 하다',1,'2','2023-10-26',1,1),(12695,'accurate','정확한',1,'2','2023-10-26',1,1),(12696,'complicate','복잡한(complicatedly복잡하게)',1,'2','2023-10-26',1,1),(12697,'accomplished','숙련된, 노련한',1,'2','2023-10-26',1,1),(12698,'inquiry','문의, 질문',1,'2','2023-10-26',1,1),(12699,'indication','징후, 조짐',1,'2','2023-10-26',1,1),(12700,'manufacturer','제조회사, 제조업자',1,'2','2023-10-26',1,1),(12701,'compatible','호환되는, 양립할 수 있는(compatibility 양립성, 호환성)',1,'2','2023-10-26',1,1),(12702,'superior','우수한, 상급의',1,'2','2023-10-26',1,1),(12703,'absolute','완전한, 완전무결한',1,'2','2023-10-26',1,1),(12704,'broaden','넓히다',1,'2','2023-10-26',1,1),(12705,'corrosion','부식',1,'2','2023-10-26',1,1),(12706,'epuipment','장비, 설비',1,'2','2023-10-26',1,1),(12707,'automate','자동화하다',1,'2','2023-10-26',1,1),(12708,'specification','명세서, 설명서, 사양',1,'2','2023-10-26',1,1),(12709,'properly','제대로, 정확하게',1,'2','2023-10-26',1,1),(12710,'safety','안전',1,'2','2023-10-26',1,1),(12711,'precaution','예방조치, 예방책',1,'2','2023-10-26',1,1),(12712,'operate','(기계 등이)작동하다, 움직이다',1,'2','2023-10-26',1,1),(12713,'processing','가공, 처리(process 과정, 진행, 처리하다)',1,'2','2023-10-26',1,1),(12714,'capacity','용량, 수용력; 역할',1,'2','2023-10-26',1,1),(12715,'assemble','(부품,기계 등을)조립하다;\n(사람을)모으다',1,'2','2023-10-26',1,1),(12716,'utilize','이용하다, 활용하다',1,'2','2023-10-26',1,1),(12717,'place','~을-한 상태에 두다;\n(지시,주문,신청등을)하다',1,'2','2023-10-26',1,1),(12718,'fill','~을 채우다; (주문대로)이행하다',1,'2','2023-10-26',1,1),(12719,'manufacturing','제조(업)의',1,'2','2023-10-26',1,1),(12720,'renovate','(낡은 건물, 가구등을)개조하다,\n수리하다, 보수하다',1,'2','2023-10-26',1,1),(12721,'decision','결정, 판단',1,'2','2023-10-26',1,1),(12722,'material','재료, 물질',1,'2','2023-10-26',1,1),(12723,'success','성과, 성공',1,'2','2023-10-26',1,1),(12724,'attribute','(원인을)~의 덕분으로 돌리다',1,'2','2023-10-26',1,1),(12725,'efficiency','효율, 능률',1,'2','2023-10-26',1,1),(12726,'limit','한계, 제한',1,'2','2023-10-26',1,1),(12727,'tailored','맞춤의, 주문에 따라 맞춘',1,'2','2023-10-26',1,1),(12728,'component','부품, (구성)요소',1,'2','2023-10-26',1,1),(12729,'capable','~을 할 수 있는, ~할 능력이 있는',1,'2','2023-10-26',1,1),(12730,'economize','절약하다, 아끼다',1,'2','2023-10-26',1,1),(12731,'flexible','융통성 있는; 유연한, 잘 구부러지는',1,'2','2023-10-26',1,1),(12732,'comparable','필적하는, 비교되는',1,'2','2023-10-26',1,1),(12733,'produce','생산하다',1,'2','2023-10-26',1,1),(12734,'respectively','각각, 따로(respective 각각의)',1,'2','2023-10-26',1,1),(12735,'device','장치',1,'2','2023-10-26',1,1),(12736,'trim','(깍아)다듬다, 없애다; 삭감하다',1,'2','2023-10-26',1,1),(12737,'launch','(신제품을)출시하다',1,'2','2023-10-26',1,1),(12738,'separately','개별적으로, 따로따로',1,'2','2023-10-26',1,1),(12739,'expiration','(기간,임기 등의)만료, 만기',1,'2','2023-10-26',1,1),(12740,'maneuver','이동시키다, 움직이다',1,'2','2023-10-26',1,1),(12741,'coming','다가오는',1,'2','2023-10-26',1,1),(12742,'damaged','손상된, 손해를 입은',1,'2','2023-10-26',1,1),(12743,'prevent','~을 막다, ~을 예방하다',1,'2','2023-10-26',1,1),(12744,'power','전력, 전기',1,'2','2023-10-26',1,1),(12745,'chemical','화학제품',1,'2','2023-10-26',1,1),(12746,'complaint','불평',1,'2','2023-10-26',1,1),(12747,'deal','처리하다; 거래하다; 분배하다',1,'2','2023-10-26',1,1),(12748,'argumentative','논쟁적인, 논쟁을 좋아하는',1,'2','2023-10-26',1,1),(12749,'appropriately','적절하게(appropriate 적합한)',1,'2','2023-10-26',1,1),(12750,'respond','응답하다',1,'2','2023-10-26',1,1),(12751,'infuriate','화나게하다, 격분시키다',1,'2','2023-10-26',1,1),(12752,'curteous','예의바른',1,'2','2023-10-26',1,1),(12753,'satisfaction','만족',1,'2','2023-10-26',1,1),(12754,'inconvenience','불편, ~에게 불편을 느끼게 하다',1,'2','2023-10-26',1,1),(12755,'complete','완료하다, 완성하다, 완료된, 완성된',1,'2','2023-10-26',1,1),(12756,'specific','구체적인, 명확한',1,'2','2023-10-26',1,1),(12757,'return','반환하다, 반송하다',1,'2','2023-10-26',1,1),(12758,'replace','~을 교체하다, 대체하다',1,'2','2023-10-26',1,1),(12759,'presentation','발표',1,'2','2023-10-26',1,1),(12760,'evaluation','평가',1,'2','2023-10-26',1,1),(12761,'confident','자신 있는',1,'2','2023-10-26',1,1),(12762,'cause','~을 야기하다, ~의 원인이 되다\n원인',1,'2','2023-10-26',1,1),(12763,'commentary','해설, 설명(comment 해설하다,논평, 주석을달다)',1,'2','2023-10-26',1,1),(12764,'notification','통지',1,'2','2023-10-26',1,1),(12765,'apologize','사과하다',1,'2','2023-10-26',1,1),(12766,'interact','소통하다, 교류하다; 상호작용을 하다',1,'2','2023-10-26',1,1),(12767,'certain','확신하는, 확실한; 특정한',1,'2','2023-10-26',1,1),(12768,'commitment','헌신, 전념',1,'2','2023-10-26',1,1),(12769,'applaud','~에게 박수를 보내다; 칭찬하다',1,'2','2023-10-26',1,1),(12770,'biography','약력, 전기',1,'2','2023-10-26',1,1),(12771,'critical','비판적인; 중요한; 위기의',1,'2','2023-10-26',1,1),(12772,'depend on','~에 달려 있다, ~에게 의존하다',1,'2','2023-10-26',1,1),(12773,'combine','결합시키다',1,'2','2023-10-26',1,1),(12774,'priority','우선권, 우선사항',1,'2','2023-10-26',1,1),(12775,'observe','관찰하다, 주시하다;\n(규칙 등을)준수하다, 지키다',1,'2','2023-10-26',1,1),(12776,'defective','결함이 있는',1,'2','2023-10-26',1,1),(12777,'reflect','반영하다, 나타내다',1,'2','2023-10-26',1,1),(12778,'attitude','태도, 마음가짐',1,'2','2023-10-26',1,1),(12779,'disappoint','실망시키다',1,'2','2023-10-26',1,1),(12780,'inquire','문의하다, 질문하다',1,'2','2023-10-26',1,1),(12781,'insert','삽입하다',1,'2','2023-10-26',1,1),(12782,'disclose','공개하다, 드러내다',1,'2','2023-10-26',1,1),(12783,'guarantee','보장하다, 보장',1,'2','2023-10-26',1,1),(12784,'politely','공손하게, 예의바르게',1,'2','2023-10-26',1,1),(12785,'seriously','진지하게',1,'2','2023-10-26',1,1),(12786,'international','국제적인',1,'2','2023-10-26',1,1),(12787,'attraction','관광 명소',1,'2','2023-10-26',1,1),(12788,'itinerary','여행 일정',1,'2','2023-10-26',1,1),(12789,'exotic','이국적인, 매혹적인',1,'2','2023-10-26',1,1),(12790,'diverse','다양한',1,'2','2023-10-26',1,1),(12791,'superb','최고의, 뛰어난',1,'2','2023-10-26',1,1),(12792,'baggage','수화물',1,'2','2023-10-26',1,1),(12793,'destination','목적지',1,'2','2023-10-26',1,1),(12794,'missing','분실된, 없어진',1,'2','2023-10-26',1,1),(12795,'locate','(~의 위치를)찾아내다;\n~을 위치시키다',1,'2','2023-10-26',1,1),(12796,'approximately','대략',1,'2','2023-10-26',1,1),(12797,'duty','관세,세금; 직무,의무',1,'2','2023-10-26',1,1),(12798,'process','과정, 처리하다',1,'2','2023-10-26',1,1),(12799,'board','탑승하다, 이사회',1,'2','2023-10-26',1,1),(12800,'comfortable','편안한',1,'2','2023-10-26',1,1),(12801,'declare','(세관에서)신고하다',1,'2','2023-10-26',1,1),(12802,'specify','명시하다 (specification 열거, 명시, 명세서)',1,'2','2023-10-26',1,1),(12803,'depart','출발하다',1,'2','2023-10-26',1,1),(12804,'emergency','비상시, 비상 사태',1,'2','2023-10-26',1,1),(12805,'passenger','승객',1,'2','2023-10-26',1,1),(12806,'outgoing','(장소를)출발하는, 떠나는;\n(지위를)떠나는',1,'2','2023-10-26',1,1),(12807,'tighly','단단히, 꽉',1,'2','2023-10-26',1,1),(12808,'tour','(공장,시설 등의)견학, 짧은 여행',1,'2','2023-10-26',1,1),(12809,'carrier','항공사, 수송기, 수송 회사',1,'2','2023-10-26',1,1),(12810,'customarily','관례상, 습관적으로',1,'2','2023-10-26',1,1),(12811,'confuse','혼란시키다 (refuse 거절하다, 거부하다)',1,'2','2023-10-26',1,1),(12812,'arrive','도착하다',1,'2','2023-10-26',1,1),(12813,'brochure','(홍보용)소책자, 브로셔',1,'2','2023-10-26',1,1),(12814,'involve','수반하다, 포함하다; 참여시키다',1,'2','2023-10-26',1,1),(12815,'ship','(배나 다른 운송 수단으로)운송하다, 수송하다, 선박, 배',1,'2','2023-10-26',1,1),(12816,'suitcase','여행가방',1,'2','2023-10-26',1,1),(12817,'unavailable','이용할 수 없는, 구할 수 없는',1,'2','2023-10-26',1,1),(12818,'fill out/in','(서류에)기입하다, 적어 넣다',1,'2','2023-10-26',1,1),(12819,'customs','세관',1,'2','2023-10-26',1,1),(12820,'away','떨어져서',1,'2','2023-10-26',1,1),(12821,'dramatic','멋진, 극적인; 급격한',1,'2','2023-10-26',1,1),(12822,'hospitality','환대, 친절',1,'2','2023-10-26',1,1),(12823,'indulge','빠지다, 탐닉하다',1,'2','2023-10-26',1,1),(12824,'proximity','가까움, 근접함',1,'2','2023-10-26',1,1),(12825,'seating','(집합적)좌석 설비; 좌석 배열',1,'2','2023-10-26',1,1),(12826,'unlimited','무제한의',1,'2','2023-10-26',1,1),(12827,'proposal','제안, 계획',1,'2','2023-10-26',1,1),(12828,'alliance','동맹, 제휴',1,'2','2023-10-26',1,1),(12829,'stipulation','계약 조건',1,'2','2023-10-26',1,1),(12830,'term','조건; 임기, 기한',1,'2','2023-10-26',1,1),(12831,'compromise','타협, 화해',1,'2','2023-10-26',1,1),(12832,'negotiation','협상, 교섭',1,'2','2023-10-26',1,1),(12833,'agreement','계약, 협정; 합의',1,'2','2023-10-26',1,1),(12834,'deadlock','교착 상태',1,'2','2023-10-26',1,1),(12835,'review','검토하다, 재조사하다',1,'2','2023-10-26',1,1),(12836,'contract','계약(서),계약하다, 수축하다',1,'2','2023-10-26',1,1),(12837,'signature','서명',1,'2','2023-10-26',1,1),(12838,'originally','원래, 처음에는',1,'2','2023-10-26',1,1),(12839,'direction','방향, 지시, 감독',1,'2','2023-10-26',1,1),(12840,'initially','처음에, 초기에',1,'2','2023-10-26',1,1),(12841,'expire','(계약등이)만료되다',1,'2','2023-10-26',1,1),(12842,'collaborate','협력하다, 공동으로 일하다',1,'2','2023-10-26',1,1),(12843,'dedicate','전념하다, 헌신하다, 바치다(indicate 나타내다)',1,'2','2023-10-26',1,1),(12844,'revised','수정된, 변경된',1,'2','2023-10-26',1,1),(12845,'imperative','반드시 해야 하는, 필수적인',1,'2','2023-10-26',1,1),(12846,'cooperatively','협력하여, 협조적으로',1,'2','2023-10-26',1,1),(12847,'commission','수수료, 커미션; 위원회\n(일 등을)의뢰하다, 주문하다',1,'2','2023-10-26',1,1),(12848,'omit','빠뜨리다, 생략하다',1,'2','2023-10-26',1,1),(12849,'conflict','대립, 충돌, 갈등',1,'2','2023-10-26',1,1),(12850,'renew','(계약 등을)갱신하다',1,'2','2023-10-26',1,1),(12851,'proficient','능숙한, 능한',1,'2','2023-10-26',1,1),(12852,'confidentiality','기밀, 비밀',1,'2','2023-10-26',1,1),(12853,'dispute','분쟁, 논쟁',1,'2','2023-10-26',1,1),(12854,'objection','반대, 이익',1,'2','2023-10-26',1,1),(12855,'define','규정하다, 정의하다',1,'2','2023-10-26',1,1),(12856,'impression','인상',1,'2','2023-10-26',1,1),(12857,'security','보안, 안전, 보호',1,'2','2023-10-26',1,1),(12858,'option','선택권',1,'2','2023-10-26',1,1),(12859,'proceed','(일을)진행하다, 진척되다',1,'2','2023-10-26',1,1),(12860,'modify','수정하다, 일부 변경하다',1,'2','2023-10-26',1,1),(12861,'narrow','(범위 등을)좁히다',1,'2','2023-10-26',1,1),(12862,'bid','입찰',1,'2','2023-10-26',1,1),(12863,'settle','해결하다, 처리하다',1,'2','2023-10-26',1,1),(12864,'terminate','끝내다, 종결시키다',1,'2','2023-10-26',1,1),(12865,'challenging','도전적인, 힘든',1,'2','2023-10-26',1,1),(12866,'foundation','토대, 기초',1,'2','2023-10-26',1,1),(12867,'completely','전적으로, 완전히',1,'2','2023-10-26',1,1),(12868,'refuse','거절하다',1,'2','2023-10-26',1,1),(12869,'temporarily','일시적으로\n(temporary 일시적인, 잠정적인, 임시고용인)',1,'2','2023-10-26',1,1),(12870,'dealer','판매업자, 상인',1,'2','2023-10-26',1,1),(12871,'bulk','대량의',1,'2','2023-10-26',1,1),(12872,'inventory','재고품, 재고목록',1,'2','2023-10-26',1,1),(12873,'short','부족한',1,'2','2023-10-26',1,1),(12874,'cost','비용',1,'2','2023-10-26',1,1),(12875,'selection','선택된 것, 정선품',1,'2','2023-10-26',1,1),(12876,'commercial','상업의, 상업적인, 광고',1,'2','2023-10-26',1,1),(12877,'order','주문하다, 주문, 주문품',1,'2','2023-10-26',1,1),(12878,'provide','공급하다, 제공하다',1,'2','2023-10-26',1,1),(12879,'contact','~와 연락하다,\n(상업적 목적으로)교섭하고 있는 사람',1,'2','2023-10-26',1,1),(12880,'invoice','송장',1,'2','2023-10-26',1,1),(12881,'move','옮기다, 움직이다, 조치, 수단;\n이동, 이사',1,'2','2023-10-26',1,1),(12882,'supply','공급하다, 공급; (-s)비품, 소모품',1,'2','2023-10-26',1,1),(12883,'discount','할인',1,'2','2023-10-26',1,1),(12884,'distribute','배포하다, 배급하다',1,'2','2023-10-26',1,1),(12885,'acquisition','인수; 구입한 것',1,'2','2023-10-26',1,1),(12886,'assure','~에게 보장하다, ~을 안심시키다, 장담하다',1,'2','2023-10-26',1,1),(12887,'subject','~의 영향을 받기 쉬운;\n(동의 등을)조건으로 하는,\n~에게(~을) 받게 하다',1,'2','2023-10-26',1,1),(12888,'seek','구하다, 찾다',1,'2','2023-10-26',1,1),(12889,'satisfactory','만족스러운',1,'2','2023-10-26',1,1),(12890,'confirmation','확인, 확증',2,'2','2023-10-26',1,1),(12891,'unable','~할 수 없는',1,'2','2023-10-26',1,1),(12892,'payment','지불(금액),납입(금액)',1,'2','2023-10-26',1,1),(12893,'measure','대책, 조치, 수단\n측정하다',1,'2','2023-10-26',1,1),(12894,'bargain','특가품, 흥정',1,'2','2023-10-26',1,1),(12895,'stock','재고; 주식',1,'2','2023-10-26',1,1),(12896,'affordability','감당할 수 있는 비용',1,'2','2023-10-26',1,1),(12897,'clientele','(집합적)고객들,\n(변호사,건축가 등의)모든 의뢰인',1,'2','2023-10-26',1,1),(12898,'acclaim','호평, 찬사',1,'2','2023-10-26',1,1),(12899,'represent','~을 대표하다',1,'2','2023-10-26',1,1),(12900,'rating','등급, 평가',1,'2','2023-10-26',1,1),(12901,'encompass','포함하다, 둘러싸다',1,'2','2023-10-26',1,1),(12902,'finalize','마무리 짓다, 완결하다',1,'2','2023-10-26',1,1),(12903,'market','시장',1,'2','2023-10-26',1,1),(12904,'retail','소매',1,'2','2023-10-26',1,1),(12905,'commodity','상품, 산물',1,'2','2023-10-26',1,1),(12906,'quote','견적(액), 견적을 내다',1,'2','2023-10-26',1,1),(12907,'consignment','위탁 판매(consign위탁하다)',1,'2','2023-10-26',1,1),(12908,'fragile','깨지기 쉬운',1,'2','2023-10-26',1,1),(12909,'perishable','부패하기 쉬운',1,'2','2023-10-26',1,1),(12910,'deliver','배달하다; (연설을)하다',1,'2','2023-10-26',1,1),(12911,'ensure','확실하게 하다, 보장하다',1,'2','2023-10-26',1,1),(12912,'courier','급송 택배, 운반인',1,'2','2023-10-26',1,1),(12913,'carton','(큰)판지상자',1,'2','2023-10-26',1,1),(12914,'address','주소,\n(어려운 문제 등을)처리하다,다루다',1,'2','2023-10-26',1,1),(12915,'shipment','선적, (화물의)발송;\n수송품, 적하물',1,'2','2023-10-26',1,1),(12916,'particularly','특히',1,'2','2023-10-26',1,1),(12917,'adequately','적절히',1,'2','2023-10-26',1,1),(12918,'article','물품, 물건; 기사, 논설',1,'2','2023-10-26',1,1),(12919,'efficient','(기계, 방법 등이)효과적인,능률적인',1,'2','2023-10-26',1,1),(12920,'agency','대행 회사, 대리점',1,'2','2023-10-26',1,1),(12921,'enclose','~을 동봉하다; ~을 둘러싸다, 애워싸다',1,'2','2023-10-26',1,1),(12922,'careful','조심스러운, 주의 깊은',1,'2','2023-10-26',1,1),(12923,'pick up','~을 찾다; (사람,물건 등을) 도중에 태우다',1,'2','2023-10-26',1,1),(12924,'carry','지니다; (물건을)팔다, 가게에 놓다',1,'2','2023-10-26',1,1),(12925,'attach','붙이다, 접착하다, 첨부하다',1,'2','2023-10-26',1,1),(12926,'formerly','이전에',1,'2','2023-10-26',1,1),(12927,'package','소포, 꾸러미',1,'2','2023-10-26',1,1),(12928,'react','반응하다, 대응하다',1,'2','2023-10-26',1,1),(12929,'content','내용물',1,'2','2023-10-26',1,1),(12930,'convenience','편의, 편리',1,'2','2023-10-26',1,1),(12931,'acknowledge','인정하다; (편지 등의)수령을 알리다, 감사하다',1,'2','2023-10-26',1,1),(12932,'caution','주의, 조심',1,'2','2023-10-26',1,1),(12933,'correspondence','편지, 통신문',1,'2','2023-10-26',1,1),(12934,'separate','분리하다; 분류하다',1,'2','2023-10-26',1,1),(12935,'remarkable','현저한, 두드러진(markedly 현저하게 눈에 띄게)',1,'2','2023-10-26',1,1),(12936,'handle','취급하다, 다루다',1,'2','2023-10-26',1,1),(12937,'warehouse','창고, 저장소',1,'2','2023-10-26',1,1),(12938,'impose','(세금 등을)부과하다',1,'2','2023-10-26',1,1),(12939,'storage','보관소, 저장소',1,'2','2023-10-26',1,1),(12940,'detach','분리하다, 떼다, (attach 붙이다)',1,'2','2023-10-26',1,1),(12941,'envelope','봉투',1,'2','2023-10-26',1,1),(12942,'exclusion','제외, 배제',1,'2','2023-10-26',1,1),(12943,'recipient','수신자',1,'2','2023-10-26',1,1),(12944,'affix','(우표 등을)붙이다',1,'2','2023-10-26',1,1),(12945,'incorrect','부정확한',1,'2','2023-10-26',1,1),(12946,'oblige','어쩔 수 없이 ~하게 하다,\n~에게 강요하다',1,'2','2023-10-26',1,1),(12947,'step','단계; 조치, 수단',1,'2','2023-10-26',1,1),(12948,'check in','체크인하다, 숙박 수속을 하다',1,'2','2023-10-26',1,1),(12949,'compensate','보상하다\n(compensation 보상)',1,'2','2023-10-26',1,1),(12950,'complimentary','무료의, 우대의',1,'2','2023-10-26',1,1),(12951,'chef','주방장',1,'2','2023-10-26',1,1),(12952,'container','용기, 그릇',1,'2','2023-10-26',1,1),(12953,'elegant','우아한, 고상한',1,'2','2023-10-26',1,1),(12954,'flavor','맛, 풍미',1,'2','2023-10-26',1,1),(12955,'accommodate','(건물 등이)~을 수용하다, 숙박시키다;(충분한 공간을) 제공하다\n(조건, 요구 등을)만족시키다',1,'2','2023-10-26',1,1),(12956,'available','(사물이)이용 가능한;\n(사람이) 시간이 있는',1,'2','2023-10-26',1,1),(12957,'reception','환영회; (호텔, 회사, 병원 등의)접수처',1,'2','2023-10-26',1,1),(12958,'in advance','미리, 사전에',1,'2','2023-10-26',1,1),(12959,'refreshments','다과, 가벼운 음식물',1,'2','2023-10-26',1,1),(12960,'make','~을 하다, ~을 만들다',1,'2','2023-10-26',1,1),(12961,'cater','(연회 등의)음식물을 공급하다',1,'2','2023-10-26',1,1),(12962,'reservation','예약, 지정; 보호구역',1,'2','2023-10-26',1,1),(12963,'beverage','음료',1,'2','2023-10-26',1,1),(12964,'confirm','확인하다',2,'2','2023-10-26',1,1),(12965,'cancel','취소하다',1,'2','2023-10-26',1,1),(12966,'rate','요금',1,'2','2023-10-26',1,1),(12967,'conviniently','편리하게',1,'2','2023-10-26',1,1),(12968,'decorate','장식하다',1,'2','2023-10-26',1,1),(12969,'information','정보, 자료',1,'2','2023-10-26',1,1),(12970,'retain','유지하다, 보유하다',1,'2','2023-10-26',1,1),(12971,'atmosphere','분위기, 환경',1,'2','2023-10-26',1,1),(12972,'cuisine','(독특한)요리',1,'2','2023-10-26',1,1),(12973,'sequence','순서, 차례',1,'2','2023-10-26',1,1),(12974,'extensive','광범위한, 넓은',1,'2','2023-10-26',1,1),(12975,'prior','전의, 먼저의',1,'2','2023-10-26',1,1),(12976,'book','예약하다',1,'2','2023-10-26',1,1),(12977,'amenity','편의 시설',1,'2','2023-10-26',1,1),(12978,'belongings','소지품, 소유물',1,'2','2023-10-26',1,1),(12979,'entirely','완전히',1,'2','2023-10-26',1,1),(12980,'ease','완화시키다, 쉬움, 용이함',1,'2','2023-10-26',1,1),(12981,'ingredient','재료, 성분',1,'2','2023-10-26',1,1),(12982,'sip','음미하며 마시다, 홀짝거리다',1,'2','2023-10-26',1,1),(12983,'stir','휘젓다, 뒤섞다',1,'2','2023-10-26',1,1),(12984,'choice','선택물, 선택 사항, 선택',1,'2','2023-10-26',1,1),(12985,'complication','복잡한 문제',1,'2','2023-10-26',1,1),(12986,'freshness','신선함',1,'2','2023-10-26',1,1),(12987,'occupancy','(호텔등의)이용률',1,'2','2023-10-26',1,1),(12988,'decline','감소, 하락,(초대,신청을)거절하다',1,'2','2023-10-26',1,1),(12989,'markedly','현저하게, 눈에 띄게',1,'2','2023-10-26',1,1),(12990,'increase','인상, 증가, 증가하다',1,'2','2023-10-26',1,1),(12991,'revenue','수입',1,'2','2023-10-26',1,1),(12992,'projection','예상(치)',1,'2','2023-10-26',1,1),(12993,'substantial','상당한',1,'2','2023-10-26',1,1),(12994,'anticipate','예상하다, 기대하다\n(anticipation 예상)',1,'2','2023-10-26',1,1),(12995,'significantly','상당히, 두드러지게',1,'2','2023-10-26',1,1),(12996,'estimate','추정하다, 추산하다, 추정(치), 추산',1,'2','2023-10-26',1,1),(12997,'shift','옮기다, 이동하다, 변화, 교대근무',1,'2','2023-10-26',1,1),(12998,'fee','요금, 수수료',1,'2','2023-10-26',1,1),(12999,'production','생산량, 생산',1,'2','2023-10-26',1,1),(13000,'sale','(-s)매출액, 매상고; (할인)판매',1,'2','2023-10-26',1,1),(13001,'impressive','굉장한, 인상적인',1,'2','2023-10-26',1,1),(13002,'representative','직원, 외판원; 대표자',1,'2','2023-10-26',1,1),(13003,'recent','최근의',1,'2','2023-10-26',1,1),(13004,'exceed','~을 초과하다\n(exceedingly 대단히, 몹시)\n(exceedably 넘을 수 있는)',1,'2','2023-10-26',1,1),(13005,'improvement','향상',1,'2','2023-10-26',1,1),(13006,'employer','고용주',1,'2','2023-10-26',1,1),(13007,'regular','정기적인; 단골의',1,'2','2023-10-26',1,1),(13008,'summarize','요약하다',1,'2','2023-10-26',1,1),(13009,'typically','보통, 일반적으로',1,'2','2023-10-26',1,1),(13010,'whole','전체의, 온전한',1,'2','2023-10-26',1,1),(13011,'growth','성장, 발전',1,'2','2023-10-26',1,1),(13012,'figure','총액, 합계 수',1,'2','2023-10-26',1,1),(13013,'steady','꾸준한; 안정된',1,'2','2023-10-26',1,1),(13014,'frequent','빈번한, 잦은',1,'2','2023-10-26',1,1),(13015,'achieve','달성하다, 성취하다',1,'2','2023-10-26',1,1),(13016,'assumption','추정, 산정, 가정',1,'2','2023-10-26',1,1),(13017,'share','공유하다, 함께쓰다;\n(생각, 경험, 감정을 남과)함께 나누다\n몫, 지분',1,'2','2023-10-26',1,1),(13018,'incur','(손실을)입다, (빚을)지다',1,'2','2023-10-26',1,1),(13019,'slightly','약간',1,'2','2023-10-26',1,1),(13020,'profit','수익, 이익',1,'2','2023-10-26',1,1),(13021,'reliant','의존하는, 의지하는\n(reliantly 의지하여)',1,'2','2023-10-26',1,1),(13022,'illustrate','분명히 보여주다, 설명하다\n(illustrate 설명,해설,삽화)',1,'2','2023-10-26',1,1),(13023,'inaccurate','부정확한',1,'2','2023-10-26',1,1),(13024,'percentage','비율, 백분율',1,'2','2023-10-26',1,1),(13025,'reduce','줄이다, 감소시키다',1,'2','2023-10-26',1,1),(13026,'tend','~하는 경향이 있다, ~하기 쉽다',1,'2','2023-10-26',1,1),(13027,'audit','회계 감사, 심사',1,'2','2023-10-26',1,1),(13028,'accounting','회계',1,'2','2023-10-26',1,1),(13029,'budget','예산',1,'2','2023-10-26',1,1),(13030,'financial','재정의, 금전상의',1,'2','2023-10-26',1,1),(13031,'curtail','~을 줄이다, 삭감하다\n(curtailment 단축)',1,'2','2023-10-26',1,1),(13032,'deficit','적자, 부족액',1,'2','2023-10-26',1,1),(13033,'recently','최근에',1,'2','2023-10-26',1,1),(13034,'substantially','크게, 상당히\n(substantial 상당한, 재력이 있는)',1,'2','2023-10-26',1,1),(13035,'committee','위원회',1,'2','2023-10-26',1,1),(13036,'frequently','자주, 흔히',1,'2','2023-10-26',1,1),(13037,'capability','능력, 역량',1,'2','2023-10-26',1,1),(13038,'proceeds','수익금',1,'2','2023-10-26',1,1),(13039,'reimburse','변제하다, 상환하다',1,'2','2023-10-26',1,1),(13040,'considerably','상당히, 많이',1,'2','2023-10-26',1,1),(13041,'adequate','충분한, 적절한\n(adequately 적절히, 충분히)',1,'2','2023-10-26',1,1),(13042,'total','총계의, 전부의',1,'2','2023-10-26',1,1),(13043,'allocate','할당하다, 배분하다\n(allocation 할당)',1,'2','2023-10-26',1,1),(13044,'inspector','조사관, 감독관\n(inspect 검사하다)',1,'2','2023-10-26',1,1),(13045,'preferred','선호되는, 우선의',1,'2','2023-10-26',1,1),(13046,'quarter','사분기; 4분의1',1,'2','2023-10-26',1,1),(13047,'interrupt','중단시키다, 방해하다\n(interruption 방해, 중지, 중단)',1,'2','2023-10-26',1,1),(13048,'browse','흝어보다, 둘러보다',1,'2','2023-10-26',1,1),(13049,'prompt','즉각적인; 신속한, 촉발하다, 유도하다 (promptly 신속히)',1,'2','2023-10-26',1,1),(13050,'deduct','공제하다, 빼다\n(deduction 공제)',1,'2','2023-10-26',1,1),(13051,'measurement','측정, 측량; 치수',1,'2','2023-10-26',1,1),(13052,'shorten','단축하다, 짧게하다',1,'2','2023-10-26',1,1),(13053,'amend','수정하다\n(amendable 개정할 수 있는)',1,'2','2023-10-26',1,1),(13054,'calculate','계산하다, 산출하다',1,'2','2023-10-26',1,1),(13055,'exempt','면제된, ~이 없는\n(exemption 면제)',1,'2','2023-10-26',1,1),(13056,'deficient','부족한, 불충분한',1,'2','2023-10-26',1,1),(13057,'compare','비교하다',1,'2','2023-10-26',1,1),(13058,'fortunate','운 좋은',1,'2','2023-10-26',1,1),(13059,'expenditure','지출, 비용',1,'2','2023-10-26',1,1),(13060,'accurately','정확하게',1,'2','2023-10-26',1,1),(13061,'worth','~의 가치가 있는, (얼마)어치, 가치',1,'2','2023-10-26',1,1),(13062,'excess','초과, 초과량',1,'2','2023-10-26',1,1),(13063,'fiscal','회계의, 재정상의',1,'2','2023-10-26',1,1),(13064,'incidental','부수적인',1,'2','2023-10-26',1,1),(13065,'inflation','물가상승, 인플레이션, 통화팽창',1,'2','2023-10-26',1,1),(13066,'liable','책임져야 할; ~하기 쉬운',1,'2','2023-10-26',1,1),(13067,'spend','~을 쓰다, 소비하다',1,'2','2023-10-26',1,1),(13068,'turnover','총 매상고, 거래액; 이직률',1,'2','2023-10-26',1,1),(13069,'announce','발표하다',1,'2','2023-10-26',1,1),(13070,'interested','관련 있는; 관심이 있는',1,'2','2023-10-26',1,1),(13071,'active','적극적인, 활발한',1,'2','2023-10-26',1,1),(13072,'accept','수락하다, 승낙하다',1,'2','2023-10-26',1,1),(13073,'foresee','예견하다, 예감하다',1,'2','2023-10-26',1,1),(13074,'expansion','확장, 팽창',1,'2','2023-10-26',1,1),(13075,'relocate','(공장 등을)이전하다',1,'2','2023-10-26',1,1),(13076,'competitor','경쟁업체, 경쟁자',1,'2','2023-10-26',1,1),(13077,'asset','자산',1,'2','2023-10-26',1,1),(13078,'contribute','기여하다, 공헌하다',1,'2','2023-10-26',1,1),(13079,'dedicated','(목표 등에)전념하는, 헌신적인',1,'2','2023-10-26',1,1),(13080,'misplace','잃어버리다, 위치를 잘못 잡다',1,'2','2023-10-26',1,1),(13081,'considerable','(정도나 양이)상당한',1,'2','2023-10-26',1,1),(13082,'last','지속되다',1,'2','2023-10-26',1,1),(13083,'emerge','부상하다, 나타나다\n(merge 합병하다)',1,'2','2023-10-26',1,1),(13084,'grow','성장하다, 성장시키다, 증가시키다',1,'2','2023-10-26',1,1),(13085,'select','선발하다, 선택하다',1,'2','2023-10-26',1,1),(13086,'merge','합병하다, 병합하다',1,'2','2023-10-26',1,1),(13087,'imply','암시하다, 넌지시 나타내다, 의미하다',1,'2','2023-10-26',1,1),(13088,'vital','필수적인',1,'2','2023-10-26',1,1),(13089,'persist','(집요하게)계속하다, 계속되다, 지속되다\n(continue 계속되다, 계속하다)',1,'2','2023-10-26',1,1),(13090,'independent','독립적인, 독자적인',1,'2','2023-10-26',1,1),(13091,'force','세력',1,'2','2023-10-26',1,1),(13092,'establish','설립하다',1,'2','2023-10-26',1,1),(13093,'initiate','(사업 등을) 착수하다, 시작하다\n(commence 시작하다)',1,'2','2023-10-26',1,1),(13094,'enhance','(질 등을) 향상시키다, 높이다, 강화하다\n(strengthen 강화하다)\n(reinforce 보강하다, 강화하다)',1,'2','2023-10-26',1,1),(13095,'renowned','저명한, 유명한, 명성이 있는',1,'2','2023-10-26',1,1),(13096,'informed','정보에 근거한\n(inform 알리다, 통지하다)',1,'2','2023-10-26',1,1),(13097,'minutes','회의록',1,'2','2023-10-26',1,1),(13098,'waive','(규칙 등을)적용하지 않다,\n(권리,청구등을)포기하다\n(abandon 버리다, 단념하다, 그만두다)',1,'2','2023-10-26',1,1),(13099,'reach','(치수,양 등이)~에 달하다;\n~에 도착하다',1,'2','2023-10-26',1,1),(13100,'authority','권한; 당국',1,'2','2023-10-26',1,1),(13101,'acquire','매입하다, 취득하다\n(inquire 묻다)\n(inquiry 조사, 문의)',1,'2','2023-10-26',1,1),(13102,'surpass','~을 능가하다, 넘어서다',1,'2','2023-10-26',1,1),(13103,'run','~을 운영하다, 경영하다',1,'2','2023-10-26',1,1),(13104,'improbable','사실이라고 생각할 수 없는,\n일어날 것 같지 않은\n(probable 있음직한, 일어날것같은)',1,'2','2023-10-26',1,1),(13105,'edge','우위, 유리함; 가장자리, 끝',1,'2','2023-10-26',1,1),(13106,'simultaneously','동시에\n(coincidentally 우연히 일치하게 동시발생적으로)',1,'2','2023-10-26',1,1),(13107,'reveal','밝히다, 누설하다',1,'2','2023-10-26',1,1),(13108,'productivity','생산성',1,'2','2023-10-26',1,1),(13109,'uncertain','확신이 없는, 불확실한',1,'2','2023-10-26',1,1),(13110,'premier','으뜸의, 첫째의',1,'2','2023-10-26',1,1),(13111,'agenda','의제, 의사일정',1,'2','2023-10-26',1,1),(13112,'convene','(회원 등이)모이다, (회의가)개최되다\n(convener 의장,소집자)',1,'2','2023-10-26',1,1),(13113,'refute','부인하다, 반박하다\n(refutation 반박, 반론)',1,'2','2023-10-26',1,1),(13114,'coordination','조정',1,'2','2023-10-26',1,1),(13115,'unanimous','만장일치의, 동의하는\n(unanimously  만장일치로)',1,'2','2023-10-26',1,1),(13116,'convince','납득시키다, 확신시키다',1,'2','2023-10-26',1,1),(13117,'consensus','여론, 일치된 의견',1,'2','2023-10-26',1,1),(13118,'defer','연기하다, 미루다\n(differ 다르다)',1,'2','2023-10-26',1,1),(13119,'usually','보통, 일반적으로',1,'2','2023-10-26',1,1),(13120,'reschedule','일정을 바꾸다',1,'2','2023-10-26',1,1),(13121,'meeting','회의',1,'2','2023-10-26',1,1),(13122,'determine','알아내다; 결정하다, 확정하다',1,'2','2023-10-26',1,1),(13123,'report','보고하다; 출두하다,\n(직장,회의 등에 도착을)알리다,\n보고서; 보도, 기록',1,'2','2023-10-26',1,1),(13124,'comment','논평하다, 언급하다',1,'2','2023-10-26',1,1),(13125,'phase','단계',1,'2','2023-10-26',1,1),(13126,'approve','승인하다, 찬성하다',1,'2','2023-10-26',1,1),(13127,'enclosed','동봉된',1,'2','2023-10-26',1,1),(13128,'easy','쉬운, 용이한',1,'2','2023-10-26',1,1),(13129,'record','기록; 경력, 이력, 기록하다',1,'2','2023-10-26',1,1),(13130,'suggestion','제안',1,'2','2023-10-26',1,1),(13131,'attention','주의, 경청',1,'2','2023-10-26',1,1),(13132,'object','반대하다',1,'2','2023-10-26',1,1),(13133,'coincidentally','우연히, 일치하게, 동시 발생적으로\n(coincident 일치하는)',1,'2','2023-10-26',1,1),(13134,'crowded','붐비는, 복잡한',1,'2','2023-10-26',1,1),(13135,'undergo','겪다, 거치다, 경험하다',1,'2','2023-10-26',1,1),(13136,'outcome','결과 (=consequence)',1,'2','2023-10-26',1,1),(13137,'narrowly','주의 깊게, 좁게; 가까스로, 간신히, 겨우',1,'2','2023-10-26',1,1),(13138,'differ','의견을 달리하다, 다르다',1,'2','2023-10-26',1,1),(13139,'discuss','논의하다, 토론하다',1,'2','2023-10-26',1,1),(13140,'give','(연설, 수업 등을)하다',1,'2','2023-10-26',1,1),(13141,'brief','~에게 간단히 설명하다, 브리핑하다',1,'2','2023-10-26',1,1),(13142,'distract','(주의를)산만하게 하다, 빗기게 하다(distraction 주의산만, 방심)',1,'2','2023-10-26',1,1),(13143,'emphasis','강조, 중점',1,'2','2023-10-26',1,1),(13144,'press','언론(계),보도기관, 누르다',2,'2','2023-10-26',1,1),(13145,'organize','준비하다, 조직하다, 정리하다',1,'2','2023-10-26',1,1),(13146,'mention','언급하다',1,'2','2023-10-26',1,1),(13147,'persuasive','설득력 있는',1,'2','2023-10-26',1,1),(13148,'understanding','이해심 있는',1,'2','2023-10-26',1,1),(13149,'adjourn','(회의 등을)휴회하다',1,'2','2023-10-26',1,1),(13150,'constructive','건설적인',1,'2','2023-10-26',1,1),(13151,'preside','(회의의)사회를 보다, ~의 의장을 맡아보다',1,'2','2023-10-26',1,1),(13152,'irrelevant','관계가 없는, 무관한\n(relevant 관계가 있는)',1,'2','2023-10-26',1,1),(13153,'constraint','제한(=restriction)',1,'2','2023-10-26',1,1),(13154,'host','(대회 등을)주최하다',1,'2','2023-10-26',1,1),(13155,'annual','매년의',1,'2','2023-10-26',1,1),(13156,'purpose','목적, 의도',1,'2','2023-10-26',1,1),(13157,'enroll','등록하다',1,'2','2023-10-26',1,1),(13158,'lecture','강의, 강연',1,'2','2023-10-26',1,1),(13159,'participant','참가자',1,'2','2023-10-26',1,1),(13160,'attend','참석하다, 출석하다',1,'2','2023-10-26',1,1),(13161,'encourage','장려하다, 복돋아주다',1,'2','2023-10-26',1,1),(13162,'leave','휴가, 떠나다, 남기다',1,'2','2023-10-26',1,1),(13163,'recommendation','추천사항, 추천',1,'2','2023-10-26',1,1),(13164,'conference','회의, 회담',1,'2','2023-10-26',1,1),(13165,'schedule','~을 예정하다',1,'2','2023-10-26',1,1),(13166,'include','포함하다',1,'2','2023-10-26',1,1),(13167,'result','결과,(~의 결과로)되다',1,'2','2023-10-26',1,1),(13168,'register','등록하다',1,'2','2023-10-26',1,1),(13169,'require','요구하다',1,'2','2023-10-26',1,1),(13170,'grateful','고마워하는, 감사하는',1,'2','2023-10-26',1,1),(13171,'overtime','초과근무, 야근',1,'2','2023-10-26',1,1),(13172,'responsibility','부담, 책임, 의무',1,'2','2023-10-26',1,1),(13173,'assent','찬성하다, 승인, 동의\n(approval 승인)\n(approve 찬성하다)\n(prove 증명하다)',1,'2','2023-10-26',1,1),(13174,'regard','~을 -으로 간주하다, 여기다,\n관심,배려',1,'2','2023-10-26',1,1),(13175,'tentative','임시적인, 잠정적인',1,'2','2023-10-26',1,1),(13176,'welcome','반가운, 기꺼이 받아들여지는',1,'2','2023-10-26',1,1),(13177,'function','행사, 연회',1,'2','2023-10-26',1,1),(13178,'commence','시작되다',1,'2','2023-10-26',1,1),(13179,'objective','목표, 목적',1,'2','2023-10-26',1,1),(13180,'excited','신이 난, 들뜬',1,'2','2023-10-26',1,1),(13181,'reimbursement','상환, 변제, 배상',1,'2','2023-10-26',1,1),(13182,'treatment','대우, 처우',1,'2','2023-10-26',1,1),(13183,'honor','존경, 명예',1,'2','2023-10-26',1,1),(13184,'emphasize','강조하다',1,'2','2023-10-26',1,1),(13185,'entry','(경기 등의)참가자, 출품물',1,'2','2023-10-26',1,1),(13186,'bonus','상여금, 보너스',1,'2','2023-10-26',1,1),(13187,'salary','급여',1,'2','2023-10-26',1,1),(13188,'earn','(금전 등을)벌다; (평판을)받다, 얻다',1,'2','2023-10-26',1,1),(13189,'arise','(문제 등이)발생하다, 일어나다 = occur',1,'2','2023-10-26',1,1),(13190,'labor','노동',1,'2','2023-10-26',1,1),(13191,'union','노동조합',1,'2','2023-10-26',1,1),(13192,'existing','기존의, 현행의',1,'2','2023-10-26',1,1),(13193,'exploit','착취하다, 부당하게 이용하다\n(exploitation 개발,개척,약탈,착취)',1,'2','2023-10-26',1,1),(13194,'appoint','임명하다, 지명하다',1,'2','2023-10-26',1,1),(13195,'appraisal','평가',1,'2','2023-10-26',1,1),(13196,'promote','승진시키다; 촉진하다',1,'2','2023-10-26',1,1),(13197,'skilled','숙련된, 노련한',1,'2','2023-10-26',1,1),(13198,'radically','완전히, 철저히, 근본적으로\n(radical 근본적인, 과격한)',1,'2','2023-10-26',1,1),(13199,'exceptional','뛰어난, 예외적인\n(exception 예외, 이의, 반대)',1,'2','2023-10-26',1,1),(13200,'appreciation','감사',1,'2','2023-10-26',1,1),(13201,'evaluate','평가하다',1,'2','2023-10-26',1,1),(13202,'suggest','제안하다, 추천하다',1,'2','2023-10-26',1,1),(13203,'preference','선호',1,'2','2023-10-26',1,1),(13204,'management','경영진, 경영',1,'2','2023-10-26',1,1),(13205,'predict','예측하다',1,'2','2023-10-26',1,1),(13206,'transfer','보내다; 전근시키다',1,'2','2023-10-26',1,1),(13207,'award','상\n(reward 보상하다, 포상,보상)',1,'2','2023-10-26',1,1),(13208,'mandatory','의무적인',1,'2','2023-10-26',1,1),(13209,'competent','유능한, 능숙한\n(competence 능력)',1,'2','2023-10-26',1,1),(13210,'performance','실적,성과; 공연,연주, 연기',1,'2','2023-10-26',1,1),(13211,'reward','~에 보답하다, 보상하다, 포상,보상\n(award 상)',1,'2','2023-10-26',1,1),(13212,'search','찾기, 수색, 조사',1,'2','2023-10-26',1,1),(13213,'inexperienced','경험없는, 미숙한',1,'2','2023-10-26',1,1),(13214,'early','시간상 이른, 조기의',1,'2','2023-10-26',1,1),(13215,'designate','지명하다, 지정하다',1,'2','2023-10-26',1,1),(13216,'executive','경영의,관리의',1,'2','2023-10-26',1,1),(13217,'dedication','헌신',1,'2','2023-10-26',1,1),(13218,'unanimously','만장일치로\n(unanimous 만장일치의)\n(anonymously 익명으로, 특색없이)',1,'2','2023-10-26',1,1),(13219,'progress','진행, 진척, 진전, 진보하다, 발전하다',1,'2','2023-10-26',1,1),(13220,'congratulate','축하하다',1,'2','2023-10-26',1,1),(13221,'dismiss','해임하다, 해고하다',1,'2','2023-10-26',1,1),(13222,'independence','독립성',1,'2','2023-10-26',1,1),(13223,'participation','참여, 참가, 가입',1,'2','2023-10-26',1,1),(13224,'praise','칭찬',1,'2','2023-10-26',1,1),(13225,'accomplishment','성과,업적',1,'2','2023-10-26',1,1),(13226,'deliberation','토의, 심의, 숙고\n(deliberate 고의의, 숙고하다)',1,'2','2023-10-26',1,1),(13227,'leadership','리더십, 지도력',1,'2','2023-10-26',1,1),(13228,'retire','퇴직하다, 은퇴하다',1,'2','2023-10-26',1,1),(13229,'nomination','임명, 지명',1,'2','2023-10-26',1,1),(13230,'reorganize','재편성하다, 재조직하다\n(recognize 인식하다)\n(organize 조직하다)',1,'2','2023-10-26',1,1),(13231,'serve','근무하다, 일하다',1,'2','2023-10-26',1,1),(13232,'encouragement','격려',1,'2','2023-10-26',1,1),(13233,'resignation','사임, 사직, 사직서',1,'2','2023-10-26',1,1),(13234,'strictly','엄격히',1,'2','2023-10-26',1,1),(13235,'congestion','(교통의)체증, 혼잡\n(congest 혼잡하게 하다)',1,'2','2023-10-26',1,1),(13236,'alleviate','완화하다',1,'2','2023-10-26',1,1),(13237,'divert','우회시키다, 다른 곳으로 돌리다',1,'2','2023-10-26',1,1),(13238,'detour','우회',1,'2','2023-10-26',1,1),(13239,'fuel','연료',1,'2','2023-10-26',1,1),(13240,'malfunction','오작동, 기능불량',1,'2','2023-10-26',1,1),(13241,'permit','허락하다, 허가증',1,'2','2023-10-26',1,1),(13242,'transportation','교통(수단), 운송 수단',1,'2','2023-10-26',1,1),(13243,'opportunity','기회',1,'2','2023-10-26',1,1),(13244,'clearly','명확히',1,'2','2023-10-26',1,1),(13245,'ongoing','계속 진행 중인',1,'2','2023-10-26',1,1),(13246,'detailed','상세한',1,'2','2023-10-26',1,1),(13247,'alternative','대안, 대체, 다른, 대신의',1,'2','2023-10-26',1,1),(13248,'obtain','획득하다, 얻다',1,'2','2023-10-26',1,1),(13249,'designated','지정된',1,'2','2023-10-26',1,1),(13250,'intersection','교차로, 교차지점',1,'2','2023-10-26',1,1),(13251,'equip','갖추다, 설비하다',1,'2','2023-10-26',1,1),(13252,'commute','통근하다',1,'2','2023-10-26',1,1),(13253,'downtown','시내에서, 도심지로',1,'2','2023-10-26',1,1),(13254,'automotive','자동차의',1,'2','2023-10-26',1,1),(13255,'closure','폐쇄',1,'2','2023-10-26',1,1),(13256,'vehicle','차량, 운송 수단',1,'2','2023-10-26',1,1),(13257,'platform','승강장',1,'2','2023-10-26',1,1),(13258,'official','공무원, 관리, 공식적인',1,'2','2023-10-26',1,1),(13259,'transit','교통, 수송, 통과하다',1,'2','2023-10-26',1,1),(13260,'fare','교통요금',1,'2','2023-10-26',1,1),(13261,'expense','비용, 지출',1,'2','2023-10-26',1,1),(13262,'trust','신뢰, 신임, 믿다, 신뢰하다',1,'2','2023-10-26',1,1),(13263,'head','(~의 방향으로)나아가다, 향하게 하다',1,'2','2023-10-26',1,1),(13264,'drive','(차 등을)운전하다, 타고가다, 조종하다',1,'2','2023-10-26',1,1),(13265,'fine','벌금',1,'2','2023-10-26',1,1),(13266,'pass','지나가다, 통과하다',1,'2','2023-10-26',1,1),(13267,'securely','(매듭 등이)단단하게, 튼튼하게',1,'2','2023-10-26',1,1),(13268,'prominently','눈에 잘 띄게, 두드러지게\n(prominent 눈에 띄는)',1,'2','2023-10-26',1,1),(13269,'reserved','예약된, 예약한; 지정된',1,'2','2023-10-26',1,1),(13270,'average','평균치, 평균',1,'2','2023-10-26',1,1),(13271,'collision','충돌',1,'2','2023-10-26',1,1),(13272,'tow','견인하다',1,'2','2023-10-26',1,1),(13273,'reverse','뒤의, 반대의',1,'2','2023-10-26',1,1),(13274,'obstruct','(전망 등을)가리다, 차단하다;\n(도로 등을)막다\n(obstruction 장애물, 방해물)',1,'2','2023-10-26',1,1),(13275,'delinquent','(세금 등이)연체된, 미불의',1,'2','2023-10-26',1,1),(13276,'overdue','(지불,반납 등의)기한이 지난, 지불 기한이 넘은',1,'2','2023-10-26',1,1),(13277,'regrettably','유감스럽게도',1,'2','2023-10-26',1,1),(13278,'balance','잔고, 차감 잔액',1,'2','2023-10-26',1,1),(13279,'deposit','입금하다, 예금하다',1,'2','2023-10-26',1,1),(13280,'investigation','조사 (investigate 연구하다, 조사하다)',1,'2','2023-10-26',1,1),(13281,'account','계좌; 설명; 고려',1,'2','2023-10-26',1,1),(13282,'statement','명세서, 성명서',1,'2','2023-10-26',1,1),(13283,'amount','액수, 양',1,'2','2023-10-26',1,1),(13284,'withdrawal','(예금의)인출',1,'2','2023-10-26',1,1),(13285,'previously','이전에',1,'2','2023-10-26',1,1),(13286,'due','만기가 된, 지불 기일이 된;\n(금전 등이)~에게 마땅히 지급되어야 할',1,'2','2023-10-26',1,1),(13287,'receive','받다, 수취하다',1,'2','2023-10-26',1,1),(13288,'expect','예상하다, 기대하다',1,'2','2023-10-26',1,1),(13289,'certificate','증명서, 증서',1,'2','2023-10-26',1,1),(13290,'document','서류, 문서',1,'2','2023-10-26',1,1),(13291,'spending','소비; 지출',1,'2','2023-10-26',1,1),(13292,'successfully','성공적으로',1,'2','2023-10-26',1,1),(13293,'bill','~에게 청구서를 보내다, 청구서, 계산서',1,'2','2023-10-26',1,1),(13294,'pleasure','즐거움, 기쁜, 영광',1,'2','2023-10-26',1,1),(13295,'study','연구',1,'2','2023-10-26',1,1),(13296,'summary','요약, 개요\n(emphasize 강조하다)',1,'2','2023-10-26',1,1),(13297,'temporary','임시의',1,'2','2023-10-26',1,1),(13298,'lower','(양,가격을)줄이다',1,'2','2023-10-26',1,1),(13299,'transaction','거래, 업무',1,'2','2023-10-26',1,1),(13300,'double','두배로 만들다',1,'2','2023-10-26',1,1),(13301,'identification','신분증, 신분 증명서',1,'2','2023-10-26',1,1),(13302,'dissatisfaction','불만, 불평',1,'2','2023-10-26',1,1),(13303,'in common','공통으로, 공동으로',1,'2','2023-10-26',1,1),(13304,'interest','관심; 권리; 이자',1,'2','2023-10-26',1,1),(13305,'reject','거절하다, 거부하다',1,'2','2023-10-26',1,1),(13306,'relation','관계',1,'2','2023-10-26',1,1),(13307,'tentatively','임시로, 시험적으로\n(tentative 시험적인, 임시의, 가설)',1,'2','2023-10-26',1,1),(13308,'alternatively','그렇지 않으면, 그 대신에',1,'2','2023-10-26',1,1),(13309,'attentive','주의 깊은, 세심한',1,'2','2023-10-26',1,1),(13310,'convert','전환하다, 변환하다',1,'2','2023-10-26',1,1),(13311,'heavily','몹시, 심하게',1,'2','2023-10-26',1,1),(13312,'loan','대출, 대출금',1,'2','2023-10-26',1,1),(13313,'unexpected','예기치 않은',1,'2','2023-10-26',1,1),(13314,'cash','현금으로 바꾸다',1,'2','2023-10-26',1,1),(13315,'mortgage','(담보)대출',1,'2','2023-10-26',1,1),(13316,'payable','지불해야 하는',1,'2','2023-10-26',1,1),(13317,'personal','개인의',1,'2','2023-10-26',1,1),(13318,'investment','투자, 투자금',1,'2','2023-10-26',1,1),(13319,'incrative','수익성 있는, 돈벌이가 되는\n(profit, earning, gainings 이익)\n(income 수입, 소득)',1,'2','2023-10-26',1,1),(13320,'inherently','본질적으로\n(inherent 본래 갖추어져 있는, 고유의)',1,'2','2023-10-26',1,1),(13321,'secure','확보하다, 얻어 내다;\n안전하게 지키다, 고정시키다',1,'2','2023-10-26',1,1),(13322,'foreseeable','예견할 수 있는\n(oversee 감독하다)\n(overseas 외국의)',1,'2','2023-10-26',1,1),(13323,'innate','타고난',1,'2','2023-10-26',1,1),(13324,'property','재산',1,'2','2023-10-26',1,1),(13325,'on behalf of','~을 대신해서',1,'2','2023-10-26',1,1),(13326,'lease','임대차(계약)',1,'2','2023-10-26',1,1),(13327,'sponsor','후원하다, 후원자',1,'2','2023-10-26',1,1),(13328,'propose','제안하다',1,'2','2023-10-26',1,1),(13329,'support','후원, 원조, 지지, 지원하다,\n후원하다; 살게하다,\n(생명, 기력 등을)유지하다',1,'2','2023-10-26',1,1),(13330,'distributuion','분배, 배급',1,'2','2023-10-26',1,1),(13331,'consider','고려하다',1,'2','2023-10-26',1,1),(13332,'nearly','거의, 대략',1,'2','2023-10-26',1,1),(13333,'consent','동의, 허락, 동의하다\n(consentaneous일치하는)',1,'2','2023-10-26',1,1),(13334,'gratitude','고마움, 감사',1,'2','2023-10-26',1,1),(13335,'consult','상의하다, 상담하다',1,'2','2023-10-26',1,1),(13336,'advice','조언, 충고',1,'2','2023-10-26',1,1),(13337,'partially','부분적으로, 일부분은',1,'2','2023-10-26',1,1),(13338,'evident','분명한, 명백한,',1,'2','2023-10-26',1,1),(13339,'reliability','신뢰도, 믿음직함',1,'2','2023-10-26',1,1),(13340,'cautious','조심하는, 신중한',1,'2','2023-10-26',1,1),(13341,'insight','식견, 통찰력',1,'2','2023-10-26',1,1),(13342,'portfolio','포트폴리오, 투자 자산 구성',1,'2','2023-10-26',1,1),(13343,'possible','가능한, 있음직한',1,'2','2023-10-26',1,1),(13344,'speculation','추측\n(speculate, suppose, guess, infer 추측하다)',1,'2','2023-10-26',1,1),(13345,'solely','오로지, 혼자서, 전적으로',1,'2','2023-10-26',1,1),(13346,'entrepreneur','사업가',1,'2','2023-10-26',1,1),(13347,'eventually','결국, 마침내',1,'2','2023-10-26',1,1),(13348,'shareholder','주주',1,'2','2023-10-26',1,1),(13349,'outlook','전망',1,'2','2023-10-26',1,1),(13350,'stability','안정, 안정성',1,'2','2023-10-26',1,1),(13351,'bond','채권',1,'2','2023-10-26',1,1),(13352,'depreciation','가치 하락, 화폐의 구매력 저하\n(depreciate : ~의 가치를 떨어뜨리다, 가치가 떨어지다)',1,'2','2023-10-26',1,1),(13353,'increasing','증가하는',1,'2','2023-10-26',1,1),(13354,'prevalent','유행하고 있는, 널리 퍼진\n(prevalence 보급, 유행)',1,'2','2023-10-26',1,1),(13355,'rapid','빠른, 신속한',1,'2','2023-10-26',1,1),(13356,'unprecedented','전례 없는\n(precedented 전례가 있는)',1,'2','2023-10-26',1,1),(13357,'yield','(이윤을) 가져오다, 산출하다',1,'2','2023-10-26',1,1),(13358,'furnished','가구가 비치된',1,'2','2023-10-26',1,1),(13359,'residence','거주지, 주택',1,'2','2023-10-26',1,1),(13360,'spacious','(공간이)넓은',1,'2','2023-10-26',1,1),(13361,'drape','(방 등을 커튼 등으로)장식하다',1,'2','2023-10-26',1,1),(13362,'unoccupied','(집 등이)비어 있는, 사람이 살지 않는\n(occupy 차지하다, 점유하다)',1,'2','2023-10-26',1,1),(13363,'renovation','수리, 개조',1,'2','2023-10-26',1,1),(13364,'appropriate','적당한, 적합한(appropriately 적합하게)',1,'2','2023-10-26',1,1),(13365,'delay','연기하다, ~을 뒤로 미루다',1,'2','2023-10-26',1,1),(13366,'community','지역 사회, 공동체',1,'2','2023-10-26',1,1),(13367,'construction','건설, 건축',1,'2','2023-10-26',1,1),(13368,'repair','수리하다',1,'2','2023-10-26',1,1),(13369,'currently','현재',1,'2','2023-10-26',1,1),(13370,'regularly','정기적으로',1,'2','2023-10-26',1,1),(13371,'arrange','배열하다, 정돈하다',1,'2','2023-10-26',1,1),(13372,'location','장소, 위치',1,'2','2023-10-26',1,1),(13373,'restore','복구하다, 회복시키다\n(recovery 회복, recover되찾다, 회복하다)',1,'2','2023-10-26',1,1),(13374,'presently','현재\n(present, current현재의)\n(latest, recent, up to date 최근의)',1,'2','2023-10-26',1,1),(13375,'numerous','많은',1,'2','2023-10-26',1,1),(13376,'abandon','그만두다; 버리다(abondonment 버림, 포기)',1,'2','2023-10-26',1,1),(13377,'contractor','계약자, 도급업자',1,'2','2023-10-26',1,1),(13378,'develop','개발하다',1,'2','2023-10-26',1,1),(13379,'maintain','유지하다, 관리하다',1,'2','2023-10-26',1,1),(13380,'densely','빽빽이, 밀집하여',1,'2','2023-10-26',1,1),(13381,'prepare','준비하다, 채비를 갖추다',1,'2','2023-10-26',1,1),(13382,'finally','결국, 마침내',1,'2','2023-10-26',1,1),(13383,'district','지역, 지구',1,'2','2023-10-26',1,1),(13384,'renewal','재개발',1,'2','2023-10-26',1,1),(13385,'compulsory','의무적인',1,'2','2023-10-26',1,1),(13386,'interfere','방해하다, 해치다',1,'2','2023-10-26',1,1),(13387,'relocation','이전, 재배치',1,'2','2023-10-26',1,1),(13388,'totally','완전히, 전적으로',1,'2','2023-10-26',1,1),(13389,'actually','실제로, 사실은',1,'2','2023-10-26',1,1),(13390,'architect','건축가',1,'2','2023-10-26',1,1),(13391,'enlarge','확장하다, 확대하다',1,'2','2023-10-26',1,1),(13392,'install','설치하다, 장치하다',1,'2','2023-10-26',1,1),(13393,'permanent','영구적인',1,'2','2023-10-26',1,1),(13394,'suppose','생각하다, 추측하다(guess, infer 추측하다)',1,'2','2023-10-26',1,1),(13395,'adjacent','인접한',1,'2','2023-10-26',1,1),(13396,'consist','구성되다, 이루어지다',1,'2','2023-10-26',1,1),(13397,'utility','공공시설; 공공요금',1,'2','2023-10-26',1,1),(13398,'conserve','보전하다, 유지하다',1,'2','2023-10-26',1,1),(13399,'chance','가능성, 기회',1,'2','2023-10-26',1,1),(13400,'forecast','(날씨의)예보',1,'2','2023-10-26',1,1),(13401,'waste','쓰레기, 폐기물',1,'2','2023-10-26',1,1),(13402,'dispose','처분하다, 처리하다',1,'2','2023-10-26',1,1),(13403,'recycling','재활용',1,'2','2023-10-26',1,1),(13404,'clear','맑게 갠; 명백한, 분명한\n또렷하게, 완전히; 떨어져서',1,'2','2023-10-26',1,1),(13405,'damage','피해, 손해, 손상시키다',1,'2','2023-10-26',1,1),(13406,'significant','상당한; 중대한, 중요한',1,'2','2023-10-26',1,1),(13407,'solution','해결책',1,'2','2023-10-26',1,1),(13408,'occur','(일이)발생하다, 생기다(happen, take place)',1,'2','2023-10-26',1,1),(13409,'ideal','이상적인',1,'2','2023-10-26',1,1),(13410,'preserve','보존하다, 보호하다(=conserve, maintain, retain, keep)',1,'2','2023-10-26',1,1),(13411,'aid','원조, 돕다',1,'2','2023-10-26',1,1),(13412,'excessive','지나친, 과도한(excess 초과, 초과량)',1,'2','2023-10-26',1,1),(13413,'intensively','집중적으로( intense 격렬한)',1,'2','2023-10-26',1,1),(13414,'vary','다르다, 다양하다',1,'2','2023-10-26',1,1),(13415,'pleasing','즐거운, 기분 좋은, 만족스러운',1,'2','2023-10-26',1,1),(13416,'mark','점수, 평점, 표시, 축하하다',1,'2','2023-10-26',1,1),(13417,'inaccessible','접근이 불가능한, 이용이 불가능한',1,'2','2023-10-26',1,1),(13418,'disturb','방해하다',1,'2','2023-10-26',1,1),(13419,'pollutant','오염물질',1,'2','2023-10-26',1,1),(13420,'emission','배기가스, 방출',1,'2','2023-10-26',1,1),(13421,'dense','빽빽한, 밀집한',1,'2','2023-10-26',1,1),(13422,'environmental','환경적인',1,'2','2023-10-26',1,1),(13423,'consistent','일치하는, 지속적인, 한결같은',1,'2','2023-10-26',1,1),(13424,'leak','누출, 누출량',1,'2','2023-10-26',1,1),(13425,'organization','단체',1,'2','2023-10-26',1,1),(13426,'continually','계속해서',1,'2','2023-10-26',1,1),(13427,'contaminate','오염시키다(=pollution)',1,'2','2023-10-26',1,1),(13428,'disaster','재난',1,'2','2023-10-26',1,1),(13429,'discharge','방출하다',1,'2','2023-10-26',1,1),(13430,'resource','자원, 자료',1,'2','2023-10-26',1,1),(13431,'prominent','유명한, 두드러진',1,'2','2023-10-26',1,1),(13432,'deplete','고갈시키다(depletion 고갈)',1,'2','2023-10-26',1,1),(13433,'purify','정화시키다',1,'2','2023-10-26',1,1),(13434,'endangered','멸종 위기에 처한',1,'2','2023-10-26',1,1),(13435,'extinction','멸종',1,'2','2023-10-26',1,1),(13436,'drought','가뭄',1,'2','2023-10-26',1,1),(13437,'inflict','(고통,피해를)입히다, 가하다',1,'2','2023-10-26',1,1),(13438,'migration','이동, 이주',1,'2','2023-10-26',1,1),(13439,'ecology','생태, 자연환경',1,'2','2023-10-26',1,1),(13440,'habitat','(동, 식물의)서식지',1,'2','2023-10-26',1,1),(13441,'fatigue','피로',1,'2','2023-10-26',1,1),(13442,'checkup','건강 진단',1,'2','2023-10-26',1,1),(13443,'symtom','증상',1,'2','2023-10-26',1,1),(13444,'physician','내과의사',1,'2','2023-10-26',1,1),(13445,'diagnosis','진단',1,'2','2023-10-26',1,1),(13446,'prescribe','(약을)처방하다, 규정하다',1,'2','2023-10-26',1,1),(13447,'recovery','회복, 쾌유',1,'2','2023-10-26',1,1),(13448,'recognize','인정하다, 알아보다\n(organize 조직하다)',1,'2','2023-10-26',1,1),(13449,'join','~에 가입하다',1,'2','2023-10-26',1,1),(13450,'comprehensive','종합적인, 포괄적인',1,'2','2023-10-26',1,1),(13451,'participate','참여하다, 참가하다',1,'2','2023-10-26',1,1),(13452,'recommend','권고하다, 추천하다',1,'2','2023-10-26',1,1),(13453,'necessary','필요한',1,'2','2023-10-26',1,1),(13454,'ability','능력',1,'2','2023-10-26',1,1),(13455,'operation','수술',1,'2','2023-10-26',1,1),(13456,'cleanliness','청결',1,'2','2023-10-26',1,1),(13457,'duration','지속 기간, 지속',1,'2','2023-10-26',1,1),(13458,'examination','진찰, 검사',1,'2','2023-10-26',1,1),(13459,'eliminate','제거하다(elimination 제거)',1,'2','2023-10-26',1,1),(13460,'easily','쉽게',1,'2','2023-10-26',1,1),(13461,'dental','치과의',1,'2','2023-10-26',1,1),(13462,'dietary','식이 요법의, 규정식의',1,'2','2023-10-26',1,1),(13463,'related','관련된',1,'2','2023-10-26',1,1),(13464,'transmit','전염시키다(transmittable 전염가능한, 유전가능한)',1,'2','2023-10-26',1,1),(13465,'periodically','주기적으로',1,'2','2023-10-26',1,1),(13466,'reaction','반응',1,'2','2023-10-26',1,1),(13467,'simple','단순한',1,'2','2023-10-26',1,1),(13468,'coverage','(보험의)보상 범위; (신문 등의)보도, 취재범위',1,'2','2023-10-26',1,1),(13469,'exposure','노출',1,'2','2023-10-26',1,1),(13470,'pharmaceutical','제약의, 약학의',1,'2','2023-10-26',1,1),(13471,'premium','보험료',1,'2','2023-10-26',1,1),(13472,'relieve','완화시키다',1,'2','2023-10-26',1,1),(13473,'combination','결합, 연합',1,'2','2023-10-26',1,1),(13474,'conscious','알고 있는, 자각하고 있는\n(consciousness : 의식)',1,'2','2023-10-26',1,1),(13475,'deprivation','박탈, 상실(deprivative 박탈하는, 빼앗는)',1,'2','2023-10-26',1,1),(13476,'health','건강; (사회,기관의,)번영,안녕',1,'2','2023-10-26',1,1),(13477,'induce','유발하다 (reduce줄이다, 낮추다)',1,'2','2023-10-26',1,1),(13478,'insurance','보험',1,'2','2023-10-26',1,1),(13479,'nutrition','영양',1,'2','2023-10-26',1,1),(13480,'prevention','예방(prevent 예방하다, 방해하다)',1,'2','2023-10-26',1,1),(13481,'susceptible','~에 감염되기 쉬운, 영향 받기 쉬운',1,'2','2023-10-26',1,1);
/*!40000 ALTER TABLE `vocabulary` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-26 14:33:47
