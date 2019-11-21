-- MariaDB dump 10.17  Distrib 10.4.8-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: testlink
-- ------------------------------------------------------
-- Server version	10.4.8-MariaDB

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
-- Table structure for table `assignment_status`
--

DROP TABLE IF EXISTS `assignment_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assignment_status` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(100) NOT NULL DEFAULT 'unknown',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assignment_status`
--

LOCK TABLES `assignment_status` WRITE;
/*!40000 ALTER TABLE `assignment_status` DISABLE KEYS */;
INSERT INTO `assignment_status` VALUES (1,'open'),(2,'closed'),(3,'completed'),(4,'todo_urgent'),(5,'todo');
/*!40000 ALTER TABLE `assignment_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assignment_types`
--

DROP TABLE IF EXISTS `assignment_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assignment_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fk_table` varchar(30) DEFAULT '',
  `description` varchar(100) NOT NULL DEFAULT 'unknown',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assignment_types`
--

LOCK TABLES `assignment_types` WRITE;
/*!40000 ALTER TABLE `assignment_types` DISABLE KEYS */;
INSERT INTO `assignment_types` VALUES (1,'testplan_tcversions','testcase_execution'),(2,'tcversions','testcase_review');
/*!40000 ALTER TABLE `assignment_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attachments`
--

DROP TABLE IF EXISTS `attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attachments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fk_id` int(10) unsigned NOT NULL DEFAULT 0,
  `fk_table` varchar(250) DEFAULT '',
  `title` varchar(250) DEFAULT '',
  `description` varchar(250) DEFAULT '',
  `file_name` varchar(250) NOT NULL DEFAULT '',
  `file_path` varchar(250) DEFAULT '',
  `file_size` int(11) NOT NULL DEFAULT 0,
  `file_type` varchar(250) NOT NULL DEFAULT '',
  `date_added` timestamp NOT NULL DEFAULT current_timestamp(),
  `content` longblob DEFAULT NULL,
  `compression_type` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `attachments_idx1` (`fk_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attachments`
--

LOCK TABLES `attachments` WRITE;
/*!40000 ALTER TABLE `attachments` DISABLE KEYS */;
/*!40000 ALTER TABLE `attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `builds`
--

DROP TABLE IF EXISTS `builds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `builds` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `testplan_id` int(10) unsigned NOT NULL DEFAULT 0,
  `name` varchar(100) NOT NULL DEFAULT 'undefined',
  `notes` text DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `is_open` tinyint(1) NOT NULL DEFAULT 1,
  `author_id` int(10) unsigned DEFAULT NULL,
  `creation_ts` timestamp NOT NULL DEFAULT current_timestamp(),
  `release_date` date DEFAULT NULL,
  `closed_on_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`testplan_id`,`name`),
  KEY `testplan_id` (`testplan_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Available builds';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `builds`
--

LOCK TABLES `builds` WRITE;
/*!40000 ALTER TABLE `builds` DISABLE KEYS */;
/*!40000 ALTER TABLE `builds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cfield_build_design_values`
--

DROP TABLE IF EXISTS `cfield_build_design_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cfield_build_design_values` (
  `field_id` int(10) NOT NULL DEFAULT 0,
  `node_id` int(10) NOT NULL DEFAULT 0,
  `value` varchar(4000) NOT NULL DEFAULT '',
  PRIMARY KEY (`field_id`,`node_id`),
  KEY `idx_cfield_build_design_values` (`node_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cfield_build_design_values`
--

LOCK TABLES `cfield_build_design_values` WRITE;
/*!40000 ALTER TABLE `cfield_build_design_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `cfield_build_design_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cfield_design_values`
--

DROP TABLE IF EXISTS `cfield_design_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cfield_design_values` (
  `field_id` int(10) NOT NULL DEFAULT 0,
  `node_id` int(10) NOT NULL DEFAULT 0,
  `value` varchar(4000) NOT NULL DEFAULT '',
  PRIMARY KEY (`field_id`,`node_id`),
  KEY `idx_cfield_design_values` (`node_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cfield_design_values`
--

LOCK TABLES `cfield_design_values` WRITE;
/*!40000 ALTER TABLE `cfield_design_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `cfield_design_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cfield_execution_values`
--

DROP TABLE IF EXISTS `cfield_execution_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cfield_execution_values` (
  `field_id` int(10) NOT NULL DEFAULT 0,
  `execution_id` int(10) NOT NULL DEFAULT 0,
  `testplan_id` int(10) NOT NULL DEFAULT 0,
  `tcversion_id` int(10) NOT NULL DEFAULT 0,
  `value` varchar(4000) NOT NULL DEFAULT '',
  PRIMARY KEY (`field_id`,`execution_id`,`testplan_id`,`tcversion_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cfield_execution_values`
--

LOCK TABLES `cfield_execution_values` WRITE;
/*!40000 ALTER TABLE `cfield_execution_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `cfield_execution_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cfield_node_types`
--

DROP TABLE IF EXISTS `cfield_node_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cfield_node_types` (
  `field_id` int(10) NOT NULL DEFAULT 0,
  `node_type_id` int(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (`field_id`,`node_type_id`),
  KEY `idx_custom_fields_assign` (`node_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cfield_node_types`
--

LOCK TABLES `cfield_node_types` WRITE;
/*!40000 ALTER TABLE `cfield_node_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `cfield_node_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cfield_testplan_design_values`
--

DROP TABLE IF EXISTS `cfield_testplan_design_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cfield_testplan_design_values` (
  `field_id` int(10) NOT NULL DEFAULT 0,
  `link_id` int(10) NOT NULL DEFAULT 0 COMMENT 'point to testplan_tcversion id',
  `value` varchar(4000) NOT NULL DEFAULT '',
  PRIMARY KEY (`field_id`,`link_id`),
  KEY `idx_cfield_tplan_design_val` (`link_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cfield_testplan_design_values`
--

LOCK TABLES `cfield_testplan_design_values` WRITE;
/*!40000 ALTER TABLE `cfield_testplan_design_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `cfield_testplan_design_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cfield_testprojects`
--

DROP TABLE IF EXISTS `cfield_testprojects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cfield_testprojects` (
  `field_id` int(10) unsigned NOT NULL DEFAULT 0,
  `testproject_id` int(10) unsigned NOT NULL DEFAULT 0,
  `display_order` smallint(5) unsigned NOT NULL DEFAULT 1,
  `location` smallint(5) unsigned NOT NULL DEFAULT 1,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `required` tinyint(1) NOT NULL DEFAULT 0,
  `required_on_design` tinyint(1) NOT NULL DEFAULT 0,
  `required_on_execution` tinyint(1) NOT NULL DEFAULT 0,
  `monitorable` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`field_id`,`testproject_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cfield_testprojects`
--

LOCK TABLES `cfield_testprojects` WRITE;
/*!40000 ALTER TABLE `cfield_testprojects` DISABLE KEYS */;
/*!40000 ALTER TABLE `cfield_testprojects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `codetrackers`
--

DROP TABLE IF EXISTS `codetrackers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `codetrackers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `type` int(10) DEFAULT 0,
  `cfg` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `codetrackers_uidx1` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `codetrackers`
--

LOCK TABLES `codetrackers` WRITE;
/*!40000 ALTER TABLE `codetrackers` DISABLE KEYS */;
/*!40000 ALTER TABLE `codetrackers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_fields`
--

DROP TABLE IF EXISTS `custom_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_fields` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL DEFAULT '',
  `label` varchar(64) NOT NULL DEFAULT '' COMMENT 'label to display on user interface',
  `type` smallint(6) NOT NULL DEFAULT 0,
  `possible_values` varchar(4000) NOT NULL DEFAULT '',
  `default_value` varchar(4000) NOT NULL DEFAULT '',
  `valid_regexp` varchar(255) NOT NULL DEFAULT '',
  `length_min` int(10) NOT NULL DEFAULT 0,
  `length_max` int(10) NOT NULL DEFAULT 0,
  `show_on_design` tinyint(3) unsigned NOT NULL DEFAULT 1 COMMENT '1=> show it during specification design',
  `enable_on_design` tinyint(3) unsigned NOT NULL DEFAULT 1 COMMENT '1=> user can write/manage it during specification design',
  `show_on_execution` tinyint(3) unsigned NOT NULL DEFAULT 0 COMMENT '1=> show it during test case execution',
  `enable_on_execution` tinyint(3) unsigned NOT NULL DEFAULT 0 COMMENT '1=> user can write/manage it during test case execution',
  `show_on_testplan_design` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `enable_on_testplan_design` tinyint(3) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_custom_fields_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_fields`
--

LOCK TABLES `custom_fields` WRITE;
/*!40000 ALTER TABLE `custom_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db_version`
--

DROP TABLE IF EXISTS `db_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `db_version` (
  `version` varchar(50) NOT NULL DEFAULT 'unknown',
  `upgrade_ts` timestamp NOT NULL DEFAULT current_timestamp(),
  `notes` text DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_version`
--

LOCK TABLES `db_version` WRITE;
/*!40000 ALTER TABLE `db_version` DISABLE KEYS */;
INSERT INTO `db_version` VALUES ('DB 1.9.19','2019-11-01 15:09:28','TestLink 1.9.19 Metonic cycle');
/*!40000 ALTER TABLE `db_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `events` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `transaction_id` int(10) unsigned NOT NULL DEFAULT 0,
  `log_level` smallint(5) unsigned NOT NULL DEFAULT 0,
  `source` varchar(45) DEFAULT NULL,
  `description` text NOT NULL,
  `fired_at` int(10) unsigned NOT NULL DEFAULT 0,
  `activity` varchar(45) DEFAULT NULL,
  `object_id` int(10) unsigned DEFAULT NULL,
  `object_type` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `transaction_id` (`transaction_id`),
  KEY `fired_at` (`fired_at`)
) ENGINE=InnoDB AUTO_INCREMENT=816 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
INSERT INTO `events` VALUES (1,1,32,'GUI','string \'testCaseStatus_draft\' is not localized for locale \'ru_RU\'  - using en_GB',1572620978,'LOCALIZATION',0,NULL),(2,1,32,'GUI','string \'testCaseStatus_readyForReview\' is not localized for locale \'ru_RU\'  - using en_GB',1572620978,'LOCALIZATION',0,NULL),(3,1,32,'GUI','string \'testCaseStatus_reviewInProgress\' is not localized for locale \'ru_RU\'  - using en_GB',1572620978,'LOCALIZATION',0,NULL),(4,1,32,'GUI','string \'testCaseStatus_rework\' is not localized for locale \'ru_RU\'  - using en_GB',1572620978,'LOCALIZATION',0,NULL),(5,1,32,'GUI','string \'testCaseStatus_obsolete\' is not localized for locale \'ru_RU\'  - using en_GB',1572620978,'LOCALIZATION',0,NULL),(6,1,32,'GUI','string \'testCaseStatus_future\' is not localized for locale \'ru_RU\'  - using en_GB',1572620978,'LOCALIZATION',0,NULL),(7,1,32,'GUI','string \'testCaseStatus_final\' is not localized for locale \'ru_RU\'  - using en_GB',1572620978,'LOCALIZATION',0,NULL),(8,1,32,'GUI','string \'login\' is not localized for locale \'ru_RU\'  - using en_GB',1572620978,'LOCALIZATION',0,NULL),(9,1,32,'GUI','string \'demo_usage\' is not localized for locale \'ru_RU\'  - using en_GB',1572620978,'LOCALIZATION',0,NULL),(10,1,32,'GUI','string \'oauth_login\' is not localized for locale \'ru_RU\'  - using en_GB',1572620978,'LOCALIZATION',0,NULL),(11,2,2,'GUI','E_NOTICE\nUndefined index: login - in /srv/http/testlink/gui/templates_c/4d432ce5fb59b2da298041c604fa21c7d200169d_0.file.firstLogin-model-marcobiedermann.tpl.php - Line 36',1572620988,'PHP',0,NULL),(12,2,2,'GUI','E_NOTICE\nUndefined property: stdClass::$pwdInputMaxLength - in /srv/http/testlink/gui/templates_c/4d432ce5fb59b2da298041c604fa21c7d200169d_0.file.firstLogin-model-marcobiedermann.tpl.php - Line 74',1572620988,'PHP',0,NULL),(13,2,2,'GUI','E_NOTICE\nUndefined property: stdClass::$pwdInputMaxLength - in /srv/http/testlink/gui/templates_c/4d432ce5fb59b2da298041c604fa21c7d200169d_0.file.firstLogin-model-marcobiedermann.tpl.php - Line 82',1572620988,'PHP',0,NULL),(14,3,2,'GUI','E_WARNING\nimplode(): Invalid arguments passed - in /srv/http/testlink/firstLogin.php - Line 179',1572621005,'PHP',0,NULL),(15,3,16,'GUI','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:23:\"audit_users_self_signup\";s:6:\"params\";a:1:{i:0;s:4:\"root\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1572621005,'CREATE',2,'users'),(16,4,32,'GUI','string \'unknown_authentication_method\' is not localized for locale \'ru_RU\'  - using en_GB',1572621009,'LOCALIZATION',0,NULL),(17,5,16,'GUI','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:21:\"audit_login_succeeded\";s:6:\"params\";a:2:{i:0;s:4:\"root\";i:1;s:12:\"192.168.67.1\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1572621009,'LOGIN',2,'users'),(18,6,2,'GUI','E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /srv/http/testlink/lib/functions/tlUser.class.php - Line 1053',1572621009,'PHP',0,NULL),(19,6,2,'GUI','E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /srv/http/testlink/lib/functions/tlUser.class.php - Line 1053',1572621009,'PHP',0,NULL),(20,6,32,'GUI','string \'full_text_search\' is not localized for locale \'ru_RU\'  - using en_GB',1572621009,'LOCALIZATION',0,NULL),(21,7,2,'GUI','E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /srv/http/testlink/lib/functions/tlUser.class.php - Line 1053',1572621009,'PHP',0,NULL),(22,7,2,'GUI','E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /srv/http/testlink/lib/functions/tlUser.class.php - Line 1053',1572621009,'PHP',0,NULL),(23,7,2,'GUI','E_NOTICE\nUndefined index: testprojectOptions - in /srv/http/testlink/lib/general/mainPage.php - Line 283',1572621009,'PHP',0,NULL),(24,7,2,'GUI','E_NOTICE\nTrying to get property \'inventoryEnabled\' of non-object - in /srv/http/testlink/lib/general/mainPage.php - Line 283',1572621009,'PHP',0,NULL),(25,7,2,'GUI','E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /srv/http/testlink/lib/functions/tlUser.class.php - Line 1053',1572621009,'PHP',0,NULL),(26,7,32,'GUI','string \'href_exec_ro_access\' is not localized for locale \'ru_RU\'  - using en_GB',1572621009,'LOCALIZATION',0,NULL),(27,7,32,'GUI','string \'poweredBy\' is not localized for locale \'ru_RU\'  - using en_GB',1572621009,'LOCALIZATION',0,NULL),(28,7,32,'GUI','string \'system_descr\' is not localized for locale \'ru_RU\'  - using en_GB',1572621009,'LOCALIZATION',0,NULL),(29,7,32,'GUI','string \'system_config\' is not localized for locale \'ru_RU\'  - using en_GB',1572621009,'LOCALIZATION',0,NULL),(30,7,32,'GUI','string \'link_report_test_cases_created_per_user\' is not localized for locale \'ru_RU\'  - using en_GB',1572621009,'LOCALIZATION',0,NULL),(31,7,32,'GUI','string \'href_req_overview\' is not localized for locale \'ru_RU\'  - using en_GB',1572621009,'LOCALIZATION',0,NULL),(32,7,32,'GUI','string \'href_print_req\' is not localized for locale \'ru_RU\'  - using en_GB',1572621009,'LOCALIZATION',0,NULL),(33,7,32,'GUI','string \'title_documentation\' is not localized for locale \'ru_RU\'  - using en_GB',1572621009,'LOCALIZATION',0,NULL),(34,7,32,'GUI','string \'href_issuetracker_management\' is not localized for locale \'ru_RU\'  - using en_GB',1572621009,'LOCALIZATION',0,NULL),(35,7,32,'GUI','string \'href_codetracker_management\' is not localized for locale \'ru_RU\'  - using en_GB',1572621009,'LOCALIZATION',0,NULL),(36,7,32,'GUI','string \'href_reqmgrsystem_management\' is not localized for locale \'ru_RU\'  - using en_GB',1572621009,'LOCALIZATION',0,NULL),(37,7,32,'GUI','string \'href_req_monitor_overview\' is not localized for locale \'ru_RU\'  - using en_GB',1572621009,'LOCALIZATION',0,NULL),(38,8,2,'GUI','E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /srv/http/testlink/lib/functions/tlUser.class.php - Line 1053',1572621015,'PHP',0,NULL),(39,8,2,'GUI','E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /srv/http/testlink/lib/functions/tlUser.class.php - Line 1053',1572621015,'PHP',0,NULL),(40,8,2,'GUI','E_NOTICE\nUndefined index: testprojectOptions - in /srv/http/testlink/lib/general/mainPage.php - Line 283',1572621015,'PHP',0,NULL),(41,8,2,'GUI','E_NOTICE\nTrying to get property \'inventoryEnabled\' of non-object - in /srv/http/testlink/lib/general/mainPage.php - Line 283',1572621015,'PHP',0,NULL),(42,8,2,'GUI','E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /srv/http/testlink/lib/functions/tlUser.class.php - Line 1053',1572621015,'PHP',0,NULL),(43,9,2,'GUI','E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /srv/http/testlink/lib/functions/tlUser.class.php - Line 1053',1572621015,'PHP',0,NULL),(44,9,2,'GUI','E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /srv/http/testlink/lib/functions/tlUser.class.php - Line 1053',1572621015,'PHP',0,NULL),(45,10,2,'GUI','E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /srv/http/testlink/lib/functions/tlUser.class.php - Line 1053',1572621017,'PHP',0,NULL),(46,10,2,'GUI','E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /srv/http/testlink/lib/functions/tlUser.class.php - Line 1053',1572621017,'PHP',0,NULL),(47,11,2,'GUI','E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /srv/http/testlink/lib/functions/tlUser.class.php - Line 1053',1572621017,'PHP',0,NULL),(48,11,2,'GUI','E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /srv/http/testlink/lib/functions/tlUser.class.php - Line 1053',1572621017,'PHP',0,NULL),(49,11,2,'GUI','E_NOTICE\nUndefined index: testprojectOptions - in /srv/http/testlink/lib/general/mainPage.php - Line 283',1572621017,'PHP',0,NULL),(50,11,2,'GUI','E_NOTICE\nTrying to get property \'inventoryEnabled\' of non-object - in /srv/http/testlink/lib/general/mainPage.php - Line 283',1572621017,'PHP',0,NULL),(51,11,2,'GUI','E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /srv/http/testlink/lib/functions/tlUser.class.php - Line 1053',1572621017,'PHP',0,NULL),(52,12,2,'GUI','E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /srv/http/testlink/lib/functions/tlUser.class.php - Line 1053',1572621024,'PHP',0,NULL),(53,12,2,'GUI','E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /srv/http/testlink/lib/functions/tlUser.class.php - Line 1053',1572621024,'PHP',0,NULL),(54,12,2,'GUI','E_NOTICE\nUndefined index: testprojectOptions - in /srv/http/testlink/lib/general/mainPage.php - Line 283',1572621024,'PHP',0,NULL),(55,12,2,'GUI','E_NOTICE\nTrying to get property \'inventoryEnabled\' of non-object - in /srv/http/testlink/lib/general/mainPage.php - Line 283',1572621024,'PHP',0,NULL),(56,12,2,'GUI','E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /srv/http/testlink/lib/functions/tlUser.class.php - Line 1053',1572621024,'PHP',0,NULL),(57,13,2,'GUI','E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /srv/http/testlink/lib/functions/tlUser.class.php - Line 1053',1572621024,'PHP',0,NULL),(58,13,2,'GUI','E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /srv/http/testlink/lib/functions/tlUser.class.php - Line 1053',1572621024,'PHP',0,NULL),(59,14,2,'GUI','E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /srv/http/testlink/lib/functions/tlUser.class.php - Line 1053',1572621025,'PHP',0,NULL),(60,14,2,'GUI','E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /srv/http/testlink/lib/functions/tlUser.class.php - Line 1053',1572621025,'PHP',0,NULL),(61,14,2,'GUI','E_NOTICE\nUndefined index: testprojectOptions - in /srv/http/testlink/lib/general/mainPage.php - Line 283',1572621025,'PHP',0,NULL),(62,14,2,'GUI','E_NOTICE\nTrying to get property \'inventoryEnabled\' of non-object - in /srv/http/testlink/lib/general/mainPage.php - Line 283',1572621025,'PHP',0,NULL),(63,14,2,'GUI','E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /srv/http/testlink/lib/functions/tlUser.class.php - Line 1053',1572621025,'PHP',0,NULL),(64,15,2,'GUI','E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /srv/http/testlink/lib/functions/tlUser.class.php - Line 1053',1572621025,'PHP',0,NULL),(65,15,2,'GUI','E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /srv/http/testlink/lib/functions/tlUser.class.php - Line 1053',1572621025,'PHP',0,NULL),(66,16,2,'GUI','E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /srv/http/testlink/lib/functions/tlUser.class.php - Line 1053',1572621029,'PHP',0,NULL),(67,16,2,'GUI','E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /srv/http/testlink/lib/functions/tlUser.class.php - Line 1053',1572621029,'PHP',0,NULL),(68,16,2,'GUI','E_NOTICE\nUndefined index: testprojectOptions - in /srv/http/testlink/lib/general/mainPage.php - Line 283',1572621029,'PHP',0,NULL),(69,16,2,'GUI','E_NOTICE\nTrying to get property \'inventoryEnabled\' of non-object - in /srv/http/testlink/lib/general/mainPage.php - Line 283',1572621029,'PHP',0,NULL),(70,16,2,'GUI','E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /srv/http/testlink/lib/functions/tlUser.class.php - Line 1053',1572621029,'PHP',0,NULL),(71,17,2,'GUI','E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /srv/http/testlink/lib/functions/tlUser.class.php - Line 1053',1572621029,'PHP',0,NULL),(72,17,2,'GUI','E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /srv/http/testlink/lib/functions/tlUser.class.php - Line 1053',1572621029,'PHP',0,NULL),(73,18,16,'GUI','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:17:\"audit_user_logout\";s:6:\"params\";a:1:{i:0;s:4:\"root\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1572621031,'LOGOUT',2,'users'),(74,19,32,'GUI','string \'testCaseStatus_draft\' is not localized for locale \'ru_RU\'  - using en_GB',1572621031,'LOCALIZATION',0,NULL),(75,19,32,'GUI','string \'testCaseStatus_readyForReview\' is not localized for locale \'ru_RU\'  - using en_GB',1572621031,'LOCALIZATION',0,NULL),(76,19,32,'GUI','string \'testCaseStatus_reviewInProgress\' is not localized for locale \'ru_RU\'  - using en_GB',1572621031,'LOCALIZATION',0,NULL),(77,19,32,'GUI','string \'testCaseStatus_rework\' is not localized for locale \'ru_RU\'  - using en_GB',1572621031,'LOCALIZATION',0,NULL),(78,19,32,'GUI','string \'testCaseStatus_obsolete\' is not localized for locale \'ru_RU\'  - using en_GB',1572621031,'LOCALIZATION',0,NULL),(79,19,32,'GUI','string \'testCaseStatus_future\' is not localized for locale \'ru_RU\'  - using en_GB',1572621031,'LOCALIZATION',0,NULL),(80,19,32,'GUI','string \'testCaseStatus_final\' is not localized for locale \'ru_RU\'  - using en_GB',1572621031,'LOCALIZATION',0,NULL),(81,19,32,'GUI','string \'login\' is not localized for locale \'ru_RU\'  - using en_GB',1572621031,'LOCALIZATION',0,NULL),(82,19,32,'GUI','string \'demo_usage\' is not localized for locale \'ru_RU\'  - using en_GB',1572621031,'LOCALIZATION',0,NULL),(83,19,32,'GUI','string \'oauth_login\' is not localized for locale \'ru_RU\'  - using en_GB',1572621031,'LOCALIZATION',0,NULL),(84,20,32,'GUI','string \'unknown_authentication_method\' is not localized for locale \'ru_RU\'  - using en_GB',1572621050,'LOCALIZATION',0,NULL),(85,21,16,'GUI','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:21:\"audit_login_succeeded\";s:6:\"params\";a:2:{i:0;s:4:\"root\";i:1;s:12:\"192.168.67.1\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1572621050,'LOGIN',2,'users'),(86,22,2,'GUI','E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /srv/http/testlink/lib/functions/tlUser.class.php - Line 1053',1572621050,'PHP',0,NULL),(87,22,2,'GUI','E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /srv/http/testlink/lib/functions/tlUser.class.php - Line 1053',1572621050,'PHP',0,NULL),(88,22,2,'GUI','E_NOTICE\nUndefined index: testprojectOptions - in /srv/http/testlink/lib/general/mainPage.php - Line 283',1572621050,'PHP',0,NULL),(89,22,2,'GUI','E_NOTICE\nTrying to get property \'inventoryEnabled\' of non-object - in /srv/http/testlink/lib/general/mainPage.php - Line 283',1572621050,'PHP',0,NULL),(90,22,2,'GUI','E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /srv/http/testlink/lib/functions/tlUser.class.php - Line 1053',1572621050,'PHP',0,NULL),(91,22,32,'GUI','string \'href_exec_ro_access\' is not localized for locale \'ru_RU\'  - using en_GB',1572621050,'LOCALIZATION',0,NULL),(92,22,32,'GUI','string \'poweredBy\' is not localized for locale \'ru_RU\'  - using en_GB',1572621050,'LOCALIZATION',0,NULL),(93,22,32,'GUI','string \'system_descr\' is not localized for locale \'ru_RU\'  - using en_GB',1572621050,'LOCALIZATION',0,NULL),(94,22,32,'GUI','string \'system_config\' is not localized for locale \'ru_RU\'  - using en_GB',1572621050,'LOCALIZATION',0,NULL),(95,22,32,'GUI','string \'link_report_test_cases_created_per_user\' is not localized for locale \'ru_RU\'  - using en_GB',1572621050,'LOCALIZATION',0,NULL),(96,22,32,'GUI','string \'href_req_overview\' is not localized for locale \'ru_RU\'  - using en_GB',1572621050,'LOCALIZATION',0,NULL),(97,22,32,'GUI','string \'href_print_req\' is not localized for locale \'ru_RU\'  - using en_GB',1572621050,'LOCALIZATION',0,NULL),(98,22,32,'GUI','string \'title_documentation\' is not localized for locale \'ru_RU\'  - using en_GB',1572621050,'LOCALIZATION',0,NULL),(99,22,32,'GUI','string \'href_issuetracker_management\' is not localized for locale \'ru_RU\'  - using en_GB',1572621050,'LOCALIZATION',0,NULL),(100,22,32,'GUI','string \'href_codetracker_management\' is not localized for locale \'ru_RU\'  - using en_GB',1572621050,'LOCALIZATION',0,NULL),(101,22,32,'GUI','string \'href_reqmgrsystem_management\' is not localized for locale \'ru_RU\'  - using en_GB',1572621050,'LOCALIZATION',0,NULL),(102,22,32,'GUI','string \'href_req_monitor_overview\' is not localized for locale \'ru_RU\'  - using en_GB',1572621050,'LOCALIZATION',0,NULL),(103,23,2,'GUI','E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /srv/http/testlink/lib/functions/tlUser.class.php - Line 1053',1572621050,'PHP',0,NULL),(104,23,2,'GUI','E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /srv/http/testlink/lib/functions/tlUser.class.php - Line 1053',1572621050,'PHP',0,NULL),(105,23,32,'GUI','string \'full_text_search\' is not localized for locale \'ru_RU\'  - using en_GB',1572621050,'LOCALIZATION',0,NULL),(106,24,16,'GUI','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:17:\"audit_user_logout\";s:6:\"params\";a:1:{i:0;s:4:\"root\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1572621094,'LOGOUT',2,'users'),(107,25,32,'GUI','string \'testCaseStatus_draft\' is not localized for locale \'ru_RU\'  - using en_GB',1572621095,'LOCALIZATION',0,NULL),(108,25,32,'GUI','string \'testCaseStatus_readyForReview\' is not localized for locale \'ru_RU\'  - using en_GB',1572621095,'LOCALIZATION',0,NULL),(109,25,32,'GUI','string \'testCaseStatus_reviewInProgress\' is not localized for locale \'ru_RU\'  - using en_GB',1572621095,'LOCALIZATION',0,NULL),(110,25,32,'GUI','string \'testCaseStatus_rework\' is not localized for locale \'ru_RU\'  - using en_GB',1572621095,'LOCALIZATION',0,NULL),(111,25,32,'GUI','string \'testCaseStatus_obsolete\' is not localized for locale \'ru_RU\'  - using en_GB',1572621095,'LOCALIZATION',0,NULL),(112,25,32,'GUI','string \'testCaseStatus_future\' is not localized for locale \'ru_RU\'  - using en_GB',1572621095,'LOCALIZATION',0,NULL),(113,25,32,'GUI','string \'testCaseStatus_final\' is not localized for locale \'ru_RU\'  - using en_GB',1572621095,'LOCALIZATION',0,NULL),(114,25,32,'GUI','string \'login\' is not localized for locale \'ru_RU\'  - using en_GB',1572621095,'LOCALIZATION',0,NULL),(115,25,32,'GUI','string \'demo_usage\' is not localized for locale \'ru_RU\'  - using en_GB',1572621095,'LOCALIZATION',0,NULL),(116,25,32,'GUI','string \'oauth_login\' is not localized for locale \'ru_RU\'  - using en_GB',1572621095,'LOCALIZATION',0,NULL),(117,26,32,'GUI','string \'unknown_authentication_method\' is not localized for locale \'ru_RU\'  - using en_GB',1572621099,'LOCALIZATION',0,NULL),(118,27,16,'GUI','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:21:\"audit_login_succeeded\";s:6:\"params\";a:2:{i:0;s:5:\"admin\";i:1;s:12:\"192.168.67.1\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1572621099,'LOGIN',1,'users'),(119,28,16,'GUI - Test Project ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:25:\"audit_testproject_created\";s:6:\"params\";a:1:{i:0;s:4:\"TEST\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1572621120,'CREATE',1,'testprojects'),(120,29,32,'GUI','string \'testCaseStatus_draft\' is not localized for locale \'ru_RU\'  - using en_GB',1572621900,'LOCALIZATION',0,NULL),(121,29,32,'GUI','string \'testCaseStatus_readyForReview\' is not localized for locale \'ru_RU\'  - using en_GB',1572621900,'LOCALIZATION',0,NULL),(122,29,32,'GUI','string \'testCaseStatus_reviewInProgress\' is not localized for locale \'ru_RU\'  - using en_GB',1572621900,'LOCALIZATION',0,NULL),(123,29,32,'GUI','string \'testCaseStatus_rework\' is not localized for locale \'ru_RU\'  - using en_GB',1572621900,'LOCALIZATION',0,NULL),(124,29,32,'GUI','string \'testCaseStatus_obsolete\' is not localized for locale \'ru_RU\'  - using en_GB',1572621900,'LOCALIZATION',0,NULL),(125,29,32,'GUI','string \'testCaseStatus_future\' is not localized for locale \'ru_RU\'  - using en_GB',1572621900,'LOCALIZATION',0,NULL),(126,29,32,'GUI','string \'testCaseStatus_final\' is not localized for locale \'ru_RU\'  - using en_GB',1572621900,'LOCALIZATION',0,NULL),(127,29,32,'GUI','string \'login\' is not localized for locale \'ru_RU\'  - using en_GB',1572621900,'LOCALIZATION',0,NULL),(128,29,32,'GUI','string \'demo_usage\' is not localized for locale \'ru_RU\'  - using en_GB',1572621900,'LOCALIZATION',0,NULL),(129,29,32,'GUI','string \'oauth_login\' is not localized for locale \'ru_RU\'  - using en_GB',1572621900,'LOCALIZATION',0,NULL),(130,30,32,'GUI','string \'unknown_authentication_method\' is not localized for locale \'ru_RU\'  - using en_GB',1572621913,'LOCALIZATION',0,NULL),(131,31,16,'GUI - Test Project ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:21:\"audit_login_succeeded\";s:6:\"params\";a:2:{i:0;s:5:\"admin\";i:1;s:12:\"192.168.67.1\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1572621913,'LOGIN',1,'users'),(132,32,32,'GUI','string \'testCaseStatus_draft\' is not localized for locale \'ru_RU\'  - using en_GB',1572622500,'LOCALIZATION',0,NULL),(133,32,32,'GUI','string \'testCaseStatus_readyForReview\' is not localized for locale \'ru_RU\'  - using en_GB',1572622500,'LOCALIZATION',0,NULL),(134,32,32,'GUI','string \'testCaseStatus_reviewInProgress\' is not localized for locale \'ru_RU\'  - using en_GB',1572622500,'LOCALIZATION',0,NULL),(135,32,32,'GUI','string \'testCaseStatus_rework\' is not localized for locale \'ru_RU\'  - using en_GB',1572622500,'LOCALIZATION',0,NULL),(136,32,32,'GUI','string \'testCaseStatus_obsolete\' is not localized for locale \'ru_RU\'  - using en_GB',1572622500,'LOCALIZATION',0,NULL),(137,32,32,'GUI','string \'testCaseStatus_future\' is not localized for locale \'ru_RU\'  - using en_GB',1572622500,'LOCALIZATION',0,NULL),(138,32,32,'GUI','string \'testCaseStatus_final\' is not localized for locale \'ru_RU\'  - using en_GB',1572622500,'LOCALIZATION',0,NULL),(139,32,32,'GUI','string \'login\' is not localized for locale \'ru_RU\'  - using en_GB',1572622500,'LOCALIZATION',0,NULL),(140,32,32,'GUI','string \'demo_usage\' is not localized for locale \'ru_RU\'  - using en_GB',1572622500,'LOCALIZATION',0,NULL),(141,32,32,'GUI','string \'oauth_login\' is not localized for locale \'ru_RU\'  - using en_GB',1572622500,'LOCALIZATION',0,NULL),(142,33,32,'GUI','string \'testCaseStatus_draft\' is not localized for locale \'ru_RU\'  - using en_GB',1572622762,'LOCALIZATION',0,NULL),(143,33,32,'GUI','string \'testCaseStatus_readyForReview\' is not localized for locale \'ru_RU\'  - using en_GB',1572622762,'LOCALIZATION',0,NULL),(144,33,32,'GUI','string \'testCaseStatus_reviewInProgress\' is not localized for locale \'ru_RU\'  - using en_GB',1572622762,'LOCALIZATION',0,NULL),(145,33,32,'GUI','string \'testCaseStatus_rework\' is not localized for locale \'ru_RU\'  - using en_GB',1572622762,'LOCALIZATION',0,NULL),(146,33,32,'GUI','string \'testCaseStatus_obsolete\' is not localized for locale \'ru_RU\'  - using en_GB',1572622762,'LOCALIZATION',0,NULL),(147,33,32,'GUI','string \'testCaseStatus_future\' is not localized for locale \'ru_RU\'  - using en_GB',1572622762,'LOCALIZATION',0,NULL),(148,33,32,'GUI','string \'testCaseStatus_final\' is not localized for locale \'ru_RU\'  - using en_GB',1572622762,'LOCALIZATION',0,NULL),(149,33,32,'GUI','string \'login\' is not localized for locale \'ru_RU\'  - using en_GB',1572622762,'LOCALIZATION',0,NULL),(150,33,32,'GUI','string \'demo_usage\' is not localized for locale \'ru_RU\'  - using en_GB',1572622762,'LOCALIZATION',0,NULL),(151,33,32,'GUI','string \'oauth_login\' is not localized for locale \'ru_RU\'  - using en_GB',1572622762,'LOCALIZATION',0,NULL),(152,34,32,'GUI','string \'testCaseStatus_draft\' is not localized for locale \'ru_RU\'  - using en_GB',1574363705,'LOCALIZATION',0,NULL),(153,34,32,'GUI','string \'testCaseStatus_readyForReview\' is not localized for locale \'ru_RU\'  - using en_GB',1574363705,'LOCALIZATION',0,NULL),(154,34,32,'GUI','string \'testCaseStatus_reviewInProgress\' is not localized for locale \'ru_RU\'  - using en_GB',1574363705,'LOCALIZATION',0,NULL),(155,34,32,'GUI','string \'testCaseStatus_rework\' is not localized for locale \'ru_RU\'  - using en_GB',1574363705,'LOCALIZATION',0,NULL),(156,34,32,'GUI','string \'testCaseStatus_obsolete\' is not localized for locale \'ru_RU\'  - using en_GB',1574363705,'LOCALIZATION',0,NULL),(157,34,32,'GUI','string \'testCaseStatus_future\' is not localized for locale \'ru_RU\'  - using en_GB',1574363705,'LOCALIZATION',0,NULL),(158,34,32,'GUI','string \'testCaseStatus_final\' is not localized for locale \'ru_RU\'  - using en_GB',1574363705,'LOCALIZATION',0,NULL),(159,34,32,'GUI','string \'login\' is not localized for locale \'ru_RU\'  - using en_GB',1574363706,'LOCALIZATION',0,NULL),(160,34,32,'GUI','string \'demo_usage\' is not localized for locale \'ru_RU\'  - using en_GB',1574363706,'LOCALIZATION',0,NULL),(161,34,32,'GUI','string \'oauth_login\' is not localized for locale \'ru_RU\'  - using en_GB',1574363706,'LOCALIZATION',0,NULL),(162,35,32,'GUI','string \'unknown_authentication_method\' is not localized for locale \'ru_RU\'  - using en_GB',1574363708,'LOCALIZATION',0,NULL),(163,36,16,'GUI -  ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:21:\"audit_login_succeeded\";s:6:\"params\";a:2:{i:0;s:4:\"root\";i:1;s:12:\"192.168.67.1\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1574363708,'LOGIN',2,'users'),(164,37,2,'GUI -  ID : 1','E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /srv/http/testlink/lib/functions/tlUser.class.php - Line 1053',1574363709,'PHP',0,NULL),(165,37,2,'GUI -  ID : 1','E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /srv/http/testlink/lib/functions/tlUser.class.php - Line 1053',1574363709,'PHP',0,NULL),(166,37,2,'GUI -  ID : 1','E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /srv/http/testlink/lib/functions/tlUser.class.php - Line 1053',1574363709,'PHP',0,NULL),(167,37,32,'GUI -  ID : 1','string \'href_exec_ro_access\' is not localized for locale \'ru_RU\'  - using en_GB',1574363709,'LOCALIZATION',0,NULL),(168,37,32,'GUI -  ID : 1','string \'poweredBy\' is not localized for locale \'ru_RU\'  - using en_GB',1574363709,'LOCALIZATION',0,NULL),(169,37,32,'GUI -  ID : 1','string \'system_descr\' is not localized for locale \'ru_RU\'  - using en_GB',1574363709,'LOCALIZATION',0,NULL),(170,37,32,'GUI -  ID : 1','string \'system_config\' is not localized for locale \'ru_RU\'  - using en_GB',1574363709,'LOCALIZATION',0,NULL),(171,37,32,'GUI -  ID : 1','string \'link_report_test_cases_created_per_user\' is not localized for locale \'ru_RU\'  - using en_GB',1574363709,'LOCALIZATION',0,NULL),(172,37,32,'GUI -  ID : 1','string \'href_req_overview\' is not localized for locale \'ru_RU\'  - using en_GB',1574363709,'LOCALIZATION',0,NULL),(173,37,32,'GUI -  ID : 1','string \'href_print_req\' is not localized for locale \'ru_RU\'  - using en_GB',1574363709,'LOCALIZATION',0,NULL),(174,37,32,'GUI -  ID : 1','string \'title_documentation\' is not localized for locale \'ru_RU\'  - using en_GB',1574363709,'LOCALIZATION',0,NULL),(175,37,32,'GUI -  ID : 1','string \'href_issuetracker_management\' is not localized for locale \'ru_RU\'  - using en_GB',1574363709,'LOCALIZATION',0,NULL),(176,37,32,'GUI -  ID : 1','string \'href_codetracker_management\' is not localized for locale \'ru_RU\'  - using en_GB',1574363709,'LOCALIZATION',0,NULL),(177,37,32,'GUI -  ID : 1','string \'href_reqmgrsystem_management\' is not localized for locale \'ru_RU\'  - using en_GB',1574363709,'LOCALIZATION',0,NULL),(178,37,32,'GUI -  ID : 1','string \'href_req_monitor_overview\' is not localized for locale \'ru_RU\'  - using en_GB',1574363709,'LOCALIZATION',0,NULL),(179,37,2,'GUI -  ID : 1','E_NOTICE\nUndefined index: platform_view - in /srv/http/testlink/gui/templates_c/2d6fb2a38669793051953ef20e150fe584f6789b_0.file.mainPageLeft.tpl.php - Line 179',1574363709,'PHP',0,NULL),(180,38,2,'GUI -  ID : 1','E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /srv/http/testlink/lib/functions/tlUser.class.php - Line 1053',1574363709,'PHP',0,NULL),(181,38,2,'GUI -  ID : 1','E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /srv/http/testlink/lib/functions/tlUser.class.php - Line 1053',1574363709,'PHP',0,NULL),(182,38,2,'GUI -  ID : 1','E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /srv/http/testlink/lib/functions/tlUser.class.php - Line 1053',1574363709,'PHP',0,NULL),(183,38,32,'GUI -  ID : 1','string \'full_text_search\' is not localized for locale \'ru_RU\'  - using en_GB',1574363709,'LOCALIZATION',0,NULL),(184,39,32,'GUI -  ID : 1','string \'btn_reorder_testcases_externalid\' is not localized for locale \'ru_RU\'  - using en_GB',1574363714,'LOCALIZATION',0,NULL),(185,39,32,'GUI -  ID : 1','string \'btn_testcases_table_view\' is not localized for locale \'ru_RU\'  - using en_GB',1574363714,'LOCALIZATION',0,NULL),(186,39,32,'GUI -  ID : 1','string \'btn_delete_testcases\' is not localized for locale \'ru_RU\'  - using en_GB',1574363714,'LOCALIZATION',0,NULL),(187,39,32,'GUI -  ID : 1','string \'btn_reorder_testcases_alpha\' is not localized for locale \'ru_RU\'  - using en_GB',1574363714,'LOCALIZATION',0,NULL),(188,39,32,'GUI -  ID : 1','string \'btn_reorder_testsuites_alpha\' is not localized for locale \'ru_RU\'  - using en_GB',1574363714,'LOCALIZATION',0,NULL),(189,39,32,'GUI -  ID : 1','string \'btn_gen_test_spec\' is not localized for locale \'ru_RU\'  - using en_GB',1574363714,'LOCALIZATION',0,NULL),(190,39,32,'GUI -  ID : 1','string \'btn_gen_test_spec_new_window\' is not localized for locale \'ru_RU\'  - using en_GB',1574363714,'LOCALIZATION',0,NULL),(191,39,32,'GUI -  ID : 1','string \'btn_gen_test_spec_word\' is not localized for locale \'ru_RU\'  - using en_GB',1574363714,'LOCALIZATION',0,NULL),(192,39,32,'GUI -  ID : 1','string \'btn_gen_test_suite_spec_word\' is not localized for locale \'ru_RU\'  - using en_GB',1574363714,'LOCALIZATION',0,NULL),(193,39,32,'GUI -  ID : 1','string \'btn_gen_test_suite_spec\' is not localized for locale \'ru_RU\'  - using en_GB',1574363714,'LOCALIZATION',0,NULL),(194,39,32,'GUI -  ID : 1','string \'btn_gen_test_suite_spec_new_window\' is not localized for locale \'ru_RU\'  - using en_GB',1574363714,'LOCALIZATION',0,NULL),(195,39,32,'GUI -  ID : 1','string \'testsuite_operations\' is not localized for locale \'ru_RU\'  - using en_GB',1574363714,'LOCALIZATION',0,NULL),(196,39,32,'GUI -  ID : 1','string \'testcase_operations\' is not localized for locale \'ru_RU\'  - using en_GB',1574363714,'LOCALIZATION',0,NULL),(197,39,32,'GUI -  ID : 1','string \'btn_create_from_issue_xml\' is not localized for locale \'ru_RU\'  - using en_GB',1574363714,'LOCALIZATION',0,NULL),(198,39,32,'GUI -  ID : 1','string \'click_to_get_attachment\' is not localized for locale \'ru_RU\'  - using en_GB',1574363714,'LOCALIZATION',0,NULL),(199,39,32,'GUI -  ID : 1','string \'display_inline\' is not localized for locale \'ru_RU\'  - using en_GB',1574363714,'LOCALIZATION',0,NULL),(200,39,32,'GUI -  ID : 1','string \'display_ea_string\' is not localized for locale \'ru_RU\'  - using en_GB',1574363714,'LOCALIZATION',0,NULL),(201,39,32,'GUI -  ID : 1','string \'display_inline_string\' is not localized for locale \'ru_RU\'  - using en_GB',1574363714,'LOCALIZATION',0,NULL),(202,40,32,'GUI -  ID : 1','string \'without_keywords\' is not localized for locale \'ru_RU\'  - using en_GB',1574363714,'LOCALIZATION',0,NULL),(203,40,32,'GUI -  ID : 1','string \'logical_or\' is not localized for locale \'ru_RU\'  - using en_GB',1574363714,'LOCALIZATION',0,NULL),(204,40,32,'GUI -  ID : 1','string \'logical_and\' is not localized for locale \'ru_RU\'  - using en_GB',1574363714,'LOCALIZATION',0,NULL),(205,40,32,'GUI -  ID : 1','string \'not_linked\' is not localized for locale \'ru_RU\'  - using en_GB',1574363714,'LOCALIZATION',0,NULL),(206,40,32,'GUI -  ID : 1','string \'btn_hide_cf\' is not localized for locale \'ru_RU\'  - using en_GB',1574363714,'LOCALIZATION',0,NULL),(207,40,32,'GUI -  ID : 1','string \'filter_active_inactive\' is not localized for locale \'ru_RU\'  - using en_GB',1574363714,'LOCALIZATION',0,NULL),(208,40,32,'GUI -  ID : 1','string \'btn_remove_all_tester_assignments\' is not localized for locale \'ru_RU\'  - using en_GB',1574363714,'LOCALIZATION',0,NULL),(209,40,32,'GUI -  ID : 1','string \'hint_list_of_bugs\' is not localized for locale \'ru_RU\'  - using en_GB',1574363714,'LOCALIZATION',0,NULL),(210,40,32,'GUI -  ID : 1','string \'document_id\' is not localized for locale \'ru_RU\'  - using en_GB',1574363714,'LOCALIZATION',0,NULL),(211,40,32,'GUI -  ID : 1','string \'bugs_on_context\' is not localized for locale \'ru_RU\'  - using en_GB',1574363714,'LOCALIZATION',0,NULL),(212,40,32,'GUI -  ID : 1','string \'req_type\' is not localized for locale \'ru_RU\'  - using en_GB',1574363714,'LOCALIZATION',0,NULL),(213,40,32,'GUI -  ID : 1','string \'req_spec_type\' is not localized for locale \'ru_RU\'  - using en_GB',1574363714,'LOCALIZATION',0,NULL),(214,40,32,'GUI -  ID : 1','string \'has_relation_type\' is not localized for locale \'ru_RU\'  - using en_GB',1574363714,'LOCALIZATION',0,NULL),(215,40,32,'GUI -  ID : 1','string \'btn_export_testplan_tree\' is not localized for locale \'ru_RU\'  - using en_GB',1574363714,'LOCALIZATION',0,NULL),(216,40,32,'GUI -  ID : 1','string \'btn_export_testplan_tree_for_results\' is not localized for locale \'ru_RU\'  - using en_GB',1574363714,'LOCALIZATION',0,NULL),(217,40,32,'GUI -  ID : 1','string \'tester_works_with_settings\' is not localized for locale \'ru_RU\'  - using en_GB',1574363714,'LOCALIZATION',0,NULL),(218,40,32,'GUI -  ID : 1','string \'btn_bulk_remove\' is not localized for locale \'ru_RU\'  - using en_GB',1574363714,'LOCALIZATION',0,NULL),(219,40,32,'GUI -  ID : 1','string \'btn_bulk_copy\' is not localized for locale \'ru_RU\'  - using en_GB',1574363714,'LOCALIZATION',0,NULL),(220,41,2,'GUI -  ID : 1','E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /srv/http/testlink/lib/functions/tlUser.class.php - Line 1053',1574363716,'PHP',0,NULL),(221,41,2,'GUI -  ID : 1','E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /srv/http/testlink/lib/functions/tlUser.class.php - Line 1053',1574363716,'PHP',0,NULL),(222,41,2,'GUI -  ID : 1','E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /srv/http/testlink/lib/functions/tlUser.class.php - Line 1053',1574363716,'PHP',0,NULL),(223,42,2,'GUI -  ID : 1','E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /srv/http/testlink/lib/functions/tlUser.class.php - Line 1053',1574363716,'PHP',0,NULL),(224,42,2,'GUI -  ID : 1','E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /srv/http/testlink/lib/functions/tlUser.class.php - Line 1053',1574363716,'PHP',0,NULL),(225,42,2,'GUI -  ID : 1','E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /srv/http/testlink/lib/functions/tlUser.class.php - Line 1053',1574363716,'PHP',0,NULL),(226,42,2,'GUI -  ID : 1','E_NOTICE\nUndefined index: platform_view - in /srv/http/testlink/gui/templates_c/2d6fb2a38669793051953ef20e150fe584f6789b_0.file.mainPageLeft.tpl.php - Line 179',1574363716,'PHP',0,NULL),(227,43,32,'GUI -  ID : 1','string \'tcvqty_with_kw\' is not localized for locale \'ru_RU\'  - using en_GB',1574363718,'LOCALIZATION',0,NULL),(228,44,2,'GUI -  ID : 1','E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /srv/http/testlink/lib/functions/tlUser.class.php - Line 1053',1574363719,'PHP',0,NULL),(229,44,2,'GUI -  ID : 1','E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /srv/http/testlink/lib/functions/tlUser.class.php - Line 1053',1574363719,'PHP',0,NULL),(230,44,2,'GUI -  ID : 1','E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /srv/http/testlink/lib/functions/tlUser.class.php - Line 1053',1574363719,'PHP',0,NULL),(231,45,2,'GUI -  ID : 1','E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /srv/http/testlink/lib/functions/tlUser.class.php - Line 1053',1574363720,'PHP',0,NULL),(232,45,2,'GUI -  ID : 1','E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /srv/http/testlink/lib/functions/tlUser.class.php - Line 1053',1574363720,'PHP',0,NULL),(233,45,2,'GUI -  ID : 1','E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /srv/http/testlink/lib/functions/tlUser.class.php - Line 1053',1574363720,'PHP',0,NULL),(234,45,2,'GUI -  ID : 1','E_NOTICE\nUndefined index: platform_view - in /srv/http/testlink/gui/templates_c/2d6fb2a38669793051953ef20e150fe584f6789b_0.file.mainPageLeft.tpl.php - Line 179',1574363720,'PHP',0,NULL),(235,46,2,'GUI -  ID : 1','E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /srv/http/testlink/lib/functions/tlUser.class.php - Line 1053',1574363726,'PHP',0,NULL),(236,46,2,'GUI -  ID : 1','E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /srv/http/testlink/lib/functions/tlUser.class.php - Line 1053',1574363726,'PHP',0,NULL),(237,46,2,'GUI -  ID : 1','E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /srv/http/testlink/lib/functions/tlUser.class.php - Line 1053',1574363726,'PHP',0,NULL),(238,46,2,'GUI -  ID : 1','E_NOTICE\nUndefined index: platform_view - in /srv/http/testlink/gui/templates_c/2d6fb2a38669793051953ef20e150fe584f6789b_0.file.mainPageLeft.tpl.php - Line 179',1574363726,'PHP',0,NULL),(239,47,2,'GUI -  ID : 1','E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /srv/http/testlink/lib/functions/tlUser.class.php - Line 1053',1574363731,'PHP',0,NULL),(240,47,2,'GUI -  ID : 1','E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /srv/http/testlink/lib/functions/tlUser.class.php - Line 1053',1574363731,'PHP',0,NULL),(241,47,2,'GUI -  ID : 1','E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /srv/http/testlink/lib/functions/tlUser.class.php - Line 1053',1574363731,'PHP',0,NULL),(242,47,2,'GUI -  ID : 1','E_NOTICE\nUndefined index: platform_view - in /srv/http/testlink/gui/templates_c/2d6fb2a38669793051953ef20e150fe584f6789b_0.file.mainPageLeft.tpl.php - Line 179',1574363731,'PHP',0,NULL),(243,48,2,'GUI -  ID : 1','E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /srv/http/testlink/lib/functions/tlUser.class.php - Line 1053',1574363731,'PHP',0,NULL),(244,48,2,'GUI -  ID : 1','E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /srv/http/testlink/lib/functions/tlUser.class.php - Line 1053',1574363731,'PHP',0,NULL),(245,48,2,'GUI -  ID : 1','E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /srv/http/testlink/lib/functions/tlUser.class.php - Line 1053',1574363731,'PHP',0,NULL),(246,49,2,'GUI -  ID : 1','E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /srv/http/testlink/lib/functions/tlUser.class.php - Line 1053',1574363738,'PHP',0,NULL),(247,49,2,'GUI -  ID : 1','E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /srv/http/testlink/lib/functions/tlUser.class.php - Line 1053',1574363738,'PHP',0,NULL),(248,49,2,'GUI -  ID : 1','E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /srv/http/testlink/lib/functions/tlUser.class.php - Line 1053',1574363738,'PHP',0,NULL),(249,50,2,'GUI -  ID : 1','E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /srv/http/testlink/lib/functions/tlUser.class.php - Line 1053',1574363739,'PHP',0,NULL),(250,50,2,'GUI -  ID : 1','E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /srv/http/testlink/lib/functions/tlUser.class.php - Line 1053',1574363739,'PHP',0,NULL),(251,50,2,'GUI -  ID : 1','E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /srv/http/testlink/lib/functions/tlUser.class.php - Line 1053',1574363739,'PHP',0,NULL),(252,50,2,'GUI -  ID : 1','E_NOTICE\nUndefined index: platform_view - in /srv/http/testlink/gui/templates_c/2d6fb2a38669793051953ef20e150fe584f6789b_0.file.mainPageLeft.tpl.php - Line 179',1574363739,'PHP',0,NULL),(253,51,2,'GUI -  ID : 1','E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /srv/http/testlink/lib/functions/tlUser.class.php - Line 1053',1574363743,'PHP',0,NULL),(254,51,2,'GUI -  ID : 1','E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /srv/http/testlink/lib/functions/tlUser.class.php - Line 1053',1574363743,'PHP',0,NULL),(255,51,2,'GUI -  ID : 1','E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /srv/http/testlink/lib/functions/tlUser.class.php - Line 1053',1574363743,'PHP',0,NULL),(256,51,2,'GUI -  ID : 1','E_NOTICE\nUndefined index: platform_view - in /srv/http/testlink/gui/templates_c/2d6fb2a38669793051953ef20e150fe584f6789b_0.file.mainPageLeft.tpl.php - Line 179',1574363743,'PHP',0,NULL),(257,52,2,'GUI -  ID : 1','E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /srv/http/testlink/lib/functions/tlUser.class.php - Line 1053',1574363743,'PHP',0,NULL),(258,52,2,'GUI -  ID : 1','E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /srv/http/testlink/lib/functions/tlUser.class.php - Line 1053',1574363743,'PHP',0,NULL),(259,52,2,'GUI -  ID : 1','E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /srv/http/testlink/lib/functions/tlUser.class.php - Line 1053',1574363743,'PHP',0,NULL),(260,53,2,'GUI -  ID : 1','E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /srv/http/testlink/lib/functions/tlUser.class.php - Line 1053',1574363747,'PHP',0,NULL),(261,53,2,'GUI -  ID : 1','E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /srv/http/testlink/lib/functions/tlUser.class.php - Line 1053',1574363747,'PHP',0,NULL),(262,53,2,'GUI -  ID : 1','E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /srv/http/testlink/lib/functions/tlUser.class.php - Line 1053',1574363747,'PHP',0,NULL),(263,53,2,'GUI -  ID : 1','E_NOTICE\nUndefined index: platform_view - in /srv/http/testlink/gui/templates_c/2d6fb2a38669793051953ef20e150fe584f6789b_0.file.mainPageLeft.tpl.php - Line 179',1574363747,'PHP',0,NULL),(264,54,2,'GUI -  ID : 1','E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /srv/http/testlink/lib/functions/tlUser.class.php - Line 1053',1574363749,'PHP',0,NULL),(265,54,2,'GUI -  ID : 1','E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /srv/http/testlink/lib/functions/tlUser.class.php - Line 1053',1574363749,'PHP',0,NULL),(266,54,2,'GUI -  ID : 1','E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /srv/http/testlink/lib/functions/tlUser.class.php - Line 1053',1574363749,'PHP',0,NULL),(267,54,2,'GUI -  ID : 1','E_NOTICE\nUndefined index: platform_view - in /srv/http/testlink/gui/templates_c/2d6fb2a38669793051953ef20e150fe584f6789b_0.file.mainPageLeft.tpl.php - Line 179',1574363749,'PHP',0,NULL),(268,55,2,'GUI -  ID : 1','E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /srv/http/testlink/lib/functions/tlUser.class.php - Line 1053',1574363749,'PHP',0,NULL),(269,55,2,'GUI -  ID : 1','E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /srv/http/testlink/lib/functions/tlUser.class.php - Line 1053',1574363749,'PHP',0,NULL),(270,55,2,'GUI -  ID : 1','E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /srv/http/testlink/lib/functions/tlUser.class.php - Line 1053',1574363749,'PHP',0,NULL),(271,56,2,'GUI -  ID : 1','E_WARNING\nsizeof(): Parameter must be an array or an object that implements Countable - in /srv/http/testlink/lib/functions/object.class.php - Line 590',1574363750,'PHP',0,NULL),(272,56,32,'GUI -  ID : 1','string \'demo_update_user_disabled\' is not localized for locale \'ru_RU\'  - using en_GB',1574363750,'LOCALIZATION',0,NULL),(273,56,2,'GUI -  ID : 1','E_WARNING\nA non-numeric value encountered - in /srv/http/testlink/locale/ja_JP/strings.txt - Line 2045',1574363751,'PHP',0,NULL),(274,56,2,'GUI -  ID : 1','E_WARNING\nA non-numeric value encountered - in /srv/http/testlink/locale/ja_JP/strings.txt - Line 2045',1574363751,'PHP',0,NULL),(275,56,2,'GUI -  ID : 1','E_WARNING\nA non-numeric value encountered - in /srv/http/testlink/locale/ja_JP/strings.txt - Line 2046',1574363751,'PHP',0,NULL),(276,56,2,'GUI -  ID : 1','E_WARNING\nA non-numeric value encountered - in /srv/http/testlink/locale/ja_JP/strings.txt - Line 2046',1574363751,'PHP',0,NULL),(277,56,2,'GUI -  ID : 1','E_WARNING\nA non-numeric value encountered - in /srv/http/testlink/locale/ja_JP/strings.txt - Line 2047',1574363751,'PHP',0,NULL),(278,56,2,'GUI -  ID : 1','E_WARNING\nA non-numeric value encountered - in /srv/http/testlink/locale/ja_JP/strings.txt - Line 2047',1574363751,'PHP',0,NULL),(279,56,2,'GUI -  ID : 1','E_WARNING\nA non-numeric value encountered - in /srv/http/testlink/locale/ja_JP/strings.txt - Line 3265',1574363751,'PHP',0,NULL),(280,56,2,'GUI -  ID : 1','E_WARNING\nA non-numeric value encountered - in /srv/http/testlink/locale/ja_JP/strings.txt - Line 3265',1574363751,'PHP',0,NULL),(281,57,16,'GUI -  ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:16:\"audit_user_saved\";s:6:\"params\";a:1:{i:0;s:4:\"root\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1574363765,'SAVE',2,'users'),(282,57,2,'GUI - Test Project ID : 1','E_WARNING\nsizeof(): Parameter must be an array or an object that implements Countable - in /srv/http/testlink/lib/functions/object.class.php - Line 590',1574363765,'PHP',0,NULL),(283,57,2,'GUI - Test Project ID : 1','E_WARNING\nA non-numeric value encountered - in /srv/http/testlink/locale/ja_JP/strings.txt - Line 2045',1574363765,'PHP',0,NULL),(284,57,2,'GUI - Test Project ID : 1','E_WARNING\nA non-numeric value encountered - in /srv/http/testlink/locale/ja_JP/strings.txt - Line 2045',1574363765,'PHP',0,NULL),(285,57,2,'GUI - Test Project ID : 1','E_WARNING\nA non-numeric value encountered - in /srv/http/testlink/locale/ja_JP/strings.txt - Line 2046',1574363765,'PHP',0,NULL),(286,57,2,'GUI - Test Project ID : 1','E_WARNING\nA non-numeric value encountered - in /srv/http/testlink/locale/ja_JP/strings.txt - Line 2046',1574363765,'PHP',0,NULL),(287,57,2,'GUI - Test Project ID : 1','E_WARNING\nA non-numeric value encountered - in /srv/http/testlink/locale/ja_JP/strings.txt - Line 2047',1574363765,'PHP',0,NULL),(288,57,2,'GUI - Test Project ID : 1','E_WARNING\nA non-numeric value encountered - in /srv/http/testlink/locale/ja_JP/strings.txt - Line 2047',1574363765,'PHP',0,NULL),(289,57,2,'GUI - Test Project ID : 1','E_WARNING\nA non-numeric value encountered - in /srv/http/testlink/locale/ja_JP/strings.txt - Line 3265',1574363765,'PHP',0,NULL),(290,57,2,'GUI - Test Project ID : 1','E_WARNING\nA non-numeric value encountered - in /srv/http/testlink/locale/ja_JP/strings.txt - Line 3265',1574363765,'PHP',0,NULL),(291,58,2,'GUI - Test Project ID : 1','E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /srv/http/testlink/lib/functions/tlUser.class.php - Line 1053',1574363765,'PHP',0,NULL),(292,58,2,'GUI - Test Project ID : 1','E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /srv/http/testlink/lib/functions/tlUser.class.php - Line 1053',1574363765,'PHP',0,NULL),(293,58,2,'GUI - Test Project ID : 1','E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /srv/http/testlink/lib/functions/tlUser.class.php - Line 1053',1574363765,'PHP',0,NULL),(294,59,2,'GUI - Test Project ID : 1','E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /srv/http/testlink/lib/functions/tlUser.class.php - Line 1053',1574363767,'PHP',0,NULL),(295,59,2,'GUI - Test Project ID : 1','E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /srv/http/testlink/lib/functions/tlUser.class.php - Line 1053',1574363767,'PHP',0,NULL),(296,59,2,'GUI - Test Project ID : 1','E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /srv/http/testlink/lib/functions/tlUser.class.php - Line 1053',1574363767,'PHP',0,NULL),(297,60,2,'GUI - Test Project ID : 1','E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /srv/http/testlink/lib/functions/tlUser.class.php - Line 1053',1574363767,'PHP',0,NULL),(298,60,2,'GUI - Test Project ID : 1','E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /srv/http/testlink/lib/functions/tlUser.class.php - Line 1053',1574363767,'PHP',0,NULL),(299,60,2,'GUI - Test Project ID : 1','E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /srv/http/testlink/lib/functions/tlUser.class.php - Line 1053',1574363767,'PHP',0,NULL),(300,60,2,'GUI - Test Project ID : 1','E_NOTICE\nUndefined index: platform_view - in /srv/http/testlink/gui/templates_c/2d6fb2a38669793051953ef20e150fe584f6789b_0.file.mainPageLeft.tpl.php - Line 179',1574363767,'PHP',0,NULL),(301,61,2,'GUI - Test Project ID : 1','E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /srv/http/testlink/lib/functions/tlUser.class.php - Line 1053',1574363777,'PHP',0,NULL),(302,61,2,'GUI - Test Project ID : 1','E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /srv/http/testlink/lib/functions/tlUser.class.php - Line 1053',1574363777,'PHP',0,NULL),(303,61,2,'GUI - Test Project ID : 1','E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /srv/http/testlink/lib/functions/tlUser.class.php - Line 1053',1574363777,'PHP',0,NULL),(304,62,2,'GUI - Test Project ID : 1','E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /srv/http/testlink/lib/functions/tlUser.class.php - Line 1053',1574363777,'PHP',0,NULL),(305,62,2,'GUI - Test Project ID : 1','E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /srv/http/testlink/lib/functions/tlUser.class.php - Line 1053',1574363777,'PHP',0,NULL),(306,62,2,'GUI - Test Project ID : 1','E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /srv/http/testlink/lib/functions/tlUser.class.php - Line 1053',1574363777,'PHP',0,NULL),(307,62,2,'GUI - Test Project ID : 1','E_NOTICE\nUndefined index: platform_view - in /srv/http/testlink/gui/templates_c/2d6fb2a38669793051953ef20e150fe584f6789b_0.file.mainPageLeft.tpl.php - Line 179',1574363777,'PHP',0,NULL),(308,63,2,'GUI - Test Project ID : 1','E_WARNING\nsizeof(): Parameter must be an array or an object that implements Countable - in /srv/http/testlink/lib/functions/object.class.php - Line 590',1574363792,'PHP',0,NULL),(309,63,2,'GUI - Test Project ID : 1','E_WARNING\nA non-numeric value encountered - in /srv/http/testlink/locale/ja_JP/strings.txt - Line 2045',1574363792,'PHP',0,NULL),(310,63,2,'GUI - Test Project ID : 1','E_WARNING\nA non-numeric value encountered - in /srv/http/testlink/locale/ja_JP/strings.txt - Line 2045',1574363792,'PHP',0,NULL),(311,63,2,'GUI - Test Project ID : 1','E_WARNING\nA non-numeric value encountered - in /srv/http/testlink/locale/ja_JP/strings.txt - Line 2046',1574363792,'PHP',0,NULL),(312,63,2,'GUI - Test Project ID : 1','E_WARNING\nA non-numeric value encountered - in /srv/http/testlink/locale/ja_JP/strings.txt - Line 2046',1574363792,'PHP',0,NULL),(313,63,2,'GUI - Test Project ID : 1','E_WARNING\nA non-numeric value encountered - in /srv/http/testlink/locale/ja_JP/strings.txt - Line 2047',1574363792,'PHP',0,NULL),(314,63,2,'GUI - Test Project ID : 1','E_WARNING\nA non-numeric value encountered - in /srv/http/testlink/locale/ja_JP/strings.txt - Line 2047',1574363792,'PHP',0,NULL),(315,63,2,'GUI - Test Project ID : 1','E_WARNING\nA non-numeric value encountered - in /srv/http/testlink/locale/ja_JP/strings.txt - Line 3265',1574363792,'PHP',0,NULL),(316,63,2,'GUI - Test Project ID : 1','E_WARNING\nA non-numeric value encountered - in /srv/http/testlink/locale/ja_JP/strings.txt - Line 3265',1574363792,'PHP',0,NULL),(317,64,32,'GUI - Test Project ID : 1','string \'show_calendar\' is not localized for locale \'en_US\' ',1574363798,'LOCALIZATION',0,NULL),(318,65,16,'GUI - Test Project ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:17:\"audit_user_logout\";s:6:\"params\";a:1:{i:0;s:4:\"root\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1574363799,'LOGOUT',2,'users'),(319,66,32,'GUI','string \'testCaseStatus_draft\' is not localized for locale \'ru_RU\'  - using en_GB',1574363799,'LOCALIZATION',0,NULL),(320,66,32,'GUI','string \'testCaseStatus_readyForReview\' is not localized for locale \'ru_RU\'  - using en_GB',1574363799,'LOCALIZATION',0,NULL),(321,66,32,'GUI','string \'testCaseStatus_reviewInProgress\' is not localized for locale \'ru_RU\'  - using en_GB',1574363799,'LOCALIZATION',0,NULL),(322,66,32,'GUI','string \'testCaseStatus_rework\' is not localized for locale \'ru_RU\'  - using en_GB',1574363799,'LOCALIZATION',0,NULL),(323,66,32,'GUI','string \'testCaseStatus_obsolete\' is not localized for locale \'ru_RU\'  - using en_GB',1574363799,'LOCALIZATION',0,NULL),(324,66,32,'GUI','string \'testCaseStatus_future\' is not localized for locale \'ru_RU\'  - using en_GB',1574363799,'LOCALIZATION',0,NULL),(325,66,32,'GUI','string \'testCaseStatus_final\' is not localized for locale \'ru_RU\'  - using en_GB',1574363799,'LOCALIZATION',0,NULL),(326,66,32,'GUI','string \'login\' is not localized for locale \'ru_RU\'  - using en_GB',1574363799,'LOCALIZATION',0,NULL),(327,66,32,'GUI','string \'demo_usage\' is not localized for locale \'ru_RU\'  - using en_GB',1574363799,'LOCALIZATION',0,NULL),(328,66,32,'GUI','string \'oauth_login\' is not localized for locale \'ru_RU\'  - using en_GB',1574363799,'LOCALIZATION',0,NULL),(329,67,2,'GUI','E_NOTICE\nUndefined index: login - in /srv/http/testlink/gui/templates_c/4d432ce5fb59b2da298041c604fa21c7d200169d_0.file.firstLogin-model-marcobiedermann.tpl.php - Line 36',1574363800,'PHP',0,NULL),(330,67,2,'GUI','E_NOTICE\nUndefined property: stdClass::$pwdInputMaxLength - in /srv/http/testlink/gui/templates_c/4d432ce5fb59b2da298041c604fa21c7d200169d_0.file.firstLogin-model-marcobiedermann.tpl.php - Line 74',1574363800,'PHP',0,NULL),(331,67,2,'GUI','E_NOTICE\nUndefined property: stdClass::$pwdInputMaxLength - in /srv/http/testlink/gui/templates_c/4d432ce5fb59b2da298041c604fa21c7d200169d_0.file.firstLogin-model-marcobiedermann.tpl.php - Line 82',1574363800,'PHP',0,NULL),(332,68,2,'GUI','E_WARNING\nimplode(): Invalid arguments passed - in /srv/http/testlink/firstLogin.php - Line 179',1574363818,'PHP',0,NULL),(333,68,16,'GUI','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:23:\"audit_users_self_signup\";s:6:\"params\";a:1:{i:0;s:8:\"lolizz00\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1574363818,'CREATE',3,'users'),(334,69,32,'GUI','string \'unknown_authentication_method\' is not localized for locale \'ru_RU\'  - using en_GB',1574363823,'LOCALIZATION',0,NULL),(335,70,16,'GUI -  ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:21:\"audit_login_succeeded\";s:6:\"params\";a:2:{i:0;s:8:\"lolizz00\";i:1;s:12:\"192.168.67.1\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1574363823,'LOGIN',3,'users'),(336,71,2,'GUI -  ID : 1','E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /srv/http/testlink/lib/functions/tlUser.class.php - Line 1053',1574363823,'PHP',0,NULL),(337,71,2,'GUI -  ID : 1','E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /srv/http/testlink/lib/functions/tlUser.class.php - Line 1053',1574363823,'PHP',0,NULL),(338,71,2,'GUI -  ID : 1','E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /srv/http/testlink/lib/functions/tlUser.class.php - Line 1053',1574363823,'PHP',0,NULL),(339,71,32,'GUI -  ID : 1','string \'full_text_search\' is not localized for locale \'ru_RU\'  - using en_GB',1574363823,'LOCALIZATION',0,NULL),(340,72,2,'GUI -  ID : 1','E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /srv/http/testlink/lib/functions/tlUser.class.php - Line 1053',1574363823,'PHP',0,NULL),(341,72,2,'GUI -  ID : 1','E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /srv/http/testlink/lib/functions/tlUser.class.php - Line 1053',1574363823,'PHP',0,NULL),(342,72,2,'GUI -  ID : 1','E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /srv/http/testlink/lib/functions/tlUser.class.php - Line 1053',1574363823,'PHP',0,NULL),(343,72,32,'GUI -  ID : 1','string \'href_exec_ro_access\' is not localized for locale \'ru_RU\'  - using en_GB',1574363823,'LOCALIZATION',0,NULL),(344,72,32,'GUI -  ID : 1','string \'poweredBy\' is not localized for locale \'ru_RU\'  - using en_GB',1574363823,'LOCALIZATION',0,NULL),(345,72,32,'GUI -  ID : 1','string \'system_descr\' is not localized for locale \'ru_RU\'  - using en_GB',1574363823,'LOCALIZATION',0,NULL),(346,72,32,'GUI -  ID : 1','string \'system_config\' is not localized for locale \'ru_RU\'  - using en_GB',1574363823,'LOCALIZATION',0,NULL),(347,72,32,'GUI -  ID : 1','string \'link_report_test_cases_created_per_user\' is not localized for locale \'ru_RU\'  - using en_GB',1574363823,'LOCALIZATION',0,NULL),(348,72,32,'GUI -  ID : 1','string \'href_req_overview\' is not localized for locale \'ru_RU\'  - using en_GB',1574363823,'LOCALIZATION',0,NULL),(349,72,32,'GUI -  ID : 1','string \'href_print_req\' is not localized for locale \'ru_RU\'  - using en_GB',1574363823,'LOCALIZATION',0,NULL),(350,72,32,'GUI -  ID : 1','string \'title_documentation\' is not localized for locale \'ru_RU\'  - using en_GB',1574363823,'LOCALIZATION',0,NULL),(351,72,32,'GUI -  ID : 1','string \'href_issuetracker_management\' is not localized for locale \'ru_RU\'  - using en_GB',1574363823,'LOCALIZATION',0,NULL),(352,72,32,'GUI -  ID : 1','string \'href_codetracker_management\' is not localized for locale \'ru_RU\'  - using en_GB',1574363823,'LOCALIZATION',0,NULL),(353,72,32,'GUI -  ID : 1','string \'href_reqmgrsystem_management\' is not localized for locale \'ru_RU\'  - using en_GB',1574363823,'LOCALIZATION',0,NULL),(354,72,32,'GUI -  ID : 1','string \'href_req_monitor_overview\' is not localized for locale \'ru_RU\'  - using en_GB',1574363823,'LOCALIZATION',0,NULL),(355,72,2,'GUI -  ID : 1','E_NOTICE\nUndefined index: platform_view - in /srv/http/testlink/gui/templates_c/2d6fb2a38669793051953ef20e150fe584f6789b_0.file.mainPageLeft.tpl.php - Line 179',1574363823,'PHP',0,NULL),(356,73,2,'GUI -  ID : 1','E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /srv/http/testlink/lib/functions/tlUser.class.php - Line 1053',1574363829,'PHP',0,NULL),(357,73,2,'GUI -  ID : 1','E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /srv/http/testlink/lib/functions/tlUser.class.php - Line 1053',1574363829,'PHP',0,NULL),(358,73,2,'GUI -  ID : 1','E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /srv/http/testlink/lib/functions/tlUser.class.php - Line 1053',1574363829,'PHP',0,NULL),(359,73,2,'GUI -  ID : 1','E_NOTICE\nUndefined index: platform_view - in /srv/http/testlink/gui/templates_c/2d6fb2a38669793051953ef20e150fe584f6789b_0.file.mainPageLeft.tpl.php - Line 179',1574363829,'PHP',0,NULL),(360,74,2,'GUI -  ID : 1','E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /srv/http/testlink/lib/functions/tlUser.class.php - Line 1053',1574363829,'PHP',0,NULL),(361,74,2,'GUI -  ID : 1','E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /srv/http/testlink/lib/functions/tlUser.class.php - Line 1053',1574363829,'PHP',0,NULL),(362,74,2,'GUI -  ID : 1','E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /srv/http/testlink/lib/functions/tlUser.class.php - Line 1053',1574363829,'PHP',0,NULL),(363,75,16,'GUI -  ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:17:\"audit_user_logout\";s:6:\"params\";a:1:{i:0;s:8:\"lolizz00\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1574363833,'LOGOUT',3,'users'),(364,76,32,'GUI','string \'testCaseStatus_draft\' is not localized for locale \'ru_RU\'  - using en_GB',1574363833,'LOCALIZATION',0,NULL),(365,76,32,'GUI','string \'testCaseStatus_readyForReview\' is not localized for locale \'ru_RU\'  - using en_GB',1574363833,'LOCALIZATION',0,NULL),(366,76,32,'GUI','string \'testCaseStatus_reviewInProgress\' is not localized for locale \'ru_RU\'  - using en_GB',1574363833,'LOCALIZATION',0,NULL),(367,76,32,'GUI','string \'testCaseStatus_rework\' is not localized for locale \'ru_RU\'  - using en_GB',1574363833,'LOCALIZATION',0,NULL),(368,76,32,'GUI','string \'testCaseStatus_obsolete\' is not localized for locale \'ru_RU\'  - using en_GB',1574363833,'LOCALIZATION',0,NULL),(369,76,32,'GUI','string \'testCaseStatus_future\' is not localized for locale \'ru_RU\'  - using en_GB',1574363833,'LOCALIZATION',0,NULL),(370,76,32,'GUI','string \'testCaseStatus_final\' is not localized for locale \'ru_RU\'  - using en_GB',1574363833,'LOCALIZATION',0,NULL),(371,76,32,'GUI','string \'login\' is not localized for locale \'ru_RU\'  - using en_GB',1574363833,'LOCALIZATION',0,NULL),(372,76,32,'GUI','string \'demo_usage\' is not localized for locale \'ru_RU\'  - using en_GB',1574363833,'LOCALIZATION',0,NULL),(373,76,32,'GUI','string \'oauth_login\' is not localized for locale \'ru_RU\'  - using en_GB',1574363833,'LOCALIZATION',0,NULL),(374,77,32,'GUI','string \'unknown_authentication_method\' is not localized for locale \'ru_RU\'  - using en_GB',1574363837,'LOCALIZATION',0,NULL),(375,78,16,'GUI -  ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:21:\"audit_login_succeeded\";s:6:\"params\";a:2:{i:0;s:8:\"lolizz00\";i:1;s:12:\"192.168.67.1\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1574363837,'LOGIN',3,'users'),(376,79,2,'GUI -  ID : 1','E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /srv/http/testlink/lib/functions/tlUser.class.php - Line 1053',1574363837,'PHP',0,NULL),(377,79,2,'GUI -  ID : 1','E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /srv/http/testlink/lib/functions/tlUser.class.php - Line 1053',1574363837,'PHP',0,NULL),(378,79,2,'GUI -  ID : 1','E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /srv/http/testlink/lib/functions/tlUser.class.php - Line 1053',1574363837,'PHP',0,NULL),(379,79,32,'GUI -  ID : 1','string \'full_text_search\' is not localized for locale \'ru_RU\'  - using en_GB',1574363837,'LOCALIZATION',0,NULL),(380,80,2,'GUI -  ID : 1','E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /srv/http/testlink/lib/functions/tlUser.class.php - Line 1053',1574363837,'PHP',0,NULL),(381,80,2,'GUI -  ID : 1','E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /srv/http/testlink/lib/functions/tlUser.class.php - Line 1053',1574363837,'PHP',0,NULL),(382,80,2,'GUI -  ID : 1','E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /srv/http/testlink/lib/functions/tlUser.class.php - Line 1053',1574363837,'PHP',0,NULL),(383,80,32,'GUI -  ID : 1','string \'href_exec_ro_access\' is not localized for locale \'ru_RU\'  - using en_GB',1574363837,'LOCALIZATION',0,NULL),(384,80,32,'GUI -  ID : 1','string \'poweredBy\' is not localized for locale \'ru_RU\'  - using en_GB',1574363837,'LOCALIZATION',0,NULL),(385,80,32,'GUI -  ID : 1','string \'system_descr\' is not localized for locale \'ru_RU\'  - using en_GB',1574363837,'LOCALIZATION',0,NULL),(386,80,32,'GUI -  ID : 1','string \'system_config\' is not localized for locale \'ru_RU\'  - using en_GB',1574363837,'LOCALIZATION',0,NULL),(387,80,32,'GUI -  ID : 1','string \'link_report_test_cases_created_per_user\' is not localized for locale \'ru_RU\'  - using en_GB',1574363837,'LOCALIZATION',0,NULL),(388,80,32,'GUI -  ID : 1','string \'href_req_overview\' is not localized for locale \'ru_RU\'  - using en_GB',1574363837,'LOCALIZATION',0,NULL),(389,80,32,'GUI -  ID : 1','string \'href_print_req\' is not localized for locale \'ru_RU\'  - using en_GB',1574363837,'LOCALIZATION',0,NULL),(390,80,32,'GUI -  ID : 1','string \'title_documentation\' is not localized for locale \'ru_RU\'  - using en_GB',1574363837,'LOCALIZATION',0,NULL),(391,80,32,'GUI -  ID : 1','string \'href_issuetracker_management\' is not localized for locale \'ru_RU\'  - using en_GB',1574363837,'LOCALIZATION',0,NULL),(392,80,32,'GUI -  ID : 1','string \'href_codetracker_management\' is not localized for locale \'ru_RU\'  - using en_GB',1574363837,'LOCALIZATION',0,NULL),(393,80,32,'GUI -  ID : 1','string \'href_reqmgrsystem_management\' is not localized for locale \'ru_RU\'  - using en_GB',1574363837,'LOCALIZATION',0,NULL),(394,80,32,'GUI -  ID : 1','string \'href_req_monitor_overview\' is not localized for locale \'ru_RU\'  - using en_GB',1574363837,'LOCALIZATION',0,NULL),(395,80,2,'GUI -  ID : 1','E_NOTICE\nUndefined index: platform_view - in /srv/http/testlink/gui/templates_c/2d6fb2a38669793051953ef20e150fe584f6789b_0.file.mainPageLeft.tpl.php - Line 179',1574363837,'PHP',0,NULL),(396,81,32,'GUI -  ID : 1','string \'btn_reorder_testcases_externalid\' is not localized for locale \'ru_RU\'  - using en_GB',1574363839,'LOCALIZATION',0,NULL),(397,81,32,'GUI -  ID : 1','string \'btn_testcases_table_view\' is not localized for locale \'ru_RU\'  - using en_GB',1574363839,'LOCALIZATION',0,NULL),(398,81,32,'GUI -  ID : 1','string \'btn_delete_testcases\' is not localized for locale \'ru_RU\'  - using en_GB',1574363839,'LOCALIZATION',0,NULL),(399,81,32,'GUI -  ID : 1','string \'btn_reorder_testcases_alpha\' is not localized for locale \'ru_RU\'  - using en_GB',1574363839,'LOCALIZATION',0,NULL),(400,81,32,'GUI -  ID : 1','string \'btn_reorder_testsuites_alpha\' is not localized for locale \'ru_RU\'  - using en_GB',1574363839,'LOCALIZATION',0,NULL),(401,81,32,'GUI -  ID : 1','string \'btn_gen_test_spec\' is not localized for locale \'ru_RU\'  - using en_GB',1574363839,'LOCALIZATION',0,NULL),(402,81,32,'GUI -  ID : 1','string \'btn_gen_test_spec_new_window\' is not localized for locale \'ru_RU\'  - using en_GB',1574363839,'LOCALIZATION',0,NULL),(403,81,32,'GUI -  ID : 1','string \'btn_gen_test_spec_word\' is not localized for locale \'ru_RU\'  - using en_GB',1574363839,'LOCALIZATION',0,NULL),(404,81,32,'GUI -  ID : 1','string \'btn_gen_test_suite_spec_word\' is not localized for locale \'ru_RU\'  - using en_GB',1574363839,'LOCALIZATION',0,NULL),(405,81,32,'GUI -  ID : 1','string \'btn_gen_test_suite_spec\' is not localized for locale \'ru_RU\'  - using en_GB',1574363839,'LOCALIZATION',0,NULL),(406,81,32,'GUI -  ID : 1','string \'btn_gen_test_suite_spec_new_window\' is not localized for locale \'ru_RU\'  - using en_GB',1574363839,'LOCALIZATION',0,NULL),(407,81,32,'GUI -  ID : 1','string \'testsuite_operations\' is not localized for locale \'ru_RU\'  - using en_GB',1574363839,'LOCALIZATION',0,NULL),(408,81,32,'GUI -  ID : 1','string \'testcase_operations\' is not localized for locale \'ru_RU\'  - using en_GB',1574363839,'LOCALIZATION',0,NULL),(409,81,32,'GUI -  ID : 1','string \'btn_create_from_issue_xml\' is not localized for locale \'ru_RU\'  - using en_GB',1574363839,'LOCALIZATION',0,NULL),(410,81,32,'GUI -  ID : 1','string \'click_to_get_attachment\' is not localized for locale \'ru_RU\'  - using en_GB',1574363839,'LOCALIZATION',0,NULL),(411,81,32,'GUI -  ID : 1','string \'display_inline\' is not localized for locale \'ru_RU\'  - using en_GB',1574363839,'LOCALIZATION',0,NULL),(412,81,32,'GUI -  ID : 1','string \'display_ea_string\' is not localized for locale \'ru_RU\'  - using en_GB',1574363839,'LOCALIZATION',0,NULL),(413,81,32,'GUI -  ID : 1','string \'display_inline_string\' is not localized for locale \'ru_RU\'  - using en_GB',1574363839,'LOCALIZATION',0,NULL),(414,82,32,'GUI -  ID : 1','string \'without_keywords\' is not localized for locale \'ru_RU\'  - using en_GB',1574363839,'LOCALIZATION',0,NULL),(415,82,32,'GUI -  ID : 1','string \'logical_or\' is not localized for locale \'ru_RU\'  - using en_GB',1574363839,'LOCALIZATION',0,NULL),(416,82,32,'GUI -  ID : 1','string \'logical_and\' is not localized for locale \'ru_RU\'  - using en_GB',1574363839,'LOCALIZATION',0,NULL),(417,82,32,'GUI -  ID : 1','string \'not_linked\' is not localized for locale \'ru_RU\'  - using en_GB',1574363839,'LOCALIZATION',0,NULL),(418,82,32,'GUI -  ID : 1','string \'btn_hide_cf\' is not localized for locale \'ru_RU\'  - using en_GB',1574363839,'LOCALIZATION',0,NULL),(419,82,32,'GUI -  ID : 1','string \'filter_active_inactive\' is not localized for locale \'ru_RU\'  - using en_GB',1574363839,'LOCALIZATION',0,NULL),(420,82,32,'GUI -  ID : 1','string \'btn_remove_all_tester_assignments\' is not localized for locale \'ru_RU\'  - using en_GB',1574363839,'LOCALIZATION',0,NULL),(421,82,32,'GUI -  ID : 1','string \'hint_list_of_bugs\' is not localized for locale \'ru_RU\'  - using en_GB',1574363839,'LOCALIZATION',0,NULL),(422,82,32,'GUI -  ID : 1','string \'document_id\' is not localized for locale \'ru_RU\'  - using en_GB',1574363839,'LOCALIZATION',0,NULL),(423,82,32,'GUI -  ID : 1','string \'bugs_on_context\' is not localized for locale \'ru_RU\'  - using en_GB',1574363839,'LOCALIZATION',0,NULL),(424,82,32,'GUI -  ID : 1','string \'req_type\' is not localized for locale \'ru_RU\'  - using en_GB',1574363839,'LOCALIZATION',0,NULL),(425,82,32,'GUI -  ID : 1','string \'req_spec_type\' is not localized for locale \'ru_RU\'  - using en_GB',1574363839,'LOCALIZATION',0,NULL),(426,82,32,'GUI -  ID : 1','string \'has_relation_type\' is not localized for locale \'ru_RU\'  - using en_GB',1574363839,'LOCALIZATION',0,NULL),(427,82,32,'GUI -  ID : 1','string \'btn_export_testplan_tree\' is not localized for locale \'ru_RU\'  - using en_GB',1574363839,'LOCALIZATION',0,NULL),(428,82,32,'GUI -  ID : 1','string \'btn_export_testplan_tree_for_results\' is not localized for locale \'ru_RU\'  - using en_GB',1574363839,'LOCALIZATION',0,NULL),(429,82,32,'GUI -  ID : 1','string \'tester_works_with_settings\' is not localized for locale \'ru_RU\'  - using en_GB',1574363839,'LOCALIZATION',0,NULL),(430,82,32,'GUI -  ID : 1','string \'btn_bulk_remove\' is not localized for locale \'ru_RU\'  - using en_GB',1574363839,'LOCALIZATION',0,NULL),(431,82,32,'GUI -  ID : 1','string \'btn_bulk_copy\' is not localized for locale \'ru_RU\'  - using en_GB',1574363839,'LOCALIZATION',0,NULL),(432,83,2,'GUI -  ID : 1','E_WARNING\nsizeof(): Parameter must be an array or an object that implements Countable - in /srv/http/testlink/lib/functions/object.class.php - Line 590',1574363868,'PHP',0,NULL),(433,83,32,'GUI -  ID : 1','string \'demo_update_user_disabled\' is not localized for locale \'ru_RU\'  - using en_GB',1574363868,'LOCALIZATION',0,NULL),(434,83,2,'GUI -  ID : 1','E_WARNING\nA non-numeric value encountered - in /srv/http/testlink/locale/ja_JP/strings.txt - Line 2045',1574363868,'PHP',0,NULL),(435,83,2,'GUI -  ID : 1','E_WARNING\nA non-numeric value encountered - in /srv/http/testlink/locale/ja_JP/strings.txt - Line 2045',1574363868,'PHP',0,NULL),(436,83,2,'GUI -  ID : 1','E_WARNING\nA non-numeric value encountered - in /srv/http/testlink/locale/ja_JP/strings.txt - Line 2046',1574363868,'PHP',0,NULL),(437,83,2,'GUI -  ID : 1','E_WARNING\nA non-numeric value encountered - in /srv/http/testlink/locale/ja_JP/strings.txt - Line 2046',1574363868,'PHP',0,NULL),(438,83,2,'GUI -  ID : 1','E_WARNING\nA non-numeric value encountered - in /srv/http/testlink/locale/ja_JP/strings.txt - Line 2047',1574363868,'PHP',0,NULL),(439,83,2,'GUI -  ID : 1','E_WARNING\nA non-numeric value encountered - in /srv/http/testlink/locale/ja_JP/strings.txt - Line 2047',1574363868,'PHP',0,NULL),(440,83,2,'GUI -  ID : 1','E_WARNING\nA non-numeric value encountered - in /srv/http/testlink/locale/ja_JP/strings.txt - Line 3265',1574363868,'PHP',0,NULL),(441,83,2,'GUI -  ID : 1','E_WARNING\nA non-numeric value encountered - in /srv/http/testlink/locale/ja_JP/strings.txt - Line 3265',1574363868,'PHP',0,NULL),(442,84,2,'GUI -  ID : 1','E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /srv/http/testlink/lib/functions/tlUser.class.php - Line 1053',1574363876,'PHP',0,NULL),(443,84,2,'GUI -  ID : 1','E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /srv/http/testlink/lib/functions/tlUser.class.php - Line 1053',1574363876,'PHP',0,NULL),(444,84,2,'GUI -  ID : 1','E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /srv/http/testlink/lib/functions/tlUser.class.php - Line 1053',1574363876,'PHP',0,NULL),(445,84,2,'GUI -  ID : 1','E_NOTICE\nUndefined index: platform_view - in /srv/http/testlink/gui/templates_c/2d6fb2a38669793051953ef20e150fe584f6789b_0.file.mainPageLeft.tpl.php - Line 179',1574363876,'PHP',0,NULL),(446,85,2,'GUI -  ID : 1','E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /srv/http/testlink/lib/functions/tlUser.class.php - Line 1053',1574363876,'PHP',0,NULL),(447,85,2,'GUI -  ID : 1','E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /srv/http/testlink/lib/functions/tlUser.class.php - Line 1053',1574363876,'PHP',0,NULL),(448,85,2,'GUI -  ID : 1','E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /srv/http/testlink/lib/functions/tlUser.class.php - Line 1053',1574363876,'PHP',0,NULL),(449,86,2,'GUI -  ID : 1','E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /srv/http/testlink/lib/functions/tlUser.class.php - Line 1053',1574363885,'PHP',0,NULL),(450,86,2,'GUI -  ID : 1','E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /srv/http/testlink/lib/functions/tlUser.class.php - Line 1053',1574363885,'PHP',0,NULL),(451,86,2,'GUI -  ID : 1','E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /srv/http/testlink/lib/functions/tlUser.class.php - Line 1053',1574363885,'PHP',0,NULL),(452,86,2,'GUI -  ID : 1','E_NOTICE\nUndefined index: platform_view - in /srv/http/testlink/gui/templates_c/2d6fb2a38669793051953ef20e150fe584f6789b_0.file.mainPageLeft.tpl.php - Line 179',1574363885,'PHP',0,NULL),(453,87,2,'GUI -  ID : 1','E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /srv/http/testlink/lib/functions/tlUser.class.php - Line 1053',1574363885,'PHP',0,NULL),(454,87,2,'GUI -  ID : 1','E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /srv/http/testlink/lib/functions/tlUser.class.php - Line 1053',1574363885,'PHP',0,NULL),(455,87,2,'GUI -  ID : 1','E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /srv/http/testlink/lib/functions/tlUser.class.php - Line 1053',1574363885,'PHP',0,NULL),(456,88,2,'GUI -  ID : 1','E_WARNING\nsizeof(): Parameter must be an array or an object that implements Countable - in /srv/http/testlink/lib/functions/object.class.php - Line 590',1574363887,'PHP',0,NULL),(457,88,2,'GUI -  ID : 1','E_WARNING\nA non-numeric value encountered - in /srv/http/testlink/locale/ja_JP/strings.txt - Line 2045',1574363887,'PHP',0,NULL),(458,88,2,'GUI -  ID : 1','E_WARNING\nA non-numeric value encountered - in /srv/http/testlink/locale/ja_JP/strings.txt - Line 2045',1574363887,'PHP',0,NULL),(459,88,2,'GUI -  ID : 1','E_WARNING\nA non-numeric value encountered - in /srv/http/testlink/locale/ja_JP/strings.txt - Line 2046',1574363887,'PHP',0,NULL),(460,88,2,'GUI -  ID : 1','E_WARNING\nA non-numeric value encountered - in /srv/http/testlink/locale/ja_JP/strings.txt - Line 2046',1574363887,'PHP',0,NULL),(461,88,2,'GUI -  ID : 1','E_WARNING\nA non-numeric value encountered - in /srv/http/testlink/locale/ja_JP/strings.txt - Line 2047',1574363887,'PHP',0,NULL),(462,88,2,'GUI -  ID : 1','E_WARNING\nA non-numeric value encountered - in /srv/http/testlink/locale/ja_JP/strings.txt - Line 2047',1574363887,'PHP',0,NULL),(463,88,2,'GUI -  ID : 1','E_WARNING\nA non-numeric value encountered - in /srv/http/testlink/locale/ja_JP/strings.txt - Line 3265',1574363887,'PHP',0,NULL),(464,88,2,'GUI -  ID : 1','E_WARNING\nA non-numeric value encountered - in /srv/http/testlink/locale/ja_JP/strings.txt - Line 3265',1574363887,'PHP',0,NULL),(465,89,16,'GUI -  ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:17:\"audit_user_logout\";s:6:\"params\";a:1:{i:0;s:8:\"lolizz00\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1574363888,'LOGOUT',3,'users'),(466,90,32,'GUI','string \'testCaseStatus_draft\' is not localized for locale \'ru_RU\'  - using en_GB',1574363888,'LOCALIZATION',0,NULL),(467,90,32,'GUI','string \'testCaseStatus_readyForReview\' is not localized for locale \'ru_RU\'  - using en_GB',1574363888,'LOCALIZATION',0,NULL),(468,90,32,'GUI','string \'testCaseStatus_reviewInProgress\' is not localized for locale \'ru_RU\'  - using en_GB',1574363888,'LOCALIZATION',0,NULL),(469,90,32,'GUI','string \'testCaseStatus_rework\' is not localized for locale \'ru_RU\'  - using en_GB',1574363888,'LOCALIZATION',0,NULL),(470,90,32,'GUI','string \'testCaseStatus_obsolete\' is not localized for locale \'ru_RU\'  - using en_GB',1574363888,'LOCALIZATION',0,NULL),(471,90,32,'GUI','string \'testCaseStatus_future\' is not localized for locale \'ru_RU\'  - using en_GB',1574363888,'LOCALIZATION',0,NULL),(472,90,32,'GUI','string \'testCaseStatus_final\' is not localized for locale \'ru_RU\'  - using en_GB',1574363888,'LOCALIZATION',0,NULL),(473,90,32,'GUI','string \'login\' is not localized for locale \'ru_RU\'  - using en_GB',1574363888,'LOCALIZATION',0,NULL),(474,90,32,'GUI','string \'demo_usage\' is not localized for locale \'ru_RU\'  - using en_GB',1574363888,'LOCALIZATION',0,NULL),(475,90,32,'GUI','string \'oauth_login\' is not localized for locale \'ru_RU\'  - using en_GB',1574363888,'LOCALIZATION',0,NULL),(476,91,32,'GUI','string \'unknown_authentication_method\' is not localized for locale \'ru_RU\'  - using en_GB',1574363890,'LOCALIZATION',0,NULL),(477,92,16,'GUI - Test Project ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:21:\"audit_login_succeeded\";s:6:\"params\";a:2:{i:0;s:5:\"admin\";i:1;s:12:\"192.168.67.1\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1574363890,'LOGIN',1,'users'),(478,93,2,'GUI -  ID : 1','E_NOTICE\nUndefined property: stdClass::$reqURI - in /srv/http/testlink/gui/templates_c/ad7e70b2ac36091b88f7b80223d469e84256f5e6_0.file.lostPassword-model-marcobiedermann.tpl.php - Line 63',1574363910,'PHP',0,NULL),(479,93,2,'GUI -  ID : 1','E_NOTICE\nUndefined property: stdClass::$destination - in /srv/http/testlink/gui/templates_c/ad7e70b2ac36091b88f7b80223d469e84256f5e6_0.file.lostPassword-model-marcobiedermann.tpl.php - Line 65',1574363910,'PHP',0,NULL),(480,94,32,'GUI','string \'testCaseStatus_draft\' is not localized for locale \'ru_RU\'  - using en_GB',1574363925,'LOCALIZATION',0,NULL),(481,94,32,'GUI','string \'testCaseStatus_readyForReview\' is not localized for locale \'ru_RU\'  - using en_GB',1574363925,'LOCALIZATION',0,NULL),(482,94,32,'GUI','string \'testCaseStatus_reviewInProgress\' is not localized for locale \'ru_RU\'  - using en_GB',1574363925,'LOCALIZATION',0,NULL),(483,94,32,'GUI','string \'testCaseStatus_rework\' is not localized for locale \'ru_RU\'  - using en_GB',1574363925,'LOCALIZATION',0,NULL),(484,94,32,'GUI','string \'testCaseStatus_obsolete\' is not localized for locale \'ru_RU\'  - using en_GB',1574363925,'LOCALIZATION',0,NULL),(485,94,32,'GUI','string \'testCaseStatus_future\' is not localized for locale \'ru_RU\'  - using en_GB',1574363925,'LOCALIZATION',0,NULL),(486,94,32,'GUI','string \'testCaseStatus_final\' is not localized for locale \'ru_RU\'  - using en_GB',1574363925,'LOCALIZATION',0,NULL),(487,94,32,'GUI','string \'login\' is not localized for locale \'ru_RU\'  - using en_GB',1574363925,'LOCALIZATION',0,NULL),(488,94,32,'GUI','string \'demo_usage\' is not localized for locale \'ru_RU\'  - using en_GB',1574363925,'LOCALIZATION',0,NULL),(489,94,32,'GUI','string \'oauth_login\' is not localized for locale \'ru_RU\'  - using en_GB',1574363925,'LOCALIZATION',0,NULL),(490,95,32,'GUI','string \'unknown_authentication_method\' is not localized for locale \'ru_RU\'  - using en_GB',1574363934,'LOCALIZATION',0,NULL),(491,95,16,'GUI','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:18:\"audit_login_failed\";s:6:\"params\";a:2:{i:0;s:5:\"admin\";i:1;s:12:\"192.168.67.1\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1574363934,'LOGIN_FAILED',1,'users'),(492,96,16,'GUI','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:18:\"audit_login_failed\";s:6:\"params\";a:2:{i:0;s:5:\"admin\";i:1;s:12:\"192.168.67.1\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1574363944,'LOGIN_FAILED',1,'users'),(493,97,16,'GUI','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:18:\"audit_login_failed\";s:6:\"params\";a:2:{i:0;s:5:\"admin\";i:1;s:12:\"192.168.67.1\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1574363952,'LOGIN_FAILED',1,'users'),(494,98,16,'GUI','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:18:\"audit_login_failed\";s:6:\"params\";a:2:{i:0;s:5:\"admin\";i:1;s:12:\"192.168.67.1\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1574363964,'LOGIN_FAILED',1,'users'),(495,99,16,'GUI - Test Project ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:21:\"audit_login_succeeded\";s:6:\"params\";a:2:{i:0;s:4:\"root\";i:1;s:12:\"192.168.67.1\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1574363967,'LOGIN',2,'users'),(496,100,2,'GUI - Test Project ID : 1','E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /srv/http/testlink/lib/functions/tlUser.class.php - Line 1053',1574363967,'PHP',0,NULL),(497,100,2,'GUI - Test Project ID : 1','E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /srv/http/testlink/lib/functions/tlUser.class.php - Line 1053',1574363967,'PHP',0,NULL),(498,100,2,'GUI - Test Project ID : 1','E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /srv/http/testlink/lib/functions/tlUser.class.php - Line 1053',1574363967,'PHP',0,NULL),(499,100,32,'GUI - Test Project ID : 1','string \'poweredBy\' is not localized for locale \'en_US\'  - using en_GB',1574363967,'LOCALIZATION',0,NULL),(500,100,32,'GUI - Test Project ID : 1','string \'system_descr\' is not localized for locale \'en_US\'  - using en_GB',1574363967,'LOCALIZATION',0,NULL),(501,100,32,'GUI - Test Project ID : 1','string \'href_codetracker_management\' is not localized for locale \'en_US\'  - using en_GB',1574363967,'LOCALIZATION',0,NULL),(502,100,2,'GUI - Test Project ID : 1','E_NOTICE\nUndefined index: platform_view - in /srv/http/testlink/gui/templates_c/2d6fb2a38669793051953ef20e150fe584f6789b_0.file.mainPageLeft.tpl.php - Line 179',1574363967,'PHP',0,NULL),(503,101,2,'GUI - Test Project ID : 1','E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /srv/http/testlink/lib/functions/tlUser.class.php - Line 1053',1574363967,'PHP',0,NULL),(504,101,2,'GUI - Test Project ID : 1','E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /srv/http/testlink/lib/functions/tlUser.class.php - Line 1053',1574363967,'PHP',0,NULL),(505,101,2,'GUI - Test Project ID : 1','E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /srv/http/testlink/lib/functions/tlUser.class.php - Line 1053',1574363967,'PHP',0,NULL),(506,102,2,'GUI - Test Project ID : 1','E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /srv/http/testlink/lib/functions/tlUser.class.php - Line 1053',1574363971,'PHP',0,NULL),(507,102,2,'GUI - Test Project ID : 1','E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /srv/http/testlink/lib/functions/tlUser.class.php - Line 1053',1574363971,'PHP',0,NULL),(508,102,2,'GUI - Test Project ID : 1','E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /srv/http/testlink/lib/functions/tlUser.class.php - Line 1053',1574363971,'PHP',0,NULL),(509,103,2,'GUI - Test Project ID : 1','E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /srv/http/testlink/lib/functions/tlUser.class.php - Line 1053',1574363971,'PHP',0,NULL),(510,103,2,'GUI - Test Project ID : 1','E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /srv/http/testlink/lib/functions/tlUser.class.php - Line 1053',1574363971,'PHP',0,NULL),(511,103,2,'GUI - Test Project ID : 1','E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /srv/http/testlink/lib/functions/tlUser.class.php - Line 1053',1574363971,'PHP',0,NULL),(512,103,2,'GUI - Test Project ID : 1','E_NOTICE\nUndefined index: platform_view - in /srv/http/testlink/gui/templates_c/2d6fb2a38669793051953ef20e150fe584f6789b_0.file.mainPageLeft.tpl.php - Line 179',1574363971,'PHP',0,NULL),(513,104,32,'GUI - Test Project ID : 1','string \'tcvqty_with_kw\' is not localized for locale \'en_US\'  - using en_GB',1574363972,'LOCALIZATION',0,NULL),(514,105,2,'GUI - Test Project ID : 1','E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /srv/http/testlink/lib/functions/tlUser.class.php - Line 1053',1574363973,'PHP',0,NULL),(515,105,2,'GUI - Test Project ID : 1','E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /srv/http/testlink/lib/functions/tlUser.class.php - Line 1053',1574363973,'PHP',0,NULL),(516,105,2,'GUI - Test Project ID : 1','E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /srv/http/testlink/lib/functions/tlUser.class.php - Line 1053',1574363973,'PHP',0,NULL),(517,105,2,'GUI - Test Project ID : 1','E_NOTICE\nUndefined index: platform_view - in /srv/http/testlink/gui/templates_c/2d6fb2a38669793051953ef20e150fe584f6789b_0.file.mainPageLeft.tpl.php - Line 179',1574363973,'PHP',0,NULL),(518,106,2,'GUI - Test Project ID : 1','E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /srv/http/testlink/lib/functions/tlUser.class.php - Line 1053',1574363975,'PHP',0,NULL),(519,106,2,'GUI - Test Project ID : 1','E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /srv/http/testlink/lib/functions/tlUser.class.php - Line 1053',1574363975,'PHP',0,NULL),(520,106,2,'GUI - Test Project ID : 1','E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /srv/http/testlink/lib/functions/tlUser.class.php - Line 1053',1574363975,'PHP',0,NULL),(521,106,2,'GUI - Test Project ID : 1','E_NOTICE\nUndefined index: platform_view - in /srv/http/testlink/gui/templates_c/2d6fb2a38669793051953ef20e150fe584f6789b_0.file.mainPageLeft.tpl.php - Line 179',1574363975,'PHP',0,NULL),(522,107,16,'GUI -  ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:18:\"audit_login_failed\";s:6:\"params\";a:2:{i:0;s:5:\"admin\";i:1;s:12:\"192.168.67.1\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1574363978,'LOGIN_FAILED',1,'users'),(523,108,16,'GUI -  ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:17:\"audit_user_logout\";s:6:\"params\";a:1:{i:0;s:4:\"root\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1574363990,'LOGOUT',2,'users'),(524,109,32,'GUI','string \'testCaseStatus_draft\' is not localized for locale \'ru_RU\'  - using en_GB',1574363990,'LOCALIZATION',0,NULL),(525,109,32,'GUI','string \'testCaseStatus_readyForReview\' is not localized for locale \'ru_RU\'  - using en_GB',1574363990,'LOCALIZATION',0,NULL),(526,109,32,'GUI','string \'testCaseStatus_reviewInProgress\' is not localized for locale \'ru_RU\'  - using en_GB',1574363990,'LOCALIZATION',0,NULL),(527,109,32,'GUI','string \'testCaseStatus_rework\' is not localized for locale \'ru_RU\'  - using en_GB',1574363990,'LOCALIZATION',0,NULL),(528,109,32,'GUI','string \'testCaseStatus_obsolete\' is not localized for locale \'ru_RU\'  - using en_GB',1574363990,'LOCALIZATION',0,NULL),(529,109,32,'GUI','string \'testCaseStatus_future\' is not localized for locale \'ru_RU\'  - using en_GB',1574363990,'LOCALIZATION',0,NULL),(530,109,32,'GUI','string \'testCaseStatus_final\' is not localized for locale \'ru_RU\'  - using en_GB',1574363990,'LOCALIZATION',0,NULL),(531,109,32,'GUI','string \'login\' is not localized for locale \'ru_RU\'  - using en_GB',1574363990,'LOCALIZATION',0,NULL),(532,109,32,'GUI','string \'demo_usage\' is not localized for locale \'ru_RU\'  - using en_GB',1574363990,'LOCALIZATION',0,NULL),(533,109,32,'GUI','string \'oauth_login\' is not localized for locale \'ru_RU\'  - using en_GB',1574363990,'LOCALIZATION',0,NULL),(534,110,32,'GUI','string \'unknown_authentication_method\' is not localized for locale \'ru_RU\'  - using en_GB',1574363997,'LOCALIZATION',0,NULL),(535,111,16,'GUI - Test Project ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:21:\"audit_login_succeeded\";s:6:\"params\";a:2:{i:0;s:5:\"admin\";i:1;s:12:\"192.168.67.1\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1574363997,'LOGIN',1,'users'),(536,112,16,'GUI - Test Project ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:17:\"audit_user_logout\";s:6:\"params\";a:1:{i:0;s:5:\"admin\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1574364012,'LOGOUT',1,'users'),(537,113,32,'GUI','string \'testCaseStatus_draft\' is not localized for locale \'ru_RU\'  - using en_GB',1574364012,'LOCALIZATION',0,NULL),(538,113,32,'GUI','string \'testCaseStatus_readyForReview\' is not localized for locale \'ru_RU\'  - using en_GB',1574364012,'LOCALIZATION',0,NULL),(539,113,32,'GUI','string \'testCaseStatus_reviewInProgress\' is not localized for locale \'ru_RU\'  - using en_GB',1574364012,'LOCALIZATION',0,NULL),(540,113,32,'GUI','string \'testCaseStatus_rework\' is not localized for locale \'ru_RU\'  - using en_GB',1574364012,'LOCALIZATION',0,NULL),(541,113,32,'GUI','string \'testCaseStatus_obsolete\' is not localized for locale \'ru_RU\'  - using en_GB',1574364012,'LOCALIZATION',0,NULL),(542,113,32,'GUI','string \'testCaseStatus_future\' is not localized for locale \'ru_RU\'  - using en_GB',1574364012,'LOCALIZATION',0,NULL),(543,113,32,'GUI','string \'testCaseStatus_final\' is not localized for locale \'ru_RU\'  - using en_GB',1574364012,'LOCALIZATION',0,NULL),(544,113,32,'GUI','string \'login\' is not localized for locale \'ru_RU\'  - using en_GB',1574364012,'LOCALIZATION',0,NULL),(545,113,32,'GUI','string \'demo_usage\' is not localized for locale \'ru_RU\'  - using en_GB',1574364012,'LOCALIZATION',0,NULL),(546,113,32,'GUI','string \'oauth_login\' is not localized for locale \'ru_RU\'  - using en_GB',1574364012,'LOCALIZATION',0,NULL),(547,114,32,'GUI','string \'unknown_authentication_method\' is not localized for locale \'ru_RU\'  - using en_GB',1574364016,'LOCALIZATION',0,NULL),(548,115,16,'GUI - Test Project ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:21:\"audit_login_succeeded\";s:6:\"params\";a:2:{i:0;s:5:\"admin\";i:1;s:12:\"192.168.67.1\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1574364016,'LOGIN',1,'users'),(549,116,2,'GUI - Test Project ID : 1','E_WARNING\nA non-numeric value encountered - in /srv/http/testlink/locale/ja_JP/strings.txt - Line 2045',1574364030,'PHP',0,NULL),(550,116,2,'GUI - Test Project ID : 1','E_WARNING\nA non-numeric value encountered - in /srv/http/testlink/locale/ja_JP/strings.txt - Line 2045',1574364030,'PHP',0,NULL),(551,116,2,'GUI - Test Project ID : 1','E_WARNING\nA non-numeric value encountered - in /srv/http/testlink/locale/ja_JP/strings.txt - Line 2046',1574364030,'PHP',0,NULL),(552,116,2,'GUI - Test Project ID : 1','E_WARNING\nA non-numeric value encountered - in /srv/http/testlink/locale/ja_JP/strings.txt - Line 2046',1574364030,'PHP',0,NULL),(553,116,2,'GUI - Test Project ID : 1','E_WARNING\nA non-numeric value encountered - in /srv/http/testlink/locale/ja_JP/strings.txt - Line 2047',1574364030,'PHP',0,NULL),(554,116,2,'GUI - Test Project ID : 1','E_WARNING\nA non-numeric value encountered - in /srv/http/testlink/locale/ja_JP/strings.txt - Line 2047',1574364030,'PHP',0,NULL),(555,116,2,'GUI - Test Project ID : 1','E_WARNING\nA non-numeric value encountered - in /srv/http/testlink/locale/ja_JP/strings.txt - Line 3265',1574364030,'PHP',0,NULL),(556,116,2,'GUI - Test Project ID : 1','E_WARNING\nA non-numeric value encountered - in /srv/http/testlink/locale/ja_JP/strings.txt - Line 3265',1574364030,'PHP',0,NULL),(557,117,2,'GUI - Test Project ID : 1','E_WARNING\nA non-numeric value encountered - in /srv/http/testlink/locale/ja_JP/strings.txt - Line 2045',1574364044,'PHP',0,NULL),(558,117,2,'GUI - Test Project ID : 1','E_WARNING\nA non-numeric value encountered - in /srv/http/testlink/locale/ja_JP/strings.txt - Line 2045',1574364044,'PHP',0,NULL),(559,117,2,'GUI - Test Project ID : 1','E_WARNING\nA non-numeric value encountered - in /srv/http/testlink/locale/ja_JP/strings.txt - Line 2046',1574364044,'PHP',0,NULL),(560,117,2,'GUI - Test Project ID : 1','E_WARNING\nA non-numeric value encountered - in /srv/http/testlink/locale/ja_JP/strings.txt - Line 2046',1574364044,'PHP',0,NULL),(561,117,2,'GUI - Test Project ID : 1','E_WARNING\nA non-numeric value encountered - in /srv/http/testlink/locale/ja_JP/strings.txt - Line 2047',1574364044,'PHP',0,NULL),(562,117,2,'GUI - Test Project ID : 1','E_WARNING\nA non-numeric value encountered - in /srv/http/testlink/locale/ja_JP/strings.txt - Line 2047',1574364044,'PHP',0,NULL),(563,117,2,'GUI - Test Project ID : 1','E_WARNING\nA non-numeric value encountered - in /srv/http/testlink/locale/ja_JP/strings.txt - Line 3265',1574364044,'PHP',0,NULL),(564,117,2,'GUI - Test Project ID : 1','E_WARNING\nA non-numeric value encountered - in /srv/http/testlink/locale/ja_JP/strings.txt - Line 3265',1574364044,'PHP',0,NULL),(565,118,16,'GUI - Test Project ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:16:\"audit_user_saved\";s:6:\"params\";a:1:{i:0;s:5:\"admin\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1574364057,'SAVE',1,'users'),(566,118,32,'GUI -  ID : 1','string \'demo_update_user_disabled\' is not localized for locale \'ru_RU\'  - using en_GB',1574364057,'LOCALIZATION',0,NULL),(567,118,2,'GUI -  ID : 1','E_WARNING\nA non-numeric value encountered - in /srv/http/testlink/locale/ja_JP/strings.txt - Line 2045',1574364057,'PHP',0,NULL),(568,118,2,'GUI -  ID : 1','E_WARNING\nA non-numeric value encountered - in /srv/http/testlink/locale/ja_JP/strings.txt - Line 2045',1574364057,'PHP',0,NULL),(569,118,2,'GUI -  ID : 1','E_WARNING\nA non-numeric value encountered - in /srv/http/testlink/locale/ja_JP/strings.txt - Line 2046',1574364057,'PHP',0,NULL),(570,118,2,'GUI -  ID : 1','E_WARNING\nA non-numeric value encountered - in /srv/http/testlink/locale/ja_JP/strings.txt - Line 2046',1574364057,'PHP',0,NULL),(571,118,2,'GUI -  ID : 1','E_WARNING\nA non-numeric value encountered - in /srv/http/testlink/locale/ja_JP/strings.txt - Line 2047',1574364057,'PHP',0,NULL),(572,118,2,'GUI -  ID : 1','E_WARNING\nA non-numeric value encountered - in /srv/http/testlink/locale/ja_JP/strings.txt - Line 2047',1574364057,'PHP',0,NULL),(573,118,2,'GUI -  ID : 1','E_WARNING\nA non-numeric value encountered - in /srv/http/testlink/locale/ja_JP/strings.txt - Line 3265',1574364057,'PHP',0,NULL),(574,118,2,'GUI -  ID : 1','E_WARNING\nA non-numeric value encountered - in /srv/http/testlink/locale/ja_JP/strings.txt - Line 3265',1574364057,'PHP',0,NULL),(575,119,32,'GUI -  ID : 1','string \'full_text_search\' is not localized for locale \'ru_RU\'  - using en_GB',1574364058,'LOCALIZATION',0,NULL),(576,120,32,'GUI -  ID : 1','string \'href_exec_ro_access\' is not localized for locale \'ru_RU\'  - using en_GB',1574364061,'LOCALIZATION',0,NULL),(577,120,32,'GUI -  ID : 1','string \'poweredBy\' is not localized for locale \'ru_RU\'  - using en_GB',1574364061,'LOCALIZATION',0,NULL),(578,120,32,'GUI -  ID : 1','string \'system_descr\' is not localized for locale \'ru_RU\'  - using en_GB',1574364061,'LOCALIZATION',0,NULL),(579,120,32,'GUI -  ID : 1','string \'system_config\' is not localized for locale \'ru_RU\'  - using en_GB',1574364061,'LOCALIZATION',0,NULL),(580,120,32,'GUI -  ID : 1','string \'link_report_test_cases_created_per_user\' is not localized for locale \'ru_RU\'  - using en_GB',1574364061,'LOCALIZATION',0,NULL),(581,120,32,'GUI -  ID : 1','string \'href_req_overview\' is not localized for locale \'ru_RU\'  - using en_GB',1574364061,'LOCALIZATION',0,NULL),(582,120,32,'GUI -  ID : 1','string \'href_print_req\' is not localized for locale \'ru_RU\'  - using en_GB',1574364061,'LOCALIZATION',0,NULL),(583,120,32,'GUI -  ID : 1','string \'title_documentation\' is not localized for locale \'ru_RU\'  - using en_GB',1574364061,'LOCALIZATION',0,NULL),(584,120,32,'GUI -  ID : 1','string \'href_issuetracker_management\' is not localized for locale \'ru_RU\'  - using en_GB',1574364061,'LOCALIZATION',0,NULL),(585,120,32,'GUI -  ID : 1','string \'href_codetracker_management\' is not localized for locale \'ru_RU\'  - using en_GB',1574364061,'LOCALIZATION',0,NULL),(586,120,32,'GUI -  ID : 1','string \'href_reqmgrsystem_management\' is not localized for locale \'ru_RU\'  - using en_GB',1574364061,'LOCALIZATION',0,NULL),(587,120,32,'GUI -  ID : 1','string \'href_req_monitor_overview\' is not localized for locale \'ru_RU\'  - using en_GB',1574364061,'LOCALIZATION',0,NULL),(588,121,2,'GUI -  ID : 1','E_WARNING\nA non-numeric value encountered - in /srv/http/testlink/locale/ja_JP/strings.txt - Line 2045',1574364074,'PHP',0,NULL),(589,121,2,'GUI -  ID : 1','E_WARNING\nA non-numeric value encountered - in /srv/http/testlink/locale/ja_JP/strings.txt - Line 2045',1574364074,'PHP',0,NULL),(590,121,2,'GUI -  ID : 1','E_WARNING\nA non-numeric value encountered - in /srv/http/testlink/locale/ja_JP/strings.txt - Line 2046',1574364074,'PHP',0,NULL),(591,121,2,'GUI -  ID : 1','E_WARNING\nA non-numeric value encountered - in /srv/http/testlink/locale/ja_JP/strings.txt - Line 2046',1574364074,'PHP',0,NULL),(592,121,2,'GUI -  ID : 1','E_WARNING\nA non-numeric value encountered - in /srv/http/testlink/locale/ja_JP/strings.txt - Line 2047',1574364074,'PHP',0,NULL),(593,121,2,'GUI -  ID : 1','E_WARNING\nA non-numeric value encountered - in /srv/http/testlink/locale/ja_JP/strings.txt - Line 2047',1574364074,'PHP',0,NULL),(594,121,2,'GUI -  ID : 1','E_WARNING\nA non-numeric value encountered - in /srv/http/testlink/locale/ja_JP/strings.txt - Line 3265',1574364074,'PHP',0,NULL),(595,121,2,'GUI -  ID : 1','E_WARNING\nA non-numeric value encountered - in /srv/http/testlink/locale/ja_JP/strings.txt - Line 3265',1574364074,'PHP',0,NULL),(596,122,16,'GUI -  ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:16:\"audit_user_saved\";s:6:\"params\";a:1:{i:0;s:5:\"admin\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1574364084,'SAVE',1,'users'),(597,122,2,'GUI - Test Project ID : 1','E_WARNING\nA non-numeric value encountered - in /srv/http/testlink/locale/ja_JP/strings.txt - Line 2045',1574364084,'PHP',0,NULL),(598,122,2,'GUI - Test Project ID : 1','E_WARNING\nA non-numeric value encountered - in /srv/http/testlink/locale/ja_JP/strings.txt - Line 2045',1574364084,'PHP',0,NULL),(599,122,2,'GUI - Test Project ID : 1','E_WARNING\nA non-numeric value encountered - in /srv/http/testlink/locale/ja_JP/strings.txt - Line 2046',1574364084,'PHP',0,NULL),(600,122,2,'GUI - Test Project ID : 1','E_WARNING\nA non-numeric value encountered - in /srv/http/testlink/locale/ja_JP/strings.txt - Line 2046',1574364084,'PHP',0,NULL),(601,122,2,'GUI - Test Project ID : 1','E_WARNING\nA non-numeric value encountered - in /srv/http/testlink/locale/ja_JP/strings.txt - Line 2047',1574364084,'PHP',0,NULL),(602,122,2,'GUI - Test Project ID : 1','E_WARNING\nA non-numeric value encountered - in /srv/http/testlink/locale/ja_JP/strings.txt - Line 2047',1574364084,'PHP',0,NULL),(603,122,2,'GUI - Test Project ID : 1','E_WARNING\nA non-numeric value encountered - in /srv/http/testlink/locale/ja_JP/strings.txt - Line 3265',1574364084,'PHP',0,NULL),(604,122,2,'GUI - Test Project ID : 1','E_WARNING\nA non-numeric value encountered - in /srv/http/testlink/locale/ja_JP/strings.txt - Line 3265',1574364084,'PHP',0,NULL),(605,123,32,'GUI - Test Project ID : 1','string \'expiration\' is not localized for locale \'en_US\'  - using en_GB',1574364087,'LOCALIZATION',0,NULL),(606,123,32,'GUI - Test Project ID : 1','string \'expiration_date\' is not localized for locale \'en_US\'  - using en_GB',1574364087,'LOCALIZATION',0,NULL),(607,124,16,'GUI - Test Project ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:19:\"audit_user_disabled\";s:6:\"params\";a:1:{i:0;s:8:\"lolizz00\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1574364094,'DISABLE',3,'users'),(608,125,16,'GUI - Test Project ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:19:\"audit_user_disabled\";s:6:\"params\";a:1:{i:0;s:4:\"root\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1574364100,'DISABLE',2,'users'),(609,126,16,'GUI - Test Project ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:19:\"audit_user_disabled\";s:6:\"params\";a:1:{i:0;s:4:\"root\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1574364116,'DISABLE',2,'users'),(610,127,16,'GUI - Test Project ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:19:\"audit_user_disabled\";s:6:\"params\";a:1:{i:0;s:4:\"root\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1574364121,'DISABLE',2,'users'),(611,128,16,'GUI - Test Project ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:19:\"audit_user_disabled\";s:6:\"params\";a:1:{i:0;s:4:\"root\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1574364132,'DISABLE',2,'users'),(612,129,16,'GUI - Test Project ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:16:\"audit_user_saved\";s:6:\"params\";a:1:{i:0;s:8:\"lolizz00\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1574364155,'SAVE',3,'users'),(613,130,16,'GUI - Test Project ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:17:\"audit_user_logout\";s:6:\"params\";a:1:{i:0;s:5:\"admin\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1574364165,'LOGOUT',1,'users'),(614,131,32,'GUI','string \'testCaseStatus_draft\' is not localized for locale \'ru_RU\'  - using en_GB',1574364165,'LOCALIZATION',0,NULL),(615,131,32,'GUI','string \'testCaseStatus_readyForReview\' is not localized for locale \'ru_RU\'  - using en_GB',1574364165,'LOCALIZATION',0,NULL),(616,131,32,'GUI','string \'testCaseStatus_reviewInProgress\' is not localized for locale \'ru_RU\'  - using en_GB',1574364165,'LOCALIZATION',0,NULL),(617,131,32,'GUI','string \'testCaseStatus_rework\' is not localized for locale \'ru_RU\'  - using en_GB',1574364165,'LOCALIZATION',0,NULL),(618,131,32,'GUI','string \'testCaseStatus_obsolete\' is not localized for locale \'ru_RU\'  - using en_GB',1574364165,'LOCALIZATION',0,NULL),(619,131,32,'GUI','string \'testCaseStatus_future\' is not localized for locale \'ru_RU\'  - using en_GB',1574364165,'LOCALIZATION',0,NULL),(620,131,32,'GUI','string \'testCaseStatus_final\' is not localized for locale \'ru_RU\'  - using en_GB',1574364165,'LOCALIZATION',0,NULL),(621,131,32,'GUI','string \'login\' is not localized for locale \'ru_RU\'  - using en_GB',1574364165,'LOCALIZATION',0,NULL),(622,131,32,'GUI','string \'demo_usage\' is not localized for locale \'ru_RU\'  - using en_GB',1574364165,'LOCALIZATION',0,NULL),(623,131,32,'GUI','string \'oauth_login\' is not localized for locale \'ru_RU\'  - using en_GB',1574364165,'LOCALIZATION',0,NULL),(624,132,32,'GUI','string \'unknown_authentication_method\' is not localized for locale \'ru_RU\'  - using en_GB',1574364173,'LOCALIZATION',0,NULL),(625,132,16,'GUI','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:18:\"audit_login_failed\";s:6:\"params\";a:2:{i:0;s:8:\"lolizz00\";i:1;s:12:\"192.168.67.1\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1574364173,'LOGIN_FAILED',3,'users'),(626,133,16,'GUI','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:18:\"audit_login_failed\";s:6:\"params\";a:2:{i:0;s:8:\"lolizz00\";i:1;s:12:\"192.168.67.1\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1574364183,'LOGIN_FAILED',3,'users'),(627,134,16,'GUI - Test Project ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:21:\"audit_login_succeeded\";s:6:\"params\";a:2:{i:0;s:5:\"admin\";i:1;s:12:\"192.168.67.1\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1574364188,'LOGIN',1,'users'),(628,135,32,'GUI - Test Project ID : 1','string \'poweredBy\' is not localized for locale \'en_US\'  - using en_GB',1574364188,'LOCALIZATION',0,NULL),(629,135,32,'GUI - Test Project ID : 1','string \'system_descr\' is not localized for locale \'en_US\'  - using en_GB',1574364188,'LOCALIZATION',0,NULL),(630,135,32,'GUI - Test Project ID : 1','string \'href_codetracker_management\' is not localized for locale \'en_US\'  - using en_GB',1574364188,'LOCALIZATION',0,NULL),(631,136,16,'GUI -  ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:18:\"audit_login_failed\";s:6:\"params\";a:2:{i:0;s:8:\"lolizz00\";i:1;s:12:\"192.168.67.1\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1574364194,'LOGIN_FAILED',3,'users'),(632,137,16,'GUI -  ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:18:\"audit_login_failed\";s:6:\"params\";a:2:{i:0;s:8:\"lolizz00\";i:1;s:12:\"192.168.67.1\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1574364198,'LOGIN_FAILED',3,'users'),(633,138,16,'GUI -  ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:18:\"audit_login_failed\";s:6:\"params\";a:2:{i:0;s:8:\"lolizz00\";i:1;s:12:\"192.168.67.1\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1574364207,'LOGIN_FAILED',3,'users'),(634,139,16,'GUI -  ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:17:\"audit_user_logout\";s:6:\"params\";a:1:{i:0;s:5:\"admin\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1574364215,'LOGOUT',1,'users'),(635,140,32,'GUI','string \'testCaseStatus_draft\' is not localized for locale \'ru_RU\'  - using en_GB',1574364215,'LOCALIZATION',0,NULL),(636,140,32,'GUI','string \'testCaseStatus_readyForReview\' is not localized for locale \'ru_RU\'  - using en_GB',1574364215,'LOCALIZATION',0,NULL),(637,140,32,'GUI','string \'testCaseStatus_reviewInProgress\' is not localized for locale \'ru_RU\'  - using en_GB',1574364215,'LOCALIZATION',0,NULL),(638,140,32,'GUI','string \'testCaseStatus_rework\' is not localized for locale \'ru_RU\'  - using en_GB',1574364215,'LOCALIZATION',0,NULL),(639,140,32,'GUI','string \'testCaseStatus_obsolete\' is not localized for locale \'ru_RU\'  - using en_GB',1574364215,'LOCALIZATION',0,NULL),(640,140,32,'GUI','string \'testCaseStatus_future\' is not localized for locale \'ru_RU\'  - using en_GB',1574364215,'LOCALIZATION',0,NULL),(641,140,32,'GUI','string \'testCaseStatus_final\' is not localized for locale \'ru_RU\'  - using en_GB',1574364215,'LOCALIZATION',0,NULL),(642,140,32,'GUI','string \'login\' is not localized for locale \'ru_RU\'  - using en_GB',1574364215,'LOCALIZATION',0,NULL),(643,140,32,'GUI','string \'demo_usage\' is not localized for locale \'ru_RU\'  - using en_GB',1574364215,'LOCALIZATION',0,NULL),(644,140,32,'GUI','string \'oauth_login\' is not localized for locale \'ru_RU\'  - using en_GB',1574364215,'LOCALIZATION',0,NULL),(645,141,32,'GUI','string \'unknown_authentication_method\' is not localized for locale \'ru_RU\'  - using en_GB',1574364220,'LOCALIZATION',0,NULL),(646,142,16,'GUI - Test Project ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:21:\"audit_login_succeeded\";s:6:\"params\";a:2:{i:0;s:5:\"admin\";i:1;s:12:\"192.168.67.1\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1574364220,'LOGIN',1,'users'),(647,143,32,'GUI - Test Project ID : 1','string \'poweredBy\' is not localized for locale \'en_US\'  - using en_GB',1574364220,'LOCALIZATION',0,NULL),(648,143,32,'GUI - Test Project ID : 1','string \'system_descr\' is not localized for locale \'en_US\'  - using en_GB',1574364220,'LOCALIZATION',0,NULL),(649,143,32,'GUI - Test Project ID : 1','string \'href_codetracker_management\' is not localized for locale \'en_US\'  - using en_GB',1574364220,'LOCALIZATION',0,NULL),(650,144,2,'GUI - Test Project ID : 1','E_WARNING\nA non-numeric value encountered - in /srv/http/testlink/locale/ja_JP/strings.txt - Line 2045',1574364222,'PHP',0,NULL),(651,144,2,'GUI - Test Project ID : 1','E_WARNING\nA non-numeric value encountered - in /srv/http/testlink/locale/ja_JP/strings.txt - Line 2045',1574364222,'PHP',0,NULL),(652,144,2,'GUI - Test Project ID : 1','E_WARNING\nA non-numeric value encountered - in /srv/http/testlink/locale/ja_JP/strings.txt - Line 2046',1574364222,'PHP',0,NULL),(653,144,2,'GUI - Test Project ID : 1','E_WARNING\nA non-numeric value encountered - in /srv/http/testlink/locale/ja_JP/strings.txt - Line 2046',1574364222,'PHP',0,NULL),(654,144,2,'GUI - Test Project ID : 1','E_WARNING\nA non-numeric value encountered - in /srv/http/testlink/locale/ja_JP/strings.txt - Line 2047',1574364222,'PHP',0,NULL),(655,144,2,'GUI - Test Project ID : 1','E_WARNING\nA non-numeric value encountered - in /srv/http/testlink/locale/ja_JP/strings.txt - Line 2047',1574364222,'PHP',0,NULL),(656,144,2,'GUI - Test Project ID : 1','E_WARNING\nA non-numeric value encountered - in /srv/http/testlink/locale/ja_JP/strings.txt - Line 3265',1574364222,'PHP',0,NULL),(657,144,2,'GUI - Test Project ID : 1','E_WARNING\nA non-numeric value encountered - in /srv/http/testlink/locale/ja_JP/strings.txt - Line 3265',1574364222,'PHP',0,NULL),(658,145,32,'GUI - Test Project ID : 1','string \'expiration\' is not localized for locale \'en_US\'  - using en_GB',1574364225,'LOCALIZATION',0,NULL),(659,145,32,'GUI - Test Project ID : 1','string \'expiration_date\' is not localized for locale \'en_US\'  - using en_GB',1574364225,'LOCALIZATION',0,NULL),(660,146,2,'GUI - Test Project ID : 1','E_WARNING\nA non-numeric value encountered - in /srv/http/testlink/locale/ja_JP/strings.txt - Line 2045',1574364250,'PHP',0,NULL),(661,146,2,'GUI - Test Project ID : 1','E_WARNING\nA non-numeric value encountered - in /srv/http/testlink/locale/ja_JP/strings.txt - Line 2045',1574364250,'PHP',0,NULL),(662,146,2,'GUI - Test Project ID : 1','E_WARNING\nA non-numeric value encountered - in /srv/http/testlink/locale/ja_JP/strings.txt - Line 2046',1574364250,'PHP',0,NULL),(663,146,2,'GUI - Test Project ID : 1','E_WARNING\nA non-numeric value encountered - in /srv/http/testlink/locale/ja_JP/strings.txt - Line 2046',1574364250,'PHP',0,NULL),(664,146,2,'GUI - Test Project ID : 1','E_WARNING\nA non-numeric value encountered - in /srv/http/testlink/locale/ja_JP/strings.txt - Line 2047',1574364250,'PHP',0,NULL),(665,146,2,'GUI - Test Project ID : 1','E_WARNING\nA non-numeric value encountered - in /srv/http/testlink/locale/ja_JP/strings.txt - Line 2047',1574364250,'PHP',0,NULL),(666,146,2,'GUI - Test Project ID : 1','E_WARNING\nA non-numeric value encountered - in /srv/http/testlink/locale/ja_JP/strings.txt - Line 3265',1574364250,'PHP',0,NULL),(667,146,2,'GUI - Test Project ID : 1','E_WARNING\nA non-numeric value encountered - in /srv/http/testlink/locale/ja_JP/strings.txt - Line 3265',1574364250,'PHP',0,NULL),(668,147,2,'GUI - Test Project ID : 1','E_WARNING\nA non-numeric value encountered - in /srv/http/testlink/locale/ja_JP/strings.txt - Line 2045',1574364296,'PHP',0,NULL),(669,147,2,'GUI - Test Project ID : 1','E_WARNING\nA non-numeric value encountered - in /srv/http/testlink/locale/ja_JP/strings.txt - Line 2045',1574364296,'PHP',0,NULL),(670,147,2,'GUI - Test Project ID : 1','E_WARNING\nA non-numeric value encountered - in /srv/http/testlink/locale/ja_JP/strings.txt - Line 2046',1574364296,'PHP',0,NULL),(671,147,2,'GUI - Test Project ID : 1','E_WARNING\nA non-numeric value encountered - in /srv/http/testlink/locale/ja_JP/strings.txt - Line 2046',1574364296,'PHP',0,NULL),(672,147,2,'GUI - Test Project ID : 1','E_WARNING\nA non-numeric value encountered - in /srv/http/testlink/locale/ja_JP/strings.txt - Line 2047',1574364296,'PHP',0,NULL),(673,147,2,'GUI - Test Project ID : 1','E_WARNING\nA non-numeric value encountered - in /srv/http/testlink/locale/ja_JP/strings.txt - Line 2047',1574364296,'PHP',0,NULL),(674,147,2,'GUI - Test Project ID : 1','E_WARNING\nA non-numeric value encountered - in /srv/http/testlink/locale/ja_JP/strings.txt - Line 3265',1574364296,'PHP',0,NULL),(675,147,2,'GUI - Test Project ID : 1','E_WARNING\nA non-numeric value encountered - in /srv/http/testlink/locale/ja_JP/strings.txt - Line 3265',1574364296,'PHP',0,NULL),(676,148,16,'GUI - Test Project ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:18:\"audit_user_created\";s:6:\"params\";a:1:{i:0;s:8:\"lolizz00\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1574364413,'CREATE',4,'users'),(677,149,2,'GUI - Test Project ID : 1','E_WARNING\nA non-numeric value encountered - in /srv/http/testlink/locale/ja_JP/strings.txt - Line 2045',1574364436,'PHP',0,NULL),(678,149,2,'GUI - Test Project ID : 1','E_WARNING\nA non-numeric value encountered - in /srv/http/testlink/locale/ja_JP/strings.txt - Line 2045',1574364436,'PHP',0,NULL),(679,149,2,'GUI - Test Project ID : 1','E_WARNING\nA non-numeric value encountered - in /srv/http/testlink/locale/ja_JP/strings.txt - Line 2046',1574364436,'PHP',0,NULL),(680,149,2,'GUI - Test Project ID : 1','E_WARNING\nA non-numeric value encountered - in /srv/http/testlink/locale/ja_JP/strings.txt - Line 2046',1574364436,'PHP',0,NULL),(681,149,2,'GUI - Test Project ID : 1','E_WARNING\nA non-numeric value encountered - in /srv/http/testlink/locale/ja_JP/strings.txt - Line 2047',1574364436,'PHP',0,NULL),(682,149,2,'GUI - Test Project ID : 1','E_WARNING\nA non-numeric value encountered - in /srv/http/testlink/locale/ja_JP/strings.txt - Line 2047',1574364436,'PHP',0,NULL),(683,149,2,'GUI - Test Project ID : 1','E_WARNING\nA non-numeric value encountered - in /srv/http/testlink/locale/ja_JP/strings.txt - Line 3265',1574364436,'PHP',0,NULL),(684,149,2,'GUI - Test Project ID : 1','E_WARNING\nA non-numeric value encountered - in /srv/http/testlink/locale/ja_JP/strings.txt - Line 3265',1574364436,'PHP',0,NULL),(685,150,16,'GUI - Test Project ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:17:\"audit_user_logout\";s:6:\"params\";a:1:{i:0;s:5:\"admin\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1574364437,'LOGOUT',1,'users'),(686,151,32,'GUI','string \'testCaseStatus_draft\' is not localized for locale \'ru_RU\'  - using en_GB',1574364437,'LOCALIZATION',0,NULL),(687,151,32,'GUI','string \'testCaseStatus_readyForReview\' is not localized for locale \'ru_RU\'  - using en_GB',1574364437,'LOCALIZATION',0,NULL),(688,151,32,'GUI','string \'testCaseStatus_reviewInProgress\' is not localized for locale \'ru_RU\'  - using en_GB',1574364437,'LOCALIZATION',0,NULL),(689,151,32,'GUI','string \'testCaseStatus_rework\' is not localized for locale \'ru_RU\'  - using en_GB',1574364437,'LOCALIZATION',0,NULL),(690,151,32,'GUI','string \'testCaseStatus_obsolete\' is not localized for locale \'ru_RU\'  - using en_GB',1574364437,'LOCALIZATION',0,NULL),(691,151,32,'GUI','string \'testCaseStatus_future\' is not localized for locale \'ru_RU\'  - using en_GB',1574364437,'LOCALIZATION',0,NULL),(692,151,32,'GUI','string \'testCaseStatus_final\' is not localized for locale \'ru_RU\'  - using en_GB',1574364437,'LOCALIZATION',0,NULL),(693,151,32,'GUI','string \'login\' is not localized for locale \'ru_RU\'  - using en_GB',1574364437,'LOCALIZATION',0,NULL),(694,151,32,'GUI','string \'demo_usage\' is not localized for locale \'ru_RU\'  - using en_GB',1574364437,'LOCALIZATION',0,NULL),(695,151,32,'GUI','string \'oauth_login\' is not localized for locale \'ru_RU\'  - using en_GB',1574364437,'LOCALIZATION',0,NULL),(696,152,32,'GUI','string \'unknown_authentication_method\' is not localized for locale \'ru_RU\'  - using en_GB',1574364448,'LOCALIZATION',0,NULL),(697,153,16,'GUI -  ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:21:\"audit_login_succeeded\";s:6:\"params\";a:2:{i:0;s:8:\"lolizz00\";i:1;s:12:\"192.168.67.1\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1574364448,'LOGIN',4,'users'),(698,154,32,'GUI -  ID : 1','string \'full_text_search\' is not localized for locale \'ru_RU\'  - using en_GB',1574364448,'LOCALIZATION',0,NULL),(699,155,32,'GUI -  ID : 1','string \'href_exec_ro_access\' is not localized for locale \'ru_RU\'  - using en_GB',1574364448,'LOCALIZATION',0,NULL),(700,155,32,'GUI -  ID : 1','string \'poweredBy\' is not localized for locale \'ru_RU\'  - using en_GB',1574364448,'LOCALIZATION',0,NULL),(701,155,32,'GUI -  ID : 1','string \'system_descr\' is not localized for locale \'ru_RU\'  - using en_GB',1574364448,'LOCALIZATION',0,NULL),(702,155,32,'GUI -  ID : 1','string \'system_config\' is not localized for locale \'ru_RU\'  - using en_GB',1574364448,'LOCALIZATION',0,NULL),(703,155,32,'GUI -  ID : 1','string \'link_report_test_cases_created_per_user\' is not localized for locale \'ru_RU\'  - using en_GB',1574364448,'LOCALIZATION',0,NULL),(704,155,32,'GUI -  ID : 1','string \'href_req_overview\' is not localized for locale \'ru_RU\'  - using en_GB',1574364448,'LOCALIZATION',0,NULL),(705,155,32,'GUI -  ID : 1','string \'href_print_req\' is not localized for locale \'ru_RU\'  - using en_GB',1574364448,'LOCALIZATION',0,NULL),(706,155,32,'GUI -  ID : 1','string \'title_documentation\' is not localized for locale \'ru_RU\'  - using en_GB',1574364448,'LOCALIZATION',0,NULL),(707,155,32,'GUI -  ID : 1','string \'href_issuetracker_management\' is not localized for locale \'ru_RU\'  - using en_GB',1574364448,'LOCALIZATION',0,NULL),(708,155,32,'GUI -  ID : 1','string \'href_codetracker_management\' is not localized for locale \'ru_RU\'  - using en_GB',1574364448,'LOCALIZATION',0,NULL),(709,155,32,'GUI -  ID : 1','string \'href_reqmgrsystem_management\' is not localized for locale \'ru_RU\'  - using en_GB',1574364448,'LOCALIZATION',0,NULL),(710,155,32,'GUI -  ID : 1','string \'href_req_monitor_overview\' is not localized for locale \'ru_RU\'  - using en_GB',1574364448,'LOCALIZATION',0,NULL),(711,156,2,'GUI -  ID : 1','E_WARNING\nsizeof(): Parameter must be an array or an object that implements Countable - in /srv/http/testlink/lib/functions/object.class.php - Line 590',1574364454,'PHP',0,NULL),(712,156,32,'GUI -  ID : 1','string \'demo_update_user_disabled\' is not localized for locale \'ru_RU\'  - using en_GB',1574364454,'LOCALIZATION',0,NULL),(713,156,2,'GUI -  ID : 1','E_WARNING\nA non-numeric value encountered - in /srv/http/testlink/locale/ja_JP/strings.txt - Line 2045',1574364454,'PHP',0,NULL),(714,156,2,'GUI -  ID : 1','E_WARNING\nA non-numeric value encountered - in /srv/http/testlink/locale/ja_JP/strings.txt - Line 2045',1574364454,'PHP',0,NULL),(715,156,2,'GUI -  ID : 1','E_WARNING\nA non-numeric value encountered - in /srv/http/testlink/locale/ja_JP/strings.txt - Line 2046',1574364454,'PHP',0,NULL),(716,156,2,'GUI -  ID : 1','E_WARNING\nA non-numeric value encountered - in /srv/http/testlink/locale/ja_JP/strings.txt - Line 2046',1574364454,'PHP',0,NULL),(717,156,2,'GUI -  ID : 1','E_WARNING\nA non-numeric value encountered - in /srv/http/testlink/locale/ja_JP/strings.txt - Line 2047',1574364454,'PHP',0,NULL),(718,156,2,'GUI -  ID : 1','E_WARNING\nA non-numeric value encountered - in /srv/http/testlink/locale/ja_JP/strings.txt - Line 2047',1574364454,'PHP',0,NULL),(719,156,2,'GUI -  ID : 1','E_WARNING\nA non-numeric value encountered - in /srv/http/testlink/locale/ja_JP/strings.txt - Line 3265',1574364454,'PHP',0,NULL),(720,156,2,'GUI -  ID : 1','E_WARNING\nA non-numeric value encountered - in /srv/http/testlink/locale/ja_JP/strings.txt - Line 3265',1574364454,'PHP',0,NULL),(721,157,16,'GUI -  ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:16:\"audit_user_saved\";s:6:\"params\";a:1:{i:0;s:8:\"lolizz00\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1574364463,'SAVE',4,'users'),(722,157,2,'GUI - Test Project ID : 1','E_WARNING\nsizeof(): Parameter must be an array or an object that implements Countable - in /srv/http/testlink/lib/functions/object.class.php - Line 590',1574364463,'PHP',0,NULL),(723,157,2,'GUI - Test Project ID : 1','E_WARNING\nA non-numeric value encountered - in /srv/http/testlink/locale/ja_JP/strings.txt - Line 2045',1574364463,'PHP',0,NULL),(724,157,2,'GUI - Test Project ID : 1','E_WARNING\nA non-numeric value encountered - in /srv/http/testlink/locale/ja_JP/strings.txt - Line 2045',1574364463,'PHP',0,NULL),(725,157,2,'GUI - Test Project ID : 1','E_WARNING\nA non-numeric value encountered - in /srv/http/testlink/locale/ja_JP/strings.txt - Line 2046',1574364463,'PHP',0,NULL),(726,157,2,'GUI - Test Project ID : 1','E_WARNING\nA non-numeric value encountered - in /srv/http/testlink/locale/ja_JP/strings.txt - Line 2046',1574364463,'PHP',0,NULL),(727,157,2,'GUI - Test Project ID : 1','E_WARNING\nA non-numeric value encountered - in /srv/http/testlink/locale/ja_JP/strings.txt - Line 2047',1574364463,'PHP',0,NULL),(728,157,2,'GUI - Test Project ID : 1','E_WARNING\nA non-numeric value encountered - in /srv/http/testlink/locale/ja_JP/strings.txt - Line 2047',1574364463,'PHP',0,NULL),(729,157,2,'GUI - Test Project ID : 1','E_WARNING\nA non-numeric value encountered - in /srv/http/testlink/locale/ja_JP/strings.txt - Line 3265',1574364463,'PHP',0,NULL),(730,157,2,'GUI - Test Project ID : 1','E_WARNING\nA non-numeric value encountered - in /srv/http/testlink/locale/ja_JP/strings.txt - Line 3265',1574364463,'PHP',0,NULL),(731,158,32,'GUI','string \'testCaseStatus_draft\' is not localized for locale \'ru_RU\'  - using en_GB',1574364521,'LOCALIZATION',0,NULL),(732,158,32,'GUI','string \'testCaseStatus_readyForReview\' is not localized for locale \'ru_RU\'  - using en_GB',1574364521,'LOCALIZATION',0,NULL),(733,158,32,'GUI','string \'testCaseStatus_reviewInProgress\' is not localized for locale \'ru_RU\'  - using en_GB',1574364521,'LOCALIZATION',0,NULL),(734,158,32,'GUI','string \'testCaseStatus_rework\' is not localized for locale \'ru_RU\'  - using en_GB',1574364521,'LOCALIZATION',0,NULL),(735,158,32,'GUI','string \'testCaseStatus_obsolete\' is not localized for locale \'ru_RU\'  - using en_GB',1574364521,'LOCALIZATION',0,NULL),(736,158,32,'GUI','string \'testCaseStatus_future\' is not localized for locale \'ru_RU\'  - using en_GB',1574364521,'LOCALIZATION',0,NULL),(737,158,32,'GUI','string \'testCaseStatus_final\' is not localized for locale \'ru_RU\'  - using en_GB',1574364521,'LOCALIZATION',0,NULL),(738,158,32,'GUI','string \'login\' is not localized for locale \'ru_RU\'  - using en_GB',1574364521,'LOCALIZATION',0,NULL),(739,158,32,'GUI','string \'demo_usage\' is not localized for locale \'ru_RU\'  - using en_GB',1574364521,'LOCALIZATION',0,NULL),(740,158,32,'GUI','string \'oauth_login\' is not localized for locale \'ru_RU\'  - using en_GB',1574364521,'LOCALIZATION',0,NULL),(741,159,32,'GUI','string \'testCaseStatus_draft\' is not localized for locale \'ru_RU\'  - using en_GB',1574366520,'LOCALIZATION',0,NULL),(742,159,32,'GUI','string \'testCaseStatus_readyForReview\' is not localized for locale \'ru_RU\'  - using en_GB',1574366520,'LOCALIZATION',0,NULL),(743,159,32,'GUI','string \'testCaseStatus_reviewInProgress\' is not localized for locale \'ru_RU\'  - using en_GB',1574366520,'LOCALIZATION',0,NULL),(744,159,32,'GUI','string \'testCaseStatus_rework\' is not localized for locale \'ru_RU\'  - using en_GB',1574366520,'LOCALIZATION',0,NULL),(745,159,32,'GUI','string \'testCaseStatus_obsolete\' is not localized for locale \'ru_RU\'  - using en_GB',1574366520,'LOCALIZATION',0,NULL),(746,159,32,'GUI','string \'testCaseStatus_future\' is not localized for locale \'ru_RU\'  - using en_GB',1574366520,'LOCALIZATION',0,NULL),(747,159,32,'GUI','string \'testCaseStatus_final\' is not localized for locale \'ru_RU\'  - using en_GB',1574366520,'LOCALIZATION',0,NULL),(748,159,32,'GUI','string \'login\' is not localized for locale \'ru_RU\'  - using en_GB',1574366520,'LOCALIZATION',0,NULL),(749,159,32,'GUI','string \'demo_usage\' is not localized for locale \'ru_RU\'  - using en_GB',1574366520,'LOCALIZATION',0,NULL),(750,159,32,'GUI','string \'oauth_login\' is not localized for locale \'ru_RU\'  - using en_GB',1574366520,'LOCALIZATION',0,NULL),(751,160,32,'GUI','string \'unknown_authentication_method\' is not localized for locale \'ru_RU\'  - using en_GB',1574366523,'LOCALIZATION',0,NULL),(752,161,16,'GUI - Test Project ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:21:\"audit_login_succeeded\";s:6:\"params\";a:2:{i:0;s:8:\"lolizz00\";i:1;s:12:\"192.168.67.1\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1574366523,'LOGIN',4,'users'),(753,162,32,'GUI - Test Project ID : 1','string \'poweredBy\' is not localized for locale \'en_US\'  - using en_GB',1574366523,'LOCALIZATION',0,NULL),(754,162,32,'GUI - Test Project ID : 1','string \'system_descr\' is not localized for locale \'en_US\'  - using en_GB',1574366523,'LOCALIZATION',0,NULL),(755,162,32,'GUI - Test Project ID : 1','string \'href_codetracker_management\' is not localized for locale \'en_US\'  - using en_GB',1574366523,'LOCALIZATION',0,NULL),(756,163,16,'GUI - Test Project ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:21:\"audit_login_succeeded\";s:6:\"params\";a:2:{i:0;s:8:\"lolizz00\";i:1;s:9:\"127.0.0.1\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1574366886,'LOGIN',4,'users'),(757,164,32,'GUI - Test Project ID : 1','string \'poweredBy\' is not localized for locale \'en_US\'  - using en_GB',1574366887,'LOCALIZATION',0,NULL),(758,164,32,'GUI - Test Project ID : 1','string \'system_descr\' is not localized for locale \'en_US\'  - using en_GB',1574366887,'LOCALIZATION',0,NULL),(759,164,32,'GUI - Test Project ID : 1','string \'href_codetracker_management\' is not localized for locale \'en_US\'  - using en_GB',1574366887,'LOCALIZATION',0,NULL),(760,165,16,'GUI - Test Project ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:21:\"audit_login_succeeded\";s:6:\"params\";a:2:{i:0;s:8:\"lolizz00\";i:1;s:9:\"127.0.0.1\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1574367636,'LOGIN',4,'users'),(761,166,32,'GUI - Test Project ID : 1','string \'poweredBy\' is not localized for locale \'en_US\'  - using en_GB',1574367637,'LOCALIZATION',0,NULL),(762,166,32,'GUI - Test Project ID : 1','string \'system_descr\' is not localized for locale \'en_US\'  - using en_GB',1574367637,'LOCALIZATION',0,NULL),(763,166,32,'GUI - Test Project ID : 1','string \'href_codetracker_management\' is not localized for locale \'en_US\'  - using en_GB',1574367637,'LOCALIZATION',0,NULL),(764,167,2,'GUI - Test Project ID : 1','E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /srv/http/testlink/gui/templates_c/ed021c5e3d51679ef7cde897006f57826b9b01fb_0.file.planView.tpl.php - Line 87',1574367913,'PHP',0,NULL),(765,168,32,'GUI - Test Project ID : 1','string \'title_issuetracker_mgmt\' is not localized for locale \'en_US\'  - using en_GB',1574367922,'LOCALIZATION',0,NULL),(766,169,1,'GUI - Test Project ID : 1','youtrackrestInterface::connectError for \'/user/login\': 404',1574368025,NULL,0,NULL),(767,170,1,'GUI - Test Project ID : 1','youtrackrestInterface::connectError for \'/user/login\': 404',1574368067,NULL,0,NULL),(768,171,1,'GUI - Test Project ID : 1','youtrackrestInterface::connectError for \'/user/login\': 404',1574368088,NULL,0,NULL),(769,172,1,'GUI - Test Project ID : 1','youtrackrestInterface::connectError for \'/user/login\': 404',1574368089,NULL,0,NULL),(770,173,1,'GUI - Test Project ID : 1','youtrackrestInterface::connectError for \'/user/login\': 404',1574368119,NULL,0,NULL),(771,174,1,'GUI - Test Project ID : 1','youtrackrestInterface::connectError for \'/user/login\': 404',1574368120,NULL,0,NULL),(772,175,1,'GUI - Test Project ID : 1','youtrackrestInterface::connectError for \'/user/login\': 404',1574368121,NULL,0,NULL),(773,176,1,'GUI - Test Project ID : 1','youtrackrestInterface::connectError for \'/user/login\': 404',1574368121,NULL,0,NULL),(774,177,1,'GUI - Test Project ID : 1','youtrackrestInterface::connectError for \'/user/login\': 404',1574368141,NULL,0,NULL),(775,178,1,'GUI - Test Project ID : 1','youtrackrestInterface::connectError for \'/user/login\': 404',1574368142,NULL,0,NULL),(776,179,1,'GUI - Test Project ID : 1','youtrackrestInterface::connectError for \'/user/login\': 404',1574368156,NULL,0,NULL),(777,180,1,'GUI - Test Project ID : 1','youtrackrestInterface::connectError for \'/user/login\': 404',1574368157,NULL,0,NULL),(778,181,1,'GUI - Test Project ID : 1','youtrackrestInterface::connectError for \'/user/login\': 404',1574368176,NULL,0,NULL),(779,182,1,'GUI - Test Project ID : 1','youtrackrestInterface::connectError for \'/user/login\': 404',1574368240,NULL,0,NULL),(780,183,1,'GUI - Test Project ID : 1','youtrackrestInterface::connectError for \'/user/login\': 404',1574368241,NULL,0,NULL),(781,184,1,'GUI - Test Project ID : 1','youtrackrestInterface::connectError for \'/user/login\': 404',1574368259,NULL,0,NULL),(782,185,32,'GUI - Test Project ID : 1','string \'th_codetracker\' is not localized for locale \'en_US\'  - using en_GB',1574369128,'LOCALIZATION',0,NULL),(783,186,16,'GUI - Test Project ID : 1','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:40:\"audit_all_user_roles_removed_testproject\";s:6:\"params\";a:1:{i:0;s:4:\"TEST\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1574369131,'ASSIGN',1,'testprojects'),(784,186,16,'GUI','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:25:\"audit_testproject_deleted\";s:6:\"params\";a:1:{i:0;s:4:\"TEST\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1574369131,'DELETE',1,'testprojects'),(785,186,2,'GUI','E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /srv/http/testlink/lib/project/projectEdit.php - Line 132',1574369131,'PHP',0,NULL),(786,186,2,'GUI','E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /srv/http/testlink/lib/project/projectEdit.php - Line 140',1574369131,'PHP',0,NULL),(787,186,2,'GUI','E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /srv/http/testlink/lib/project/projectEdit.php - Line 156',1574369131,'PHP',0,NULL),(788,186,2,'GUI','E_WARNING\ncount(): Parameter must be an array or an object that implements Countable - in /srv/http/testlink/lib/project/projectEdit.php - Line 172',1574369131,'PHP',0,NULL),(789,187,32,'GUI','string \'testproject_code_tracker_integration\' is not localized for locale \'en_US\'  - using en_GB',1574372270,'LOCALIZATION',0,NULL),(790,187,32,'GUI','string \'code_tracker\' is not localized for locale \'en_US\'  - using en_GB',1574372270,'LOCALIZATION',0,NULL),(791,187,32,'GUI','string \'no_codetracker_defined\' is not localized for locale \'en_US\'  - using en_GB',1574372270,'LOCALIZATION',0,NULL),(792,188,16,'GUI - Test Project ID : 3','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:25:\"audit_testproject_created\";s:6:\"params\";a:1:{i:0;s:3:\"SWB\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1574372324,'CREATE',3,'testprojects'),(793,189,16,'GUI - Test Project ID : 3','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:22:\"audit_req_spec_created\";s:6:\"params\";a:2:{i:0;s:3:\"SWB\";i:1;s:35:\"Работа с веб-мордой\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1574372378,'CREATE',4,'req_specs'),(794,190,16,'GUI - Test Project ID : 3','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:22:\"audit_req_spec_created\";s:6:\"params\";a:2:{i:0;s:3:\"SWB\";i:1;s:32:\"Работа с Утилитой\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1574372407,'CREATE',6,'req_specs'),(795,191,16,'GUI - Test Project ID : 3','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:22:\"audit_req_spec_created\";s:6:\"params\";a:2:{i:0;s:3:\"SWB\";i:1;s:20:\"USB терминал\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1574372488,'CREATE',9,'req_specs'),(796,192,16,'GUI - Test Project ID : 3','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:25:\"audit_requirement_created\";s:6:\"params\";a:1:{i:0;s:11:\"SWB-REQ-1-1\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1574372591,'CREATE',11,'requirements'),(797,193,32,'GUI - Test Project ID : 3','string \'img_title_relation_frozen\' is not localized for locale \'en_US\'  - using en_GB',1574372591,'LOCALIZATION',0,NULL),(798,193,32,'GUI - Test Project ID : 3','string \'obsolete\' is not localized for locale \'en_US\'  - using en_GB',1574372591,'LOCALIZATION',0,NULL),(799,194,16,'GUI - Test Project ID : 3','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:25:\"audit_requirement_deleted\";s:6:\"params\";a:1:{i:0;s:11:\"SWB-REQ-1-1\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1574372600,'DELETE',11,'requirements'),(800,195,16,'GUI - Test Project ID : 3','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:22:\"audit_req_spec_created\";s:6:\"params\";a:2:{i:0;s:3:\"SWB\";i:1;s:27:\"Утилита для Linux\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1574372631,'CREATE',13,'req_specs'),(801,196,32,'GUI','string \'testCaseStatus_draft\' is not localized for locale \'ru_RU\'  - using en_GB',1574372985,'LOCALIZATION',0,NULL),(802,196,32,'GUI','string \'testCaseStatus_readyForReview\' is not localized for locale \'ru_RU\'  - using en_GB',1574372985,'LOCALIZATION',0,NULL),(803,196,32,'GUI','string \'testCaseStatus_reviewInProgress\' is not localized for locale \'ru_RU\'  - using en_GB',1574372985,'LOCALIZATION',0,NULL),(804,196,32,'GUI','string \'testCaseStatus_rework\' is not localized for locale \'ru_RU\'  - using en_GB',1574372985,'LOCALIZATION',0,NULL),(805,196,32,'GUI','string \'testCaseStatus_obsolete\' is not localized for locale \'ru_RU\'  - using en_GB',1574372985,'LOCALIZATION',0,NULL),(806,196,32,'GUI','string \'testCaseStatus_future\' is not localized for locale \'ru_RU\'  - using en_GB',1574372985,'LOCALIZATION',0,NULL),(807,196,32,'GUI','string \'testCaseStatus_final\' is not localized for locale \'ru_RU\'  - using en_GB',1574372985,'LOCALIZATION',0,NULL),(808,196,32,'GUI','string \'login\' is not localized for locale \'ru_RU\'  - using en_GB',1574372985,'LOCALIZATION',0,NULL),(809,196,32,'GUI','string \'demo_usage\' is not localized for locale \'ru_RU\'  - using en_GB',1574372985,'LOCALIZATION',0,NULL),(810,196,32,'GUI','string \'oauth_login\' is not localized for locale \'ru_RU\'  - using en_GB',1574372985,'LOCALIZATION',0,NULL),(811,197,32,'GUI','string \'unknown_authentication_method\' is not localized for locale \'ru_RU\'  - using en_GB',1574373275,'LOCALIZATION',0,NULL),(812,198,16,'GUI - Test Project ID : 3','O:18:\"tlMetaStringHelper\":4:{s:5:\"label\";s:21:\"audit_login_succeeded\";s:6:\"params\";a:2:{i:0;s:8:\"lolizz00\";i:1;s:12:\"192.168.67.1\";}s:13:\"bDontLocalize\";b:0;s:14:\"bDontFireEvent\";b:0;}',1574373275,'LOGIN',4,'users'),(813,199,32,'GUI - Test Project ID : 3','string \'poweredBy\' is not localized for locale \'en_US\'  - using en_GB',1574373275,'LOCALIZATION',0,NULL),(814,199,32,'GUI - Test Project ID : 3','string \'system_descr\' is not localized for locale \'en_US\'  - using en_GB',1574373275,'LOCALIZATION',0,NULL),(815,199,32,'GUI - Test Project ID : 3','string \'href_codetracker_management\' is not localized for locale \'en_US\'  - using en_GB',1574373275,'LOCALIZATION',0,NULL);
/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `execution_bugs`
--

DROP TABLE IF EXISTS `execution_bugs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `execution_bugs` (
  `execution_id` int(10) unsigned NOT NULL DEFAULT 0,
  `bug_id` varchar(64) NOT NULL DEFAULT '0',
  `tcstep_id` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`execution_id`,`bug_id`,`tcstep_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `execution_bugs`
--

LOCK TABLES `execution_bugs` WRITE;
/*!40000 ALTER TABLE `execution_bugs` DISABLE KEYS */;
/*!40000 ALTER TABLE `execution_bugs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `execution_tcsteps`
--

DROP TABLE IF EXISTS `execution_tcsteps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `execution_tcsteps` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `execution_id` int(10) unsigned NOT NULL DEFAULT 0,
  `tcstep_id` int(10) unsigned NOT NULL DEFAULT 0,
  `notes` text DEFAULT NULL,
  `status` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `execution_tcsteps_idx1` (`execution_id`,`tcstep_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `execution_tcsteps`
--

LOCK TABLES `execution_tcsteps` WRITE;
/*!40000 ALTER TABLE `execution_tcsteps` DISABLE KEYS */;
/*!40000 ALTER TABLE `execution_tcsteps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `executions`
--

DROP TABLE IF EXISTS `executions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `executions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `build_id` int(10) NOT NULL DEFAULT 0,
  `tester_id` int(10) unsigned DEFAULT NULL,
  `execution_ts` datetime DEFAULT NULL,
  `status` char(1) DEFAULT NULL,
  `testplan_id` int(10) unsigned NOT NULL DEFAULT 0,
  `tcversion_id` int(10) unsigned NOT NULL DEFAULT 0,
  `tcversion_number` smallint(5) unsigned NOT NULL DEFAULT 1,
  `platform_id` int(10) unsigned NOT NULL DEFAULT 0,
  `execution_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1 -> manual, 2 -> automated',
  `execution_duration` decimal(6,2) DEFAULT NULL COMMENT 'NULL will be considered as NO DATA Provided by user',
  `notes` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `executions_idx1` (`testplan_id`,`tcversion_id`,`platform_id`,`build_id`),
  KEY `executions_idx2` (`execution_type`),
  KEY `executions_idx3` (`tcversion_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `executions`
--

LOCK TABLES `executions` WRITE;
/*!40000 ALTER TABLE `executions` DISABLE KEYS */;
/*!40000 ALTER TABLE `executions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory`
--

DROP TABLE IF EXISTS `inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventory` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `testproject_id` int(10) unsigned NOT NULL,
  `owner_id` int(10) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `ipaddress` varchar(255) NOT NULL,
  `content` text DEFAULT NULL,
  `creation_ts` timestamp NOT NULL DEFAULT current_timestamp(),
  `modification_ts` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `inventory_idx1` (`testproject_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory`
--

LOCK TABLES `inventory` WRITE;
/*!40000 ALTER TABLE `inventory` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issuetrackers`
--

DROP TABLE IF EXISTS `issuetrackers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issuetrackers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `type` int(10) DEFAULT 0,
  `cfg` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `issuetrackers_uidx1` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issuetrackers`
--

LOCK TABLES `issuetrackers` WRITE;
/*!40000 ALTER TABLE `issuetrackers` DISABLE KEYS */;
/*!40000 ALTER TABLE `issuetrackers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `keywords`
--

DROP TABLE IF EXISTS `keywords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `keywords` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `keyword` varchar(100) NOT NULL DEFAULT '',
  `testproject_id` int(10) unsigned NOT NULL DEFAULT 0,
  `notes` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `keyword_testproject_id` (`keyword`,`testproject_id`),
  KEY `testproject_id` (`testproject_id`),
  KEY `keyword` (`keyword`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `keywords`
--

LOCK TABLES `keywords` WRITE;
/*!40000 ALTER TABLE `keywords` DISABLE KEYS */;
/*!40000 ALTER TABLE `keywords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `latest_req_version`
--

DROP TABLE IF EXISTS `latest_req_version`;
/*!50001 DROP VIEW IF EXISTS `latest_req_version`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `latest_req_version` (
  `req_id` tinyint NOT NULL,
  `version` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `latest_req_version_id`
--

DROP TABLE IF EXISTS `latest_req_version_id`;
/*!50001 DROP VIEW IF EXISTS `latest_req_version_id`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `latest_req_version_id` (
  `req_id` tinyint NOT NULL,
  `version` tinyint NOT NULL,
  `req_version_id` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `latest_rspec_revision`
--

DROP TABLE IF EXISTS `latest_rspec_revision`;
/*!50001 DROP VIEW IF EXISTS `latest_rspec_revision`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `latest_rspec_revision` (
  `req_spec_id` tinyint NOT NULL,
  `testproject_id` tinyint NOT NULL,
  `revision` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `latest_tcase_version_id`
--

DROP TABLE IF EXISTS `latest_tcase_version_id`;
/*!50001 DROP VIEW IF EXISTS `latest_tcase_version_id`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `latest_tcase_version_id` (
  `testcase_id` tinyint NOT NULL,
  `version` tinyint NOT NULL,
  `tcversion_id` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `latest_tcase_version_number`
--

DROP TABLE IF EXISTS `latest_tcase_version_number`;
/*!50001 DROP VIEW IF EXISTS `latest_tcase_version_number`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `latest_tcase_version_number` (
  `testcase_id` tinyint NOT NULL,
  `version` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `milestones`
--

DROP TABLE IF EXISTS `milestones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `milestones` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `testplan_id` int(10) unsigned NOT NULL DEFAULT 0,
  `target_date` date DEFAULT NULL,
  `start_date` date NOT NULL,
  `a` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `b` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `c` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `name` varchar(100) NOT NULL DEFAULT 'undefined',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_testplan_id` (`name`,`testplan_id`),
  KEY `testplan_id` (`testplan_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `milestones`
--

LOCK TABLES `milestones` WRITE;
/*!40000 ALTER TABLE `milestones` DISABLE KEYS */;
/*!40000 ALTER TABLE `milestones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `node_types`
--

DROP TABLE IF EXISTS `node_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `node_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(100) NOT NULL DEFAULT 'testproject',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `node_types`
--

LOCK TABLES `node_types` WRITE;
/*!40000 ALTER TABLE `node_types` DISABLE KEYS */;
INSERT INTO `node_types` VALUES (1,'testproject'),(2,'testsuite'),(3,'testcase'),(4,'testcase_version'),(5,'testplan'),(6,'requirement_spec'),(7,'requirement'),(8,'requirement_version'),(9,'testcase_step'),(10,'requirement_revision'),(11,'requirement_spec_revision'),(12,'build'),(13,'platform'),(14,'user');
/*!40000 ALTER TABLE `node_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nodes_hierarchy`
--

DROP TABLE IF EXISTS `nodes_hierarchy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nodes_hierarchy` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `node_type_id` int(10) unsigned NOT NULL DEFAULT 1,
  `node_order` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pid_m_nodeorder` (`parent_id`,`node_order`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nodes_hierarchy`
--

LOCK TABLES `nodes_hierarchy` WRITE;
/*!40000 ALTER TABLE `nodes_hierarchy` DISABLE KEYS */;
INSERT INTO `nodes_hierarchy` VALUES (3,'SWB',NULL,1,1),(4,'Работа с веб-мордой',3,6,0),(5,'Работа с веб-мордой',4,11,0),(6,'Утилита',3,6,1),(7,'Работа с Утилитой',6,11,0),(8,'Утилита',6,11,0),(9,'USB терминал',3,6,2),(10,'USB терминал',9,11,0),(13,'Утилита для Linux',6,6,1),(14,'Утилита для Linux',13,11,0);
/*!40000 ALTER TABLE `nodes_hierarchy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `object_keywords`
--

DROP TABLE IF EXISTS `object_keywords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `object_keywords` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fk_id` int(10) unsigned NOT NULL DEFAULT 0,
  `fk_table` varchar(30) DEFAULT '',
  `keyword_id` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `udx01_object_keywords` (`fk_id`,`fk_table`,`keyword_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `object_keywords`
--

LOCK TABLES `object_keywords` WRITE;
/*!40000 ALTER TABLE `object_keywords` DISABLE KEYS */;
/*!40000 ALTER TABLE `object_keywords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `platforms`
--

DROP TABLE IF EXISTS `platforms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `platforms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `testproject_id` int(10) unsigned NOT NULL,
  `notes` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_platforms` (`testproject_id`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `platforms`
--

LOCK TABLES `platforms` WRITE;
/*!40000 ALTER TABLE `platforms` DISABLE KEYS */;
/*!40000 ALTER TABLE `platforms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugins`
--

DROP TABLE IF EXISTS `plugins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plugins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `basename` varchar(100) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 0,
  `author_id` int(10) unsigned DEFAULT NULL,
  `creation_ts` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugins`
--

LOCK TABLES `plugins` WRITE;
/*!40000 ALTER TABLE `plugins` DISABLE KEYS */;
/*!40000 ALTER TABLE `plugins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugins_configuration`
--

DROP TABLE IF EXISTS `plugins_configuration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plugins_configuration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `testproject_id` int(11) NOT NULL,
  `config_key` varchar(255) NOT NULL,
  `config_type` int(11) NOT NULL,
  `config_value` varchar(255) NOT NULL,
  `author_id` int(10) unsigned DEFAULT NULL,
  `creation_ts` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugins_configuration`
--

LOCK TABLES `plugins_configuration` WRITE;
/*!40000 ALTER TABLE `plugins_configuration` DISABLE KEYS */;
/*!40000 ALTER TABLE `plugins_configuration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `req_coverage`
--

DROP TABLE IF EXISTS `req_coverage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `req_coverage` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `req_id` int(10) NOT NULL,
  `req_version_id` int(10) NOT NULL,
  `testcase_id` int(10) NOT NULL,
  `tcversion_id` int(10) NOT NULL,
  `link_status` int(11) NOT NULL DEFAULT 1,
  `is_active` int(11) NOT NULL DEFAULT 1,
  `author_id` int(10) unsigned DEFAULT NULL,
  `creation_ts` timestamp NOT NULL DEFAULT current_timestamp(),
  `review_requester_id` int(10) unsigned DEFAULT NULL,
  `review_request_ts` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `req_coverage_full_link` (`req_id`,`req_version_id`,`testcase_id`,`tcversion_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='relation test case version ** requirement version';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `req_coverage`
--

LOCK TABLES `req_coverage` WRITE;
/*!40000 ALTER TABLE `req_coverage` DISABLE KEYS */;
/*!40000 ALTER TABLE `req_coverage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `req_monitor`
--

DROP TABLE IF EXISTS `req_monitor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `req_monitor` (
  `req_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `testproject_id` int(11) NOT NULL,
  PRIMARY KEY (`req_id`,`user_id`,`testproject_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `req_monitor`
--

LOCK TABLES `req_monitor` WRITE;
/*!40000 ALTER TABLE `req_monitor` DISABLE KEYS */;
/*!40000 ALTER TABLE `req_monitor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `req_relations`
--

DROP TABLE IF EXISTS `req_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `req_relations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `source_id` int(10) unsigned NOT NULL,
  `destination_id` int(10) unsigned NOT NULL,
  `relation_type` smallint(5) unsigned NOT NULL DEFAULT 1,
  `author_id` int(10) unsigned DEFAULT NULL,
  `creation_ts` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `req_relations`
--

LOCK TABLES `req_relations` WRITE;
/*!40000 ALTER TABLE `req_relations` DISABLE KEYS */;
/*!40000 ALTER TABLE `req_relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `req_revisions`
--

DROP TABLE IF EXISTS `req_revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `req_revisions` (
  `parent_id` int(10) unsigned NOT NULL,
  `id` int(10) unsigned NOT NULL,
  `revision` smallint(5) unsigned NOT NULL DEFAULT 1,
  `req_doc_id` varchar(64) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `scope` text DEFAULT NULL,
  `status` char(1) NOT NULL DEFAULT 'V',
  `type` char(1) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `is_open` tinyint(1) NOT NULL DEFAULT 1,
  `expected_coverage` int(10) NOT NULL DEFAULT 1,
  `log_message` text DEFAULT NULL,
  `author_id` int(10) unsigned DEFAULT NULL,
  `creation_ts` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifier_id` int(10) unsigned DEFAULT NULL,
  `modification_ts` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `req_revisions_uidx1` (`parent_id`,`revision`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `req_revisions`
--

LOCK TABLES `req_revisions` WRITE;
/*!40000 ALTER TABLE `req_revisions` DISABLE KEYS */;
/*!40000 ALTER TABLE `req_revisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `req_specs`
--

DROP TABLE IF EXISTS `req_specs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `req_specs` (
  `id` int(10) unsigned NOT NULL,
  `testproject_id` int(10) unsigned NOT NULL,
  `doc_id` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `req_spec_uk1` (`doc_id`,`testproject_id`),
  KEY `testproject_id` (`testproject_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Dev. Documents (e.g. System Requirements Specification)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `req_specs`
--

LOCK TABLES `req_specs` WRITE;
/*!40000 ALTER TABLE `req_specs` DISABLE KEYS */;
INSERT INTO `req_specs` VALUES (4,3,'SWB-REQ-0'),(6,3,'SWB-REQ-1'),(13,3,'SWB-REQ-1-0'),(9,3,'SWB-REQ-2');
/*!40000 ALTER TABLE `req_specs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `req_specs_revisions`
--

DROP TABLE IF EXISTS `req_specs_revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `req_specs_revisions` (
  `parent_id` int(10) unsigned NOT NULL,
  `id` int(10) unsigned NOT NULL,
  `revision` smallint(5) unsigned NOT NULL DEFAULT 1,
  `doc_id` varchar(64) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `scope` text DEFAULT NULL,
  `total_req` int(10) NOT NULL DEFAULT 0,
  `status` int(10) unsigned DEFAULT 1,
  `type` char(1) DEFAULT NULL,
  `log_message` text DEFAULT NULL,
  `author_id` int(10) unsigned DEFAULT NULL,
  `creation_ts` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifier_id` int(10) unsigned DEFAULT NULL,
  `modification_ts` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `req_specs_revisions_uidx1` (`parent_id`,`revision`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `req_specs_revisions`
--

LOCK TABLES `req_specs_revisions` WRITE;
/*!40000 ALTER TABLE `req_specs_revisions` DISABLE KEYS */;
INSERT INTO `req_specs_revisions` VALUES (4,5,1,'SWB-REQ-0','Работа с веб-мордой','',0,1,'1','Requirement Specification Created',4,'2019-11-21 21:39:38',NULL,'2019-11-21 21:39:38'),(6,7,1,'SWB-REQ-1','Работа с Утилитой','',0,1,'1','Requirement Specification Created',4,'2019-11-21 21:40:07',NULL,'2019-11-21 21:40:07'),(6,8,2,'SWB-REQ-1','Утилита','',0,1,'1','',4,'2019-11-21 21:41:02',NULL,'2019-11-21 21:41:02'),(9,10,1,'SWB-REQ-2','USB терминал','',0,1,'1','Requirement Specification Created',4,'2019-11-21 21:41:28',NULL,'2019-11-21 21:41:28'),(13,14,1,'SWB-REQ-1-0','Утилита для Linux','',0,1,'1','Requirement Specification Created',4,'2019-11-21 21:43:51',NULL,'2019-11-21 21:43:51');
/*!40000 ALTER TABLE `req_specs_revisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `req_versions`
--

DROP TABLE IF EXISTS `req_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `req_versions` (
  `id` int(10) unsigned NOT NULL,
  `version` smallint(5) unsigned NOT NULL DEFAULT 1,
  `revision` smallint(5) unsigned NOT NULL DEFAULT 1,
  `scope` text DEFAULT NULL,
  `status` char(1) NOT NULL DEFAULT 'V',
  `type` char(1) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `is_open` tinyint(1) NOT NULL DEFAULT 1,
  `expected_coverage` int(10) NOT NULL DEFAULT 1,
  `author_id` int(10) unsigned DEFAULT NULL,
  `creation_ts` timestamp NOT NULL DEFAULT current_timestamp(),
  `modifier_id` int(10) unsigned DEFAULT NULL,
  `modification_ts` datetime NOT NULL DEFAULT current_timestamp(),
  `log_message` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `req_versions`
--

LOCK TABLES `req_versions` WRITE;
/*!40000 ALTER TABLE `req_versions` DISABLE KEYS */;
/*!40000 ALTER TABLE `req_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reqmgrsystems`
--

DROP TABLE IF EXISTS `reqmgrsystems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reqmgrsystems` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `type` int(10) DEFAULT 0,
  `cfg` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `reqmgrsystems_uidx1` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reqmgrsystems`
--

LOCK TABLES `reqmgrsystems` WRITE;
/*!40000 ALTER TABLE `reqmgrsystems` DISABLE KEYS */;
/*!40000 ALTER TABLE `reqmgrsystems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `requirements`
--

DROP TABLE IF EXISTS `requirements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `requirements` (
  `id` int(10) unsigned NOT NULL,
  `srs_id` int(10) unsigned NOT NULL,
  `req_doc_id` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `requirements_req_doc_id` (`srs_id`,`req_doc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `requirements`
--

LOCK TABLES `requirements` WRITE;
/*!40000 ALTER TABLE `requirements` DISABLE KEYS */;
/*!40000 ALTER TABLE `requirements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rights`
--

DROP TABLE IF EXISTS `rights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rights` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `rights_descr` (`description`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rights`
--

LOCK TABLES `rights` WRITE;
/*!40000 ALTER TABLE `rights` DISABLE KEYS */;
INSERT INTO `rights` VALUES (53,'cfield_assignment'),(18,'cfield_management'),(17,'cfield_view'),(51,'codetracker_management'),(52,'codetracker_view'),(22,'events_mgt'),(54,'exec_assign_testcases'),(36,'exec_delete'),(35,'exec_edit_notes'),(49,'exec_ro_access'),(41,'exec_testcases_assigned_to_me'),(31,'issuetracker_management'),(32,'issuetracker_view'),(29,'keyword_assignment'),(9,'mgt_modify_key'),(12,'mgt_modify_product'),(11,'mgt_modify_req'),(7,'mgt_modify_tc'),(48,'mgt_plugins'),(16,'mgt_testplan_create'),(30,'mgt_unfreeze_req'),(13,'mgt_users'),(20,'mgt_view_events'),(8,'mgt_view_key'),(10,'mgt_view_req'),(6,'mgt_view_tc'),(21,'mgt_view_usergroups'),(50,'monitor_requirement'),(24,'platform_management'),(25,'platform_view'),(26,'project_inventory_management'),(27,'project_inventory_view'),(33,'reqmgrsystem_management'),(34,'reqmgrsystem_view'),(28,'req_tcase_link_management'),(14,'role_management'),(19,'system_configuration'),(47,'testcase_freeze'),(43,'testplan_add_remove_platforms'),(2,'testplan_create_build'),(1,'testplan_execute'),(3,'testplan_metrics'),(40,'testplan_milestone_overview'),(4,'testplan_planning'),(45,'testplan_set_urgent_testcases'),(46,'testplan_show_testcases_newest_versions'),(37,'testplan_unlink_executed_testcases'),(44,'testplan_update_linked_testcase_versions'),(5,'testplan_user_role_assignment'),(38,'testproject_delete_executed_testcases'),(39,'testproject_edit_executed_testcases'),(42,'testproject_metrics_dashboard'),(23,'testproject_user_role_assignment'),(15,'user_role_assignment');
/*!40000 ALTER TABLE `rights` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `risk_assignments`
--

DROP TABLE IF EXISTS `risk_assignments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `risk_assignments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `testplan_id` int(10) unsigned NOT NULL DEFAULT 0,
  `node_id` int(10) unsigned NOT NULL DEFAULT 0,
  `risk` char(1) NOT NULL DEFAULT '2',
  `importance` char(1) NOT NULL DEFAULT 'M',
  PRIMARY KEY (`id`),
  UNIQUE KEY `risk_assignments_tplan_node_id` (`testplan_id`,`node_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `risk_assignments`
--

LOCK TABLES `risk_assignments` WRITE;
/*!40000 ALTER TABLE `risk_assignments` DISABLE KEYS */;
/*!40000 ALTER TABLE `risk_assignments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_rights`
--

DROP TABLE IF EXISTS `role_rights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_rights` (
  `role_id` int(10) NOT NULL DEFAULT 0,
  `right_id` int(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (`role_id`,`right_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_rights`
--

LOCK TABLES `role_rights` WRITE;
/*!40000 ALTER TABLE `role_rights` DISABLE KEYS */;
INSERT INTO `role_rights` VALUES (4,3),(4,6),(4,7),(4,8),(4,9),(4,10),(4,11),(4,28),(4,29),(4,30),(4,50),(5,3),(5,6),(5,8),(6,1),(6,2),(6,3),(6,6),(6,7),(6,8),(6,9),(6,11),(6,25),(6,27),(6,28),(6,29),(6,30),(6,50),(7,1),(7,3),(7,6),(7,8),(8,1),(8,2),(8,3),(8,4),(8,5),(8,6),(8,7),(8,8),(8,9),(8,10),(8,11),(8,12),(8,13),(8,14),(8,15),(8,16),(8,17),(8,18),(8,19),(8,20),(8,21),(8,22),(8,23),(8,24),(8,25),(8,26),(8,27),(8,28),(8,29),(8,30),(8,31),(8,32),(8,33),(8,34),(8,35),(8,36),(8,37),(8,38),(8,39),(8,40),(8,41),(8,42),(8,43),(8,44),(8,45),(8,46),(8,47),(8,48),(8,50),(8,51),(8,52),(8,53),(8,54),(9,1),(9,2),(9,3),(9,4),(9,5),(9,6),(9,7),(9,8),(9,9),(9,10),(9,11),(9,15),(9,16),(9,24),(9,25),(9,26),(9,27),(9,28),(9,29),(9,30),(9,47),(9,50);
/*!40000 ALTER TABLE `role_rights` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(100) NOT NULL DEFAULT '',
  `notes` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `role_rights_roles_descr` (`description`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'<reserved system role 1>',NULL),(2,'<reserved system role 2>',NULL),(3,'<no rights>',NULL),(4,'test designer',NULL),(5,'guest',NULL),(6,'senior tester',NULL),(7,'tester',NULL),(8,'admin',NULL),(9,'leader',NULL);
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tcsteps`
--

DROP TABLE IF EXISTS `tcsteps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tcsteps` (
  `id` int(10) unsigned NOT NULL,
  `step_number` int(11) NOT NULL DEFAULT 1,
  `actions` text DEFAULT NULL,
  `expected_results` text DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `execution_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1 -> manual, 2 -> automated',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tcsteps`
--

LOCK TABLES `tcsteps` WRITE;
/*!40000 ALTER TABLE `tcsteps` DISABLE KEYS */;
/*!40000 ALTER TABLE `tcsteps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tcversions`
--

DROP TABLE IF EXISTS `tcversions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tcversions` (
  `id` int(10) unsigned NOT NULL,
  `tc_external_id` int(10) unsigned DEFAULT NULL,
  `version` smallint(5) unsigned NOT NULL DEFAULT 1,
  `layout` smallint(5) unsigned NOT NULL DEFAULT 1,
  `status` smallint(5) unsigned NOT NULL DEFAULT 1,
  `summary` text DEFAULT NULL,
  `preconditions` text DEFAULT NULL,
  `importance` smallint(5) unsigned NOT NULL DEFAULT 2,
  `author_id` int(10) unsigned DEFAULT NULL,
  `creation_ts` timestamp NOT NULL DEFAULT current_timestamp(),
  `updater_id` int(10) unsigned DEFAULT NULL,
  `modification_ts` datetime NOT NULL DEFAULT current_timestamp(),
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `is_open` tinyint(1) NOT NULL DEFAULT 1,
  `execution_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1 -> manual, 2 -> automated',
  `estimated_exec_duration` decimal(6,2) DEFAULT NULL COMMENT 'NULL will be considered as NO DATA Provided by user',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tcversions`
--

LOCK TABLES `tcversions` WRITE;
/*!40000 ALTER TABLE `tcversions` DISABLE KEYS */;
/*!40000 ALTER TABLE `tcversions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `tcversions_without_keywords`
--

DROP TABLE IF EXISTS `tcversions_without_keywords`;
/*!50001 DROP VIEW IF EXISTS `tcversions_without_keywords`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `tcversions_without_keywords` (
  `testcase_id` tinyint NOT NULL,
  `id` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `testcase_keywords`
--

DROP TABLE IF EXISTS `testcase_keywords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `testcase_keywords` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `testcase_id` int(10) unsigned NOT NULL DEFAULT 0,
  `tcversion_id` int(10) unsigned NOT NULL DEFAULT 0,
  `keyword_id` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx01_testcase_keywords` (`testcase_id`,`tcversion_id`,`keyword_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testcase_keywords`
--

LOCK TABLES `testcase_keywords` WRITE;
/*!40000 ALTER TABLE `testcase_keywords` DISABLE KEYS */;
/*!40000 ALTER TABLE `testcase_keywords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testcase_relations`
--

DROP TABLE IF EXISTS `testcase_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `testcase_relations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `source_id` int(10) unsigned NOT NULL,
  `destination_id` int(10) unsigned NOT NULL,
  `link_status` tinyint(1) NOT NULL DEFAULT 1,
  `relation_type` smallint(5) unsigned NOT NULL DEFAULT 1,
  `author_id` int(10) unsigned DEFAULT NULL,
  `creation_ts` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testcase_relations`
--

LOCK TABLES `testcase_relations` WRITE;
/*!40000 ALTER TABLE `testcase_relations` DISABLE KEYS */;
/*!40000 ALTER TABLE `testcase_relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testcase_script_links`
--

DROP TABLE IF EXISTS `testcase_script_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `testcase_script_links` (
  `tcversion_id` int(10) unsigned NOT NULL DEFAULT 0,
  `project_key` varchar(64) NOT NULL,
  `repository_name` varchar(64) NOT NULL,
  `code_path` varchar(255) NOT NULL,
  `branch_name` varchar(64) DEFAULT NULL,
  `commit_id` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`tcversion_id`,`project_key`,`repository_name`,`code_path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testcase_script_links`
--

LOCK TABLES `testcase_script_links` WRITE;
/*!40000 ALTER TABLE `testcase_script_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `testcase_script_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testplan_platforms`
--

DROP TABLE IF EXISTS `testplan_platforms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `testplan_platforms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `testplan_id` int(10) unsigned NOT NULL,
  `platform_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_testplan_platforms` (`testplan_id`,`platform_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Connects a testplan with platforms';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testplan_platforms`
--

LOCK TABLES `testplan_platforms` WRITE;
/*!40000 ALTER TABLE `testplan_platforms` DISABLE KEYS */;
/*!40000 ALTER TABLE `testplan_platforms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testplan_tcversions`
--

DROP TABLE IF EXISTS `testplan_tcversions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `testplan_tcversions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `testplan_id` int(10) unsigned NOT NULL DEFAULT 0,
  `tcversion_id` int(10) unsigned NOT NULL DEFAULT 0,
  `node_order` int(10) unsigned NOT NULL DEFAULT 1,
  `urgency` smallint(5) NOT NULL DEFAULT 2,
  `platform_id` int(10) unsigned NOT NULL DEFAULT 0,
  `author_id` int(10) unsigned DEFAULT NULL,
  `creation_ts` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `testplan_tcversions_tplan_tcversion` (`testplan_id`,`tcversion_id`,`platform_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testplan_tcversions`
--

LOCK TABLES `testplan_tcversions` WRITE;
/*!40000 ALTER TABLE `testplan_tcversions` DISABLE KEYS */;
/*!40000 ALTER TABLE `testplan_tcversions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testplans`
--

DROP TABLE IF EXISTS `testplans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `testplans` (
  `id` int(10) unsigned NOT NULL,
  `testproject_id` int(10) unsigned NOT NULL DEFAULT 0,
  `notes` text DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `is_open` tinyint(1) NOT NULL DEFAULT 1,
  `is_public` tinyint(1) NOT NULL DEFAULT 1,
  `api_key` varchar(64) NOT NULL DEFAULT '829a2ded3ed0829a2dedd8ab81dfa2c77e8235bc3ed0d8ab81dfa2c77e8235bc',
  PRIMARY KEY (`id`),
  UNIQUE KEY `testplans_api_key` (`api_key`),
  KEY `testplans_testproject_id_active` (`testproject_id`,`active`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testplans`
--

LOCK TABLES `testplans` WRITE;
/*!40000 ALTER TABLE `testplans` DISABLE KEYS */;
/*!40000 ALTER TABLE `testplans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testproject_codetracker`
--

DROP TABLE IF EXISTS `testproject_codetracker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `testproject_codetracker` (
  `testproject_id` int(10) unsigned NOT NULL,
  `codetracker_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`testproject_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testproject_codetracker`
--

LOCK TABLES `testproject_codetracker` WRITE;
/*!40000 ALTER TABLE `testproject_codetracker` DISABLE KEYS */;
/*!40000 ALTER TABLE `testproject_codetracker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testproject_issuetracker`
--

DROP TABLE IF EXISTS `testproject_issuetracker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `testproject_issuetracker` (
  `testproject_id` int(10) unsigned NOT NULL,
  `issuetracker_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`testproject_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testproject_issuetracker`
--

LOCK TABLES `testproject_issuetracker` WRITE;
/*!40000 ALTER TABLE `testproject_issuetracker` DISABLE KEYS */;
/*!40000 ALTER TABLE `testproject_issuetracker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testproject_reqmgrsystem`
--

DROP TABLE IF EXISTS `testproject_reqmgrsystem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `testproject_reqmgrsystem` (
  `testproject_id` int(10) unsigned NOT NULL,
  `reqmgrsystem_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`testproject_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testproject_reqmgrsystem`
--

LOCK TABLES `testproject_reqmgrsystem` WRITE;
/*!40000 ALTER TABLE `testproject_reqmgrsystem` DISABLE KEYS */;
/*!40000 ALTER TABLE `testproject_reqmgrsystem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testprojects`
--

DROP TABLE IF EXISTS `testprojects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `testprojects` (
  `id` int(10) unsigned NOT NULL,
  `notes` text DEFAULT NULL,
  `color` varchar(12) NOT NULL DEFAULT '#9BD',
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `option_reqs` tinyint(1) NOT NULL DEFAULT 0,
  `option_priority` tinyint(1) NOT NULL DEFAULT 0,
  `option_automation` tinyint(1) NOT NULL DEFAULT 0,
  `options` text DEFAULT NULL,
  `prefix` varchar(16) NOT NULL,
  `tc_counter` int(10) unsigned NOT NULL DEFAULT 0,
  `is_public` tinyint(1) NOT NULL DEFAULT 1,
  `issue_tracker_enabled` tinyint(1) NOT NULL DEFAULT 0,
  `code_tracker_enabled` tinyint(1) NOT NULL DEFAULT 0,
  `reqmgr_integration_enabled` tinyint(1) NOT NULL DEFAULT 0,
  `api_key` varchar(64) NOT NULL DEFAULT '0d8ab81dfa2c77e8235bc829a2ded3edfa2c78235bc829a27eded3ed0d8ab81d',
  PRIMARY KEY (`id`),
  UNIQUE KEY `testprojects_prefix` (`prefix`),
  UNIQUE KEY `testprojects_api_key` (`api_key`),
  KEY `testprojects_id_active` (`id`,`active`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testprojects`
--

LOCK TABLES `testprojects` WRITE;
/*!40000 ALTER TABLE `testprojects` DISABLE KEYS */;
INSERT INTO `testprojects` VALUES (3,'<p><strong>SWB-ящичек</strong></p>','',1,0,0,0,'O:8:\"stdClass\":4:{s:19:\"requirementsEnabled\";i:1;s:19:\"testPriorityEnabled\";i:1;s:17:\"automationEnabled\";i:1;s:16:\"inventoryEnabled\";i:0;}','SWB',0,1,0,0,0,'aec59732af40c25547afdfe8e4e8ce602bd48051ac34919dba0c00b168017822');
/*!40000 ALTER TABLE `testprojects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testsuites`
--

DROP TABLE IF EXISTS `testsuites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `testsuites` (
  `id` int(10) unsigned NOT NULL,
  `details` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testsuites`
--

LOCK TABLES `testsuites` WRITE;
/*!40000 ALTER TABLE `testsuites` DISABLE KEYS */;
/*!40000 ALTER TABLE `testsuites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `text_templates`
--

DROP TABLE IF EXISTS `text_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `text_templates` (
  `id` int(10) unsigned NOT NULL,
  `type` smallint(5) unsigned NOT NULL,
  `title` varchar(100) NOT NULL,
  `template_data` text DEFAULT NULL,
  `author_id` int(10) unsigned DEFAULT NULL,
  `creation_ts` timestamp NOT NULL DEFAULT current_timestamp(),
  `is_public` tinyint(1) NOT NULL DEFAULT 0,
  UNIQUE KEY `idx_text_templates` (`type`,`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Global Project Templates';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `text_templates`
--

LOCK TABLES `text_templates` WRITE;
/*!40000 ALTER TABLE `text_templates` DISABLE KEYS */;
/*!40000 ALTER TABLE `text_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transactions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entry_point` varchar(45) NOT NULL DEFAULT '',
  `start_time` int(10) unsigned NOT NULL DEFAULT 0,
  `end_time` int(10) unsigned NOT NULL DEFAULT 0,
  `user_id` int(10) unsigned NOT NULL DEFAULT 0,
  `session_id` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=200 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
INSERT INTO `transactions` VALUES (1,'/testlink/login.php',1572620978,1572620978,0,NULL),(2,'/testlink/firstLogin.php',1572620988,1572620988,0,NULL),(3,'/testlink/firstLogin.php',1572621005,1572621005,0,NULL),(4,'/testlink/login.php',1572621009,1572621009,0,NULL),(5,'/testlink/login.php',1572621009,1572621009,2,'3jq12dml3ape5i76ftkp783g4v'),(6,'/testlink/lib/general/navBar.php',1572621009,1572621009,2,'3jq12dml3ape5i76ftkp783g4v'),(7,'/testlink/lib/general/mainPage.php',1572621009,1572621009,2,'3jq12dml3ape5i76ftkp783g4v'),(8,'/testlink/lib/general/mainPage.php',1572621015,1572621015,2,'3jq12dml3ape5i76ftkp783g4v'),(9,'/testlink/lib/general/navBar.php',1572621015,1572621015,2,'3jq12dml3ape5i76ftkp783g4v'),(10,'/testlink/lib/general/navBar.php',1572621017,1572621017,2,'3jq12dml3ape5i76ftkp783g4v'),(11,'/testlink/lib/general/mainPage.php',1572621017,1572621017,2,'3jq12dml3ape5i76ftkp783g4v'),(12,'/testlink/lib/general/mainPage.php',1572621024,1572621024,2,'3jq12dml3ape5i76ftkp783g4v'),(13,'/testlink/lib/general/navBar.php',1572621024,1572621024,2,'3jq12dml3ape5i76ftkp783g4v'),(14,'/testlink/lib/general/mainPage.php',1572621025,1572621025,2,'3jq12dml3ape5i76ftkp783g4v'),(15,'/testlink/lib/general/navBar.php',1572621025,1572621025,2,'3jq12dml3ape5i76ftkp783g4v'),(16,'/testlink/lib/general/mainPage.php',1572621029,1572621029,2,'3jq12dml3ape5i76ftkp783g4v'),(17,'/testlink/lib/general/navBar.php',1572621029,1572621029,2,'3jq12dml3ape5i76ftkp783g4v'),(18,'/testlink/logout.php',1572621031,1572621031,2,'3jq12dml3ape5i76ftkp783g4v'),(19,'/testlink/login.php',1572621031,1572621031,0,NULL),(20,'/testlink/login.php',1572621050,1572621050,0,NULL),(21,'/testlink/login.php',1572621050,1572621050,2,'3jq12dml3ape5i76ftkp783g4v'),(22,'/testlink/lib/general/mainPage.php',1572621050,1572621050,2,'3jq12dml3ape5i76ftkp783g4v'),(23,'/testlink/lib/general/navBar.php',1572621050,1572621050,2,'3jq12dml3ape5i76ftkp783g4v'),(24,'/testlink/logout.php',1572621094,1572621094,2,'3jq12dml3ape5i76ftkp783g4v'),(25,'/testlink/login.php',1572621095,1572621095,0,NULL),(26,'/testlink/login.php',1572621099,1572621099,0,NULL),(27,'/testlink/login.php',1572621099,1572621099,1,'3jq12dml3ape5i76ftkp783g4v'),(28,'/testlink/lib/project/projectEdit.php',1572621120,1572621120,1,'3jq12dml3ape5i76ftkp783g4v'),(29,'/testlink/login.php',1572621900,1572621900,0,NULL),(30,'/testlink/login.php',1572621913,1572621913,0,NULL),(31,'/testlink/login.php',1572621913,1572621913,1,'3jq12dml3ape5i76ftkp783g4v'),(32,'/testlink/login.php',1572622500,1572622500,0,NULL),(33,'/testlink/login.php',1572622762,1572622762,0,NULL),(34,'/testlink/login.php',1574363705,1574363706,0,NULL),(35,'/testlink/login.php',1574363708,1574363708,0,NULL),(36,'/testlink/login.php',1574363708,1574363708,2,'qge3jvah5vj3k7v0l1427e7c4h'),(37,'/testlink/lib/general/mainPage.php',1574363709,1574363709,2,'qge3jvah5vj3k7v0l1427e7c4h'),(38,'/testlink/lib/general/navBar.php',1574363709,1574363709,2,'qge3jvah5vj3k7v0l1427e7c4h'),(39,'/testlink/lib/testcases/archiveData.php',1574363714,1574363714,2,'qge3jvah5vj3k7v0l1427e7c4h'),(40,'/testlink/lib/testcases/listTestCases.php',1574363714,1574363714,2,'qge3jvah5vj3k7v0l1427e7c4h'),(41,'/testlink/lib/general/navBar.php',1574363716,1574363716,2,'qge3jvah5vj3k7v0l1427e7c4h'),(42,'/testlink/lib/general/mainPage.php',1574363716,1574363716,2,'qge3jvah5vj3k7v0l1427e7c4h'),(43,'/testlink/lib/keywords/keywordsView.php',1574363718,1574363718,2,'qge3jvah5vj3k7v0l1427e7c4h'),(44,'/testlink/lib/general/navBar.php',1574363719,1574363719,2,'qge3jvah5vj3k7v0l1427e7c4h'),(45,'/testlink/lib/general/mainPage.php',1574363720,1574363720,2,'qge3jvah5vj3k7v0l1427e7c4h'),(46,'/testlink/lib/general/mainPage.php',1574363726,1574363726,2,'qge3jvah5vj3k7v0l1427e7c4h'),(47,'/testlink/lib/general/mainPage.php',1574363731,1574363731,2,'qge3jvah5vj3k7v0l1427e7c4h'),(48,'/testlink/lib/general/navBar.php',1574363731,1574363731,2,'qge3jvah5vj3k7v0l1427e7c4h'),(49,'/testlink/lib/general/navBar.php',1574363738,1574363738,2,'qge3jvah5vj3k7v0l1427e7c4h'),(50,'/testlink/lib/general/mainPage.php',1574363739,1574363739,2,'qge3jvah5vj3k7v0l1427e7c4h'),(51,'/testlink/lib/general/mainPage.php',1574363743,1574363743,2,'qge3jvah5vj3k7v0l1427e7c4h'),(52,'/testlink/lib/general/navBar.php',1574363743,1574363743,2,'qge3jvah5vj3k7v0l1427e7c4h'),(53,'/testlink/lib/general/mainPage.php',1574363747,1574363747,2,'qge3jvah5vj3k7v0l1427e7c4h'),(54,'/testlink/lib/general/mainPage.php',1574363749,1574363749,2,'qge3jvah5vj3k7v0l1427e7c4h'),(55,'/testlink/lib/general/navBar.php',1574363749,1574363749,2,'qge3jvah5vj3k7v0l1427e7c4h'),(56,'/testlink/lib/usermanagement/userInfo.php',1574363750,1574363751,2,'qge3jvah5vj3k7v0l1427e7c4h'),(57,'/testlink/lib/usermanagement/userInfo.php',1574363765,1574363765,2,'qge3jvah5vj3k7v0l1427e7c4h'),(58,'/testlink/lib/general/navBar.php',1574363765,1574363765,2,'qge3jvah5vj3k7v0l1427e7c4h'),(59,'/testlink/lib/general/navBar.php',1574363767,1574363767,2,'qge3jvah5vj3k7v0l1427e7c4h'),(60,'/testlink/lib/general/mainPage.php',1574363767,1574363767,2,'qge3jvah5vj3k7v0l1427e7c4h'),(61,'/testlink/lib/general/navBar.php',1574363777,1574363777,2,'qge3jvah5vj3k7v0l1427e7c4h'),(62,'/testlink/lib/general/mainPage.php',1574363777,1574363777,2,'qge3jvah5vj3k7v0l1427e7c4h'),(63,'/testlink/lib/usermanagement/userInfo.php',1574363792,1574363792,2,'qge3jvah5vj3k7v0l1427e7c4h'),(64,'/testlink/lib/search/searchMgmt.php',1574363798,1574363798,2,'qge3jvah5vj3k7v0l1427e7c4h'),(65,'/testlink/logout.php',1574363799,1574363799,2,'qge3jvah5vj3k7v0l1427e7c4h'),(66,'/testlink/login.php',1574363799,1574363799,0,NULL),(67,'/testlink/firstLogin.php',1574363800,1574363800,0,NULL),(68,'/testlink/firstLogin.php',1574363818,1574363818,0,NULL),(69,'/testlink/login.php',1574363823,1574363823,0,NULL),(70,'/testlink/login.php',1574363823,1574363823,3,'qge3jvah5vj3k7v0l1427e7c4h'),(71,'/testlink/lib/general/navBar.php',1574363823,1574363823,3,'qge3jvah5vj3k7v0l1427e7c4h'),(72,'/testlink/lib/general/mainPage.php',1574363823,1574363823,3,'qge3jvah5vj3k7v0l1427e7c4h'),(73,'/testlink/lib/general/mainPage.php',1574363829,1574363829,3,'qge3jvah5vj3k7v0l1427e7c4h'),(74,'/testlink/lib/general/navBar.php',1574363829,1574363829,3,'qge3jvah5vj3k7v0l1427e7c4h'),(75,'/testlink/logout.php',1574363833,1574363833,3,'qge3jvah5vj3k7v0l1427e7c4h'),(76,'/testlink/login.php',1574363833,1574363833,0,NULL),(77,'/testlink/login.php',1574363837,1574363837,0,NULL),(78,'/testlink/login.php',1574363837,1574363837,3,'qge3jvah5vj3k7v0l1427e7c4h'),(79,'/testlink/lib/general/navBar.php',1574363837,1574363837,3,'qge3jvah5vj3k7v0l1427e7c4h'),(80,'/testlink/lib/general/mainPage.php',1574363837,1574363837,3,'qge3jvah5vj3k7v0l1427e7c4h'),(81,'/testlink/lib/testcases/archiveData.php',1574363839,1574363839,3,'qge3jvah5vj3k7v0l1427e7c4h'),(82,'/testlink/lib/testcases/listTestCases.php',1574363839,1574363839,3,'qge3jvah5vj3k7v0l1427e7c4h'),(83,'/testlink/lib/usermanagement/userInfo.php',1574363868,1574363868,3,'qge3jvah5vj3k7v0l1427e7c4h'),(84,'/testlink/lib/general/mainPage.php',1574363876,1574363876,3,'qge3jvah5vj3k7v0l1427e7c4h'),(85,'/testlink/lib/general/navBar.php',1574363876,1574363876,3,'qge3jvah5vj3k7v0l1427e7c4h'),(86,'/testlink/lib/general/mainPage.php',1574363885,1574363885,3,'qge3jvah5vj3k7v0l1427e7c4h'),(87,'/testlink/lib/general/navBar.php',1574363885,1574363885,3,'qge3jvah5vj3k7v0l1427e7c4h'),(88,'/testlink/lib/usermanagement/userInfo.php',1574363887,1574363887,3,'qge3jvah5vj3k7v0l1427e7c4h'),(89,'/testlink/logout.php',1574363888,1574363888,3,'qge3jvah5vj3k7v0l1427e7c4h'),(90,'/testlink/login.php',1574363888,1574363888,0,NULL),(91,'/testlink/login.php',1574363890,1574363890,0,NULL),(92,'/testlink/login.php',1574363890,1574363890,1,'qge3jvah5vj3k7v0l1427e7c4h'),(93,'/testlink/lostPassword.php',1574363910,1574363910,1,'qge3jvah5vj3k7v0l1427e7c4h'),(94,'/testlink/login.php',1574363925,1574363925,0,NULL),(95,'/testlink/login.php',1574363934,1574363934,0,NULL),(96,'/testlink/login.php',1574363944,1574363944,0,NULL),(97,'/testlink/login.php',1574363952,1574363952,0,NULL),(98,'/testlink/login.php',1574363964,1574363964,0,NULL),(99,'/testlink/login.php',1574363967,1574363967,2,'9i1hkf0gq0ae8h430l4b8rep98'),(100,'/testlink/lib/general/mainPage.php',1574363967,1574363967,2,'9i1hkf0gq0ae8h430l4b8rep98'),(101,'/testlink/lib/general/navBar.php',1574363967,1574363967,2,'9i1hkf0gq0ae8h430l4b8rep98'),(102,'/testlink/lib/general/navBar.php',1574363971,1574363971,2,'9i1hkf0gq0ae8h430l4b8rep98'),(103,'/testlink/lib/general/mainPage.php',1574363971,1574363971,2,'9i1hkf0gq0ae8h430l4b8rep98'),(104,'/testlink/lib/keywords/keywordsView.php',1574363972,1574363972,2,'9i1hkf0gq0ae8h430l4b8rep98'),(105,'/testlink/lib/general/mainPage.php',1574363973,1574363973,2,'9i1hkf0gq0ae8h430l4b8rep98'),(106,'/testlink/lib/general/mainPage.php',1574363975,1574363975,2,'9i1hkf0gq0ae8h430l4b8rep98'),(107,'/testlink/login.php',1574363978,1574363978,2,'9i1hkf0gq0ae8h430l4b8rep98'),(108,'/testlink/logout.php',1574363990,1574363990,2,'9i1hkf0gq0ae8h430l4b8rep98'),(109,'/testlink/login.php',1574363990,1574363990,0,NULL),(110,'/testlink/login.php',1574363997,1574363997,0,NULL),(111,'/testlink/login.php',1574363997,1574363997,1,'9i1hkf0gq0ae8h430l4b8rep98'),(112,'/testlink/logout.php',1574364012,1574364012,1,'9i1hkf0gq0ae8h430l4b8rep98'),(113,'/testlink/login.php',1574364012,1574364012,0,NULL),(114,'/testlink/login.php',1574364016,1574364016,0,NULL),(115,'/testlink/login.php',1574364016,1574364016,1,'9i1hkf0gq0ae8h430l4b8rep98'),(116,'/testlink/lib/usermanagement/userInfo.php',1574364030,1574364030,1,'9i1hkf0gq0ae8h430l4b8rep98'),(117,'/testlink/lib/usermanagement/userInfo.php',1574364044,1574364044,1,'9i1hkf0gq0ae8h430l4b8rep98'),(118,'/testlink/lib/usermanagement/userInfo.php',1574364057,1574364057,1,'9i1hkf0gq0ae8h430l4b8rep98'),(119,'/testlink/lib/general/navBar.php',1574364058,1574364058,1,'9i1hkf0gq0ae8h430l4b8rep98'),(120,'/testlink/lib/general/mainPage.php',1574364061,1574364061,1,'9i1hkf0gq0ae8h430l4b8rep98'),(121,'/testlink/lib/usermanagement/userInfo.php',1574364074,1574364074,1,'9i1hkf0gq0ae8h430l4b8rep98'),(122,'/testlink/lib/usermanagement/userInfo.php',1574364084,1574364084,1,'9i1hkf0gq0ae8h430l4b8rep98'),(123,'/testlink/lib/usermanagement/usersView.php',1574364087,1574364087,1,'9i1hkf0gq0ae8h430l4b8rep98'),(124,'/testlink/lib/usermanagement/usersView.php',1574364094,1574364094,1,'9i1hkf0gq0ae8h430l4b8rep98'),(125,'/testlink/lib/usermanagement/usersView.php',1574364100,1574364100,1,'9i1hkf0gq0ae8h430l4b8rep98'),(126,'/testlink/lib/usermanagement/usersView.php',1574364116,1574364116,1,'9i1hkf0gq0ae8h430l4b8rep98'),(127,'/testlink/lib/usermanagement/usersView.php',1574364121,1574364121,1,'9i1hkf0gq0ae8h430l4b8rep98'),(128,'/testlink/lib/usermanagement/usersView.php',1574364132,1574364132,1,'9i1hkf0gq0ae8h430l4b8rep98'),(129,'/testlink/lib/usermanagement/usersEdit.php',1574364155,1574364156,1,'9i1hkf0gq0ae8h430l4b8rep98'),(130,'/testlink/logout.php',1574364165,1574364165,1,'9i1hkf0gq0ae8h430l4b8rep98'),(131,'/testlink/login.php',1574364165,1574364165,0,NULL),(132,'/testlink/login.php',1574364173,1574364173,0,NULL),(133,'/testlink/login.php',1574364183,1574364183,0,NULL),(134,'/testlink/login.php',1574364188,1574364188,1,'9i1hkf0gq0ae8h430l4b8rep98'),(135,'/testlink/lib/general/mainPage.php',1574364188,1574364188,1,'9i1hkf0gq0ae8h430l4b8rep98'),(136,'/testlink/login.php',1574364194,1574364194,1,'9i1hkf0gq0ae8h430l4b8rep98'),(137,'/testlink/login.php',1574364198,1574364198,1,'9i1hkf0gq0ae8h430l4b8rep98'),(138,'/testlink/login.php',1574364207,1574364207,1,'9i1hkf0gq0ae8h430l4b8rep98'),(139,'/testlink/logout.php',1574364215,1574364215,1,'9i1hkf0gq0ae8h430l4b8rep98'),(140,'/testlink/login.php',1574364215,1574364215,0,NULL),(141,'/testlink/login.php',1574364220,1574364220,0,NULL),(142,'/testlink/login.php',1574364220,1574364220,1,'9i1hkf0gq0ae8h430l4b8rep98'),(143,'/testlink/lib/general/mainPage.php',1574364220,1574364220,1,'9i1hkf0gq0ae8h430l4b8rep98'),(144,'/testlink/lib/usermanagement/userInfo.php',1574364222,1574364222,1,'9i1hkf0gq0ae8h430l4b8rep98'),(145,'/testlink/lib/usermanagement/usersView.php',1574364225,1574364225,1,'9i1hkf0gq0ae8h430l4b8rep98'),(146,'/testlink/lib/usermanagement/userInfo.php',1574364250,1574364250,1,'9i1hkf0gq0ae8h430l4b8rep98'),(147,'/testlink/lib/usermanagement/userInfo.php',1574364296,1574364296,1,'9i1hkf0gq0ae8h430l4b8rep98'),(148,'/testlink/lib/usermanagement/usersEdit.php',1574364413,1574364413,1,'9i1hkf0gq0ae8h430l4b8rep98'),(149,'/testlink/lib/usermanagement/userInfo.php',1574364436,1574364436,1,'9i1hkf0gq0ae8h430l4b8rep98'),(150,'/testlink/logout.php',1574364437,1574364437,1,'9i1hkf0gq0ae8h430l4b8rep98'),(151,'/testlink/login.php',1574364437,1574364437,0,NULL),(152,'/testlink/login.php',1574364448,1574364448,0,NULL),(153,'/testlink/login.php',1574364448,1574364448,4,'9i1hkf0gq0ae8h430l4b8rep98'),(154,'/testlink/lib/general/navBar.php',1574364448,1574364448,4,'9i1hkf0gq0ae8h430l4b8rep98'),(155,'/testlink/lib/general/mainPage.php',1574364448,1574364448,4,'9i1hkf0gq0ae8h430l4b8rep98'),(156,'/testlink/lib/usermanagement/userInfo.php',1574364454,1574364454,4,'9i1hkf0gq0ae8h430l4b8rep98'),(157,'/testlink/lib/usermanagement/userInfo.php',1574364463,1574364463,4,'9i1hkf0gq0ae8h430l4b8rep98'),(158,'/testlink/login.php',1574364521,1574364521,0,NULL),(159,'/testlink/login.php',1574366520,1574366520,0,NULL),(160,'/testlink/login.php',1574366523,1574366523,0,NULL),(161,'/testlink/login.php',1574366523,1574366523,4,'9i1hkf0gq0ae8h430l4b8rep98'),(162,'/testlink/lib/general/mainPage.php',1574366523,1574366523,4,'9i1hkf0gq0ae8h430l4b8rep98'),(163,'/testlink/login.php',1574366886,1574366886,4,'1tol1t7kjqpii1qg9eq7g6gop4'),(164,'/testlink/lib/general/mainPage.php',1574366887,1574366887,4,'1tol1t7kjqpii1qg9eq7g6gop4'),(165,'/testlink/login.php',1574367636,1574367636,4,'1tol1t7kjqpii1qg9eq7g6gop4'),(166,'/testlink/lib/general/mainPage.php',1574367637,1574367637,4,'1tol1t7kjqpii1qg9eq7g6gop4'),(167,'/testlink/lib/plan/planView.php',1574367913,1574367913,4,'1tol1t7kjqpii1qg9eq7g6gop4'),(168,'/lib/issuetrackers/issueTrackerView.php',1574367922,1574367922,4,'1tol1t7kjqpii1qg9eq7g6gop4'),(169,'/lib/issuetrackers/issueTrackerEdit.php',1574368025,1574368025,4,'1tol1t7kjqpii1qg9eq7g6gop4'),(170,'/lib/issuetrackers/issueTrackerEdit.php',1574368067,1574368067,4,'1tol1t7kjqpii1qg9eq7g6gop4'),(171,'/lib/issuetrackers/issueTrackerEdit.php',1574368088,1574368088,4,'1tol1t7kjqpii1qg9eq7g6gop4'),(172,'/lib/issuetrackers/issueTrackerEdit.php',1574368089,1574368089,4,'1tol1t7kjqpii1qg9eq7g6gop4'),(173,'/lib/issuetrackers/issueTrackerEdit.php',1574368119,1574368119,4,'1tol1t7kjqpii1qg9eq7g6gop4'),(174,'/lib/issuetrackers/issueTrackerEdit.php',1574368120,1574368120,4,'1tol1t7kjqpii1qg9eq7g6gop4'),(175,'/lib/issuetrackers/issueTrackerEdit.php',1574368121,1574368121,4,'1tol1t7kjqpii1qg9eq7g6gop4'),(176,'/lib/issuetrackers/issueTrackerEdit.php',1574368121,1574368121,4,'1tol1t7kjqpii1qg9eq7g6gop4'),(177,'/lib/issuetrackers/issueTrackerEdit.php',1574368141,1574368141,4,'1tol1t7kjqpii1qg9eq7g6gop4'),(178,'/lib/issuetrackers/issueTrackerEdit.php',1574368142,1574368142,4,'1tol1t7kjqpii1qg9eq7g6gop4'),(179,'/lib/issuetrackers/issueTrackerEdit.php',1574368156,1574368156,4,'1tol1t7kjqpii1qg9eq7g6gop4'),(180,'/lib/issuetrackers/issueTrackerEdit.php',1574368157,1574368157,4,'1tol1t7kjqpii1qg9eq7g6gop4'),(181,'/lib/issuetrackers/issueTrackerEdit.php',1574368176,1574368176,4,'1tol1t7kjqpii1qg9eq7g6gop4'),(182,'/lib/issuetrackers/issueTrackerEdit.php',1574368240,1574368240,4,'1tol1t7kjqpii1qg9eq7g6gop4'),(183,'/lib/issuetrackers/issueTrackerEdit.php',1574368241,1574368241,4,'1tol1t7kjqpii1qg9eq7g6gop4'),(184,'/lib/issuetrackers/issueTrackerEdit.php',1574368259,1574368259,4,'1tol1t7kjqpii1qg9eq7g6gop4'),(185,'/testlink/lib/project/projectView.php',1574369128,1574369128,4,'1tol1t7kjqpii1qg9eq7g6gop4'),(186,'/testlink/lib/project/projectEdit.php',1574369131,1574369131,4,'1tol1t7kjqpii1qg9eq7g6gop4'),(187,'/testlink/lib/project/projectEdit.php',1574372270,1574372270,4,'1tol1t7kjqpii1qg9eq7g6gop4'),(188,'/testlink/lib/project/projectEdit.php',1574372324,1574372324,4,'1tol1t7kjqpii1qg9eq7g6gop4'),(189,'/testlink/lib/requirements/reqSpecEdit.php',1574372378,1574372378,4,'1tol1t7kjqpii1qg9eq7g6gop4'),(190,'/testlink/lib/requirements/reqSpecEdit.php',1574372407,1574372407,4,'1tol1t7kjqpii1qg9eq7g6gop4'),(191,'/testlink/lib/requirements/reqSpecEdit.php',1574372488,1574372488,4,'1tol1t7kjqpii1qg9eq7g6gop4'),(192,'/testlink/lib/requirements/reqEdit.php',1574372591,1574372591,4,'1tol1t7kjqpii1qg9eq7g6gop4'),(193,'/testlink/lib/requirements/reqView.php',1574372591,1574372591,4,'1tol1t7kjqpii1qg9eq7g6gop4'),(194,'/testlink/lib/requirements/reqEdit.php',1574372600,1574372600,4,'1tol1t7kjqpii1qg9eq7g6gop4'),(195,'/testlink/lib/requirements/reqSpecEdit.php',1574372631,1574372631,4,'1tol1t7kjqpii1qg9eq7g6gop4'),(196,'/testlink/login.php',1574372985,1574372985,0,NULL),(197,'/testlink/login.php',1574373275,1574373275,0,NULL),(198,'/testlink/login.php',1574373275,1574373275,4,'qge3jvah5vj3k7v0l1427e7c4h'),(199,'/testlink/lib/general/mainPage.php',1574373275,1574373275,4,'qge3jvah5vj3k7v0l1427e7c4h');
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_assignments`
--

DROP TABLE IF EXISTS `user_assignments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_assignments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` int(10) unsigned NOT NULL DEFAULT 1,
  `feature_id` int(10) unsigned NOT NULL DEFAULT 0,
  `user_id` int(10) unsigned DEFAULT 0,
  `build_id` int(10) unsigned DEFAULT 0,
  `deadline_ts` datetime DEFAULT NULL,
  `assigner_id` int(10) unsigned DEFAULT 0,
  `creation_ts` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` int(10) unsigned DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `user_assignments_feature_id` (`feature_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_assignments`
--

LOCK TABLES `user_assignments` WRITE;
/*!40000 ALTER TABLE `user_assignments` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_assignments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_group`
--

DROP TABLE IF EXISTS `user_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_user_group` (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_group`
--

LOCK TABLES `user_group` WRITE;
/*!40000 ALTER TABLE `user_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_group_assign`
--

DROP TABLE IF EXISTS `user_group_assign`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_group_assign` (
  `usergroup_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  UNIQUE KEY `idx_user_group_assign` (`usergroup_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_group_assign`
--

LOCK TABLES `user_group_assign` WRITE;
/*!40000 ALTER TABLE `user_group_assign` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_group_assign` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_testplan_roles`
--

DROP TABLE IF EXISTS `user_testplan_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_testplan_roles` (
  `user_id` int(10) NOT NULL DEFAULT 0,
  `testplan_id` int(10) NOT NULL DEFAULT 0,
  `role_id` int(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (`user_id`,`testplan_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_testplan_roles`
--

LOCK TABLES `user_testplan_roles` WRITE;
/*!40000 ALTER TABLE `user_testplan_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_testplan_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_testproject_roles`
--

DROP TABLE IF EXISTS `user_testproject_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_testproject_roles` (
  `user_id` int(10) NOT NULL DEFAULT 0,
  `testproject_id` int(10) NOT NULL DEFAULT 0,
  `role_id` int(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (`user_id`,`testproject_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_testproject_roles`
--

LOCK TABLES `user_testproject_roles` WRITE;
/*!40000 ALTER TABLE `user_testproject_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_testproject_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `login` varchar(100) NOT NULL DEFAULT '',
  `password` varchar(32) NOT NULL DEFAULT '',
  `role_id` int(10) unsigned NOT NULL DEFAULT 0,
  `email` varchar(100) NOT NULL DEFAULT '',
  `first` varchar(50) NOT NULL DEFAULT '',
  `last` varchar(50) NOT NULL DEFAULT '',
  `locale` varchar(10) NOT NULL DEFAULT 'en_GB',
  `default_testproject_id` int(10) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `script_key` varchar(32) DEFAULT NULL,
  `cookie_string` varchar(64) NOT NULL DEFAULT '',
  `auth_method` varchar(10) DEFAULT '',
  `creation_ts` timestamp NOT NULL DEFAULT current_timestamp(),
  `expiration_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_login` (`login`),
  UNIQUE KEY `users_cookie_string` (`cookie_string`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='User information';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','21232f297a57a5a743894a0e4a801fc3',8,'timofei.volkov@mail.ru','Testlink','Administrator','en_US',NULL,1,NULL,'46661bc230693f291ef7504507beeecb21232f297a57a5a743894a0e4a801fc3','','2019-11-01 15:09:28',NULL),(4,'lolizz00','24f863cab19f8600b622ce1391431b4c',8,'timofei.volkov@mail.ru','Tim','Vol','en_US',NULL,1,NULL,'069045161b7cdd7534ad15d247f3e31b74c2f15c5a6eee03c44a3c59cbee5eb6','','2019-11-21 19:26:53',NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `latest_req_version`
--

/*!50001 DROP TABLE IF EXISTS `latest_req_version`*/;
/*!50001 DROP VIEW IF EXISTS `latest_req_version`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `latest_req_version` AS select `RQ`.`id` AS `req_id`,max(`RQV`.`version`) AS `version` from ((`nodes_hierarchy` `NHRQV` join `requirements` `RQ` on(`RQ`.`id` = `NHRQV`.`parent_id`)) join `req_versions` `RQV` on(`RQV`.`id` = `NHRQV`.`id`)) group by `RQ`.`id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `latest_req_version_id`
--

/*!50001 DROP TABLE IF EXISTS `latest_req_version_id`*/;
/*!50001 DROP VIEW IF EXISTS `latest_req_version_id`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `latest_req_version_id` AS select `LRQVN`.`req_id` AS `req_id`,`LRQVN`.`version` AS `version`,`REQV`.`id` AS `req_version_id` from ((`latest_req_version` `LRQVN` join `nodes_hierarchy` `NHRQV` on(`NHRQV`.`parent_id` = `LRQVN`.`req_id`)) join `req_versions` `REQV` on(`REQV`.`id` = `NHRQV`.`id` and `REQV`.`version` = `LRQVN`.`version`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `latest_rspec_revision`
--

/*!50001 DROP TABLE IF EXISTS `latest_rspec_revision`*/;
/*!50001 DROP VIEW IF EXISTS `latest_rspec_revision`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `latest_rspec_revision` AS select `RSR`.`parent_id` AS `req_spec_id`,`RS`.`testproject_id` AS `testproject_id`,max(`RSR`.`revision`) AS `revision` from (`req_specs_revisions` `RSR` join `req_specs` `RS` on(`RS`.`id` = `RSR`.`parent_id`)) group by `RSR`.`parent_id`,`RS`.`testproject_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `latest_tcase_version_id`
--

/*!50001 DROP TABLE IF EXISTS `latest_tcase_version_id`*/;
/*!50001 DROP VIEW IF EXISTS `latest_tcase_version_id`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `latest_tcase_version_id` AS select `LTCVN`.`testcase_id` AS `testcase_id`,`LTCVN`.`version` AS `version`,`TCV`.`id` AS `tcversion_id` from ((`latest_tcase_version_number` `LTCVN` join `nodes_hierarchy` `NHTCV` on(`NHTCV`.`parent_id` = `LTCVN`.`testcase_id`)) join `tcversions` `TCV` on(`TCV`.`id` = `NHTCV`.`id` and `TCV`.`version` = `LTCVN`.`version`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `latest_tcase_version_number`
--

/*!50001 DROP TABLE IF EXISTS `latest_tcase_version_number`*/;
/*!50001 DROP VIEW IF EXISTS `latest_tcase_version_number`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `latest_tcase_version_number` AS select `NH_TC`.`id` AS `testcase_id`,max(`TCV`.`version`) AS `version` from ((`nodes_hierarchy` `NH_TC` join `nodes_hierarchy` `NH_TCV` on(`NH_TCV`.`parent_id` = `NH_TC`.`id`)) join `tcversions` `TCV` on(`NH_TCV`.`id` = `TCV`.`id`)) group by `NH_TC`.`id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `tcversions_without_keywords`
--

/*!50001 DROP TABLE IF EXISTS `tcversions_without_keywords`*/;
/*!50001 DROP VIEW IF EXISTS `tcversions_without_keywords`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `tcversions_without_keywords` AS select `NHTCV`.`parent_id` AS `testcase_id`,`NHTCV`.`id` AS `id` from `nodes_hierarchy` `NHTCV` where `NHTCV`.`node_type_id` = 4 and !exists(select 1 from `testcase_keywords` `TCK` where `TCK`.`tcversion_id` = `NHTCV`.`id` limit 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-11-21 22:10:08
