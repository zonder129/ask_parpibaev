-- MySQL dump 10.13  Distrib 5.7.18, for Linux (x86_64)
--
-- Host: localhost    Database: mysite
-- ------------------------------------------------------
-- Server version	5.7.18-0ubuntu0.16.04.1

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permissi_content_type_id_2f476e4b_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add user',3,'add_user'),(8,'Can change user',3,'change_user'),(9,'Can delete user',3,'delete_user'),(10,'Can add group',4,'add_group'),(11,'Can change group',4,'change_group'),(12,'Can delete group',4,'delete_group'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add Вопрос',7,'add_question'),(20,'Can change Вопрос',7,'change_question'),(21,'Can delete Вопрос',7,'delete_question'),(22,'Can add Рейтинг',8,'add_like'),(23,'Can change Рейтинг',8,'change_like'),(24,'Can delete Рейтинг',8,'delete_like'),(25,'Can add Тег',9,'add_tag'),(26,'Can change Тег',9,'change_tag'),(27,'Can delete Тег',9,'delete_tag'),(28,'Can add Пользователь',10,'add_profile'),(29,'Can change Пользователь',10,'change_profile'),(30,'Can delete Пользователь',10,'delete_profile'),(31,'Can add Ответ',11,'add_answer'),(32,'Can change Ответ',11,'change_answer'),(33,'Can delete Ответ',11,'delete_answer');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `first_name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(254) COLLATE utf8_unicode_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$30000$TP2OO76xt39K$TX9DSdAMZvlOqgkPrdVUsJUDywmul25g+iebN9f2D+4=','2017-05-23 21:06:28.040178',1,'artur','','','havofavo@mail.ru',1,1,'2017-05-22 20:00:08.892917'),(2,'pbkdf2_sha256$30000$KCuXvZ4gRk0U$vW04Rwzd3VS9rmj69RXSWV1vhS2vxF65L3WlGKVms6E=',NULL,0,'Kenny','','','',0,1,'2017-05-22 20:04:44.385870'),(3,'pbkdf2_sha256$30000$3CtJma5UF4m9$rvPL1B/yAjFU13U5AF4a9gmmK0wOKVIVCvXe6OT1p0g=',NULL,0,'DrHouse','','','',0,1,'2017-05-22 20:48:04.681283'),(4,'pbkdf2_sha256$30000$FPuhkxOdJe1F$6owO9DlaqyO04zzd2r7/yVjiRyu/nNc9AE5v4LOdoCU=',NULL,0,'Dovakhin','','','',0,1,'2017-05-22 20:48:38.432587'),(5,'pbkdf2_sha256$30000$cdRohg8xt45E$+htyPh92B1WBLhTn9vXQToMSiKN0MqNAvPlsnn9wXto=',NULL,0,'kekekekek','dfgdfg','','sdfsdfsd@mail.ru',0,1,'2017-05-23 18:08:47.052880'),(6,'pbkdf2_sha256$30000$3N984acplxtw$FXc5hKuBe76v5zPwO8tQtnyHNfKbiYNErG4Wf+/juY8=',NULL,0,'AZAZA','zxcvv','','ALLOsd@mail.ru',0,1,'2017-05-23 18:21:15.428103'),(7,'pbkdf2_sha256$30000$vmaoFiidDi69$DvYeZC5ayiF8ZLQApkkRoGGSZ4yU9cxkQicRIphJ174=',NULL,0,'keker','yohoho','','ALLO@mail.ru',0,1,'2017-05-23 20:28:06.608359'),(8,'pbkdf2_sha256$30000$uU8O04oKqVD7$tSaEE41sBs97WZ8y1EUNPqJ79G/Bq+WZOHNtN/yJjoc=',NULL,0,'alloooooo','sfgh4','','alooo@mail.ru',0,1,'2017-05-23 20:30:29.184094'),(9,'pbkdf2_sha256$30000$IjpkJbhC6UlJ$ATaxeY1H3kRHJi0/8Pv++FTS59Zps3ciXT58B66WYoI=',NULL,0,'dfghfdh','2453rgd','','adbfghfh@mail.ru',0,1,'2017-05-23 20:32:53.948353'),(10,'pbkdf2_sha256$30000$VpEHZA3b8gM3$QJfGu9SLwpi6l3lZ9A377wsBEot58jbwmmJl1o89CDs=',NULL,0,'afgfg','32resge5t','','cvnbn@mail.ru',0,1,'2017-05-23 20:34:03.187884'),(11,'pbkdf2_sha256$30000$zeBTgIBaP83w$ZFYwLH/i8RT6+2So4JV3gg4k+p6WgrfPntdrf9R6fg0=',NULL,0,'srtggt','sfgfdtghth','','sdfdf@mail.ru',0,1,'2017-05-23 20:36:17.396744'),(12,'pbkdf2_sha256$30000$KoIYZ0mFaKvY$dULruakR3PYFZkOmnr3xr2SYBlwCHePi4/HQ6PcijUU=',NULL,0,'sdfgserg','dfhnfy','','nhnhn@mail.ru',0,1,'2017-05-23 20:39:56.302715'),(13,'pbkdf2_sha256$30000$r5QVfFDsYZVx$fgyAbdZ4YOfxmq6a7cORhpT9yZ5vd+1OP9Wa8SLaDo4=',NULL,0,'newnew','sdbfbvvcb','','primer@mail.ru',0,1,'2017-05-23 20:41:50.765108'),(14,'pbkdf2_sha256$30000$cskYK4XT6Pfu$lE94AdIb5Fyuks5Kj+6KmBxqxBCxy2SQfo1iVChlhLA=',NULL,0,'azazaasdf','dsbfdthtrh','','hasdfv@mail.ru',0,1,'2017-05-23 21:03:31.740364'),(15,'pbkdf2_sha256$30000$HRfNDhXDhbLH$tj1hFYIPY5h9zEqTpsU6slFMSd25jS5CjKyoCVwA5b8=',NULL,0,'privet','','','sdfg@mail.ru',0,1,'2017-05-23 21:35:30.288795'),(16,'pbkdf2_sha256$30000$v37mHv3lZJ6L$so1AQgNdNL4uZ5R8Tmr8SAROZdR+hzFyaPqHsa5VtbA=',NULL,0,'DSFGRG','dfthh','','xvbg@mail.ru',0,1,'2017-05-23 21:50:12.975856'),(17,'pbkdf2_sha256$30000$lj2EafbKqFUg$m2/dDGWb/JSlid/f95gC7JrVgUy7k9DkiSRVjXbNJPo=',NULL,0,'asdfg','ertwret','','vbnhh@mail.ru',0,1,'2017-05-23 22:01:29.940410'),(18,'pbkdf2_sha256$30000$d9GSucj4mIyQ$0VsL508Gu/8hbFTUkVXhbtYKZviNMFMZg8aGJchJoLw=',NULL,0,'sfgnfdth','drty5','','vbnnh@mail.ru',0,1,'2017-05-23 22:04:10.259250'),(19,'pbkdf2_sha256$30000$76HbY9unwvKE$4ymrfDhZHfok9e+r9XgKijH8vP5dvJmNpNjUiSrFCjI=',NULL,0,'asdfsdg','bnfyhgn','','sdgbfdrt@mail.ru',0,1,'2017-05-23 22:05:48.032033');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext COLLATE utf8_unicode_ci,
  `object_repr` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext COLLATE utf8_unicode_ci NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2017-05-22 20:04:44.415469','2','Kenny',1,'[{\"added\": {}}]',3,1),(2,'2017-05-22 20:08:51.810918','2','Profile object',1,'[{\"added\": {}}]',10,1),(3,'2017-05-22 20:21:13.719261','2','Kenny',2,'[{\"changed\": {\"fields\": [\"avatar\"]}}]',10,1),(4,'2017-05-22 20:25:23.086551','1','DEATH',1,'[{\"added\": {}}]',9,1),(5,'2017-05-22 20:27:31.872269','1','Убийцы',1,'[{\"added\": {}}]',7,1),(6,'2017-05-22 20:48:04.895248','3','DrHouse',1,'[{\"added\": {}}]',3,1),(7,'2017-05-22 20:48:13.305223','3','DrHouse',1,'[{\"added\": {}}]',10,1),(8,'2017-05-22 20:48:38.536749','4','Dovakhin',1,'[{\"added\": {}}]',3,1),(9,'2017-05-22 20:48:44.421545','4','Dovakhin',1,'[{\"added\": {}}]',10,1),(10,'2017-05-22 20:51:34.471467','1','Даааа',1,'[{\"added\": {}}]',11,1),(11,'2017-05-22 20:54:20.601717','2','Убийцы',1,'[{\"added\": {}}]',11,1),(12,'2017-05-22 20:56:25.072487','2','Нога',1,'[{\"added\": {}}]',9,1),(13,'2017-05-22 20:56:36.607639','2','Где взять протез ноги?',1,'[{\"added\": {}}]',7,1),(14,'2017-05-22 20:58:31.327469','3','Потеряшки',1,'[{\"added\": {}}]',9,1),(15,'2017-05-22 20:58:35.086209','3','ГДЕ МОЙ РОГАТЫЙ ШЛЕМ???',1,'[{\"added\": {}}]',7,1),(16,'2017-05-22 20:59:08.872739','3','ГДЕ МОЙ РОГАТЫЙ ШЛЕМ???',1,'[{\"added\": {}}]',11,1),(17,'2017-05-22 21:00:04.240542','4','ГДЕ МОЙ РОГАТЫЙ ШЛЕМ???',1,'[{\"added\": {}}]',11,1),(18,'2017-05-22 21:00:37.330660','5','Где взять протез ноги?',1,'[{\"added\": {}}]',11,1),(19,'2017-05-22 21:00:42.706280','5','Где взять протез ноги?',2,'[]',11,1),(20,'2017-05-22 21:01:40.182559','6','Где взять протез ноги?',1,'[{\"added\": {}}]',11,1),(21,'2017-05-22 22:28:43.552991','1','Рейтинг',1,'[{\"added\": {}}]',8,1),(22,'2017-05-22 22:59:33.775597','2','Kenny У тебя тоже проблемы с волчанкой?',1,'[{\"added\": {}}]',8,1),(23,'2017-05-23 12:56:27.847009','1','artur',1,'[{\"added\": {}}]',10,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `model` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(4,'auth','group'),(2,'auth','permission'),(3,'auth','user'),(5,'contenttypes','contenttype'),(11,'questions','answer'),(8,'questions','like'),(10,'questions','profile'),(7,'questions','question'),(9,'questions','tag'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2017-05-22 19:58:40.533155'),(2,'auth','0001_initial','2017-05-22 19:58:42.223854'),(3,'admin','0001_initial','2017-05-22 19:58:42.564936'),(4,'admin','0002_logentry_remove_auto_add','2017-05-22 19:58:42.620268'),(5,'contenttypes','0002_remove_content_type_name','2017-05-22 19:58:43.082566'),(6,'auth','0002_alter_permission_name_max_length','2017-05-22 19:58:43.511074'),(7,'auth','0003_alter_user_email_max_length','2017-05-22 19:58:43.577828'),(8,'auth','0004_alter_user_username_opts','2017-05-22 19:58:43.588149'),(9,'auth','0005_alter_user_last_login_null','2017-05-22 19:58:43.705616'),(10,'auth','0006_require_contenttypes_0002','2017-05-22 19:58:43.708452'),(11,'auth','0007_alter_validators_add_error_messages','2017-05-22 19:58:43.717991'),(12,'auth','0008_alter_user_username_max_length','2017-05-22 19:58:43.950411'),(13,'questions','0001_initial','2017-05-22 19:58:46.057564'),(14,'sessions','0001_initial','2017-05-22 19:58:46.211447'),(15,'questions','0002_remove_question_likes','2017-05-22 20:28:45.157794'),(16,'questions','0003_answer_author','2017-05-22 20:45:38.644052'),(17,'questions','0004_remove_answer_title','2017-05-22 20:53:32.546541'),(18,'questions','0005_auto_20170522_2211','2017-05-22 22:11:31.628960'),(19,'questions','0006_remove_like_like','2017-05-22 22:24:35.556679'),(20,'questions','0007_auto_20170522_2228','2017-05-22 22:28:07.260692'),(21,'questions','0008_auto_20170523_1134','2017-05-23 11:34:30.339093'),(22,'questions','0009_tag_num_questions','2017-05-23 12:08:59.658069'),(23,'questions','0010_auto_20170523_1242','2017-05-23 12:42:49.186163');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `session_data` longtext COLLATE utf8_unicode_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('2houwjgmg3tpyt484kwknatn08yxmfou','NWVhMzU5ODczNzU5ZmY1ZThmZjAzNjBjYjhlNzExNGI5OGEwNDg3NDp7Il9hdXRoX3VzZXJfaGFzaCI6IjkwODc3M2MxZmM0NzVlNWM1YjFhYzIxNzIyMTkyMWE5NjZlYWIyMDMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2017-06-05 20:00:37.211199'),('unmmaetl8e3ofqnwjdj1lfugywhg899i','NWVhMzU5ODczNzU5ZmY1ZThmZjAzNjBjYjhlNzExNGI5OGEwNDg3NDp7Il9hdXRoX3VzZXJfaGFzaCI6IjkwODc3M2MxZmM0NzVlNWM1YjFhYzIxNzIyMTkyMWE5NjZlYWIyMDMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2017-06-06 21:06:28.086726');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions_answer`
--

DROP TABLE IF EXISTS `questions_answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `questions_answer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` longtext COLLATE utf8_unicode_ci NOT NULL,
  `question_id` int(11) NOT NULL,
  `author_id` int(11),
  `raiting` int(11),
  PRIMARY KEY (`id`),
  KEY `questions_answer_question_id_45884d67_fk_questions_question_id` (`question_id`),
  KEY `questions_answer_author_id_ceb2e333_fk_questions_profile_user_id` (`author_id`),
  CONSTRAINT `questions_answer_author_id_ceb2e333_fk_questions_profile_user_id` FOREIGN KEY (`author_id`) REFERENCES `questions_profile` (`user_id`),
  CONSTRAINT `questions_answer_question_id_45884d67_fk_questions_question_id` FOREIGN KEY (`question_id`) REFERENCES `questions_question` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions_answer`
--

LOCK TABLES `questions_answer` WRITE;
/*!40000 ALTER TABLE `questions_answer` DISABLE KEYS */;
INSERT INTO `questions_answer` VALUES (1,'Я видел в шкафу их КРИВЫЕ МЕЧИ',1,4,NULL),(2,'У тебя тоже проблемы с волчанкой?',1,3,NULL),(3,'Я его видел кажется на каком-то стражнике. Он все жаловался мне на колено...',3,2,NULL),(4,'Мне кажется, ты слишком много играешь в видеоигры.',3,3,NULL),(5,'Сделаю из костей дракона за 200 золотых.',2,4,NULL),(6,'У Картмена был один такой! Кажется, он тоже на ногу.',2,3,NULL);
/*!40000 ALTER TABLE `questions_answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions_like`
--

DROP TABLE IF EXISTS `questions_like`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `questions_like` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `answer_id` int(11) DEFAULT NULL,
  `author_id` int(11) DEFAULT NULL,
  `question_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `questions_like_author_id_2c48ab9e_fk_questions_profile_user_id` (`author_id`),
  KEY `questions_like_answer_id_6192879c_fk_questions_answer_id` (`answer_id`),
  KEY `questions_like_question_id_5c43ca6e_fk_questions_question_id` (`question_id`),
  CONSTRAINT `questions_like_answer_id_6192879c_fk_questions_answer_id` FOREIGN KEY (`answer_id`) REFERENCES `questions_answer` (`id`),
  CONSTRAINT `questions_like_author_id_2c48ab9e_fk_questions_profile_user_id` FOREIGN KEY (`author_id`) REFERENCES `questions_profile` (`user_id`),
  CONSTRAINT `questions_like_question_id_5c43ca6e_fk_questions_question_id` FOREIGN KEY (`question_id`) REFERENCES `questions_question` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions_like`
--

LOCK TABLES `questions_like` WRITE;
/*!40000 ALTER TABLE `questions_like` DISABLE KEYS */;
INSERT INTO `questions_like` VALUES (1,NULL,3,3),(2,2,2,NULL);
/*!40000 ALTER TABLE `questions_like` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions_profile`
--

DROP TABLE IF EXISTS `questions_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `questions_profile` (
  `avatar` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `questions_profile_user_id_31082efe_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions_profile`
--

LOCK TABLES `questions_profile` WRITE;
/*!40000 ALTER TABLE `questions_profile` DISABLE KEYS */;
INSERT INTO `questions_profile` VALUES ('avatar_qn22rsO.png',1),('avatar_ltq6F2d.png',2),('avatar_fFqtGcz.png',3),('avatar_w8JqIrR.png',4),('',7),('',8),('',9),('',10),('',11),('',12),('',13),('',14),('',15),('',16),('',17),('avatar.png',18),('avatar.png',19);
/*!40000 ALTER TABLE `questions_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions_question`
--

DROP TABLE IF EXISTS `questions_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `questions_question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `text` longtext COLLATE utf8_unicode_ci NOT NULL,
  `author_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  `raiting` int(11),
  PRIMARY KEY (`id`),
  KEY `questions_questi_author_id_f53392d1_fk_questions_profile_user_id` (`author_id`),
  KEY `questions_question_tag_id_ba76812b_fk_questions_tag_id` (`tag_id`),
  CONSTRAINT `questions_questi_author_id_f53392d1_fk_questions_profile_user_id` FOREIGN KEY (`author_id`) REFERENCES `questions_profile` (`user_id`),
  CONSTRAINT `questions_question_tag_id_ba76812b_fk_questions_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `questions_tag` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions_question`
--

LOCK TABLES `questions_question` WRITE;
/*!40000 ALTER TABLE `questions_question` DISABLE KEYS */;
INSERT INTO `questions_question` VALUES (1,'Убийцы','Мне кажется, будто я иногда умираю. Вы такое чувствуете?',2,1,NULL),(2,'Где взять протез ноги?','Ни у кого случайно не оставалось дома протеза, такого крутого, как в Deus Ex?',3,2,NULL),(3,'ГДЕ МОЙ РОГАТЫЙ ШЛЕМ???','Два дня назад гулял по рынку Маркарта и потерял шлем. Если кто найдет - он такой железный, с рогами - заплачу драконьими душами.',4,3,NULL),(4,'mbvnuxvwva?','xcsmrvrqfyfnwipcykhfzncbwthsmqhkihzrlurb',1,1,0),(5,'njonevtcws?','yahajyoastgqrsnvqitgtnbccwftksletcbylqtt',1,1,0),(6,'otuqgllydq?','cxkspgcjrqwlkoisbjratfzzqemenqgyrnatbncs',1,1,0),(7,'tltptfljqr?','jguxmfmwjmivtquzceyyxmizpounmmfxcfsykerr',1,1,0),(8,'insmbfwhgm?','lzblrqjskmthveypzxgqkxwaqyoynlwvbxgvinje',1,1,0),(9,'zzqihcodwi?','lyqfzwkzzfnmezoyfwtirerduqrkpodmawwfjgbl',1,1,0);
/*!40000 ALTER TABLE `questions_question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions_tag`
--

DROP TABLE IF EXISTS `questions_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `questions_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `num_questions` int(11),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions_tag`
--

LOCK TABLES `questions_tag` WRITE;
/*!40000 ALTER TABLE `questions_tag` DISABLE KEYS */;
INSERT INTO `questions_tag` VALUES (1,'DEATH',NULL),(2,'Нога',NULL),(3,'Потеряшки',NULL);
/*!40000 ALTER TABLE `questions_tag` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-05-31 11:53:43
