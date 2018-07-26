-- MySQL dump 10.13  Distrib 5.7.21-20, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: kassa_test
-- ------------------------------------------------------
-- Server version	5.7.21-20

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
/*!50717 SELECT COUNT(*) INTO @rocksdb_has_p_s_session_variables FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'performance_schema' AND TABLE_NAME = 'session_variables' */;
/*!50717 SET @rocksdb_get_is_supported = IF (@rocksdb_has_p_s_session_variables, 'SELECT COUNT(*) INTO @rocksdb_is_supported FROM performance_schema.session_variables WHERE VARIABLE_NAME=\'rocksdb_bulk_load\'', 'SELECT 0') */;
/*!50717 PREPARE s FROM @rocksdb_get_is_supported */;
/*!50717 EXECUTE s */;
/*!50717 DEALLOCATE PREPARE s */;
/*!50717 SET @rocksdb_enable_bulk_load = IF (@rocksdb_is_supported, 'SET SESSION rocksdb_bulk_load = 1', 'SET @rocksdb_dummy_bulk_load = 0') */;
/*!50717 PREPARE s FROM @rocksdb_enable_bulk_load */;
/*!50717 EXECUTE s */;
/*!50717 DEALLOCATE PREPARE s */;

--
-- Table structure for table `ar_internal_metadata`
--

DROP TABLE IF EXISTS `ar_internal_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ar_internal_metadata` (
  `key` varchar(255) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ar_internal_metadata`
--

LOCK TABLES `ar_internal_metadata` WRITE;
/*!40000 ALTER TABLE `ar_internal_metadata` DISABLE KEYS */;
INSERT INTO `ar_internal_metadata` VALUES ('environment','test','2018-03-15 00:01:12','2018-03-15 00:01:12');
/*!40000 ALTER TABLE `ar_internal_metadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bannerData`
--

DROP TABLE IF EXISTS `bannerData`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bannerData` (
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `currency` int(11) NOT NULL,
  `value` double unsigned NOT NULL,
  `value2` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`date`,`currency`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bannerData`
--

LOCK TABLES `bannerData` WRITE;
/*!40000 ALTER TABLE `bannerData` DISABLE KEYS */;
/*!40000 ALTER TABLE `bannerData` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bitcoin_address`
--

DROP TABLE IF EXISTS `bitcoin_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bitcoin_address` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `address` varchar(34) NOT NULL DEFAULT '',
  `label` varchar(10) NOT NULL DEFAULT '',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `fg_select` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_deleted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bitcoin_address`
--

LOCK TABLES `bitcoin_address` WRITE;
/*!40000 ALTER TABLE `bitcoin_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `bitcoin_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bitcoin_txid`
--

DROP TABLE IF EXISTS `bitcoin_txid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bitcoin_txid` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_btcaddress` int(10) unsigned NOT NULL DEFAULT '0',
  `id_ticket` int(10) unsigned NOT NULL DEFAULT '0',
  `txid` varchar(65) NOT NULL DEFAULT '',
  `confir` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_confirm_done` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_txid_done` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_error` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `t` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_ticket` (`id_ticket`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bitcoin_txid`
--

LOCK TABLES `bitcoin_txid` WRITE;
/*!40000 ALTER TABLE `bitcoin_txid` DISABLE KEYS */;
/*!40000 ALTER TABLE `bitcoin_txid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cbr_external_rates`
--

DROP TABLE IF EXISTS `cbr_external_rates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cbr_external_rates` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `cur_from` varchar(255) NOT NULL,
  `cur_to` varchar(255) NOT NULL,
  `rate` float NOT NULL,
  `original_rate` float NOT NULL,
  `nominal` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_cbr_external_rates_on_cur_from_and_cur_to_and_date` (`cur_from`,`cur_to`,`date`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cbr_external_rates`
--

LOCK TABLES `cbr_external_rates` WRITE;
/*!40000 ALTER TABLE `cbr_external_rates` DISABLE KEYS */;
INSERT INTO `cbr_external_rates` VALUES (1,'2018-03-27','USD','RUB',57.0039,57.0039,1,'2018-03-15 00:01:12','2018-03-29 22:20:30'),(2,'2018-03-27','KZT','RUB',0.178447,17.8447,100,'2018-03-15 00:01:12','2018-03-29 22:20:30'),(3,'2018-03-28','USD','RUB',57.1747,57.1747,1,'2018-03-15 00:01:12','2018-03-29 22:20:30'),(4,'2018-03-28','KZT','RUB',0.179358,17.9358,100,'2018-03-15 00:01:12','2018-03-29 22:20:30');
/*!40000 ALTER TABLE `cbr_external_rates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_actions`
--

DROP TABLE IF EXISTS `cms_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_actions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `component` varchar(20) NOT NULL DEFAULT '',
  `name` varchar(20) NOT NULL DEFAULT '',
  `title` varchar(100) NOT NULL DEFAULT '',
  `message` varchar(255) NOT NULL DEFAULT '',
  `is_tracked` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0',
  `is_visible` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`,`is_visible`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_actions`
--

LOCK TABLES `cms_actions` WRITE;
/*!40000 ALTER TABLE `cms_actions` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_actions_log`
--

DROP TABLE IF EXISTS `cms_actions_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_actions_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `action_id` int(10) unsigned NOT NULL DEFAULT '0',
  `pubdate` datetime NOT NULL,
  `user_id` int(10) unsigned NOT NULL DEFAULT '1',
  `object` varchar(100) NOT NULL DEFAULT '',
  `object_url` varchar(255) NOT NULL DEFAULT '',
  `object_id` int(10) unsigned NOT NULL DEFAULT '0',
  `target` varchar(100) NOT NULL DEFAULT '',
  `target_url` varchar(255) NOT NULL DEFAULT '',
  `target_id` int(11) NOT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `is_friends_only` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_users_only` tinyint(1) NOT NULL DEFAULT '0',
  `t` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `action_id` (`action_id`,`user_id`),
  KEY `object_id` (`object_id`),
  KEY `target_id` (`target_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_actions_log`
--

LOCK TABLES `cms_actions_log` WRITE;
/*!40000 ALTER TABLE `cms_actions_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_actions_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_application`
--

DROP TABLE IF EXISTS `cms_application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_application` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `emoney` varchar(100) NOT NULL DEFAULT '',
  `id_user` int(10) unsigned NOT NULL DEFAULT '0',
  `id_operator` int(10) unsigned NOT NULL DEFAULT '0',
  `id_ps1` int(11) DEFAULT NULL,
  `id_ps2` int(11) DEFAULT NULL,
  `num_ps1` varchar(110) DEFAULT NULL,
  `num_ps2` varchar(110) DEFAULT NULL,
  `operation_date` datetime DEFAULT NULL,
  `process_date` datetime DEFAULT NULL,
  `amount_transfer` float DEFAULT NULL,
  `transfer_fee` float DEFAULT NULL,
  `income_corp` float DEFAULT NULL,
  `status1` int(11) NOT NULL DEFAULT '0',
  `status2` int(11) NOT NULL DEFAULT '0',
  `dollar_rate` float DEFAULT NULL,
  `id_ps_company` int(11) DEFAULT NULL,
  `cause_text` text,
  `notification` int(11) DEFAULT NULL,
  `comment` text NOT NULL,
  `text` text NOT NULL,
  `isreferaloutput` int(11) NOT NULL DEFAULT '0',
  `intr_tran_sum` float NOT NULL DEFAULT '0',
  `id_in_unixtime` bigint(20) unsigned NOT NULL,
  `fio_a` varchar(100) NOT NULL,
  `fio_b` varchar(100) NOT NULL,
  `unk_a` varchar(100) NOT NULL,
  `unk_b` varchar(100) NOT NULL,
  `check_number` text,
  `check_pin` varchar(200) NOT NULL DEFAULT '',
  `check_number_b` text,
  `check_pin_b` varchar(200) NOT NULL DEFAULT '',
  `new_user` int(11) NOT NULL DEFAULT '0',
  `emoney_id1` int(11) NOT NULL DEFAULT '0',
  `emoney_id2` int(11) NOT NULL DEFAULT '0',
  `comi_tran_sum` float NOT NULL DEFAULT '0',
  `is_senddata` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `emoney_b` text NOT NULL,
  `fraudster` int(10) unsigned DEFAULT NULL,
  `kurs` text NOT NULL,
  `id_store` int(10) unsigned NOT NULL DEFAULT '0',
  `product_data` text,
  `id_notif` int(11) NOT NULL DEFAULT '0',
  `id_transit` int(11) NOT NULL DEFAULT '0',
  `store_type_cy` int(11) NOT NULL DEFAULT '0',
  `bank_b` varchar(40) NOT NULL DEFAULT '',
  `store_paytype` tinyint(1) unsigned DEFAULT NULL,
  `id_telegram` bigint(20) unsigned DEFAULT NULL,
  `eids` varchar(30) DEFAULT NULL,
  `direction_rate_id` bigint(20) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `outcome_amount` double DEFAULT NULL,
  `direction_rates_id` bigint(20) DEFAULT NULL,
  `metadata` json DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_cms_application_on_direction_rate_id` (`direction_rate_id`),
  KEY `index_cms_application_on_direction_rates_id` (`direction_rates_id`),
  KEY `id_in_unixtime` (`id_in_unixtime`),
  KEY `id_notif` (`id_notif`),
  KEY `id_ps1` (`id_ps1`),
  KEY `fk_rails_771f714223` (`id_ps2`),
  KEY `fk_rails_1786b5b50c` (`id_ps_company`),
  KEY `id_user` (`id_user`),
  KEY `process_date` (`process_date`),
  KEY `status1` (`status1`),
  CONSTRAINT `fk_rails_1786b5b50c` FOREIGN KEY (`id_ps_company`) REFERENCES `cms_paymant_system` (`id`),
  CONSTRAINT `fk_rails_1f54e5a2b6` FOREIGN KEY (`id_ps1`) REFERENCES `cms_paymant_system` (`id`),
  CONSTRAINT `fk_rails_771f714223` FOREIGN KEY (`id_ps2`) REFERENCES `cms_paymant_system` (`id`),
  CONSTRAINT `fk_rails_85a392209e` FOREIGN KEY (`direction_rate_id`) REFERENCES `direction_rates` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_application`
--

LOCK TABLES `cms_application` WRITE;
/*!40000 ALTER TABLE `cms_application` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_application` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_banlist`
--

DROP TABLE IF EXISTS `cms_banlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_banlist` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '1',
  `ip` varchar(15) NOT NULL DEFAULT '',
  `bandate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `int_num` int(10) unsigned NOT NULL DEFAULT '0',
  `int_period` varchar(20) NOT NULL DEFAULT '',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `autodelete` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `cause` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ip` (`ip`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_banlist`
--

LOCK TABLES `cms_banlist` WRITE;
/*!40000 ALTER TABLE `cms_banlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_banlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_banner_hits`
--

DROP TABLE IF EXISTS `cms_banner_hits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_banner_hits` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `banner_id` int(10) unsigned NOT NULL DEFAULT '1',
  `ip` varchar(15) NOT NULL DEFAULT '',
  `pubdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ip` (`ip`,`banner_id`),
  KEY `banner_id` (`banner_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_banner_hits`
--

LOCK TABLES `cms_banner_hits` WRITE;
/*!40000 ALTER TABLE `cms_banner_hits` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_banner_hits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_banners`
--

DROP TABLE IF EXISTS `cms_banners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_banners` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `position` varchar(100) NOT NULL DEFAULT 'banner_top',
  `typeimg` varchar(10) NOT NULL DEFAULT 'image',
  `fileurl` varchar(250) DEFAULT NULL,
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `clicks` int(10) unsigned NOT NULL DEFAULT '0',
  `maxhits` int(10) unsigned NOT NULL DEFAULT '0',
  `maxuser` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id` int(10) unsigned NOT NULL DEFAULT '1',
  `pubdate` datetime DEFAULT NULL,
  `title` varchar(250) DEFAULT NULL,
  `link` varchar(250) DEFAULT NULL,
  `published` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_banners`
--

LOCK TABLES `cms_banners` WRITE;
/*!40000 ALTER TABLE `cms_banners` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_banners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_bestchange_data`
--

DROP TABLE IF EXISTS `cms_bestchange_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_bestchange_data` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_best` int(10) unsigned NOT NULL DEFAULT '0',
  `id_exch` int(10) unsigned NOT NULL DEFAULT '0',
  `take` decimal(20,10) NOT NULL DEFAULT '0.0000000000',
  `outm` decimal(20,10) NOT NULL DEFAULT '0.0000000000',
  `reserf` decimal(20,2) NOT NULL DEFAULT '0.00',
  `level` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `main` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_bestchange_data`
--

LOCK TABLES `cms_bestchange_data` WRITE;
/*!40000 ALTER TABLE `cms_bestchange_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_bestchange_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_blog_authors`
--

DROP TABLE IF EXISTS `cms_blog_authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_blog_authors` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '1',
  `blog_id` int(10) unsigned NOT NULL DEFAULT '1',
  `description` varchar(100) NOT NULL DEFAULT '',
  `startdate` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `blog_id` (`blog_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_blog_authors`
--

LOCK TABLES `cms_blog_authors` WRITE;
/*!40000 ALTER TABLE `cms_blog_authors` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_blog_authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_blog_cats`
--

DROP TABLE IF EXISTS `cms_blog_cats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_blog_cats` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `blog_id` int(10) unsigned NOT NULL DEFAULT '1',
  `title` varchar(250) NOT NULL DEFAULT '',
  `description` varchar(1000) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `blog_id` (`blog_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_blog_cats`
--

LOCK TABLES `cms_blog_cats` WRITE;
/*!40000 ALTER TABLE `cms_blog_cats` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_blog_cats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_blog_posts`
--

DROP TABLE IF EXISTS `cms_blog_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_blog_posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `blog_id` int(11) NOT NULL,
  `pubdate` datetime NOT NULL,
  `title` varchar(250) NOT NULL,
  `feel` varchar(100) NOT NULL,
  `music` varchar(100) NOT NULL,
  `content` text NOT NULL,
  `content_html` text NOT NULL,
  `allow_who` varchar(20) NOT NULL,
  `edit_times` int(11) NOT NULL DEFAULT '0',
  `edit_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `published` tinyint(1) NOT NULL DEFAULT '1',
  `seolink` varchar(255) NOT NULL,
  `comments` tinyint(1) NOT NULL DEFAULT '1',
  `comments_count` int(11) NOT NULL DEFAULT '0',
  `rating` int(11) NOT NULL DEFAULT '0',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `pagetitle` varchar(200) NOT NULL DEFAULT '',
  `meta_keys` varchar(250) NOT NULL DEFAULT '',
  `meta_desc` varchar(250) NOT NULL DEFAULT '',
  `t` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `blog_id` (`blog_id`),
  KEY `seolink` (`seolink`),
  KEY `user_id` (`user_id`),
  FULLTEXT KEY `content_html` (`content_html`),
  FULLTEXT KEY `title` (`title`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_blog_posts`
--

LOCK TABLES `cms_blog_posts` WRITE;
/*!40000 ALTER TABLE `cms_blog_posts` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_blog_posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_blogs`
--

DROP TABLE IF EXISTS `cms_blogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_blogs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '1',
  `title` varchar(250) NOT NULL DEFAULT '',
  `pubdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `allow_who` varchar(15) NOT NULL DEFAULT '',
  `view_type` varchar(15) NOT NULL DEFAULT 'list',
  `showcats` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `ownertype` varchar(15) NOT NULL DEFAULT 'single',
  `premod` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `forall` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `owner` varchar(10) NOT NULL DEFAULT 'user',
  `seolink` varchar(255) NOT NULL DEFAULT '',
  `rating` int(11) NOT NULL DEFAULT '0',
  `comments_count` int(10) unsigned NOT NULL DEFAULT '0',
  `pagetitle` varchar(200) NOT NULL DEFAULT '',
  `meta_keys` varchar(250) NOT NULL DEFAULT '',
  `meta_desc` varchar(250) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `pubdate` (`pubdate`),
  KEY `seolink` (`seolink`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_blogs`
--

LOCK TABLES `cms_blogs` WRITE;
/*!40000 ALTER TABLE `cms_blogs` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_blogs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_board_cats`
--

DROP TABLE IF EXISTS `cms_board_cats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_board_cats` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL DEFAULT '1',
  `ordering` int(10) unsigned NOT NULL DEFAULT '1',
  `NSLeft` int(10) unsigned NOT NULL DEFAULT '0',
  `NSRight` int(10) unsigned NOT NULL DEFAULT '0',
  `NSDiffer` varchar(15) NOT NULL DEFAULT '',
  `NSIgnore` int(10) unsigned NOT NULL DEFAULT '0',
  `NSLevel` int(10) unsigned NOT NULL DEFAULT '1',
  `title` varchar(100) NOT NULL DEFAULT '',
  `description` varchar(300) NOT NULL DEFAULT '',
  `published` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `orderform` tinyint(1) unsigned DEFAULT '1',
  `showdate` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `pubdate` datetime NOT NULL,
  `orderby` varchar(20) NOT NULL DEFAULT 'title',
  `orderto` varchar(4) NOT NULL DEFAULT 'asc',
  `public` tinyint(1) NOT NULL DEFAULT '1',
  `perpage` int(10) unsigned NOT NULL DEFAULT '15',
  `maxcols` int(10) unsigned NOT NULL DEFAULT '1',
  `thumb1` int(10) unsigned NOT NULL DEFAULT '64',
  `thumb2` int(10) unsigned NOT NULL DEFAULT '400',
  `thumbsqr` int(10) unsigned NOT NULL DEFAULT '1',
  `uplimit` int(10) unsigned NOT NULL DEFAULT '10',
  `is_photos` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `icon` varchar(200) DEFAULT 'folder_grey.png',
  `obtypes` text NOT NULL,
  `form_id` int(10) unsigned NOT NULL DEFAULT '1',
  `pagetitle` varchar(200) NOT NULL DEFAULT '',
  `meta_keys` varchar(250) NOT NULL DEFAULT '',
  `meta_desc` varchar(250) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `NSLeft` (`NSLeft`,`NSRight`),
  KEY `parent_id` (`parent_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_board_cats`
--

LOCK TABLES `cms_board_cats` WRITE;
/*!40000 ALTER TABLE `cms_board_cats` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_board_cats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_board_items`
--

DROP TABLE IF EXISTS `cms_board_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_board_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(10) unsigned NOT NULL DEFAULT '1',
  `user_id` int(10) unsigned NOT NULL DEFAULT '1',
  `obtype` varchar(50) NOT NULL DEFAULT '',
  `title` varchar(250) NOT NULL DEFAULT '',
  `content` text NOT NULL,
  `formsdata` text NOT NULL,
  `city` varchar(100) NOT NULL DEFAULT '',
  `pubdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `pubdays` int(10) unsigned NOT NULL DEFAULT '0',
  `published` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `file` varchar(250) NOT NULL DEFAULT '',
  `more_images` text NOT NULL,
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `is_vip` tinyint(1) NOT NULL DEFAULT '0',
  `vipdate` datetime NOT NULL,
  `ip` int(10) unsigned NOT NULL DEFAULT '0',
  `pagetitle` varchar(200) NOT NULL DEFAULT '',
  `meta_keys` varchar(250) NOT NULL DEFAULT '',
  `meta_desc` varchar(250) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  KEY `city` (`city`),
  KEY `ip` (`ip`),
  KEY `obtype` (`obtype`),
  KEY `user_id` (`user_id`),
  FULLTEXT KEY `content` (`content`),
  FULLTEXT KEY `title` (`title`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_board_items`
--

LOCK TABLES `cms_board_items` WRITE;
/*!40000 ALTER TABLE `cms_board_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_board_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_cache`
--

DROP TABLE IF EXISTS `cms_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_cache` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `target` varchar(10) NOT NULL DEFAULT '',
  `target_id` varchar(255) NOT NULL DEFAULT '',
  `cachedate` datetime NOT NULL,
  `cachefile` varchar(80) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_cache`
--

LOCK TABLES `cms_cache` WRITE;
/*!40000 ALTER TABLE `cms_cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_category`
--

DROP TABLE IF EXISTS `cms_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `title` varchar(200) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '1',
  `showdate` tinyint(1) NOT NULL DEFAULT '1',
  `showcomm` tinyint(1) NOT NULL DEFAULT '1',
  `orderby` varchar(30) NOT NULL DEFAULT 'date',
  `orderto` varchar(4) NOT NULL DEFAULT 'asc',
  `modgrp_id` int(10) unsigned NOT NULL DEFAULT '0',
  `NSLeft` int(10) unsigned NOT NULL DEFAULT '0',
  `NSRight` int(10) unsigned NOT NULL DEFAULT '0',
  `NSLevel` int(10) unsigned NOT NULL DEFAULT '1',
  `NSDiffer` varchar(11) NOT NULL DEFAULT '',
  `NSIgnore` int(10) unsigned NOT NULL DEFAULT '1',
  `ordering` int(10) unsigned NOT NULL DEFAULT '1',
  `maxcols` int(10) unsigned NOT NULL DEFAULT '1',
  `showtags` tinyint(1) NOT NULL DEFAULT '1',
  `showrss` tinyint(1) NOT NULL DEFAULT '1',
  `showdesc` tinyint(1) NOT NULL DEFAULT '1',
  `is_public` tinyint(1) NOT NULL DEFAULT '1',
  `photoalbum` text NOT NULL,
  `seolink` varchar(200) NOT NULL DEFAULT '',
  `url` varchar(100) NOT NULL DEFAULT '',
  `tpl` varchar(50) NOT NULL DEFAULT 'com_content_view.tpl',
  `cost` varchar(5) NOT NULL DEFAULT '',
  `pagetitle` varchar(200) NOT NULL DEFAULT '',
  `meta_keys` varchar(250) NOT NULL DEFAULT '',
  `meta_desc` varchar(250) NOT NULL DEFAULT '',
  `slug` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `NSLeft` (`NSLeft`,`NSRight`),
  KEY `parent_id` (`parent_id`),
  KEY `seolink` (`seolink`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_category`
--

LOCK TABLES `cms_category` WRITE;
/*!40000 ALTER TABLE `cms_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_clubs`
--

DROP TABLE IF EXISTS `cms_clubs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_clubs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `admin_id` int(10) unsigned NOT NULL DEFAULT '1',
  `title` varchar(200) NOT NULL DEFAULT '',
  `description` longtext NOT NULL,
  `imageurl` varchar(100) NOT NULL DEFAULT '',
  `pubdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `clubtype` varchar(15) NOT NULL DEFAULT 'public',
  `published` tinyint(1) NOT NULL DEFAULT '1',
  `maxsize` int(10) unsigned NOT NULL DEFAULT '0',
  `enabled_blogs` tinyint(1) DEFAULT '1',
  `enabled_photos` tinyint(1) DEFAULT '1',
  `rating` int(11) NOT NULL DEFAULT '0',
  `members_count` int(10) unsigned NOT NULL DEFAULT '1',
  `photo_premod` tinyint(1) NOT NULL DEFAULT '0',
  `blog_premod` tinyint(1) NOT NULL DEFAULT '0',
  `blog_min_karma` int(11) NOT NULL DEFAULT '0',
  `photo_min_karma` int(11) NOT NULL DEFAULT '0',
  `album_min_karma` int(11) NOT NULL DEFAULT '25',
  `join_min_karma` int(11) NOT NULL DEFAULT '0',
  `join_karma_limit` int(11) NOT NULL DEFAULT '0',
  `create_karma` int(11) NOT NULL DEFAULT '0',
  `is_vip` tinyint(1) NOT NULL DEFAULT '0',
  `join_cost` float NOT NULL DEFAULT '0',
  `pagetitle` varchar(200) NOT NULL DEFAULT '',
  `meta_keys` varchar(250) NOT NULL DEFAULT '',
  `meta_desc` varchar(250) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `admin_id` (`admin_id`),
  KEY `pubdate` (`pubdate`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_clubs`
--

LOCK TABLES `cms_clubs` WRITE;
/*!40000 ALTER TABLE `cms_clubs` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_clubs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_comment_targets`
--

DROP TABLE IF EXISTS `cms_comment_targets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_comment_targets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `target` varchar(32) NOT NULL DEFAULT '',
  `component` varchar(32) NOT NULL DEFAULT '',
  `title` varchar(100) NOT NULL DEFAULT '',
  `target_table` varchar(32) NOT NULL DEFAULT '',
  `subj` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `target` (`target`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_comment_targets`
--

LOCK TABLES `cms_comment_targets` WRITE;
/*!40000 ALTER TABLE `cms_comment_targets` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_comment_targets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_comments`
--

DROP TABLE IF EXISTS `cms_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_comments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL DEFAULT '1',
  `pid` int(10) unsigned NOT NULL DEFAULT '1',
  `user_id` int(10) unsigned NOT NULL DEFAULT '1',
  `target` varchar(20) NOT NULL DEFAULT '',
  `target_id` int(10) unsigned NOT NULL DEFAULT '0',
  `guestname` varchar(200) NOT NULL DEFAULT '',
  `content` text NOT NULL,
  `content_bbcode` text NOT NULL,
  `pubdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `published` tinyint(1) NOT NULL DEFAULT '1',
  `is_new` tinyint(1) NOT NULL DEFAULT '1',
  `target_title` varchar(150) NOT NULL DEFAULT '',
  `target_link` varchar(200) NOT NULL DEFAULT '',
  `ip` varchar(15) NOT NULL,
  `is_hidden` tinyint(1) NOT NULL DEFAULT '0',
  `rating` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `target_id` (`target_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_comments`
--

LOCK TABLES `cms_comments` WRITE;
/*!40000 ALTER TABLE `cms_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_components`
--

DROP TABLE IF EXISTS `cms_components`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_components` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL DEFAULT '',
  `link` varchar(200) NOT NULL DEFAULT '',
  `config` text NOT NULL,
  `internal` int(11) NOT NULL DEFAULT '1',
  `author` varchar(200) NOT NULL DEFAULT 'InstantCMS team',
  `published` tinyint(1) NOT NULL DEFAULT '1',
  `version` varchar(6) NOT NULL DEFAULT '1.10.3',
  `system` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_components`
--

LOCK TABLES `cms_components` WRITE;
/*!40000 ALTER TABLE `cms_components` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_components` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_content`
--

DROP TABLE IF EXISTS `cms_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_content` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(10) unsigned NOT NULL DEFAULT '1',
  `user_id` int(10) unsigned NOT NULL DEFAULT '1',
  `pubdate` datetime NOT NULL,
  `enddate` date NOT NULL,
  `is_end` tinyint(1) NOT NULL DEFAULT '1',
  `title` varchar(200) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `content` longtext,
  `published` tinyint(1) NOT NULL DEFAULT '1',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `rating` int(11) NOT NULL DEFAULT '0',
  `meta_desc` text NOT NULL,
  `meta_keys` text NOT NULL,
  `showtitle` tinyint(1) NOT NULL DEFAULT '1',
  `showdate` tinyint(1) NOT NULL DEFAULT '1',
  `showlatest` tinyint(1) NOT NULL DEFAULT '1',
  `showpath` tinyint(1) NOT NULL DEFAULT '1',
  `ordering` int(10) unsigned NOT NULL DEFAULT '0',
  `comments` tinyint(1) NOT NULL DEFAULT '1',
  `is_arhive` tinyint(1) NOT NULL,
  `seolink` varchar(200) NOT NULL DEFAULT '',
  `canrate` tinyint(1) NOT NULL DEFAULT '1',
  `pagetitle` varchar(255) NOT NULL DEFAULT '',
  `url` varchar(100) NOT NULL DEFAULT '',
  `tpl` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_cms_content_on_seolink` (`seolink`),
  KEY `category_id` (`category_id`),
  KEY `seolink` (`seolink`),
  KEY `user_id` (`user_id`),
  FULLTEXT KEY `content` (`content`),
  FULLTEXT KEY `title` (`title`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_content`
--

LOCK TABLES `cms_content` WRITE;
/*!40000 ALTER TABLE `cms_content` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_content_access`
--

DROP TABLE IF EXISTS `cms_content_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_content_access` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `content_id` int(10) unsigned NOT NULL DEFAULT '1',
  `content_type` varchar(100) NOT NULL DEFAULT '',
  `group_id` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `content_id` (`content_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_content_access`
--

LOCK TABLES `cms_content_access` WRITE;
/*!40000 ALTER TABLE `cms_content_access` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_content_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_cron_jobs`
--

DROP TABLE IF EXISTS `cms_cron_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_cron_jobs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `job_name` varchar(50) NOT NULL DEFAULT '',
  `job_interval` smallint(6) NOT NULL DEFAULT '1',
  `job_run_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `component` varchar(20) NOT NULL DEFAULT '',
  `model_method` varchar(100) NOT NULL DEFAULT '',
  `custom_file` varchar(250) NOT NULL DEFAULT '',
  `is_enabled` tinyint(1) NOT NULL DEFAULT '1',
  `is_new` smallint(6) NOT NULL DEFAULT '1',
  `comment` varchar(200) NOT NULL DEFAULT '',
  `class_name` varchar(50) NOT NULL DEFAULT '',
  `class_method` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `is_enabled` (`is_enabled`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_cron_jobs`
--

LOCK TABLES `cms_cron_jobs` WRITE;
/*!40000 ALTER TABLE `cms_cron_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_cron_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_downloads`
--

DROP TABLE IF EXISTS `cms_downloads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_downloads` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fileurl` varchar(250) NOT NULL DEFAULT '',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_downloads`
--

LOCK TABLES `cms_downloads` WRITE;
/*!40000 ALTER TABLE `cms_downloads` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_downloads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_emoney`
--

DROP TABLE IF EXISTS `cms_emoney`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_emoney` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL,
  `id_ps` int(11) NOT NULL,
  `num_ps` varchar(96) DEFAULT NULL,
  `is_selected` tinyint(1) NOT NULL DEFAULT '0',
  `num_cart` varchar(18) NOT NULL,
  `name` varchar(60) DEFAULT NULL,
  `circ_money` float DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `balance` float NOT NULL DEFAULT '0',
  `max_limit` float NOT NULL,
  `cur_sign` varchar(10) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `date` datetime NOT NULL,
  `placeqiwi` int(11) NOT NULL,
  `directqiwi` tinyint(1) NOT NULL,
  `secretKey` varchar(100) NOT NULL,
  `fname` varchar(100) NOT NULL,
  `lname` varchar(100) NOT NULL,
  `is_item` tinyint(1) NOT NULL,
  `pemail` varchar(100) DEFAULT NULL,
  `sum` float NOT NULL DEFAULT '0',
  `placevmc` int(11) NOT NULL DEFAULT '0',
  `name_group` varchar(60) DEFAULT NULL,
  `sumOutMonth` float NOT NULL DEFAULT '0',
  `sumOutPeriod` float NOT NULL DEFAULT '0',
  `sumInMonth` float NOT NULL DEFAULT '0',
  `sumInPeriod` float NOT NULL DEFAULT '0',
  `timeLastOut` int(10) unsigned DEFAULT NULL,
  `timeLastIn` int(10) unsigned DEFAULT NULL,
  `timeFrozen` int(10) unsigned DEFAULT NULL,
  `timeUnfrozen` int(10) unsigned DEFAULT NULL,
  `statusOut` int(11) NOT NULL DEFAULT '1',
  `statusIn` int(11) NOT NULL DEFAULT '1',
  `timeInFrozen` int(10) unsigned DEFAULT NULL,
  `timeInUnfrozen` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `id_ps` (`id_ps`),
  KEY `status` (`status`),
  CONSTRAINT `fk_rails_66a7516f6c` FOREIGN KEY (`id_ps`) REFERENCES `cms_paymant_system` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_emoney`
--

LOCK TABLES `cms_emoney` WRITE;
/*!40000 ALTER TABLE `cms_emoney` DISABLE KEYS */;
INSERT INTO `cms_emoney` VALUES (1,0,1,NULL,0,'1234',NULL,NULL,0,123,12,'$',0,'2018-03-15 00:00:00',123,1,'123','vaya','vasin',1,NULL,0,0,NULL,0,0,0,0,NULL,NULL,NULL,NULL,1,1,NULL,NULL,'2018-03-14 21:01:24','2018-03-14 21:01:24'),(2,0,2,NULL,0,'1234',NULL,NULL,0,123,12,'$',0,'2018-03-15 00:00:00',123,1,'123','vaya','vasin',1,NULL,0,0,NULL,0,0,0,0,NULL,NULL,NULL,NULL,1,1,NULL,NULL,'2018-03-14 21:01:24','2018-03-14 21:01:24'),(3,0,3,NULL,0,'1234',NULL,NULL,0,123,12,'$',0,'2018-03-15 00:00:00',123,1,'123','vaya','vasin',1,NULL,0,0,NULL,0,0,0,0,NULL,NULL,NULL,NULL,1,1,NULL,NULL,'2018-03-14 21:01:24','2018-03-14 21:01:24'),(4,0,4,NULL,0,'1234',NULL,NULL,0,123,12,'$',0,'2018-03-15 00:00:00',123,1,'123','vaya','vasin',1,NULL,0,0,NULL,0,0,0,0,NULL,NULL,NULL,NULL,1,1,NULL,NULL,'2018-03-14 21:01:24','2018-03-14 21:01:24'),(5,0,5,NULL,0,'1234',NULL,NULL,0,123,12,'$',0,'2018-03-15 00:00:00',123,1,'123','vaya','vasin',1,NULL,0,0,NULL,0,0,0,0,NULL,NULL,NULL,NULL,1,1,NULL,NULL,'2018-03-14 21:01:24','2018-03-14 21:01:24'),(6,0,6,NULL,0,'1234',NULL,NULL,0,123,12,'$',0,'2018-03-15 00:00:00',123,1,'123','vaya','vasin',1,NULL,0,0,NULL,0,0,0,0,NULL,NULL,NULL,NULL,1,1,NULL,NULL,'2018-03-14 21:01:24','2018-03-14 21:01:24'),(7,0,8,NULL,0,'1234',NULL,NULL,0,123,12,'$',0,'2018-03-15 00:00:00',123,1,'123','vaya','vasin',1,NULL,0,0,NULL,0,0,0,0,NULL,NULL,NULL,NULL,1,1,NULL,NULL,'2018-03-14 21:01:24','2018-03-14 21:01:24'),(8,0,9,NULL,0,'1234',NULL,NULL,0,123,12,'$',0,'2018-03-15 00:00:00',123,1,'123','vaya','vasin',1,NULL,0,0,NULL,0,0,0,0,NULL,NULL,NULL,NULL,1,1,NULL,NULL,'2018-03-14 21:01:25','2018-03-14 21:01:25'),(9,0,10,NULL,0,'1234',NULL,NULL,0,123,12,'$',0,'2018-03-15 00:00:00',123,1,'123','vaya','vasin',1,NULL,0,0,NULL,0,0,0,0,NULL,NULL,NULL,NULL,1,1,NULL,NULL,'2018-03-14 21:01:25','2018-03-14 21:01:25'),(10,0,11,NULL,0,'1234',NULL,NULL,0,123,12,'$',0,'2018-03-15 00:00:00',123,1,'123','vaya','vasin',1,NULL,0,0,NULL,0,0,0,0,NULL,NULL,NULL,NULL,1,1,NULL,NULL,'2018-03-14 21:01:25','2018-03-14 21:01:25'),(11,0,12,NULL,0,'1234',NULL,NULL,0,123,12,'$',0,'2018-03-15 00:00:00',123,1,'123','vaya','vasin',1,NULL,0,0,NULL,0,0,0,0,NULL,NULL,NULL,NULL,1,1,NULL,NULL,'2018-03-14 21:01:25','2018-03-14 21:01:25');
/*!40000 ALTER TABLE `cms_emoney` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_emoney_history`
--

DROP TABLE IF EXISTS `cms_emoney_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_emoney_history` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_emoney` int(10) unsigned NOT NULL DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `value` float NOT NULL DEFAULT '0',
  `id_ticket` int(10) unsigned NOT NULL DEFAULT '1',
  `datetime` datetime NOT NULL,
  `value_text` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_emoney_history`
--

LOCK TABLES `cms_emoney_history` WRITE;
/*!40000 ALTER TABLE `cms_emoney_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_emoney_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_event_hooks`
--

DROP TABLE IF EXISTS `cms_event_hooks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_event_hooks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `event` varchar(50) NOT NULL DEFAULT '',
  `plugin_id` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `event` (`event`,`plugin_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_event_hooks`
--

LOCK TABLES `cms_event_hooks` WRITE;
/*!40000 ALTER TABLE `cms_event_hooks` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_event_hooks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_exch`
--

DROP TABLE IF EXISTS `cms_exch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_exch` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_b` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_exch`
--

LOCK TABLES `cms_exch` WRITE;
/*!40000 ALTER TABLE `cms_exch` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_exch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_exchange_manager`
--

DROP TABLE IF EXISTS `cms_exchange_manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_exchange_manager` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_ps1` int(11) NOT NULL,
  `id_ps2` int(11) DEFAULT NULL,
  `buy` tinyint(1) DEFAULT NULL,
  `sale` tinyint(1) DEFAULT NULL,
  `ref_output` tinyint(1) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `value_ps` float DEFAULT NULL,
  `exchange_rate_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_cms_exchange_manager_on_id_ps1_and_id_ps2` (`id_ps1`,`id_ps2`),
  KEY `fk_rails_d859ef1f78` (`exchange_rate_id`),
  KEY `fk_rails_f2bfde470f` (`id_ps2`),
  KEY `ssbr` (`status`,`sale`,`buy`,`ref_output`),
  CONSTRAINT `fk_rails_a63a40a9ba` FOREIGN KEY (`id_ps1`) REFERENCES `cms_paymant_system` (`id`),
  CONSTRAINT `fk_rails_d859ef1f78` FOREIGN KEY (`exchange_rate_id`) REFERENCES `cms_exchange_rate` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_rails_f2bfde470f` FOREIGN KEY (`id_ps2`) REFERENCES `cms_paymant_system` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_exchange_manager`
--

LOCK TABLES `cms_exchange_manager` WRITE;
/*!40000 ALTER TABLE `cms_exchange_manager` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_exchange_manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_exchange_rate`
--

DROP TABLE IF EXISTS `cms_exchange_rate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_exchange_rate` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_ps1` int(11) NOT NULL,
  `id_ps2` int(11) NOT NULL,
  `value_ps` float DEFAULT NULL,
  `timec` int(11) NOT NULL DEFAULT '0',
  `position` varchar(10) NOT NULL DEFAULT '1-7',
  `cor1` float NOT NULL DEFAULT '0',
  `cor2` float NOT NULL DEFAULT '8',
  `on_notif` tinyint(1) NOT NULL DEFAULT '1',
  `on_corridor` tinyint(1) NOT NULL DEFAULT '0',
  `is_enabled` tinyint(1) NOT NULL DEFAULT '0',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `in_cur` varchar(3) NOT NULL,
  `out_cur` varchar(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_ps1` (`id_ps1`,`id_ps2`),
  KEY `fk_rails_ef77ea3609` (`id_ps2`),
  KEY `index_cms_exchange_rate_on_is_enabled` (`is_enabled`),
  CONSTRAINT `fk_rails_6e03841034` FOREIGN KEY (`id_ps1`) REFERENCES `cms_paymant_system` (`id`),
  CONSTRAINT `fk_rails_ef77ea3609` FOREIGN KEY (`id_ps2`) REFERENCES `cms_paymant_system` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_exchange_rate`
--

LOCK TABLES `cms_exchange_rate` WRITE;
/*!40000 ALTER TABLE `cms_exchange_rate` DISABLE KEYS */;
INSERT INTO `cms_exchange_rate` VALUES (1,1,1,4,0,'1-7',0,8,1,0,1,'2018-03-14 21:01:17','2018-03-14 21:01:17','RUB','RUB'),(2,1,2,4,0,'1-7',0,8,1,0,1,'2018-03-14 21:01:17','2018-03-14 21:01:17','RUB','USD'),(3,1,3,4,0,'1-7',0,8,1,0,1,'2018-03-14 21:01:17','2018-03-14 21:01:17','RUB','BTC'),(4,1,4,4,0,'1-7',0,8,1,0,1,'2018-03-14 21:01:17','2018-03-14 21:01:17','RUB','LTC'),(5,1,5,4,0,'1-7',0,8,1,0,1,'2018-03-14 21:01:17','2018-03-14 21:01:17','RUB','ETH'),(6,1,6,4,0,'1-7',0,8,1,0,1,'2018-03-14 21:01:17','2018-03-14 21:01:17','RUB','DSH'),(7,1,8,4,0,'1-7',0,8,1,0,1,'2018-03-14 21:01:17','2018-03-14 21:01:17','RUB','KZT'),(8,1,9,4,0,'1-7',0,8,1,0,1,'2018-03-14 21:01:17','2018-03-14 21:01:17','RUB','XRP'),(9,1,10,4,0,'1-7',0,8,1,0,1,'2018-03-14 21:01:17','2018-03-14 21:01:17','RUB','ETC'),(10,1,11,4,0,'1-7',0,8,1,0,1,'2018-03-14 21:01:17','2018-03-14 21:01:17','RUB','XMR'),(11,1,12,4,0,'1-7',0,8,1,0,1,'2018-03-14 21:01:17','2018-03-14 21:01:17','RUB','BCH'),(12,2,1,4,0,'1-7',0,8,1,0,1,'2018-03-14 21:01:18','2018-03-14 21:01:18','USD','RUB'),(13,2,2,4,0,'1-7',0,8,1,0,1,'2018-03-14 21:01:18','2018-03-14 21:01:18','USD','USD'),(14,2,3,4,0,'1-7',0,8,1,0,1,'2018-03-14 21:01:18','2018-03-14 21:01:18','USD','BTC'),(15,2,4,4,0,'1-7',0,8,1,0,1,'2018-03-14 21:01:18','2018-03-14 21:01:18','USD','LTC'),(16,2,5,4,0,'1-7',0,8,1,0,1,'2018-03-14 21:01:18','2018-03-14 21:01:18','USD','ETH'),(17,2,6,4,0,'1-7',0,8,1,0,1,'2018-03-14 21:01:18','2018-03-14 21:01:18','USD','DSH'),(18,2,8,4,0,'1-7',0,8,1,0,1,'2018-03-14 21:01:18','2018-03-14 21:01:18','USD','KZT'),(19,2,9,4,0,'1-7',0,8,1,0,1,'2018-03-14 21:01:18','2018-03-14 21:01:18','USD','XRP'),(20,2,10,4,0,'1-7',0,8,1,0,1,'2018-03-14 21:01:18','2018-03-14 21:01:18','USD','ETC'),(21,2,11,4,0,'1-7',0,8,1,0,1,'2018-03-14 21:01:18','2018-03-14 21:01:18','USD','XMR'),(22,2,12,4,0,'1-7',0,8,1,0,1,'2018-03-14 21:01:18','2018-03-14 21:01:18','USD','BCH'),(23,3,1,4,0,'1-7',0,8,1,0,1,'2018-03-14 21:01:18','2018-03-14 21:01:18','BTC','RUB'),(24,3,2,4,0,'1-7',0,8,1,0,1,'2018-03-14 21:01:18','2018-03-14 21:01:18','BTC','USD'),(25,3,3,4,0,'1-7',0,8,1,0,1,'2018-03-14 21:01:18','2018-03-14 21:01:18','BTC','BTC'),(26,3,4,4,0,'1-7',0,8,1,0,1,'2018-03-14 21:01:18','2018-03-14 21:01:18','BTC','LTC'),(27,3,5,4,0,'1-7',0,8,1,0,1,'2018-03-14 21:01:18','2018-03-14 21:01:18','BTC','ETH'),(28,3,6,4,0,'1-7',0,8,1,0,1,'2018-03-14 21:01:18','2018-03-14 21:01:18','BTC','DSH'),(29,3,8,4,0,'1-7',0,8,1,0,1,'2018-03-14 21:01:18','2018-03-14 21:01:18','BTC','KZT'),(30,3,9,4,0,'1-7',0,8,1,0,1,'2018-03-14 21:01:19','2018-03-14 21:01:19','BTC','XRP'),(31,3,10,4,0,'1-7',0,8,1,0,1,'2018-03-14 21:01:19','2018-03-14 21:01:19','BTC','ETC'),(32,3,11,4,0,'1-7',0,8,1,0,1,'2018-03-14 21:01:19','2018-03-14 21:01:19','BTC','XMR'),(33,3,12,4,0,'1-7',0,8,1,0,1,'2018-03-14 21:01:19','2018-03-14 21:01:19','BTC','BCH'),(34,4,1,4,0,'1-7',0,8,1,0,1,'2018-03-14 21:01:19','2018-03-14 21:01:19','LTC','RUB'),(35,4,2,4,0,'1-7',0,8,1,0,1,'2018-03-14 21:01:19','2018-03-14 21:01:19','LTC','USD'),(36,4,3,4,0,'1-7',0,8,1,0,1,'2018-03-14 21:01:19','2018-03-14 21:01:19','LTC','BTC'),(37,4,4,4,0,'1-7',0,8,1,0,1,'2018-03-14 21:01:19','2018-03-14 21:01:19','LTC','LTC'),(38,4,5,4,0,'1-7',0,8,1,0,1,'2018-03-14 21:01:19','2018-03-14 21:01:19','LTC','ETH'),(39,4,6,4,0,'1-7',0,8,1,0,1,'2018-03-14 21:01:19','2018-03-14 21:01:19','LTC','DSH'),(40,4,8,4,0,'1-7',0,8,1,0,1,'2018-03-14 21:01:19','2018-03-14 21:01:19','LTC','KZT'),(41,4,9,4,0,'1-7',0,8,1,0,1,'2018-03-14 21:01:19','2018-03-14 21:01:19','LTC','XRP'),(42,4,10,4,0,'1-7',0,8,1,0,1,'2018-03-14 21:01:19','2018-03-14 21:01:19','LTC','ETC'),(43,4,11,4,0,'1-7',0,8,1,0,1,'2018-03-14 21:01:19','2018-03-14 21:01:19','LTC','XMR'),(44,4,12,4,0,'1-7',0,8,1,0,1,'2018-03-14 21:01:19','2018-03-14 21:01:19','LTC','BCH'),(45,5,1,4,0,'1-7',0,8,1,0,1,'2018-03-14 21:01:19','2018-03-14 21:01:19','ETH','RUB'),(46,5,2,4,0,'1-7',0,8,1,0,1,'2018-03-14 21:01:19','2018-03-14 21:01:19','ETH','USD'),(47,5,3,4,0,'1-7',0,8,1,0,1,'2018-03-14 21:01:19','2018-03-14 21:01:19','ETH','BTC'),(48,5,4,4,0,'1-7',0,8,1,0,1,'2018-03-14 21:01:19','2018-03-14 21:01:19','ETH','LTC'),(49,5,5,4,0,'1-7',0,8,1,0,1,'2018-03-14 21:01:19','2018-03-14 21:01:19','ETH','ETH'),(50,5,6,4,0,'1-7',0,8,1,0,1,'2018-03-14 21:01:20','2018-03-14 21:01:20','ETH','DSH'),(51,5,8,4,0,'1-7',0,8,1,0,1,'2018-03-14 21:01:20','2018-03-14 21:01:20','ETH','KZT'),(52,5,9,4,0,'1-7',0,8,1,0,1,'2018-03-14 21:01:20','2018-03-14 21:01:20','ETH','XRP'),(53,5,10,4,0,'1-7',0,8,1,0,1,'2018-03-14 21:01:20','2018-03-14 21:01:20','ETH','ETC'),(54,5,11,4,0,'1-7',0,8,1,0,1,'2018-03-14 21:01:20','2018-03-14 21:01:20','ETH','XMR'),(55,5,12,4,0,'1-7',0,8,1,0,1,'2018-03-14 21:01:20','2018-03-14 21:01:20','ETH','BCH'),(56,6,1,4,0,'1-7',0,8,1,0,1,'2018-03-14 21:01:20','2018-03-14 21:01:20','DSH','RUB'),(57,6,2,4,0,'1-7',0,8,1,0,1,'2018-03-14 21:01:20','2018-03-14 21:01:20','DSH','USD'),(58,6,3,4,0,'1-7',0,8,1,0,1,'2018-03-14 21:01:20','2018-03-14 21:01:20','DSH','BTC'),(59,6,4,4,0,'1-7',0,8,1,0,1,'2018-03-14 21:01:20','2018-03-14 21:01:20','DSH','LTC'),(60,6,5,4,0,'1-7',0,8,1,0,1,'2018-03-14 21:01:20','2018-03-14 21:01:20','DSH','ETH'),(61,6,6,4,0,'1-7',0,8,1,0,1,'2018-03-14 21:01:20','2018-03-14 21:01:20','DSH','DSH'),(62,6,8,4,0,'1-7',0,8,1,0,1,'2018-03-14 21:01:20','2018-03-14 21:01:20','DSH','KZT'),(63,6,9,4,0,'1-7',0,8,1,0,1,'2018-03-14 21:01:20','2018-03-14 21:01:20','DSH','XRP'),(64,6,10,4,0,'1-7',0,8,1,0,1,'2018-03-14 21:01:20','2018-03-14 21:01:20','DSH','ETC'),(65,6,11,4,0,'1-7',0,8,1,0,1,'2018-03-14 21:01:20','2018-03-14 21:01:20','DSH','XMR'),(66,6,12,4,0,'1-7',0,8,1,0,1,'2018-03-14 21:01:20','2018-03-14 21:01:20','DSH','BCH'),(67,8,1,4,0,'1-7',0,8,1,0,1,'2018-03-14 21:01:21','2018-03-14 21:01:21','KZT','RUB'),(68,8,2,4,0,'1-7',0,8,1,0,1,'2018-03-14 21:01:21','2018-03-14 21:01:21','KZT','USD'),(69,8,3,4,0,'1-7',0,8,1,0,1,'2018-03-14 21:01:21','2018-03-14 21:01:21','KZT','BTC'),(70,8,4,4,0,'1-7',0,8,1,0,1,'2018-03-14 21:01:21','2018-03-14 21:01:21','KZT','LTC'),(71,8,5,4,0,'1-7',0,8,1,0,1,'2018-03-14 21:01:21','2018-03-14 21:01:21','KZT','ETH'),(72,8,6,4,0,'1-7',0,8,1,0,1,'2018-03-14 21:01:21','2018-03-14 21:01:21','KZT','DSH'),(73,8,8,4,0,'1-7',0,8,1,0,1,'2018-03-14 21:01:21','2018-03-14 21:01:21','KZT','KZT'),(74,8,9,4,0,'1-7',0,8,1,0,1,'2018-03-14 21:01:21','2018-03-14 21:01:21','KZT','XRP'),(75,8,10,4,0,'1-7',0,8,1,0,1,'2018-03-14 21:01:21','2018-03-14 21:01:21','KZT','ETC'),(76,8,11,4,0,'1-7',0,8,1,0,1,'2018-03-14 21:01:21','2018-03-14 21:01:21','KZT','XMR'),(77,8,12,4,0,'1-7',0,8,1,0,1,'2018-03-14 21:01:21','2018-03-14 21:01:21','KZT','BCH'),(78,9,1,4,0,'1-7',0,8,1,0,1,'2018-03-14 21:01:21','2018-03-14 21:01:21','XRP','RUB'),(79,9,2,4,0,'1-7',0,8,1,0,1,'2018-03-14 21:01:21','2018-03-14 21:01:21','XRP','USD'),(80,9,3,4,0,'1-7',0,8,1,0,1,'2018-03-14 21:01:21','2018-03-14 21:01:21','XRP','BTC'),(81,9,4,4,0,'1-7',0,8,1,0,1,'2018-03-14 21:01:21','2018-03-14 21:01:21','XRP','LTC'),(82,9,5,4,0,'1-7',0,8,1,0,1,'2018-03-14 21:01:21','2018-03-14 21:01:21','XRP','ETH'),(83,9,6,4,0,'1-7',0,8,1,0,1,'2018-03-14 21:01:21','2018-03-14 21:01:21','XRP','DSH'),(84,9,8,4,0,'1-7',0,8,1,0,1,'2018-03-14 21:01:21','2018-03-14 21:01:21','XRP','KZT'),(85,9,9,4,0,'1-7',0,8,1,0,1,'2018-03-14 21:01:21','2018-03-14 21:01:21','XRP','XRP'),(86,9,10,4,0,'1-7',0,8,1,0,1,'2018-03-14 21:01:21','2018-03-14 21:01:21','XRP','ETC'),(87,9,11,4,0,'1-7',0,8,1,0,1,'2018-03-14 21:01:21','2018-03-14 21:01:21','XRP','XMR'),(88,9,12,4,0,'1-7',0,8,1,0,1,'2018-03-14 21:01:22','2018-03-14 21:01:22','XRP','BCH'),(89,10,1,4,0,'1-7',0,8,1,0,1,'2018-03-14 21:01:22','2018-03-14 21:01:22','ETC','RUB'),(90,10,2,4,0,'1-7',0,8,1,0,1,'2018-03-14 21:01:22','2018-03-14 21:01:22','ETC','USD'),(91,10,3,4,0,'1-7',0,8,1,0,1,'2018-03-14 21:01:22','2018-03-14 21:01:22','ETC','BTC'),(92,10,4,4,0,'1-7',0,8,1,0,1,'2018-03-14 21:01:22','2018-03-14 21:01:22','ETC','LTC'),(93,10,5,4,0,'1-7',0,8,1,0,1,'2018-03-14 21:01:22','2018-03-14 21:01:22','ETC','ETH'),(94,10,6,4,0,'1-7',0,8,1,0,1,'2018-03-14 21:01:22','2018-03-14 21:01:22','ETC','DSH'),(95,10,8,4,0,'1-7',0,8,1,0,1,'2018-03-14 21:01:22','2018-03-14 21:01:22','ETC','KZT'),(96,10,9,4,0,'1-7',0,8,1,0,1,'2018-03-14 21:01:22','2018-03-14 21:01:22','ETC','XRP'),(97,10,10,4,0,'1-7',0,8,1,0,1,'2018-03-14 21:01:22','2018-03-14 21:01:22','ETC','ETC'),(98,10,11,4,0,'1-7',0,8,1,0,1,'2018-03-14 21:01:22','2018-03-14 21:01:22','ETC','XMR'),(99,10,12,4,0,'1-7',0,8,1,0,1,'2018-03-14 21:01:22','2018-03-14 21:01:22','ETC','BCH'),(100,11,1,4,0,'1-7',0,8,1,0,1,'2018-03-14 21:01:22','2018-03-14 21:01:22','XMR','RUB'),(101,11,2,4,0,'1-7',0,8,1,0,1,'2018-03-14 21:01:22','2018-03-14 21:01:22','XMR','USD'),(102,11,3,4,0,'1-7',0,8,1,0,1,'2018-03-14 21:01:22','2018-03-14 21:01:22','XMR','BTC'),(103,11,4,4,0,'1-7',0,8,1,0,1,'2018-03-14 21:01:22','2018-03-14 21:01:22','XMR','LTC'),(104,11,5,4,0,'1-7',0,8,1,0,1,'2018-03-14 21:01:22','2018-03-14 21:01:22','XMR','ETH'),(105,11,6,4,0,'1-7',0,8,1,0,1,'2018-03-14 21:01:22','2018-03-14 21:01:22','XMR','DSH'),(106,11,8,4,0,'1-7',0,8,1,0,1,'2018-03-14 21:01:22','2018-03-14 21:01:22','XMR','KZT'),(107,11,9,4,0,'1-7',0,8,1,0,1,'2018-03-14 21:01:22','2018-03-14 21:01:22','XMR','XRP'),(108,11,10,4,0,'1-7',0,8,1,0,1,'2018-03-14 21:01:22','2018-03-14 21:01:22','XMR','ETC'),(109,11,11,4,0,'1-7',0,8,1,0,1,'2018-03-14 21:01:22','2018-03-14 21:01:22','XMR','XMR'),(110,11,12,4,0,'1-7',0,8,1,0,1,'2018-03-14 21:01:23','2018-03-14 21:01:23','XMR','BCH'),(111,12,1,4,0,'1-7',0,8,1,0,1,'2018-03-14 21:01:23','2018-03-14 21:01:23','BCH','RUB'),(112,12,2,4,0,'1-7',0,8,1,0,1,'2018-03-14 21:01:23','2018-03-14 21:01:23','BCH','USD'),(113,12,3,4,0,'1-7',0,8,1,0,1,'2018-03-14 21:01:23','2018-03-14 21:01:23','BCH','BTC'),(114,12,4,4,0,'1-7',0,8,1,0,1,'2018-03-14 21:01:23','2018-03-14 21:01:23','BCH','LTC'),(115,12,5,4,0,'1-7',0,8,1,0,1,'2018-03-14 21:01:23','2018-03-14 21:01:23','BCH','ETH'),(116,12,6,4,0,'1-7',0,8,1,0,1,'2018-03-14 21:01:23','2018-03-14 21:01:23','BCH','DSH'),(117,12,8,4,0,'1-7',0,8,1,0,1,'2018-03-14 21:01:23','2018-03-14 21:01:23','BCH','KZT'),(118,12,9,4,0,'1-7',0,8,1,0,1,'2018-03-14 21:01:23','2018-03-14 21:01:23','BCH','XRP'),(119,12,10,4,0,'1-7',0,8,1,0,1,'2018-03-14 21:01:23','2018-03-14 21:01:23','BCH','ETC'),(120,12,11,4,0,'1-7',0,8,1,0,1,'2018-03-14 21:01:23','2018-03-14 21:01:23','BCH','XMR'),(121,12,12,4,0,'1-7',0,8,1,0,1,'2018-03-14 21:01:23','2018-03-14 21:01:23','BCH','BCH');
/*!40000 ALTER TABLE `cms_exchange_rate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_faq_cats`
--

DROP TABLE IF EXISTS `cms_faq_cats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_faq_cats` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(250) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '1',
  `link` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_faq_cats`
--

LOCK TABLES `cms_faq_cats` WRITE;
/*!40000 ALTER TABLE `cms_faq_cats` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_faq_cats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_faq_quests`
--

DROP TABLE IF EXISTS `cms_faq_quests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_faq_quests` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(10) unsigned NOT NULL DEFAULT '1',
  `pubdate` datetime NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '1',
  `quest` text NOT NULL,
  `answer` text NOT NULL,
  `user_id` int(10) unsigned NOT NULL DEFAULT '1',
  `answeruser_id` int(10) unsigned NOT NULL DEFAULT '1',
  `answerdate` datetime NOT NULL,
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  KEY `published` (`published`),
  FULLTEXT KEY `quest` (`quest`,`answer`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_faq_quests`
--

LOCK TABLES `cms_faq_quests` WRITE;
/*!40000 ALTER TABLE `cms_faq_quests` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_faq_quests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_filters`
--

DROP TABLE IF EXISTS `cms_filters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_filters` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `link` varchar(100) NOT NULL DEFAULT '',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_filters`
--

LOCK TABLES `cms_filters` WRITE;
/*!40000 ALTER TABLE `cms_filters` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_filters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_form_fields`
--

DROP TABLE IF EXISTS `cms_form_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_form_fields` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `form_id` int(10) unsigned NOT NULL DEFAULT '1',
  `title` varchar(200) NOT NULL DEFAULT '',
  `description` varchar(200) NOT NULL DEFAULT '',
  `ordering` int(10) unsigned NOT NULL DEFAULT '0',
  `kind` varchar(30) NOT NULL DEFAULT '',
  `mustbe` int(11) NOT NULL DEFAULT '0',
  `config` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `form_id` (`form_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_form_fields`
--

LOCK TABLES `cms_form_fields` WRITE;
/*!40000 ALTER TABLE `cms_form_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_form_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_forms`
--

DROP TABLE IF EXISTS `cms_forms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_forms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `email` varchar(200) NOT NULL DEFAULT '',
  `sendto` varchar(4) NOT NULL DEFAULT 'mail',
  `user_id` int(10) unsigned NOT NULL DEFAULT '1',
  `form_action` varchar(200) NOT NULL DEFAULT '/forms/process',
  `tpl` varchar(20) NOT NULL DEFAULT 'form',
  `only_fields` tinyint(1) NOT NULL DEFAULT '0',
  `showtitle` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `title` (`title`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_forms`
--

LOCK TABLES `cms_forms` WRITE;
/*!40000 ALTER TABLE `cms_forms` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_forms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_forum_cats`
--

DROP TABLE IF EXISTS `cms_forum_cats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_forum_cats` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(250) NOT NULL DEFAULT '',
  `published` tinyint(1) NOT NULL DEFAULT '1',
  `ordering` int(10) unsigned NOT NULL DEFAULT '0',
  `seolink` varchar(200) NOT NULL DEFAULT '',
  `pagetitle` varchar(200) NOT NULL DEFAULT '',
  `meta_keys` varchar(250) NOT NULL DEFAULT '',
  `meta_desc` varchar(250) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `seolink` (`seolink`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_forum_cats`
--

LOCK TABLES `cms_forum_cats` WRITE;
/*!40000 ALTER TABLE `cms_forum_cats` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_forum_cats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_forum_files`
--

DROP TABLE IF EXISTS `cms_forum_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_forum_files` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` int(10) unsigned NOT NULL DEFAULT '1',
  `filename` varchar(200) NOT NULL DEFAULT '',
  `filesize` int(10) unsigned NOT NULL DEFAULT '0',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `pubdate` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `post_id` (`post_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_forum_files`
--

LOCK TABLES `cms_forum_files` WRITE;
/*!40000 ALTER TABLE `cms_forum_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_forum_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_forum_polls`
--

DROP TABLE IF EXISTS `cms_forum_polls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_forum_polls` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `thread_id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `answers` text NOT NULL,
  `options` varchar(250) NOT NULL,
  `enddate` datetime NOT NULL,
  `t` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `thread_id` (`thread_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_forum_polls`
--

LOCK TABLES `cms_forum_polls` WRITE;
/*!40000 ALTER TABLE `cms_forum_polls` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_forum_polls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_forum_posts`
--

DROP TABLE IF EXISTS `cms_forum_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_forum_posts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `thread_id` int(10) unsigned NOT NULL DEFAULT '1',
  `user_id` int(10) unsigned NOT NULL DEFAULT '1',
  `pinned` tinyint(1) NOT NULL DEFAULT '0',
  `pubdate` datetime NOT NULL,
  `editdate` datetime NOT NULL,
  `edittimes` int(11) NOT NULL DEFAULT '0',
  `rating` int(11) NOT NULL DEFAULT '0',
  `attach_count` int(11) NOT NULL DEFAULT '0',
  `content` text NOT NULL,
  `content_html` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `thread_id` (`thread_id`,`pubdate`),
  KEY `user_id` (`user_id`),
  FULLTEXT KEY `content_html` (`content_html`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_forum_posts`
--

LOCK TABLES `cms_forum_posts` WRITE;
/*!40000 ALTER TABLE `cms_forum_posts` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_forum_posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_forum_threads`
--

DROP TABLE IF EXISTS `cms_forum_threads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_forum_threads` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `forum_id` int(10) unsigned NOT NULL DEFAULT '1',
  `user_id` int(10) unsigned NOT NULL DEFAULT '1',
  `title` varchar(250) NOT NULL DEFAULT '',
  `description` varchar(250) NOT NULL DEFAULT '',
  `icon` varchar(100) NOT NULL DEFAULT '',
  `pubdate` datetime NOT NULL,
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `closed` tinyint(1) NOT NULL DEFAULT '0',
  `pinned` tinyint(1) NOT NULL DEFAULT '0',
  `is_hidden` tinyint(1) NOT NULL DEFAULT '0',
  `rel_to` varchar(15) NOT NULL DEFAULT '',
  `rel_id` int(10) unsigned NOT NULL DEFAULT '0',
  `post_count` int(10) unsigned NOT NULL DEFAULT '0',
  `last_msg` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `forum_id` (`forum_id`),
  KEY `rel_id` (`rel_id`),
  KEY `user_id` (`user_id`),
  FULLTEXT KEY `title` (`title`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_forum_threads`
--

LOCK TABLES `cms_forum_threads` WRITE;
/*!40000 ALTER TABLE `cms_forum_threads` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_forum_threads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_forum_votes`
--

DROP TABLE IF EXISTS `cms_forum_votes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_forum_votes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `poll_id` int(10) unsigned NOT NULL DEFAULT '1',
  `answer` varchar(300) NOT NULL DEFAULT '',
  `user_id` int(10) unsigned NOT NULL DEFAULT '1',
  `pubdate` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `poll_id` (`poll_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_forum_votes`
--

LOCK TABLES `cms_forum_votes` WRITE;
/*!40000 ALTER TABLE `cms_forum_votes` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_forum_votes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_forums`
--

DROP TABLE IF EXISTS `cms_forums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_forums` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(10) unsigned NOT NULL DEFAULT '1',
  `title` varchar(250) NOT NULL DEFAULT '',
  `description` varchar(300) NOT NULL DEFAULT '',
  `access_list` tinytext NOT NULL,
  `moder_list` tinytext NOT NULL,
  `ordering` int(11) NOT NULL DEFAULT '0',
  `published` tinyint(1) NOT NULL DEFAULT '1',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '1',
  `NSLeft` int(10) unsigned NOT NULL DEFAULT '0',
  `NSRight` int(10) unsigned NOT NULL DEFAULT '0',
  `NSDiffer` varchar(15) NOT NULL DEFAULT '',
  `NSIgnore` int(10) unsigned NOT NULL DEFAULT '1',
  `NSLevel` int(10) unsigned NOT NULL DEFAULT '0',
  `icon` varchar(200) NOT NULL DEFAULT '',
  `topic_cost` int(10) unsigned NOT NULL DEFAULT '0',
  `thread_count` int(11) NOT NULL DEFAULT '0',
  `post_count` int(11) NOT NULL DEFAULT '0',
  `last_msg` text NOT NULL,
  `pagetitle` varchar(200) NOT NULL DEFAULT '',
  `meta_keys` varchar(250) NOT NULL DEFAULT '',
  `meta_desc` varchar(250) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `NSLeft` (`NSLeft`,`NSRight`),
  KEY `category_id` (`category_id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_forums`
--

LOCK TABLES `cms_forums` WRITE;
/*!40000 ALTER TABLE `cms_forums` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_forums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_geo_cities`
--

DROP TABLE IF EXISTS `cms_geo_cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_geo_cities` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `country_id` int(10) unsigned NOT NULL DEFAULT '0',
  `region_id` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(128) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `country_id` (`country_id`),
  KEY `name` (`name`),
  KEY `region_id` (`region_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_geo_cities`
--

LOCK TABLES `cms_geo_cities` WRITE;
/*!40000 ALTER TABLE `cms_geo_cities` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_geo_cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_geo_countries`
--

DROP TABLE IF EXISTS `cms_geo_countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_geo_countries` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL DEFAULT '',
  `alpha2` varchar(2) NOT NULL DEFAULT '',
  `alpha3` varchar(3) NOT NULL DEFAULT '',
  `iso` int(11) NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '100',
  PRIMARY KEY (`id`),
  KEY `alpha2` (`alpha2`),
  KEY `alpha3` (`alpha3`),
  KEY `iso` (`iso`),
  KEY `name` (`name`),
  KEY `ordering` (`ordering`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_geo_countries`
--

LOCK TABLES `cms_geo_countries` WRITE;
/*!40000 ALTER TABLE `cms_geo_countries` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_geo_countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_geo_regions`
--

DROP TABLE IF EXISTS `cms_geo_regions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_geo_regions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `country_id` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `country_id` (`country_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_geo_regions`
--

LOCK TABLES `cms_geo_regions` WRITE;
/*!40000 ALTER TABLE `cms_geo_regions` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_geo_regions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_menu`
--

DROP TABLE IF EXISTS `cms_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menu` tinytext NOT NULL,
  `title` varchar(200) NOT NULL DEFAULT '',
  `css_class` varchar(15) NOT NULL DEFAULT '',
  `link` varchar(200) NOT NULL DEFAULT '',
  `linktype` varchar(12) NOT NULL DEFAULT 'link',
  `linkid` varchar(25) DEFAULT '-1',
  `target` varchar(8) NOT NULL DEFAULT '_self',
  `component` varchar(100) NOT NULL DEFAULT '',
  `ordering` int(10) unsigned NOT NULL DEFAULT '1',
  `published` tinyint(1) NOT NULL DEFAULT '1',
  `template` varchar(30) NOT NULL DEFAULT '',
  `access_list` tinytext NOT NULL,
  `iconurl` varchar(100) NOT NULL DEFAULT '',
  `NSLeft` int(10) unsigned NOT NULL DEFAULT '0',
  `NSRight` int(10) unsigned NOT NULL DEFAULT '0',
  `NSLevel` int(10) unsigned NOT NULL DEFAULT '1',
  `NSDiffer` varchar(40) DEFAULT NULL,
  `NSIgnore` int(10) unsigned NOT NULL DEFAULT '1',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '1',
  `is_lax` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `NSLeft` (`NSLeft`,`NSRight`),
  KEY `parent_id` (`parent_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_menu`
--

LOCK TABLES `cms_menu` WRITE;
/*!40000 ALTER TABLE `cms_menu` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_modules`
--

DROP TABLE IF EXISTS `cms_modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_modules` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `position` varchar(20) NOT NULL DEFAULT '',
  `name` varchar(200) NOT NULL DEFAULT '',
  `title` varchar(200) NOT NULL DEFAULT '',
  `is_external` tinyint(1) NOT NULL DEFAULT '1',
  `content` text NOT NULL,
  `ordering` int(10) unsigned NOT NULL DEFAULT '1',
  `showtitle` int(11) NOT NULL DEFAULT '1',
  `published` tinyint(1) NOT NULL DEFAULT '1',
  `user` int(11) NOT NULL DEFAULT '0',
  `config` text NOT NULL,
  `original` int(11) NOT NULL DEFAULT '1',
  `css_prefix` varchar(30) NOT NULL DEFAULT '',
  `access_list` tinytext NOT NULL,
  `hidden_menu_ids` varchar(300) NOT NULL DEFAULT '',
  `cache` int(11) NOT NULL DEFAULT '0',
  `cachetime` int(11) NOT NULL DEFAULT '1',
  `cacheint` varchar(15) NOT NULL DEFAULT 'HOUR',
  `template` varchar(35) NOT NULL DEFAULT 'module.tpl',
  `is_strict_bind` tinyint(1) NOT NULL DEFAULT '0',
  `is_strict_bind_hidden` tinyint(1) NOT NULL DEFAULT '0',
  `author` varchar(100) NOT NULL DEFAULT 'InstantCMS team',
  `version` varchar(6) NOT NULL DEFAULT '1.0',
  PRIMARY KEY (`id`),
  KEY `position` (`position`),
  FULLTEXT KEY `content` (`content`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_modules`
--

LOCK TABLES `cms_modules` WRITE;
/*!40000 ALTER TABLE `cms_modules` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_modules_bind`
--

DROP TABLE IF EXISTS `cms_modules_bind`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_modules_bind` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `module_id` int(10) unsigned NOT NULL DEFAULT '1',
  `menu_id` int(10) unsigned NOT NULL DEFAULT '1',
  `position` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `menu_id` (`menu_id`),
  KEY `module_id` (`module_id`),
  KEY `position` (`position`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_modules_bind`
--

LOCK TABLES `cms_modules_bind` WRITE;
/*!40000 ALTER TABLE `cms_modules_bind` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_modules_bind` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_ns_transactions`
--

DROP TABLE IF EXISTS `cms_ns_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_ns_transactions` (
  `IDTransaction` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `TableName` tinytext,
  `Differ` tinytext,
  `InTransaction` varbinary(1) DEFAULT NULL,
  `TStamp` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`IDTransaction`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_ns_transactions`
--

LOCK TABLES `cms_ns_transactions` WRITE;
/*!40000 ALTER TABLE `cms_ns_transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_ns_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_online`
--

DROP TABLE IF EXISTS `cms_online`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_online` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ip` varchar(15) NOT NULL DEFAULT '',
  `sess_id` varchar(100) NOT NULL DEFAULT '',
  `lastdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `agent` varchar(250) NOT NULL DEFAULT '',
  `viewurl` varchar(250) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `sess_id` (`sess_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_online`
--

LOCK TABLES `cms_online` WRITE;
/*!40000 ALTER TABLE `cms_online` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_online` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_paymant_system`
--

DROP TABLE IF EXISTS `cms_paymant_system`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_paymant_system` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) DEFAULT NULL,
  `pay_class` varchar(40) NOT NULL DEFAULT '',
  `cur_sign` varchar(10) DEFAULT NULL,
  `img` text,
  `type_cy` int(11) NOT NULL,
  `internal_transfer` float NOT NULL DEFAULT '0',
  `commision` float NOT NULL DEFAULT '0',
  `priority` tinyint(4) NOT NULL,
  `priority_in` tinyint(3) unsigned DEFAULT NULL,
  `priority_out` tinyint(3) unsigned DEFAULT NULL,
  `sort` tinyint(3) unsigned DEFAULT NULL,
  `id_b` int(11) DEFAULT NULL,
  `is_visible` tinyint(1) NOT NULL DEFAULT '1',
  `letter_cod` varchar(10) NOT NULL DEFAULT '',
  `show_notice` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `auto_set_card` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `income_enabled` tinyint(1) NOT NULL DEFAULT '0',
  `outcome_enabled` tinyint(1) NOT NULL DEFAULT '0',
  `referal_output_enabled` tinyint(1) NOT NULL DEFAULT '0',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `index_cms_paymant_system_on_income_enabled` (`income_enabled`),
  KEY `index_cms_paymant_system_on_outcome_enabled` (`outcome_enabled`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_paymant_system`
--

LOCK TABLES `cms_paymant_system` WRITE;
/*!40000 ALTER TABLE `cms_paymant_system` DISABLE KEYS */;
INSERT INTO `cms_paymant_system` VALUES (1,'Russian Ruble','iconpay-rub','₽','/images/ps_ico/rub.png',1,0,0.5,1,1,1,NULL,NULL,1,'RUB',0,0,1,1,0,NULL,'2018-03-14 21:01:15','2018-03-14 21:01:15'),(2,'Американский Доллар','iconpay-usd','$','/images/ps_ico/usd.png',2,0,0.5,2,2,2,NULL,NULL,1,'USD',0,0,1,1,0,NULL,'2018-03-14 21:01:15','2018-03-14 21:01:15'),(3,'Bitcoin','iconpay-btc','B⃦','/images/ps_ico/btc.png',3,0,0.5,3,3,3,NULL,NULL,1,'BTC',0,0,1,1,0,NULL,'2018-03-14 21:01:15','2018-03-14 21:01:15'),(4,'Litecoin','iconpay-ltc',NULL,'/images/ps_ico/ltc.png',4,0,0.5,4,4,4,NULL,NULL,1,'LTC',0,0,1,1,0,NULL,'2018-03-14 21:01:15','2018-03-14 21:01:15'),(5,'Ethereum','iconpay-eth',NULL,'/images/ps_ico/eth.png',5,0,0.5,5,5,5,NULL,NULL,1,'ETH',0,0,1,1,0,NULL,'2018-03-14 21:01:15','2018-03-14 21:01:15'),(6,'Dash','iconpay-dsh',NULL,'/images/ps_ico/dsh.png',6,0,0.5,6,6,6,NULL,NULL,1,'DSH',0,0,1,1,0,NULL,'2018-03-14 21:01:15','2018-03-14 21:01:15'),(8,'Казахстанский Тэнге','iconpay-kzt','₸','/images/ps_ico/kzt.png',8,0,0.5,8,8,8,NULL,NULL,1,'KZT',0,0,1,1,0,NULL,'2018-03-14 21:01:15','2018-03-14 21:01:15'),(9,'Ripple','iconpay-xrp',NULL,'/images/ps_ico/xrp.png',9,0,0.5,9,9,9,NULL,NULL,1,'XRP',0,0,1,1,0,NULL,'2018-03-14 21:01:15','2018-03-14 21:01:15'),(10,'Ethereum Classic','iconpay-etc',NULL,'/images/ps_ico/etc.png',10,0,0.5,10,10,10,NULL,NULL,1,'ETC',0,0,1,1,0,NULL,'2018-03-14 21:01:16','2018-03-14 21:01:16'),(11,'Monery','iconpay-xmr',NULL,'/images/ps_ico/xmr.png',11,0,0.5,11,11,11,NULL,NULL,1,'XMR',0,0,1,1,0,NULL,'2018-03-14 21:01:16','2018-03-14 21:01:16'),(12,'Bitcoin Cash','iconpay-bch',NULL,'/images/ps_ico/bch.png',12,0,0.5,12,12,12,NULL,NULL,1,'BCH',0,0,1,1,0,NULL,'2018-03-14 21:01:16','2018-03-14 21:01:16');
/*!40000 ALTER TABLE `cms_paymant_system` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_photo_albums`
--

DROP TABLE IF EXISTS `cms_photo_albums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_photo_albums` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL DEFAULT '1',
  `ordering` int(10) unsigned NOT NULL DEFAULT '1',
  `NSLeft` int(10) unsigned NOT NULL DEFAULT '0',
  `NSRight` int(10) unsigned NOT NULL DEFAULT '0',
  `NSDiffer` varchar(15) NOT NULL DEFAULT '',
  `NSIgnore` int(10) unsigned NOT NULL DEFAULT '1',
  `NSLevel` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(100) NOT NULL DEFAULT '',
  `description` varchar(300) NOT NULL DEFAULT '',
  `published` tinyint(1) NOT NULL DEFAULT '1',
  `showdate` tinyint(1) NOT NULL DEFAULT '1',
  `iconurl` varchar(100) NOT NULL DEFAULT '',
  `pubdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `orderby` varchar(20) NOT NULL DEFAULT 'title',
  `orderto` varchar(4) NOT NULL DEFAULT 'asc',
  `public` tinyint(1) NOT NULL DEFAULT '1',
  `perpage` int(11) NOT NULL DEFAULT '15',
  `cssprefix` varchar(20) NOT NULL DEFAULT '',
  `thumb1` int(11) NOT NULL DEFAULT '96',
  `thumb2` int(11) NOT NULL DEFAULT '480',
  `thumbsqr` tinyint(1) NOT NULL DEFAULT '1',
  `showtype` varchar(10) NOT NULL DEFAULT 'lightbox',
  `nav` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `uplimit` int(10) unsigned NOT NULL DEFAULT '1',
  `maxcols` int(10) unsigned NOT NULL DEFAULT '4',
  `orderform` tinyint(1) NOT NULL DEFAULT '1',
  `showtags` tinyint(1) NOT NULL DEFAULT '1',
  `bbcode` tinyint(1) NOT NULL DEFAULT '1',
  `user_id` int(11) NOT NULL DEFAULT '1',
  `is_comments` tinyint(1) NOT NULL DEFAULT '0',
  `pagetitle` varchar(200) NOT NULL DEFAULT '',
  `meta_keys` varchar(250) NOT NULL DEFAULT '',
  `meta_desc` varchar(250) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `NSLeft` (`NSLeft`,`NSRight`),
  KEY `parent_id` (`parent_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_photo_albums`
--

LOCK TABLES `cms_photo_albums` WRITE;
/*!40000 ALTER TABLE `cms_photo_albums` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_photo_albums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_photo_files`
--

DROP TABLE IF EXISTS `cms_photo_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_photo_files` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `album_id` int(10) unsigned NOT NULL DEFAULT '1',
  `title` varchar(200) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `pubdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `file` varchar(200) NOT NULL DEFAULT '',
  `published` tinyint(1) NOT NULL DEFAULT '1',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `showdate` tinyint(1) NOT NULL DEFAULT '1',
  `comments` tinyint(1) NOT NULL DEFAULT '1',
  `user_id` int(10) unsigned NOT NULL DEFAULT '1',
  `owner` varchar(10) DEFAULT 'photos',
  `rating` int(11) NOT NULL DEFAULT '0',
  `pagetitle` varchar(200) NOT NULL DEFAULT '',
  `meta_keys` varchar(250) NOT NULL DEFAULT '',
  `meta_desc` varchar(250) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `album_id` (`album_id`),
  KEY `owner` (`owner`),
  KEY `user_id` (`user_id`),
  FULLTEXT KEY `title` (`title`,`description`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_photo_files`
--

LOCK TABLES `cms_photo_files` WRITE;
/*!40000 ALTER TABLE `cms_photo_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_photo_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_plugins`
--

DROP TABLE IF EXISTS `cms_plugins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_plugins` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `plugin` varchar(30) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `author` varchar(255) NOT NULL DEFAULT '',
  `version` varchar(15) NOT NULL DEFAULT '',
  `plugin_type` varchar(10) NOT NULL DEFAULT '',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `config` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_plugins`
--

LOCK TABLES `cms_plugins` WRITE;
/*!40000 ALTER TABLE `cms_plugins` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_plugins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_polls`
--

DROP TABLE IF EXISTS `cms_polls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_polls` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL DEFAULT '',
  `pubdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `answers` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_polls`
--

LOCK TABLES `cms_polls` WRITE;
/*!40000 ALTER TABLE `cms_polls` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_polls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_polls_log`
--

DROP TABLE IF EXISTS `cms_polls_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_polls_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `poll_id` int(10) unsigned NOT NULL DEFAULT '1',
  `answer` varchar(300) NOT NULL DEFAULT '',
  `user_id` int(10) unsigned NOT NULL DEFAULT '1',
  `ip` varchar(15) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `ip` (`ip`),
  KEY `poll_id` (`poll_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_polls_log`
--

LOCK TABLES `cms_polls_log` WRITE;
/*!40000 ALTER TABLE `cms_polls_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_polls_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_rate_money`
--

DROP TABLE IF EXISTS `cms_rate_money`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_rate_money` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `value` float NOT NULL DEFAULT '0',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `date_str` varchar(25) DEFAULT NULL,
  `value_sell` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `date_str` (`date_str`),
  KEY `status` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_rate_money`
--

LOCK TABLES `cms_rate_money` WRITE;
/*!40000 ALTER TABLE `cms_rate_money` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_rate_money` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_rating_targets`
--

DROP TABLE IF EXISTS `cms_rating_targets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_rating_targets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `target` varchar(32) NOT NULL DEFAULT '',
  `component` varchar(32) NOT NULL DEFAULT '',
  `is_user_affect` tinyint(4) NOT NULL DEFAULT '0',
  `user_weight` smallint(5) unsigned NOT NULL DEFAULT '0',
  `target_table` varchar(32) NOT NULL DEFAULT '',
  `target_title` varchar(70) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `target` (`target`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_rating_targets`
--

LOCK TABLES `cms_rating_targets` WRITE;
/*!40000 ALTER TABLE `cms_rating_targets` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_rating_targets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_ratings`
--

DROP TABLE IF EXISTS `cms_ratings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_ratings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` int(10) unsigned NOT NULL DEFAULT '0',
  `points` int(10) unsigned NOT NULL DEFAULT '0',
  `ip` varchar(20) NOT NULL DEFAULT '',
  `target` varchar(20) NOT NULL DEFAULT '',
  `user_id` int(10) unsigned NOT NULL DEFAULT '1',
  `pubdate` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ip` (`item_id`,`target`,`ip`),
  KEY `item_id` (`item_id`,`target`,`user_id`),
  KEY `user_id` (`user_id`,`target`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_ratings`
--

LOCK TABLES `cms_ratings` WRITE;
/*!40000 ALTER TABLE `cms_ratings` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_ratings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_ratings_total`
--

DROP TABLE IF EXISTS `cms_ratings_total`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_ratings_total` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `target` varchar(32) NOT NULL DEFAULT '',
  `item_id` mediumint(8) unsigned NOT NULL,
  `total_rating` int(11) NOT NULL DEFAULT '0',
  `total_votes` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `item_id` (`item_id`,`target`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_ratings_total`
--

LOCK TABLES `cms_ratings_total` WRITE;
/*!40000 ALTER TABLE `cms_ratings_total` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_ratings_total` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_referrals_history`
--

DROP TABLE IF EXISTS `cms_referrals_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_referrals_history` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_referrals_list` int(11) DEFAULT NULL,
  `id_ticket` int(11) DEFAULT NULL,
  `id_ps1` int(11) NOT NULL,
  `sum_total` float DEFAULT NULL,
  `sum_ref` float DEFAULT NULL,
  `sum_win` float DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `outputticket` bigint(20) unsigned NOT NULL DEFAULT '0',
  `tempticket` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_rails_96119f60db` (`id_ps1`),
  KEY `id_referrals_list` (`id_referrals_list`),
  KEY `outputticket` (`outputticket`),
  KEY `status` (`status`),
  CONSTRAINT `fk_rails_96119f60db` FOREIGN KEY (`id_ps1`) REFERENCES `cms_paymant_system` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_referrals_history`
--

LOCK TABLES `cms_referrals_history` WRITE;
/*!40000 ALTER TABLE `cms_referrals_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_referrals_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_referrals_list`
--

DROP TABLE IF EXISTS `cms_referrals_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_referrals_list` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_user` int(10) unsigned NOT NULL DEFAULT '1',
  `id_refferal` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `id_refferal` (`id_refferal`),
  KEY `id_user` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_referrals_list`
--

LOCK TABLES `cms_referrals_list` WRITE;
/*!40000 ALTER TABLE `cms_referrals_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_referrals_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_requests_to_reserve`
--

DROP TABLE IF EXISTS `cms_requests_to_reserve`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_requests_to_reserve` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_ps` int(11) NOT NULL,
  `phone` varchar(40) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `amount` float DEFAULT NULL,
  `operation_date` datetime DEFAULT NULL,
  `notification_phone` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `notification_email` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_rails_3c6ef2501a` (`id_ps`),
  KEY `status` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_requests_to_reserve`
--

LOCK TABLES `cms_requests_to_reserve` WRITE;
/*!40000 ALTER TABLE `cms_requests_to_reserve` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_requests_to_reserve` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_reserves_update`
--

DROP TABLE IF EXISTS `cms_reserves_update`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_reserves_update` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ticket_id` int(10) unsigned NOT NULL DEFAULT '1',
  `emoney_id1` int(10) unsigned NOT NULL DEFAULT '1',
  `emoney_id2` int(10) unsigned NOT NULL DEFAULT '1',
  `amount` float DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `emoney_id2` (`emoney_id2`),
  KEY `ticket_id` (`ticket_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_reserves_update`
--

LOCK TABLES `cms_reserves_update` WRITE;
/*!40000 ALTER TABLE `cms_reserves_update` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_reserves_update` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_search`
--

DROP TABLE IF EXISTS `cms_search`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_search` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `session_id` varchar(100) NOT NULL DEFAULT '',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `pubdate` datetime DEFAULT NULL,
  `title` varchar(250) NOT NULL DEFAULT '',
  `description` varchar(500) NOT NULL DEFAULT '',
  `link` varchar(200) NOT NULL DEFAULT '',
  `place` varchar(100) NOT NULL DEFAULT '',
  `placelink` varchar(200) NOT NULL DEFAULT '',
  `imageurl` varchar(150) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `date` (`date`),
  KEY `session_id` (`session_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_search`
--

LOCK TABLES `cms_search` WRITE;
/*!40000 ALTER TABLE `cms_search` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_search` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_seo_page`
--

DROP TABLE IF EXISTS `cms_seo_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_seo_page` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `note` text NOT NULL,
  `component` varchar(50) NOT NULL DEFAULT '',
  `request_uri` varchar(200) NOT NULL DEFAULT '',
  `target_uri` varchar(200) NOT NULL DEFAULT '',
  `page_title` varchar(200) NOT NULL DEFAULT '',
  `meta_desc` text NOT NULL,
  `meta_keys` text NOT NULL,
  `published` int(11) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `request` (`request_uri`),
  KEY `target` (`target_uri`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_seo_page`
--

LOCK TABLES `cms_seo_page` WRITE;
/*!40000 ALTER TABLE `cms_seo_page` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_seo_page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_subscribe`
--

DROP TABLE IF EXISTS `cms_subscribe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_subscribe` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '1',
  `target` varchar(20) NOT NULL DEFAULT '',
  `target_id` int(10) unsigned NOT NULL DEFAULT '0',
  `pubdate` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `target_id` (`target_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_subscribe`
--

LOCK TABLES `cms_subscribe` WRITE;
/*!40000 ALTER TABLE `cms_subscribe` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_subscribe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_tag_targets`
--

DROP TABLE IF EXISTS `cms_tag_targets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_tag_targets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `target` varchar(32) NOT NULL DEFAULT '',
  `component` varchar(32) NOT NULL DEFAULT '',
  `title` varchar(70) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `target` (`target`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_tag_targets`
--

LOCK TABLES `cms_tag_targets` WRITE;
/*!40000 ALTER TABLE `cms_tag_targets` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_tag_targets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_tags`
--

DROP TABLE IF EXISTS `cms_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tag` varchar(250) NOT NULL DEFAULT '',
  `target` varchar(25) NOT NULL DEFAULT '',
  `item_id` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `item_id` (`item_id`),
  KEY `tag` (`tag`),
  KEY `target` (`target`,`tag`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_tags`
--

LOCK TABLES `cms_tags` WRITE;
/*!40000 ALTER TABLE `cms_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_transfer`
--

DROP TABLE IF EXISTS `cms_transfer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_transfer` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `emoney` varchar(100) NOT NULL DEFAULT '',
  `id_user` int(10) unsigned NOT NULL DEFAULT '1',
  `id_operator` int(10) unsigned NOT NULL DEFAULT '0',
  `id_ps1` int(11) DEFAULT NULL,
  `id_ps2` int(11) NOT NULL,
  `num_ps1` varchar(110) DEFAULT NULL,
  `num_ps2` varchar(110) DEFAULT NULL,
  `operation_date` datetime DEFAULT NULL,
  `amount_transfer` float DEFAULT NULL,
  `transfer_fee` float DEFAULT NULL,
  `status1` int(11) NOT NULL DEFAULT '0',
  `status2` int(11) NOT NULL DEFAULT '0',
  `dollar_rate` float DEFAULT NULL,
  `id_ps_company` int(11) DEFAULT NULL,
  `cause_text` text,
  `notification` int(11) DEFAULT NULL,
  `text` text NOT NULL,
  `isreferaloutput` int(11) NOT NULL DEFAULT '0',
  `intr_tran_sum` float NOT NULL DEFAULT '0',
  `id_in_unixtime` bigint(20) unsigned NOT NULL,
  `fio_a` varchar(100) NOT NULL DEFAULT '',
  `fio_b` varchar(100) NOT NULL DEFAULT '',
  `unk_a` varchar(100) NOT NULL DEFAULT '',
  `unk_b` varchar(100) NOT NULL DEFAULT '',
  `check_number` text,
  `check_pin` varchar(200) NOT NULL DEFAULT '',
  `check_number_b` text,
  `check_pin_b` varchar(200) NOT NULL DEFAULT '',
  `click` tinyint(1) NOT NULL DEFAULT '0',
  `result` int(11) NOT NULL DEFAULT '0',
  `new_hash` int(11) NOT NULL,
  `email` varchar(100) NOT NULL DEFAULT '',
  `emoney_id1` int(10) unsigned NOT NULL DEFAULT '0',
  `emoney_id2` int(10) unsigned NOT NULL DEFAULT '0',
  `comi_tran_sum` float NOT NULL DEFAULT '0',
  `income_corp` float NOT NULL DEFAULT '0',
  `kurs` varchar(40) NOT NULL,
  `id_store` int(11) NOT NULL DEFAULT '0',
  `product_data` text,
  `id_transit` int(11) NOT NULL DEFAULT '0',
  `store_type_cy` int(11) NOT NULL DEFAULT '0',
  `bank_b` varchar(40) NOT NULL DEFAULT '',
  `new_user` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `do_verification` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `id_telegram` bigint(20) unsigned DEFAULT NULL,
  `chash` varchar(32) NOT NULL,
  `direction_rate_id` bigint(20) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `outcome_amount` double DEFAULT NULL,
  `direction_rates_id` bigint(20) DEFAULT NULL,
  `metadata` json DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_cms_transfer_on_direction_rate_id` (`direction_rate_id`),
  KEY `index_cms_transfer_on_direction_rates_id` (`direction_rates_id`),
  KEY `id_in_unixtime` (`id_in_unixtime`),
  KEY `fk_rails_51476cd746` (`id_ps1`),
  KEY `fk_rails_605240515b` (`id_ps2`),
  KEY `fk_rails_954e6ff79a` (`id_ps_company`),
  KEY `status2` (`status2`),
  CONSTRAINT `fk_rails_51476cd746` FOREIGN KEY (`id_ps1`) REFERENCES `cms_paymant_system` (`id`),
  CONSTRAINT `fk_rails_605240515b` FOREIGN KEY (`id_ps2`) REFERENCES `cms_paymant_system` (`id`),
  CONSTRAINT `fk_rails_954e6ff79a` FOREIGN KEY (`id_ps_company`) REFERENCES `cms_paymant_system` (`id`),
  CONSTRAINT `fk_rails_ff0a1a2320` FOREIGN KEY (`direction_rate_id`) REFERENCES `direction_rates` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_transfer`
--

LOCK TABLES `cms_transfer` WRITE;
/*!40000 ALTER TABLE `cms_transfer` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_transfer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_uc_cart`
--

DROP TABLE IF EXISTS `cms_uc_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_uc_cart` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '1',
  `session_id` varchar(50) NOT NULL DEFAULT '',
  `item_id` int(10) unsigned NOT NULL DEFAULT '1',
  `pubdate` datetime NOT NULL,
  `itemscount` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_uc_cart`
--

LOCK TABLES `cms_uc_cart` WRITE;
/*!40000 ALTER TABLE `cms_uc_cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_uc_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_uc_cats`
--

DROP TABLE IF EXISTS `cms_uc_cats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_uc_cats` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(200) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '1',
  `fieldsstruct` text,
  `view_type` varchar(20) NOT NULL DEFAULT 'list',
  `fields_show` int(11) NOT NULL DEFAULT '10',
  `showmore` tinyint(1) NOT NULL DEFAULT '1',
  `perpage` int(11) NOT NULL DEFAULT '20',
  `showtags` tinyint(1) NOT NULL DEFAULT '1',
  `showsort` tinyint(1) NOT NULL DEFAULT '1',
  `is_ratings` tinyint(1) NOT NULL DEFAULT '0',
  `orderby` varchar(12) NOT NULL DEFAULT 'pubdate',
  `orderto` varchar(10) DEFAULT 'desc',
  `showabc` tinyint(1) NOT NULL DEFAULT '1',
  `shownew` tinyint(1) NOT NULL DEFAULT '1',
  `newint` varchar(100) NOT NULL DEFAULT '',
  `filters` int(11) NOT NULL DEFAULT '0',
  `is_shop` tinyint(1) NOT NULL DEFAULT '0',
  `NSLeft` int(10) unsigned NOT NULL DEFAULT '0',
  `NSRight` int(10) unsigned NOT NULL DEFAULT '0',
  `NSLevel` int(10) unsigned NOT NULL DEFAULT '1',
  `NSDiffer` int(10) unsigned NOT NULL DEFAULT '0',
  `NSIgnore` int(10) unsigned NOT NULL DEFAULT '1',
  `ordering` int(10) unsigned NOT NULL DEFAULT '1',
  `is_public` tinyint(1) NOT NULL DEFAULT '1',
  `can_edit` tinyint(1) NOT NULL DEFAULT '0',
  `cost` varchar(5) NOT NULL DEFAULT '',
  `pagetitle` varchar(200) NOT NULL DEFAULT '',
  `meta_keys` varchar(250) NOT NULL DEFAULT '',
  `meta_desc` varchar(250) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `NSLeft` (`NSLeft`,`NSRight`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_uc_cats`
--

LOCK TABLES `cms_uc_cats` WRITE;
/*!40000 ALTER TABLE `cms_uc_cats` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_uc_cats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_uc_cats_access`
--

DROP TABLE IF EXISTS `cms_uc_cats_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_uc_cats_access` (
  `cat_id` int(10) unsigned NOT NULL DEFAULT '1',
  `group_id` int(10) unsigned NOT NULL DEFAULT '1',
  KEY `cat_id` (`cat_id`,`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_uc_cats_access`
--

LOCK TABLES `cms_uc_cats_access` WRITE;
/*!40000 ALTER TABLE `cms_uc_cats_access` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_uc_cats_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_uc_discount`
--

DROP TABLE IF EXISTS `cms_uc_discount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_uc_discount` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(150) NOT NULL DEFAULT '',
  `cat_id` int(10) unsigned NOT NULL DEFAULT '1',
  `sign` tinyint(4) NOT NULL DEFAULT '0',
  `value` float NOT NULL DEFAULT '0',
  `unit` varchar(10) NOT NULL DEFAULT '',
  `if_limit` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `cat_id` (`cat_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_uc_discount`
--

LOCK TABLES `cms_uc_discount` WRITE;
/*!40000 ALTER TABLE `cms_uc_discount` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_uc_discount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_uc_items`
--

DROP TABLE IF EXISTS `cms_uc_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_uc_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(10) unsigned NOT NULL DEFAULT '1',
  `title` varchar(200) NOT NULL DEFAULT '',
  `pubdate` datetime NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '1',
  `imageurl` varchar(200) NOT NULL DEFAULT '',
  `fieldsdata` text NOT NULL,
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `is_comments` tinyint(1) NOT NULL DEFAULT '0',
  `tags` varchar(200) NOT NULL DEFAULT '',
  `rating` float NOT NULL DEFAULT '0',
  `meta_desc` varchar(250) NOT NULL DEFAULT '',
  `meta_keys` varchar(250) NOT NULL DEFAULT '',
  `price` float NOT NULL DEFAULT '0',
  `canmany` int(11) NOT NULL DEFAULT '0',
  `user_id` int(10) unsigned NOT NULL DEFAULT '1',
  `on_moderate` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  FULLTEXT KEY `title` (`title`,`fieldsdata`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_uc_items`
--

LOCK TABLES `cms_uc_items` WRITE;
/*!40000 ALTER TABLE `cms_uc_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_uc_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_uc_ratings`
--

DROP TABLE IF EXISTS `cms_uc_ratings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_uc_ratings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` int(10) unsigned NOT NULL DEFAULT '0',
  `points` int(11) NOT NULL DEFAULT '0',
  `ip` varchar(16) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_uc_ratings`
--

LOCK TABLES `cms_uc_ratings` WRITE;
/*!40000 ALTER TABLE `cms_uc_ratings` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_uc_ratings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_uc_tags`
--

DROP TABLE IF EXISTS `cms_uc_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_uc_tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tag` varchar(200) NOT NULL DEFAULT '',
  `item_id` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_uc_tags`
--

LOCK TABLES `cms_uc_tags` WRITE;
/*!40000 ALTER TABLE `cms_uc_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_uc_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_upload_images`
--

DROP TABLE IF EXISTS `cms_upload_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_upload_images` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `target_id` int(10) unsigned NOT NULL DEFAULT '0',
  `session_id` varchar(50) NOT NULL DEFAULT '',
  `fileurl` varchar(250) NOT NULL DEFAULT '',
  `target` varchar(25) NOT NULL DEFAULT '',
  `component` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `session_id` (`session_id`),
  KEY `target_id` (`target_id`,`target`,`component`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_upload_images`
--

LOCK TABLES `cms_upload_images` WRITE;
/*!40000 ALTER TABLE `cms_upload_images` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_upload_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_user_albums`
--

DROP TABLE IF EXISTS `cms_user_albums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_user_albums` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '1',
  `title` varchar(100) NOT NULL DEFAULT '',
  `pubdate` datetime NOT NULL,
  `allow_who` varchar(10) NOT NULL DEFAULT '',
  `description` varchar(200) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `allow_who` (`allow_who`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_user_albums`
--

LOCK TABLES `cms_user_albums` WRITE;
/*!40000 ALTER TABLE `cms_user_albums` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_user_albums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_user_autoawards`
--

DROP TABLE IF EXISTS `cms_user_autoawards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_user_autoawards` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL DEFAULT '',
  `description` varchar(200) NOT NULL DEFAULT '',
  `imageurl` varchar(200) NOT NULL DEFAULT '',
  `p_comment` int(11) NOT NULL DEFAULT '0',
  `p_blog` int(11) NOT NULL DEFAULT '0',
  `p_forum` int(11) NOT NULL DEFAULT '0',
  `p_photo` int(11) NOT NULL DEFAULT '0',
  `p_privphoto` int(11) DEFAULT NULL,
  `p_content` int(11) NOT NULL DEFAULT '0',
  `p_karma` int(11) NOT NULL DEFAULT '0',
  `published` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_user_autoawards`
--

LOCK TABLES `cms_user_autoawards` WRITE;
/*!40000 ALTER TABLE `cms_user_autoawards` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_user_autoawards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_user_awards`
--

DROP TABLE IF EXISTS `cms_user_awards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_user_awards` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '1',
  `pubdate` datetime NOT NULL,
  `title` varchar(250) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `imageurl` varchar(100) NOT NULL DEFAULT '',
  `from_id` int(10) unsigned NOT NULL DEFAULT '1',
  `award_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_user_awards`
--

LOCK TABLES `cms_user_awards` WRITE;
/*!40000 ALTER TABLE `cms_user_awards` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_user_awards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_user_clubs`
--

DROP TABLE IF EXISTS `cms_user_clubs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_user_clubs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '1',
  `club_id` int(10) unsigned NOT NULL DEFAULT '0',
  `role` varchar(20) NOT NULL DEFAULT 'member',
  `pubdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `club_id` (`club_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_user_clubs`
--

LOCK TABLES `cms_user_clubs` WRITE;
/*!40000 ALTER TABLE `cms_user_clubs` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_user_clubs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_user_files`
--

DROP TABLE IF EXISTS `cms_user_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_user_files` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '1',
  `filename` varchar(250) NOT NULL DEFAULT '',
  `pubdate` datetime NOT NULL,
  `allow_who` varchar(50) NOT NULL DEFAULT '',
  `filesize` int(10) unsigned NOT NULL DEFAULT '0',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_user_files`
--

LOCK TABLES `cms_user_files` WRITE;
/*!40000 ALTER TABLE `cms_user_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_user_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_user_friends`
--

DROP TABLE IF EXISTS `cms_user_friends`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_user_friends` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `to_id` int(10) unsigned NOT NULL DEFAULT '0',
  `from_id` int(10) unsigned NOT NULL DEFAULT '0',
  `logdate` datetime NOT NULL,
  `is_accepted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `from_id` (`from_id`),
  KEY `to_id` (`to_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_user_friends`
--

LOCK TABLES `cms_user_friends` WRITE;
/*!40000 ALTER TABLE `cms_user_friends` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_user_friends` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_user_groups`
--

DROP TABLE IF EXISTS `cms_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_user_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL DEFAULT '',
  `alias` varchar(100) NOT NULL DEFAULT '',
  `is_admin` tinyint(1) NOT NULL DEFAULT '0',
  `access` text NOT NULL,
  `is_operator` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_user_groups`
--

LOCK TABLES `cms_user_groups` WRITE;
/*!40000 ALTER TABLE `cms_user_groups` DISABLE KEYS */;
INSERT INTO `cms_user_groups` VALUES (1,'Пользователи','registered',0,'',0),(2,'Администраторы','admin',1,'admin/menu,admin/modules,admin/content,admin/plugins,admin/filters,admin/components,admin/users,admin/config,admin/com_rssfeed,admin/com_seo_page,admin/com_arhive,admin/com_banners,admin/com_blogs,admin/com_faq,admin/com_geo,admin/com_polls,admin/com_board,admin/com_content,admin/com_clubs,admin/com_comments,admin/com_forms,admin/com_actions,admin/com_autoawards,admin/com_search,admin/com_users,admin/com_registration,admin/com_catalog,admin/com_forum,admin/com_photos',1),(8,'Гости','guest',0,'',0),(7,'Редакторы','editors',0,'comments/add, comments/delete, content/add, content/autoadd, content/delete',0),(9,'Модераторы','moderators',0,'comments/add, comments/delete, comments/moderate, forum/moderate, content/add',0),(10,'Операторы','operator',0,'',1),(11,'Публикаторы','Publikators',0,'',0),(3,'Без рассылкиэ','eccentric',0,'',0);
/*!40000 ALTER TABLE `cms_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_user_groups_access`
--

DROP TABLE IF EXISTS `cms_user_groups_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_user_groups_access` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `access_type` varchar(60) NOT NULL DEFAULT '',
  `access_name` varchar(100) NOT NULL DEFAULT '',
  `hide_for_guest` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `access_type` (`access_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_user_groups_access`
--

LOCK TABLES `cms_user_groups_access` WRITE;
/*!40000 ALTER TABLE `cms_user_groups_access` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_user_groups_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_user_invites`
--

DROP TABLE IF EXISTS `cms_user_invites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_user_invites` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(32) NOT NULL DEFAULT '',
  `owner_id` int(10) unsigned NOT NULL DEFAULT '1',
  `createdate` datetime NOT NULL,
  `is_used` tinyint(1) NOT NULL DEFAULT '0',
  `is_sended` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `code` (`code`,`owner_id`,`is_used`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_user_invites`
--

LOCK TABLES `cms_user_invites` WRITE;
/*!40000 ALTER TABLE `cms_user_invites` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_user_invites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_user_karma`
--

DROP TABLE IF EXISTS `cms_user_karma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_user_karma` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '1',
  `sender_id` int(10) unsigned NOT NULL DEFAULT '1',
  `points` smallint(6) NOT NULL DEFAULT '0',
  `senddate` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_user_karma`
--

LOCK TABLES `cms_user_karma` WRITE;
/*!40000 ALTER TABLE `cms_user_karma` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_user_karma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_user_msg`
--

DROP TABLE IF EXISTS `cms_user_msg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_user_msg` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `to_id` int(10) unsigned NOT NULL DEFAULT '1',
  `from_id` int(11) NOT NULL DEFAULT '1',
  `senddate` datetime NOT NULL,
  `is_new` tinyint(1) NOT NULL DEFAULT '1',
  `message` text NOT NULL,
  `to_del` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `from_del` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `from_del` (`from_del`),
  KEY `from_id` (`from_id`),
  KEY `to_del` (`to_del`),
  KEY `to_id` (`to_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_user_msg`
--

LOCK TABLES `cms_user_msg` WRITE;
/*!40000 ALTER TABLE `cms_user_msg` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_user_msg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_user_photos`
--

DROP TABLE IF EXISTS `cms_user_photos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_user_photos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '1',
  `album_id` int(10) unsigned NOT NULL DEFAULT '1',
  `pubdate` datetime NOT NULL,
  `title` varchar(250) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `allow_who` varchar(15) NOT NULL DEFAULT '',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `imageurl` varchar(250) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `album_id` (`album_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_user_photos`
--

LOCK TABLES `cms_user_photos` WRITE;
/*!40000 ALTER TABLE `cms_user_photos` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_user_photos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_user_profiles`
--

DROP TABLE IF EXISTS `cms_user_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_user_profiles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '1',
  `city` varchar(250) NOT NULL DEFAULT '',
  `description` varchar(500) NOT NULL DEFAULT '',
  `showmail` tinyint(1) NOT NULL DEFAULT '0',
  `showbirth` tinyint(1) NOT NULL DEFAULT '0',
  `showicq` tinyint(1) NOT NULL DEFAULT '0',
  `karma` int(11) NOT NULL DEFAULT '0',
  `imageurl` varchar(250) NOT NULL DEFAULT '',
  `allow_who` varchar(35) NOT NULL DEFAULT 'all',
  `signature` varchar(240) NOT NULL DEFAULT '',
  `signature_html` varchar(300) NOT NULL DEFAULT '',
  `gender` varchar(1) NOT NULL DEFAULT '',
  `formsdata` varchar(800) NOT NULL DEFAULT '',
  `email_newmsg` int(11) NOT NULL DEFAULT '1',
  `cm_subscribe` varchar(4) NOT NULL DEFAULT 'both',
  `stats` varchar(500) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `city` (`city`),
  KEY `description` (`description`(333)),
  KEY `formsdata` (`formsdata`(333)),
  KEY `gender` (`gender`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_user_profiles`
--

LOCK TABLES `cms_user_profiles` WRITE;
/*!40000 ALTER TABLE `cms_user_profiles` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_user_profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_user_wall`
--

DROP TABLE IF EXISTS `cms_user_wall`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_user_wall` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '1',
  `author_id` int(10) unsigned NOT NULL DEFAULT '1',
  `pubdate` datetime NOT NULL,
  `content` text NOT NULL,
  `usertype` varchar(8) NOT NULL DEFAULT 'users',
  PRIMARY KEY (`id`),
  KEY `author_id` (`author_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_user_wall`
--

LOCK TABLES `cms_user_wall` WRITE;
/*!40000 ALTER TABLE `cms_user_wall` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_user_wall` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_users`
--

DROP TABLE IF EXISTS `cms_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `group_id` int(10) unsigned NOT NULL DEFAULT '1',
  `login` varchar(100) DEFAULT NULL,
  `nickname` varchar(100) NOT NULL DEFAULT '',
  `password` varchar(60) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `icq` varchar(15) NOT NULL DEFAULT '',
  `regdate` datetime NOT NULL,
  `logdate` datetime NOT NULL,
  `birthdate` date NOT NULL,
  `is_locked` tinyint(1) NOT NULL DEFAULT '0',
  `is_locked2` tinyint(4) NOT NULL DEFAULT '0',
  `is_deleted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_logged_once` tinyint(1) NOT NULL DEFAULT '0',
  `rating` int(11) NOT NULL DEFAULT '0',
  `points` int(10) unsigned NOT NULL DEFAULT '0',
  `last_ip` varchar(15) NOT NULL DEFAULT '',
  `status` varchar(255) NOT NULL DEFAULT '',
  `status_date` datetime DEFAULT NULL,
  `invited_by` int(11) DEFAULT NULL,
  `invdate` datetime DEFAULT NULL,
  `openid` varchar(250) DEFAULT NULL,
  `referal_hash` varchar(32) DEFAULT NULL,
  `count_jump` int(11) NOT NULL DEFAULT '0',
  `pct_win` float NOT NULL DEFAULT '5',
  `pct_ref` float NOT NULL DEFAULT '0.5',
  `yd_ft_tr` tinyint(1) NOT NULL DEFAULT '1',
  `track_id` int(11) NOT NULL DEFAULT '0',
  `id_store` int(11) NOT NULL DEFAULT '0',
  `store_status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `pct_store` float NOT NULL DEFAULT '0',
  `safe_numps` tinyint(1) NOT NULL DEFAULT '1',
  `id_device` text,
  `w_count` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `failed_logins_count` int(11) DEFAULT '0',
  `lock_expires_at` datetime DEFAULT NULL,
  `unlock_token` varchar(255) DEFAULT NULL,
  `last_login_at` datetime DEFAULT NULL,
  `last_logout_at` datetime DEFAULT NULL,
  `last_activity_at` datetime DEFAULT NULL,
  `last_login_from_ip_address` varchar(255) DEFAULT NULL,
  `activation_state` varchar(255) DEFAULT NULL,
  `activation_token` varchar(255) DEFAULT NULL,
  `activation_token_expires_at` datetime DEFAULT NULL,
  `referer_hash` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `login` (`login`),
  UNIQUE KEY `referal_hash` (`referal_hash`),
  KEY `index_cms_users_on_activation_token` (`activation_token`),
  KEY `birthdate` (`birthdate`),
  KEY `email` (`email`),
  KEY `group_id` (`group_id`),
  KEY `invited_by` (`invited_by`),
  KEY `is_deleted` (`is_deleted`),
  KEY `index_cms_users_on_last_logout_at_and_last_activity_at` (`last_logout_at`,`last_activity_at`),
  KEY `openid` (`openid`),
  KEY `store_status` (`store_status`),
  KEY `index_cms_users_on_unlock_token` (`unlock_token`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_users`
--

LOCK TABLES `cms_users` WRITE;
/*!40000 ALTER TABLE `cms_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_users_activate`
--

DROP TABLE IF EXISTS `cms_users_activate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_users_activate` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pubdate` datetime NOT NULL,
  `user_id` int(10) unsigned NOT NULL DEFAULT '1',
  `code` varchar(50) NOT NULL DEFAULT '',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_users_activate`
--

LOCK TABLES `cms_users_activate` WRITE;
/*!40000 ALTER TABLE `cms_users_activate` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_users_activate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_verification`
--

DROP TABLE IF EXISTS `cms_verification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_verification` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_in_unixtime` bigint(20) unsigned NOT NULL,
  `image` varchar(300) NOT NULL DEFAULT '',
  `id_ps` int(11) NOT NULL,
  `num_ps` varchar(40) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `date` datetime NOT NULL,
  `text` varchar(300) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `id_user` int(11) DEFAULT NULL,
  `pass` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_rails_0b80f9bdd3` (`id_ps`),
  KEY `status` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_verification`
--

LOCK TABLES `cms_verification` WRITE;
/*!40000 ALTER TABLE `cms_verification` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_verification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cross_rate_modes`
--

DROP TABLE IF EXISTS `cross_rate_modes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cross_rate_modes` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `currency_rate_mode_id` bigint(20) NOT NULL,
  `cur_from` varchar(255) NOT NULL,
  `cur_to` varchar(255) NOT NULL,
  `rate_source_id` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_cross_rate_modes_on_currency_rate_mode_id` (`currency_rate_mode_id`),
  KEY `index_cross_rate_modes_on_rate_source_id` (`rate_source_id`),
  CONSTRAINT `fk_rails_a5262c25d2` FOREIGN KEY (`currency_rate_mode_id`) REFERENCES `currency_rate_modes` (`id`),
  CONSTRAINT `fk_rails_b744cf3ff9` FOREIGN KEY (`rate_source_id`) REFERENCES `rate_sources` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cross_rate_modes`
--

LOCK TABLES `cross_rate_modes` WRITE;
/*!40000 ALTER TABLE `cross_rate_modes` DISABLE KEYS */;
/*!40000 ALTER TABLE `cross_rate_modes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currency_rate_history_intervals`
--

DROP TABLE IF EXISTS `currency_rate_history_intervals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `currency_rate_history_intervals` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cur_from_id` tinyint(4) NOT NULL,
  `cur_to_id` tinyint(4) NOT NULL,
  `min_rate` float NOT NULL,
  `avg_rate` float NOT NULL,
  `max_rate` float NOT NULL,
  `at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `crhi_unique_index` (`cur_from_id`,`cur_to_id`,`at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currency_rate_history_intervals`
--

LOCK TABLES `currency_rate_history_intervals` WRITE;
/*!40000 ALTER TABLE `currency_rate_history_intervals` DISABLE KEYS */;
/*!40000 ALTER TABLE `currency_rate_history_intervals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currency_rate_mode_snapshots`
--

DROP TABLE IF EXISTS `currency_rate_mode_snapshots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `currency_rate_mode_snapshots` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_currency_rate_mode_snapshots_on_title` (`title`),
  KEY `index_currency_rate_mode_snapshots_on_status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currency_rate_mode_snapshots`
--

LOCK TABLES `currency_rate_mode_snapshots` WRITE;
/*!40000 ALTER TABLE `currency_rate_mode_snapshots` DISABLE KEYS */;
INSERT INTO `currency_rate_mode_snapshots` VALUES (1,'2018-03-15 00:01:16','2018-03-15 00:01:16',1,'2018-03-15 00:01:16 +0300');
/*!40000 ALTER TABLE `currency_rate_mode_snapshots` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currency_rate_modes`
--

DROP TABLE IF EXISTS `currency_rate_modes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `currency_rate_modes` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cur_from` varchar(255) NOT NULL,
  `cur_to` varchar(255) NOT NULL,
  `mode` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `currency_rate_mode_snapshot_id` bigint(20) NOT NULL,
  `cross_currency1` varchar(255) DEFAULT NULL,
  `cross_rate_source1_id` bigint(20) DEFAULT NULL,
  `cross_currency2` varchar(255) DEFAULT NULL,
  `cross_currency3` varchar(255) DEFAULT NULL,
  `cross_rate_source2_id` bigint(20) DEFAULT NULL,
  `cross_rate_source3_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `crm_id_pair` (`currency_rate_mode_snapshot_id`,`cur_from`,`cur_to`),
  KEY `index_currency_rate_modes_on_cross_rate_source1_id` (`cross_rate_source1_id`),
  KEY `index_currency_rate_modes_on_cross_rate_source2_id` (`cross_rate_source2_id`),
  KEY `index_currency_rate_modes_on_cross_rate_source3_id` (`cross_rate_source3_id`),
  CONSTRAINT `fk_rails_a3382e869e` FOREIGN KEY (`cross_rate_source2_id`) REFERENCES `rate_sources` (`id`),
  CONSTRAINT `fk_rails_c2a82eaee8` FOREIGN KEY (`cross_rate_source3_id`) REFERENCES `rate_sources` (`id`),
  CONSTRAINT `fk_rails_cb8d1691f1` FOREIGN KEY (`cross_rate_source1_id`) REFERENCES `rate_sources` (`id`),
  CONSTRAINT `fk_rails_e75085d881` FOREIGN KEY (`currency_rate_mode_snapshot_id`) REFERENCES `currency_rate_mode_snapshots` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currency_rate_modes`
--

LOCK TABLES `currency_rate_modes` WRITE;
/*!40000 ALTER TABLE `currency_rate_modes` DISABLE KEYS */;
/*!40000 ALTER TABLE `currency_rate_modes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currency_rate_snapshots`
--

DROP TABLE IF EXISTS `currency_rate_snapshots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `currency_rate_snapshots` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `currency_rate_mode_snapshot_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_rails_456167e2a9` (`currency_rate_mode_snapshot_id`),
  CONSTRAINT `fk_rails_456167e2a9` FOREIGN KEY (`currency_rate_mode_snapshot_id`) REFERENCES `currency_rate_mode_snapshots` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currency_rate_snapshots`
--

LOCK TABLES `currency_rate_snapshots` WRITE;
/*!40000 ALTER TABLE `currency_rate_snapshots` DISABLE KEYS */;
INSERT INTO `currency_rate_snapshots` VALUES (1,'2018-03-14 21:01:16',1);
/*!40000 ALTER TABLE `currency_rate_snapshots` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currency_rates`
--

DROP TABLE IF EXISTS `currency_rates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `currency_rates` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cur_from` varchar(255) NOT NULL,
  `cur_to` varchar(255) NOT NULL,
  `rate_value` double NOT NULL,
  `snapshot_id` bigint(20) NOT NULL,
  `metadata` json NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `external_rate_id` bigint(20) DEFAULT NULL,
  `mode` int(11) NOT NULL,
  `rate_source_id` bigint(20) DEFAULT NULL,
  `external_rate1_id` bigint(20) DEFAULT NULL,
  `external_rate2_id` bigint(20) DEFAULT NULL,
  `external_rate3_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_current_exchange_rates_uniq` (`snapshot_id`,`cur_from`,`cur_to`),
  KEY `index_currency_rates_on_external_rate1_id` (`external_rate1_id`),
  KEY `index_currency_rates_on_external_rate2_id` (`external_rate2_id`),
  KEY `index_currency_rates_on_external_rate3_id` (`external_rate3_id`),
  KEY `fk_rails_905ddd038e` (`external_rate_id`),
  KEY `fk_rails_2397c780d5` (`rate_source_id`),
  CONSTRAINT `fk_rails_1d2a9916a1` FOREIGN KEY (`external_rate1_id`) REFERENCES `external_rates` (`id`),
  CONSTRAINT `fk_rails_2397c780d5` FOREIGN KEY (`rate_source_id`) REFERENCES `rate_sources` (`id`),
  CONSTRAINT `fk_rails_52b45b5635` FOREIGN KEY (`snapshot_id`) REFERENCES `currency_rate_snapshots` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_rails_a0a6b944db` FOREIGN KEY (`external_rate2_id`) REFERENCES `external_rates` (`id`),
  CONSTRAINT `fk_rails_d5a19345d9` FOREIGN KEY (`external_rate3_id`) REFERENCES `external_rates` (`id`),
  CONSTRAINT `fk_rails_df5eabb0e1` FOREIGN KEY (`external_rate_id`) REFERENCES `external_rates` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currency_rates`
--

LOCK TABLES `currency_rates` WRITE;
/*!40000 ALTER TABLE `currency_rates` DISABLE KEYS */;
INSERT INTO `currency_rates` VALUES (1,'RUB','RUB',1,1,'{}','2018-03-14 21:01:16',NULL,2,NULL,NULL,NULL,NULL),(2,'RUB','USD',0.0160567,1,'{}','2018-03-14 21:01:16',3,0,1,NULL,NULL,NULL),(3,'RUB','BTC',0.00000217447,1,'{}','2018-03-14 21:01:16',38,0,2,NULL,NULL,NULL),(4,'RUB','LTC',0.000128138,1,'{}','2018-03-14 21:01:16',42,0,2,NULL,NULL,NULL),(5,'RUB','ETH',0.0000342231,1,'{}','2018-03-14 21:01:16',41,0,2,NULL,NULL,NULL),(6,'RUB','DSH',0.0000467931,1,'{}','2018-03-14 21:01:16',39,0,2,NULL,NULL,NULL),(7,'RUB','KZT',5.29549,1,'{}','2018-03-14 21:01:16',2,0,1,NULL,NULL,NULL),(8,'RUB','XRP',0.0261144,1,'{}','2018-03-14 21:01:16',44,0,2,NULL,NULL,NULL),(9,'RUB','ETC',0.00106702,1,'{}','2018-03-14 21:01:16',40,0,2,NULL,NULL,NULL),(10,'RUB','XMR',0.000082766508088,1,'{}','2018-03-14 21:01:16',3,3,NULL,52,NULL,NULL),(11,'RUB','BCH',0.0000225907,1,'{}','2018-03-14 21:01:16',37,0,2,NULL,NULL,NULL),(12,'USD','RUB',61.1454,1,'{}','2018-03-14 21:01:16',4,0,1,NULL,NULL,NULL),(13,'USD','USD',1,1,'{}','2018-03-14 21:01:16',NULL,2,NULL,NULL,NULL,NULL),(14,'USD','BTC',0.000125549,1,'{}','2018-03-14 21:01:16',46,0,2,NULL,NULL,NULL),(15,'USD','LTC',0.00736971,1,'{}','2018-03-14 21:01:16',50,0,2,NULL,NULL,NULL),(16,'USD','ETH',0.00196464,1,'{}','2018-03-14 21:01:16',49,0,2,NULL,NULL,NULL),(17,'USD','DSH',0.00270075,1,'{}','2018-03-14 21:01:16',47,0,2,NULL,NULL,NULL),(18,'USD','KZT',323.794854246,1,'{}','2018-03-14 21:01:16',4,3,NULL,2,NULL,NULL),(19,'USD','XRP',1.50444,1,'{}','2018-03-14 21:01:16',53,0,2,NULL,NULL,NULL),(20,'USD','ETC',0.0615009,1,'{}','2018-03-14 21:01:16',48,0,2,NULL,NULL,NULL),(21,'USD','XMR',0.00515464,1,'{}','2018-03-14 21:01:16',52,0,2,NULL,NULL,NULL),(22,'USD','BCH',0.00130208,1,'{}','2018-03-14 21:01:16',45,0,2,NULL,NULL,NULL),(23,'BTC','RUB',457791,1,'{}','2018-03-14 21:01:16',18,0,2,NULL,NULL,NULL),(24,'BTC','USD',7945.01,1,'{}','2018-03-14 21:01:16',19,0,2,NULL,NULL,NULL),(25,'BTC','BTC',1,1,'{}','2018-03-14 21:01:16',NULL,2,NULL,NULL,NULL,NULL),(26,'BTC','LTC',58.7308,1,'{}','2018-03-14 21:01:16',17,0,2,NULL,NULL,NULL),(27,'BTC','ETH',15.675,1,'{}','2018-03-14 21:01:16',16,0,2,NULL,NULL,NULL),(28,'BTC','DSH',21.4428,1,'{}','2018-03-14 21:01:16',14,0,2,NULL,NULL,NULL),(29,'BTC','KZT',2424227.66259,1,'{}','2018-03-14 21:01:16',18,3,NULL,2,NULL,NULL),(30,'BTC','XRP',11976,1,'{}','2018-03-14 21:01:16',21,0,2,NULL,NULL,NULL),(31,'BTC','ETC',490.189,1,'{}','2018-03-14 21:01:16',15,0,2,NULL,NULL,NULL),(32,'BTC','XMR',40.5803,1,'{}','2018-03-14 21:01:16',20,0,2,NULL,NULL,NULL),(33,'BTC','BCH',10.3586,1,'{}','2018-03-14 21:01:16',13,0,2,NULL,NULL,NULL),(34,'LTC','RUB',7737.29,1,'{}','2018-03-14 21:01:16',35,0,2,NULL,NULL,NULL),(35,'LTC','USD',134.704,1,'{}','2018-03-14 21:01:16',36,0,2,NULL,NULL,NULL),(36,'LTC','BTC',0.0169407,1,'{}','2018-03-14 21:01:16',33,0,2,NULL,NULL,NULL),(37,'LTC','LTC',1,1,'{}','2018-03-14 21:01:16',NULL,2,NULL,NULL,NULL,NULL),(38,'LTC','ETH',0.266262,1,'{}','2018-03-14 21:01:16',34,0,2,NULL,NULL,NULL),(39,'LTC','DSH',0.36380182800000005,1,'{}','2018-03-14 21:01:16',36,3,NULL,47,NULL,NULL),(40,'LTC','KZT',40972.7418221,1,'{}','2018-03-14 21:01:16',35,3,NULL,2,NULL,NULL),(41,'LTC','XRP',202.65408576000002,1,'{}','2018-03-14 21:01:16',36,3,NULL,53,NULL,NULL),(42,'LTC','ETC',8.2844172336,1,'{}','2018-03-14 21:01:16',36,3,NULL,48,NULL,NULL),(43,'LTC','XMR',0.6943506265600001,1,'{}','2018-03-14 21:01:16',36,3,NULL,52,NULL,NULL),(44,'LTC','BCH',0.17539538432000001,1,'{}','2018-03-14 21:01:16',36,3,NULL,45,NULL,NULL),(45,'ETH','RUB',29220,1,'{}','2018-03-14 21:01:16',31,0,2,NULL,NULL,NULL),(46,'ETH','USD',507,1,'{}','2018-03-14 21:01:16',32,0,2,NULL,NULL,NULL),(47,'ETH','BTC',0.063611,1,'{}','2018-03-14 21:01:16',29,0,2,NULL,NULL,NULL),(48,'ETH','LTC',3.72954,1,'{}','2018-03-14 21:01:16',30,0,2,NULL,NULL,NULL),(49,'ETH','ETH',1,1,'{}','2018-03-14 21:01:16',NULL,2,NULL,NULL,NULL,NULL),(50,'ETH','DSH',1.36928025,1,'{}','2018-03-14 21:01:16',32,3,NULL,47,NULL,NULL),(51,'ETH','KZT',154734.2178,1,'{}','2018-03-14 21:01:16',31,3,NULL,2,NULL,NULL),(52,'ETH','XRP',762.75108,1,'{}','2018-03-14 21:01:16',32,3,NULL,53,NULL,NULL),(53,'ETH','ETC',31.1809563,1,'{}','2018-03-14 21:01:16',32,3,NULL,48,NULL,NULL),(54,'ETH','XMR',2.61340248,1,'{}','2018-03-14 21:01:16',32,3,NULL,52,NULL,NULL),(55,'ETH','BCH',0.659981,1,'{}','2018-03-14 21:01:16',28,0,2,NULL,NULL,NULL),(56,'DSH','RUB',21183.9,1,'{}','2018-03-14 21:01:16',23,0,2,NULL,NULL,NULL),(57,'DSH','USD',366.957,1,'{}','2018-03-14 21:01:16',24,0,2,NULL,NULL,NULL),(58,'DSH','BTC',0.0462501,1,'{}','2018-03-14 21:01:16',22,0,2,NULL,NULL,NULL),(59,'DSH','LTC',2.70436667247,1,'{}','2018-03-14 21:01:16',24,3,NULL,50,NULL,NULL),(60,'DSH','ETH',0.72093840048,1,'{}','2018-03-14 21:01:16',24,3,NULL,49,NULL,NULL),(61,'DSH','DSH',1,1,'{}','2018-03-14 21:01:16',NULL,2,NULL,NULL,NULL,NULL),(62,'DSH','KZT',112179.13061100002,1,'{}','2018-03-14 21:01:16',23,3,NULL,2,NULL,NULL),(63,'DSH','XRP',552.06478908,1,'{}','2018-03-14 21:01:16',24,3,NULL,53,NULL,NULL),(64,'DSH','ETC',22.568185761299997,1,'{}','2018-03-14 21:01:16',24,3,NULL,48,NULL,NULL),(65,'DSH','XMR',1.89153123048,1,'{}','2018-03-14 21:01:16',24,3,NULL,52,NULL,NULL),(66,'DSH','BCH',0.47780737056,1,'{}','2018-03-14 21:01:16',24,3,NULL,45,NULL,NULL),(67,'KZT','RUB',0.186277,1,'{}','2018-03-14 21:01:16',1,0,1,NULL,NULL,NULL),(68,'KZT','USD',0.0029909939059,1,'{}','2018-03-14 21:01:16',1,3,NULL,3,NULL,NULL),(69,'KZT','BTC',0.00000040505374819,1,'{}','2018-03-14 21:01:16',1,3,NULL,38,NULL,NULL),(70,'KZT','LTC',0.000023869162226,1,'{}','2018-03-14 21:01:16',1,3,NULL,42,NULL,NULL),(71,'KZT','ETH',0.0000063749763987,1,'{}','2018-03-14 21:01:16',1,3,NULL,41,NULL,NULL),(72,'KZT','DSH',0.0000087164782887,1,'{}','2018-03-14 21:01:16',1,3,NULL,39,NULL,NULL),(73,'KZT','KZT',1,1,'{}','2018-03-14 21:01:16',NULL,2,NULL,NULL,NULL,NULL),(74,'KZT','XRP',0.0048645120888,1,'{}','2018-03-14 21:01:16',1,3,NULL,44,NULL,NULL),(75,'KZT','ETC',0.00019876128453999998,1,'{}','2018-03-14 21:01:16',1,3,NULL,40,NULL,NULL),(76,'KZT','XMR',0.000015417496827108376,1,'{}','2018-03-14 21:01:16',1,3,NULL,3,52,NULL),(77,'KZT','BCH',0.0000042081278239,1,'{}','2018-03-14 21:01:17',1,3,NULL,37,NULL,NULL),(78,'XRP','RUB',38.1,1,'{}','2018-03-14 21:01:17',57,0,2,NULL,NULL,NULL),(79,'XRP','USD',0.661303,1,'{}','2018-03-14 21:01:17',58,0,2,NULL,NULL,NULL),(80,'XRP','BTC',0.0000833,1,'{}','2018-03-14 21:01:17',56,0,2,NULL,NULL,NULL),(81,'XRP','LTC',0.00487361133213,1,'{}','2018-03-14 21:01:17',58,3,NULL,50,NULL,NULL),(82,'XRP','ETH',0.00129922232592,1,'{}','2018-03-14 21:01:17',58,3,NULL,49,NULL,NULL),(83,'XRP','DSH',0.0017860140772499998,1,'{}','2018-03-14 21:01:17',58,3,NULL,47,NULL,NULL),(84,'XRP','KZT',201.758169,1,'{}','2018-03-14 21:01:17',57,3,NULL,2,NULL,NULL),(85,'XRP','XRP',1,1,'{}','2018-03-14 21:01:17',NULL,2,NULL,NULL,NULL,NULL),(86,'XRP','ETC',0.040670729672699996,1,'{}','2018-03-14 21:01:17',58,3,NULL,48,NULL,NULL),(87,'XRP','XMR',0.00340877889592,1,'{}','2018-03-14 21:01:17',58,3,NULL,52,NULL,NULL),(88,'XRP','BCH',0.00086106941024,1,'{}','2018-03-14 21:01:17',58,3,NULL,45,NULL,NULL),(89,'ETC','RUB',934.21,1,'{}','2018-03-14 21:01:17',26,0,2,NULL,NULL,NULL),(90,'ETC','USD',16.16,1,'{}','2018-03-14 21:01:17',27,0,2,NULL,NULL,NULL),(91,'ETC','BTC',0.00203898,1,'{}','2018-03-14 21:01:17',25,0,2,NULL,NULL,NULL),(92,'ETC','LTC',0.1190945136,1,'{}','2018-03-14 21:01:17',27,3,NULL,50,NULL,NULL),(93,'ETC','ETH',0.0317485824,1,'{}','2018-03-14 21:01:17',27,3,NULL,49,NULL,NULL),(94,'ETC','DSH',0.04364412,1,'{}','2018-03-14 21:01:17',27,3,NULL,47,NULL,NULL),(95,'ETC','KZT',4947.099712900001,1,'{}','2018-03-14 21:01:17',26,3,NULL,2,NULL,NULL),(96,'ETC','XRP',24.3117504,1,'{}','2018-03-14 21:01:17',27,3,NULL,53,NULL,NULL),(97,'ETC','ETC',1,1,'{}','2018-03-14 21:01:17',NULL,2,NULL,NULL,NULL,NULL),(98,'ETC','XMR',0.0832989824,1,'{}','2018-03-14 21:01:17',27,3,NULL,52,NULL,NULL),(99,'ETC','BCH',0.021041612799999998,1,'{}','2018-03-14 21:01:17',27,3,NULL,45,NULL,NULL),(100,'XMR','RUB',11853.7083894,1,'{}','2018-03-14 21:01:17',55,3,NULL,4,NULL,NULL),(101,'XMR','USD',193.861,1,'{}','2018-03-14 21:01:17',55,0,2,NULL,NULL,NULL),(102,'XMR','BTC',0.0244222,1,'{}','2018-03-14 21:01:17',54,0,2,NULL,NULL,NULL),(103,'XMR','LTC',1.4286993503099998,1,'{}','2018-03-14 21:01:17',55,3,NULL,50,NULL,NULL),(104,'XMR','ETH',0.38086707504,1,'{}','2018-03-14 21:01:17',55,3,NULL,49,NULL,NULL),(105,'XMR','DSH',0.52357009575,1,'{}','2018-03-14 21:01:17',55,3,NULL,47,NULL,NULL),(106,'XMR','KZT',62771.19423898381,1,'{}','2018-03-14 21:01:17',55,3,NULL,4,2,NULL),(107,'XMR','XRP',291.65224284,1,'{}','2018-03-14 21:01:17',55,3,NULL,53,NULL,NULL),(108,'XMR','ETC',11.922625974899999,1,'{}','2018-03-14 21:01:17',55,3,NULL,48,NULL,NULL),(109,'XMR','XMR',1,1,'{}','2018-03-14 21:01:17',NULL,2,NULL,NULL,NULL,NULL),(110,'XMR','BCH',0.25242253088,1,'{}','2018-03-14 21:01:17',55,3,NULL,45,NULL,NULL),(111,'BCH','RUB',43936.9,1,'{}','2018-03-14 21:01:17',11,0,2,NULL,NULL,NULL),(112,'BCH','USD',763.024,1,'{}','2018-03-14 21:01:17',12,0,2,NULL,NULL,NULL),(113,'BCH','BTC',0.0958034,1,'{}','2018-03-14 21:01:17',9,0,2,NULL,NULL,NULL),(114,'BCH','LTC',5.62326560304,1,'{}','2018-03-14 21:01:17',12,3,NULL,50,NULL,NULL),(115,'BCH','ETH',1.50215,1,'{}','2018-03-14 21:01:17',10,0,2,NULL,NULL,NULL),(116,'BCH','DSH',2.060737068,1,'{}','2018-03-14 21:01:17',12,3,NULL,47,NULL,NULL),(117,'BCH','KZT',232667.41458100002,1,'{}','2018-03-14 21:01:17',11,3,NULL,2,NULL,NULL),(118,'BCH','XRP',1147.92382656,1,'{}','2018-03-14 21:01:17',12,3,NULL,53,NULL,NULL),(119,'BCH','ETC',46.926662721599996,1,'{}','2018-03-14 21:01:17',12,3,NULL,48,NULL,NULL),(120,'BCH','XMR',3.93311403136,1,'{}','2018-03-14 21:01:17',12,3,NULL,52,NULL,NULL),(121,'BCH','BCH',1,1,'{}','2018-03-14 21:01:17',NULL,2,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `currency_rates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `direction_rate_snapshot_to_records`
--

DROP TABLE IF EXISTS `direction_rate_snapshot_to_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `direction_rate_snapshot_to_records` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `direction_rate_id` bigint(20) NOT NULL,
  `direction_rate_snapshot_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `drstr_unique_index` (`direction_rate_snapshot_id`,`direction_rate_id`),
  KEY `drstr_dr_id` (`direction_rate_id`),
  CONSTRAINT `fk_rails_0e6cef2c83` FOREIGN KEY (`direction_rate_snapshot_id`) REFERENCES `direction_rate_snapshots` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_rails_afaa90f7c6` FOREIGN KEY (`direction_rate_id`) REFERENCES `direction_rates` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `direction_rate_snapshot_to_records`
--

LOCK TABLES `direction_rate_snapshot_to_records` WRITE;
/*!40000 ALTER TABLE `direction_rate_snapshot_to_records` DISABLE KEYS */;
INSERT INTO `direction_rate_snapshot_to_records` VALUES (1,1,1),(2,2,1),(3,3,1),(4,4,1),(5,5,1),(6,6,1),(7,7,1),(8,8,1),(9,9,1),(10,10,1),(11,11,1),(12,12,1),(13,13,1),(14,14,1),(15,15,1),(16,16,1),(17,17,1),(18,18,1),(19,19,1),(20,20,1),(21,21,1),(22,22,1),(23,23,1),(24,24,1),(25,25,1),(26,26,1),(27,27,1),(28,28,1),(29,29,1),(30,30,1),(31,31,1),(32,32,1),(33,33,1),(34,34,1),(35,35,1),(36,36,1),(37,37,1),(38,38,1),(39,39,1),(40,40,1),(41,41,1),(42,42,1),(43,43,1),(44,44,1),(45,45,1),(46,46,1),(47,47,1),(48,48,1),(49,49,1),(50,50,1),(51,51,1),(52,52,1),(53,53,1),(54,54,1),(55,55,1),(56,56,1),(57,57,1),(58,58,1),(59,59,1),(60,60,1),(61,61,1),(62,62,1),(63,63,1),(64,64,1),(65,65,1),(66,66,1),(67,67,1),(68,68,1),(69,69,1),(70,70,1),(71,71,1),(72,72,1),(73,73,1),(74,74,1),(75,75,1),(76,76,1),(77,77,1),(78,78,1),(79,79,1),(80,80,1),(81,81,1),(82,82,1),(83,83,1),(84,84,1),(85,85,1),(86,86,1),(87,87,1),(88,88,1),(89,89,1),(90,90,1),(91,91,1),(92,92,1),(93,93,1),(94,94,1),(95,95,1),(96,96,1),(97,97,1),(98,98,1),(99,99,1),(100,100,1),(101,101,1),(102,102,1),(103,103,1),(104,104,1),(105,105,1),(106,106,1),(107,107,1),(108,108,1),(109,109,1),(110,110,1),(111,111,1),(112,112,1),(113,113,1),(114,114,1),(115,115,1),(116,116,1),(117,117,1),(118,118,1),(119,119,1),(120,120,1),(121,121,1);
/*!40000 ALTER TABLE `direction_rate_snapshot_to_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `direction_rate_snapshots`
--

DROP TABLE IF EXISTS `direction_rate_snapshots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `direction_rate_snapshots` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `direction_rate_snapshots`
--

LOCK TABLES `direction_rate_snapshots` WRITE;
/*!40000 ALTER TABLE `direction_rate_snapshots` DISABLE KEYS */;
INSERT INTO `direction_rate_snapshots` VALUES (1,'2018-03-14 21:01:23');
/*!40000 ALTER TABLE `direction_rate_snapshots` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `direction_rates`
--

DROP TABLE IF EXISTS `direction_rates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `direction_rates` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ps_from_id` int(11) NOT NULL,
  `ps_to_id` int(11) NOT NULL,
  `currency_rate_id` bigint(20) NOT NULL,
  `rate_value` double NOT NULL,
  `base_rate_value` double NOT NULL,
  `rate_percent` float NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `exchange_rate_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_rails_d6f1847478` (`currency_rate_id`),
  KEY `index_direction_rates_on_exchange_rate_id_and_id` (`exchange_rate_id`,`id`),
  KEY `index_direction_rates_on_ps_from_id_and_ps_to_id_and_id` (`ps_from_id`,`ps_to_id`,`id`),
  KEY `fk_rails_fbaf7f33e1` (`ps_to_id`),
  CONSTRAINT `fk_rails_887871b786` FOREIGN KEY (`exchange_rate_id`) REFERENCES `cms_exchange_rate` (`id`),
  CONSTRAINT `fk_rails_a9a71a2aa8` FOREIGN KEY (`ps_from_id`) REFERENCES `cms_paymant_system` (`id`),
  CONSTRAINT `fk_rails_d6f1847478` FOREIGN KEY (`currency_rate_id`) REFERENCES `currency_rates` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_rails_fbaf7f33e1` FOREIGN KEY (`ps_to_id`) REFERENCES `cms_paymant_system` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `direction_rates`
--

LOCK TABLES `direction_rates` WRITE;
/*!40000 ALTER TABLE `direction_rates` DISABLE KEYS */;
INSERT INTO `direction_rates` VALUES (1,1,1,1,0.96,1,4,'2018-03-14 21:01:23',1),(2,1,2,2,0.015414431999999999,0.0160567,4,'2018-03-14 21:01:23',2),(3,1,3,3,0.0000020874912,0.00000217447,4,'2018-03-14 21:01:24',3),(4,1,4,4,0.00012301248,0.000128138,4,'2018-03-14 21:01:24',4),(5,1,5,5,0.000032854176,0.0000342231,4,'2018-03-14 21:01:24',5),(6,1,6,6,0.000044921375999999994,0.0000467931,4,'2018-03-14 21:01:24',6),(7,1,8,7,5.0836704,5.29549,4,'2018-03-14 21:01:24',7),(8,1,9,8,0.025069823999999997,0.0261144,4,'2018-03-14 21:01:24',8),(9,1,10,9,0.0010243391999999998,0.00106702,4,'2018-03-14 21:01:24',9),(10,1,11,10,0.00007945584776448,0.000082766508088,4,'2018-03-14 21:01:24',10),(11,1,12,11,0.000021687072,0.0000225907,4,'2018-03-14 21:01:24',11),(12,2,1,12,58.699584,61.1454,4,'2018-03-14 21:01:24',12),(13,2,2,13,0.96,1,4,'2018-03-14 21:01:24',13),(14,2,3,14,0.00012052704,0.000125549,4,'2018-03-14 21:01:24',14),(15,2,4,15,0.0070749216,0.00736971,4,'2018-03-14 21:01:24',15),(16,2,5,16,0.0018860544,0.00196464,4,'2018-03-14 21:01:24',16),(17,2,6,17,0.0025927199999999997,0.00270075,4,'2018-03-14 21:01:24',17),(18,2,8,18,310.84306007616,323.794854246,4,'2018-03-14 21:01:24',18),(19,2,9,19,1.4442624,1.50444,4,'2018-03-14 21:01:24',19),(20,2,10,20,0.059040864,0.0615009,4,'2018-03-14 21:01:24',20),(21,2,11,21,0.0049484544,0.00515464,4,'2018-03-14 21:01:24',21),(22,2,12,22,0.0012499967999999998,0.00130208,4,'2018-03-14 21:01:24',22),(23,3,1,23,439479.36,457791,4,'2018-03-14 21:01:24',23),(24,3,2,24,7627.2096,7945.01,4,'2018-03-14 21:01:24',24),(25,3,3,25,0.96,1,4,'2018-03-14 21:01:24',25),(26,3,4,26,56.381568,58.7308,4,'2018-03-14 21:01:24',26),(27,3,5,27,15.048,15.675,4,'2018-03-14 21:01:24',27),(28,3,6,28,20.585088,21.4428,4,'2018-03-14 21:01:24',28),(29,3,8,29,2327258.5560864,2424227.66259,4,'2018-03-14 21:01:24',29),(30,3,9,30,11496.96,11976,4,'2018-03-14 21:01:24',30),(31,3,10,31,470.58144000000004,490.189,4,'2018-03-14 21:01:24',31),(32,3,11,32,38.957088,40.5803,4,'2018-03-14 21:01:24',32),(33,3,12,33,9.944256,10.3586,4,'2018-03-14 21:01:24',33),(34,4,1,34,7427.7984,7737.29,4,'2018-03-14 21:01:24',34),(35,4,2,35,129.31584,134.704,4,'2018-03-14 21:01:24',35),(36,4,3,36,0.016263072,0.0169407,4,'2018-03-14 21:01:24',36),(37,4,4,37,0.96,1,4,'2018-03-14 21:01:24',37),(38,4,5,38,0.25561152,0.266262,4,'2018-03-14 21:01:24',38),(39,4,6,39,0.34924975488000004,0.36380182800000005,4,'2018-03-14 21:01:24',39),(40,4,8,40,39333.832149215996,40972.7418221,4,'2018-03-14 21:01:24',40),(41,4,9,41,194.54792232960003,202.65408576000002,4,'2018-03-14 21:01:24',41),(42,4,10,42,7.953040544255999,8.2844172336,4,'2018-03-14 21:01:24',42),(43,4,11,43,0.6665766014976001,0.6943506265600001,4,'2018-03-14 21:01:24',43),(44,4,12,44,0.16837956894720002,0.17539538432000001,4,'2018-03-14 21:01:24',44),(45,5,1,45,28051.2,29220,4,'2018-03-14 21:01:24',45),(46,5,2,46,486.72,507,4,'2018-03-14 21:01:24',46),(47,5,3,47,0.06106656,0.063611,4,'2018-03-14 21:01:24',47),(48,5,4,48,3.5803584,3.72954,4,'2018-03-14 21:01:24',48),(49,5,5,49,0.96,1,4,'2018-03-14 21:01:24',49),(50,5,6,50,1.3145090400000001,1.36928025,4,'2018-03-14 21:01:24',50),(51,5,8,51,148544.84908800002,154734.2178,4,'2018-03-14 21:01:24',51),(52,5,9,52,732.2410368,762.75108,4,'2018-03-14 21:01:24',52),(53,5,10,53,29.933718048,31.1809563,4,'2018-03-14 21:01:24',53),(54,5,11,54,2.5088663808,2.61340248,4,'2018-03-14 21:01:24',54),(55,5,12,55,0.63358176,0.659981,4,'2018-03-14 21:01:24',55),(56,6,1,56,20336.544,21183.9,4,'2018-03-14 21:01:24',56),(57,6,2,57,352.27872,366.957,4,'2018-03-14 21:01:24',57),(58,6,3,58,0.044400096,0.0462501,4,'2018-03-14 21:01:24',58),(59,6,4,59,2.5961920055712,2.70436667247,4,'2018-03-14 21:01:24',59),(60,6,5,60,0.6921008644608,0.72093840048,4,'2018-03-14 21:01:24',60),(61,6,6,61,0.96,1,4,'2018-03-14 21:01:24',61),(62,6,8,62,107691.96538656001,112179.13061100002,4,'2018-03-14 21:01:24',62),(63,6,9,63,529.9821975167999,552.06478908,4,'2018-03-14 21:01:24',63),(64,6,10,64,21.665458330847997,22.568185761299997,4,'2018-03-14 21:01:24',64),(65,6,11,65,1.8158699812608001,1.89153123048,4,'2018-03-14 21:01:24',65),(66,6,12,66,0.4586950757376,0.47780737056,4,'2018-03-14 21:01:24',66),(67,8,1,67,0.17882592,0.186277,4,'2018-03-14 21:01:24',67),(68,8,2,68,0.002871354149664,0.0029909939059,4,'2018-03-14 21:01:24',68),(69,8,3,69,0.00000038885159826239997,0.00000040505374819,4,'2018-03-14 21:01:24',69),(70,8,4,70,0.000022914395736959998,0.000023869162226,4,'2018-03-14 21:01:24',70),(71,8,5,71,0.000006119977342752,0.0000063749763987,4,'2018-03-14 21:01:24',71),(72,8,6,72,0.000008367819157152,0.0000087164782887,4,'2018-03-14 21:01:24',72),(73,8,8,73,0.96,1,4,'2018-03-14 21:01:24',73),(74,8,9,74,0.004669931605248,0.0048645120888,4,'2018-03-14 21:01:24',74),(75,8,10,75,0.00019081083315839996,0.00019876128453999998,4,'2018-03-14 21:01:24',75),(76,8,11,76,0.00001480079695402404,0.000015417496827108376,4,'2018-03-14 21:01:24',76),(77,8,12,77,0.000004039802710943999,0.0000042081278239,4,'2018-03-14 21:01:24',77),(78,9,1,78,36.576,38.1,4,'2018-03-14 21:01:24',78),(79,9,2,79,0.63485088,0.661303,4,'2018-03-14 21:01:24',79),(80,9,3,80,0.000079968,0.0000833,4,'2018-03-14 21:01:24',80),(81,9,4,81,0.0046786668788448,0.00487361133213,4,'2018-03-14 21:01:24',81),(82,9,5,82,0.0012472534328832,0.00129922232592,4,'2018-03-14 21:01:24',82),(83,9,6,83,0.0017145735141599998,0.0017860140772499998,4,'2018-03-14 21:01:24',83),(84,9,8,84,193.68784224,201.758169,4,'2018-03-14 21:01:24',84),(85,9,9,85,0.96,1,4,'2018-03-14 21:01:24',85),(86,9,10,86,0.039043900485791996,0.040670729672699996,4,'2018-03-14 21:01:24',86),(87,9,11,87,0.0032724277400831996,0.00340877889592,4,'2018-03-14 21:01:24',87),(88,9,12,88,0.0008266266338304,0.00086106941024,4,'2018-03-14 21:01:24',88),(89,10,1,89,896.8416000000001,934.21,4,'2018-03-14 21:01:24',89),(90,10,2,90,15.5136,16.16,4,'2018-03-14 21:01:24',90),(91,10,3,91,0.0019574208,0.00203898,4,'2018-03-14 21:01:24',91),(92,10,4,92,0.11433073305599999,0.1190945136,4,'2018-03-14 21:01:24',92),(93,10,5,93,0.030478639104,0.0317485824,4,'2018-03-14 21:01:24',93),(94,10,6,94,0.0418983552,0.04364412,4,'2018-03-14 21:01:24',94),(95,10,8,95,4749.215724384001,4947.099712900001,4,'2018-03-14 21:01:24',95),(96,10,9,96,23.339280384000002,24.3117504,4,'2018-03-14 21:01:24',96),(97,10,10,97,0.96,1,4,'2018-03-14 21:01:24',97),(98,10,11,98,0.079967023104,0.0832989824,4,'2018-03-14 21:01:24',98),(99,10,12,99,0.020199948287999998,0.021041612799999998,4,'2018-03-14 21:01:24',99),(100,11,1,100,11379.560053824001,11853.7083894,4,'2018-03-14 21:01:24',100),(101,11,2,101,186.10656,193.861,4,'2018-03-14 21:01:24',101),(102,11,3,102,0.023445312,0.0244222,4,'2018-03-14 21:01:24',102),(103,11,4,103,1.3715513762976,1.4286993503099998,4,'2018-03-14 21:01:24',103),(104,11,5,104,0.3656323920384,0.38086707504,4,'2018-03-14 21:01:24',104),(105,11,6,105,0.50262729192,0.52357009575,4,'2018-03-14 21:01:24',105),(106,11,8,106,60260.346469424454,62771.19423898381,4,'2018-03-14 21:01:24',106),(107,11,9,107,279.9861531264,291.65224284,4,'2018-03-14 21:01:24',107),(108,11,10,108,11.445720935904,11.922625974899999,4,'2018-03-14 21:01:24',108),(109,11,11,109,0.96,1,4,'2018-03-14 21:01:24',109),(110,11,12,110,0.24232562964479998,0.25242253088,4,'2018-03-14 21:01:24',110),(111,12,1,111,42179.424,43936.9,4,'2018-03-14 21:01:24',111),(112,12,2,112,732.50304,763.024,4,'2018-03-14 21:01:24',112),(113,12,3,113,0.091971264,0.0958034,4,'2018-03-14 21:01:24',113),(114,12,4,114,5.3983349789184,5.62326560304,4,'2018-03-14 21:01:24',114),(115,12,5,115,1.442064,1.50215,4,'2018-03-14 21:01:24',115),(116,12,6,116,1.9783075852799998,2.060737068,4,'2018-03-14 21:01:24',116),(117,12,8,117,223360.71799776002,232667.41458100002,4,'2018-03-14 21:01:24',117),(118,12,9,118,1102.0068734976,1147.92382656,4,'2018-03-14 21:01:24',118),(119,12,10,119,45.049596212736,46.926662721599996,4,'2018-03-14 21:01:24',119),(120,12,11,120,3.7757894701056003,3.93311403136,4,'2018-03-14 21:01:24',120),(121,12,12,121,0.96,1,4,'2018-03-14 21:01:24',121);
/*!40000 ALTER TABLE `direction_rates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `external_rate_snapshots`
--

DROP TABLE IF EXISTS `external_rate_snapshots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `external_rate_snapshots` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `rate_source_id` bigint(20) NOT NULL,
  `actual_for` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_external_rate_snapshots_on_rate_source_id_and_actual_for` (`rate_source_id`,`actual_for`),
  KEY `index_external_rate_snapshots_on_rate_source_id` (`rate_source_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `external_rate_snapshots`
--

LOCK TABLES `external_rate_snapshots` WRITE;
/*!40000 ALTER TABLE `external_rate_snapshots` DISABLE KEYS */;
INSERT INTO `external_rate_snapshots` VALUES (1,2,'2018-03-14 21:01:12','2018-03-15 00:01:12'),(2,1,'2018-03-14 21:01:12','2018-03-15 00:01:12'),(3,4,'2018-03-14 21:01:12','2018-03-15 00:01:12');
/*!40000 ALTER TABLE `external_rate_snapshots` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `external_rates`
--

DROP TABLE IF EXISTS `external_rates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `external_rates` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `source_id` bigint(20) NOT NULL,
  `cur_from` varchar(255) NOT NULL,
  `cur_to` varchar(255) NOT NULL,
  `rate_value` double DEFAULT NULL,
  `snapshot_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_external_rates_on_snapshot_id_and_cur_from_and_cur_to` (`snapshot_id`,`cur_from`,`cur_to`),
  KEY `index_external_rates_on_source_id` (`source_id`),
  CONSTRAINT `fk_rails_811e1cfe8b` FOREIGN KEY (`snapshot_id`) REFERENCES `external_rate_snapshots` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_rails_c22bd4c2ed` FOREIGN KEY (`source_id`) REFERENCES `rate_sources` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `external_rates`
--

LOCK TABLES `external_rates` WRITE;
/*!40000 ALTER TABLE `external_rates` DISABLE KEYS */;
INSERT INTO `external_rates` VALUES (1,1,'KZT','RUB',0.186277,2,'2018-03-14 21:01:12'),(2,1,'RUB','KZT',5.29549,2,'2018-03-14 21:01:12'),(3,1,'RUB','USD',0.0160567,2,'2018-03-14 21:01:12'),(4,1,'USD','RUB',61.1454,2,'2018-03-14 21:01:13'),(5,4,'KZT','RUB',0.187559,3,'2018-03-14 21:01:13'),(6,4,'RUB','KZT',5.33167,3,'2018-03-14 21:01:13'),(7,4,'RUB','USD',0.0162042,3,'2018-03-14 21:01:13'),(8,4,'USD','RUB',61.7124,3,'2018-03-14 21:01:13'),(9,2,'BCH','BTC',0.0958034,1,'2018-03-14 21:01:13'),(10,2,'BCH','ETH',1.50215,1,'2018-03-14 21:01:13'),(11,2,'BCH','RUB',43936.9,1,'2018-03-14 21:01:13'),(12,2,'BCH','USD',763.024,1,'2018-03-14 21:01:13'),(13,2,'BTC','BCH',10.3586,1,'2018-03-14 21:01:13'),(14,2,'BTC','DSH',21.4428,1,'2018-03-14 21:01:13'),(15,2,'BTC','ETC',490.189,1,'2018-03-14 21:01:13'),(16,2,'BTC','ETH',15.675,1,'2018-03-14 21:01:13'),(17,2,'BTC','LTC',58.7308,1,'2018-03-14 21:01:13'),(18,2,'BTC','RUB',457791,1,'2018-03-14 21:01:13'),(19,2,'BTC','USD',7945.01,1,'2018-03-14 21:01:13'),(20,2,'BTC','XMR',40.5803,1,'2018-03-14 21:01:13'),(21,2,'BTC','XRP',11976,1,'2018-03-14 21:01:13'),(22,2,'DSH','BTC',0.0462501,1,'2018-03-14 21:01:13'),(23,2,'DSH','RUB',21183.9,1,'2018-03-14 21:01:13'),(24,2,'DSH','USD',366.957,1,'2018-03-14 21:01:13'),(25,2,'ETC','BTC',0.00203898,1,'2018-03-14 21:01:13'),(26,2,'ETC','RUB',934.21,1,'2018-03-14 21:01:13'),(27,2,'ETC','USD',16.16,1,'2018-03-14 21:01:13'),(28,2,'ETH','BCH',0.659981,1,'2018-03-14 21:01:13'),(29,2,'ETH','BTC',0.063611,1,'2018-03-14 21:01:14'),(30,2,'ETH','LTC',3.72954,1,'2018-03-14 21:01:14'),(31,2,'ETH','RUB',29220,1,'2018-03-14 21:01:14'),(32,2,'ETH','USD',507,1,'2018-03-14 21:01:14'),(33,2,'LTC','BTC',0.0169407,1,'2018-03-14 21:01:14'),(34,2,'LTC','ETH',0.266262,1,'2018-03-14 21:01:14'),(35,2,'LTC','RUB',7737.29,1,'2018-03-14 21:01:14'),(36,2,'LTC','USD',134.704,1,'2018-03-14 21:01:14'),(37,2,'RUB','BCH',0.0000225907,1,'2018-03-14 21:01:14'),(38,2,'RUB','BTC',0.00000217447,1,'2018-03-14 21:01:14'),(39,2,'RUB','DSH',0.0000467931,1,'2018-03-14 21:01:14'),(40,2,'RUB','ETC',0.00106702,1,'2018-03-14 21:01:14'),(41,2,'RUB','ETH',0.0000342231,1,'2018-03-14 21:01:14'),(42,2,'RUB','LTC',0.000128138,1,'2018-03-14 21:01:14'),(43,2,'RUB','USD',0.0173822,1,'2018-03-14 21:01:14'),(44,2,'RUB','XRP',0.0261144,1,'2018-03-14 21:01:14'),(45,2,'USD','BCH',0.00130208,1,'2018-03-14 21:01:14'),(46,2,'USD','BTC',0.000125549,1,'2018-03-14 21:01:14'),(47,2,'USD','DSH',0.00270075,1,'2018-03-14 21:01:14'),(48,2,'USD','ETC',0.0615009,1,'2018-03-14 21:01:14'),(49,2,'USD','ETH',0.00196464,1,'2018-03-14 21:01:14'),(50,2,'USD','LTC',0.00736971,1,'2018-03-14 21:01:15'),(51,2,'USD','RUB',57.5299,1,'2018-03-14 21:01:15'),(52,2,'USD','XMR',0.00515464,1,'2018-03-14 21:01:15'),(53,2,'USD','XRP',1.50444,1,'2018-03-14 21:01:15'),(54,2,'XMR','BTC',0.0244222,1,'2018-03-14 21:01:15'),(55,2,'XMR','USD',193.861,1,'2018-03-14 21:01:15'),(56,2,'XRP','BTC',0.0000833,1,'2018-03-14 21:01:15'),(57,2,'XRP','RUB',38.1,1,'2018-03-14 21:01:15'),(58,2,'XRP','USD',0.661303,1,'2018-03-14 21:01:15');
/*!40000 ALTER TABLE `external_rates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fraudsters_data`
--

DROP TABLE IF EXISTS `fraudsters_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fraudsters_data` (
  `id` int(10) unsigned NOT NULL,
  `data` text NOT NULL,
  `desc` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fraudsters_data`
--

LOCK TABLES `fraudsters_data` WRITE;
/*!40000 ALTER TABLE `fraudsters_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `fraudsters_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fraudsters_requisites`
--

DROP TABLE IF EXISTS `fraudsters_requisites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fraudsters_requisites` (
  `data` varchar(128) NOT NULL,
  `ref` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`data`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fraudsters_requisites`
--

LOCK TABLES `fraudsters_requisites` WRITE;
/*!40000 ALTER TABLE `fraudsters_requisites` DISABLE KEYS */;
/*!40000 ALTER TABLE `fraudsters_requisites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `history_reserves`
--

DROP TABLE IF EXISTS `history_reserves`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `history_reserves` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `amount` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `payment_system_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_history_reserves_on_payment_system_id` (`payment_system_id`),
  CONSTRAINT `fk_rails_a790d9ee43` FOREIGN KEY (`payment_system_id`) REFERENCES `cms_paymant_system` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `history_reserves`
--

LOCK TABLES `history_reserves` WRITE;
/*!40000 ALTER TABLE `history_reserves` DISABLE KEYS */;
/*!40000 ALTER TABLE `history_reserves` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification`
--

DROP TABLE IF EXISTS `notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_store` int(11) NOT NULL DEFAULT '0',
  `count_call` int(11) NOT NULL DEFAULT '0',
  `is_done` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `responce` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `is_done` (`is_done`,`count_call`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification`
--

LOCK TABLES `notification` WRITE;
/*!40000 ALTER TABLE `notification` DISABLE KEYS */;
/*!40000 ALTER TABLE `notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qiwi_payments`
--

DROP TABLE IF EXISTS `qiwi_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qiwi_payments` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `account` varchar(255) NOT NULL,
  `direction_type` varchar(255) NOT NULL,
  `txn_id` bigint(20) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `total_cents` int(11) NOT NULL DEFAULT '0',
  `total_currency` varchar(255) NOT NULL DEFAULT 'USD',
  `data` json NOT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `order_public_id` bigint(20) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_qiwi_payments_on_txn_id` (`txn_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qiwi_payments`
--

LOCK TABLES `qiwi_payments` WRITE;
/*!40000 ALTER TABLE `qiwi_payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `qiwi_payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qiwi_uniq_amount`
--

DROP TABLE IF EXISTS `qiwi_uniq_amount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qiwi_uniq_amount` (
  `amount` decimal(9,2) unsigned NOT NULL,
  `utime` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qiwi_uniq_amount`
--

LOCK TABLES `qiwi_uniq_amount` WRITE;
/*!40000 ALTER TABLE `qiwi_uniq_amount` DISABLE KEYS */;
/*!40000 ALTER TABLE `qiwi_uniq_amount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rate_sources`
--

DROP TABLE IF EXISTS `rate_sources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rate_sources` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `key` varchar(255) NOT NULL,
  `actual_snapshot_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_rate_sources_on_key` (`key`),
  UNIQUE KEY `index_rate_sources_on_title` (`title`),
  KEY `fk_rails_0b6cf3ddaa` (`actual_snapshot_id`),
  CONSTRAINT `fk_rails_0b6cf3ddaa` FOREIGN KEY (`actual_snapshot_id`) REFERENCES `external_rate_snapshots` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rate_sources`
--

LOCK TABLES `rate_sources` WRITE;
/*!40000 ALTER TABLE `rate_sources` DISABLE KEYS */;
INSERT INTO `rate_sources` VALUES (1,'ЦБ РФ','RateSourceCBR','2018-03-15 00:01:12','2018-03-15 00:01:12','cbr',2),(2,'EXMO','RateSourceEXMO','2018-03-15 00:01:12','2018-03-15 00:01:12','exmo',1),(3,'Ручной','RateSourceManual','2018-03-15 00:01:12','2018-03-15 00:01:12','manual',NULL),(4,'ЦБ РФ (средний)','RateSourceCBR','2018-03-15 00:01:12','2018-03-15 00:01:12','cbr_avg',3);
/*!40000 ALTER TABLE `rate_sources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `residue`
--

DROP TABLE IF EXISTS `residue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `residue` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_in_unixtime` bigint(20) unsigned DEFAULT NULL,
  `id_wallet` int(10) unsigned DEFAULT NULL,
  `create_time` int(10) unsigned DEFAULT NULL,
  `id_ps` int(11) NOT NULL,
  `sum` float NOT NULL DEFAULT '0',
  `is_create` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_rails_68b21311f6` (`id_ps`),
  CONSTRAINT `fk_rails_68b21311f6` FOREIGN KEY (`id_ps`) REFERENCES `cms_paymant_system` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `residue`
--

LOCK TABLES `residue` WRITE;
/*!40000 ALTER TABLE `residue` DISABLE KEYS */;
/*!40000 ALTER TABLE `residue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20180226082621'),('20180228205056'),('20180228210235'),('20180306134858'),('20180307094423'),('20180307094616'),('20180308134033'),('20180308134634'),('20180308141118'),('20180312174610'),('20180313054813'),('20180313065649'),('20180313090834'),('20180313180815'),('20180313181831'),('20180313204503'),('20180314110917'),('20180314164831'),('20180314170028'),('20180315140056'),('20180315140202'),('20180318165348'),('20180319142604'),('20180319162348'),('20180319182739'),('20180319183325'),('20180320191559'),('20180321055549'),('20180321125611'),('20180322104534'),('20180323120238'),('20180325184049'),('20180325184050'),('20180325184052'),('20180325190617'),('20180325193400'),('20180325194422'),('20180325201935'),('20180325210455'),('20180326091310'),('20180326120822'),('20180326145443'),('20180326154023'),('20180326160153'),('20180327180819'),('20180328102710'),('20180328161016'),('20180328164503'),('20180328173827'),('20180329152958'),('20180329155828'),('20180329162333'),('20180329182701'),('20180331121542'),('20180331123239'),('20180331123304'),('20180331224009'),('20180401071439'),('20180404164853'),('20180404192607'),('20180405054056'),('20180405075734'),('20180405080405'),('20180405080510'),('20180409095957'),('20180409100125'),('20180416144407'),('20180416163930'),('20180416171705'),('20180416172430'),('20180416183548'),('20180416190155'),('20180422200834'),('20180423142259'),('20180423142540'),('20180424085640'),('20180425213442'),('20180426085633'),('20180428095106'),('20180428095514'),('20180503104420'),('20180503122923'),('20180503134612'),('20180510144602'),('20180511125856'),('20180514141255'),('20180515071705'),('20180515090418'),('20180515092350'),('20180516081352');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `simple_captcha_data`
--

DROP TABLE IF EXISTS `simple_captcha_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `simple_captcha_data` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `key` varchar(40) NOT NULL,
  `value` varchar(6) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_key` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `simple_captcha_data`
--

LOCK TABLES `simple_captcha_data` WRITE;
/*!40000 ALTER TABLE `simple_captcha_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `simple_captcha_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statistics`
--

DROP TABLE IF EXISTS `statistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `statistics` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `smena` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `count_t` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `income` decimal(10,2) NOT NULL DEFAULT '0.00',
  `is_done` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statistics`
--

LOCK TABLES `statistics` WRITE;
/*!40000 ALTER TABLE `statistics` DISABLE KEYS */;
/*!40000 ALTER TABLE `statistics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_balance`
--

DROP TABLE IF EXISTS `store_balance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `store_balance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_store` int(11) NOT NULL DEFAULT '0',
  `id_ticket` int(11) NOT NULL DEFAULT '0',
  `id_ps` int(11) NOT NULL,
  `output` int(11) NOT NULL DEFAULT '0',
  `amount` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `fk_rails_778bca7f11` (`id_ps`),
  CONSTRAINT `fk_rails_778bca7f11` FOREIGN KEY (`id_ps`) REFERENCES `cms_paymant_system` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_balance`
--

LOCK TABLES `store_balance` WRITE;
/*!40000 ALTER TABLE `store_balance` DISABLE KEYS */;
/*!40000 ALTER TABLE `store_balance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_button`
--

DROP TABLE IF EXISTS `store_button`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `store_button` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_store` int(10) unsigned DEFAULT NULL,
  `name` varchar(100) NOT NULL DEFAULT '',
  `sum` varchar(20) NOT NULL DEFAULT '0',
  `valuta` tinyint(1) unsigned DEFAULT NULL,
  `hash` varchar(32) NOT NULL DEFAULT '',
  `is_deleted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_button`
--

LOCK TABLES `store_button` WRITE;
/*!40000 ALTER TABLE `store_button` DISABLE KEYS */;
/*!40000 ALTER TABLE `store_button` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_rate`
--

DROP TABLE IF EXISTS `store_rate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `store_rate` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_ps1` int(11) NOT NULL,
  `id_ps2` int(11) NOT NULL,
  `value_ps` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_rails_0d95b1d76a` (`id_ps1`),
  KEY `fk_rails_cab0b75710` (`id_ps2`),
  CONSTRAINT `fk_rails_0d95b1d76a` FOREIGN KEY (`id_ps1`) REFERENCES `cms_paymant_system` (`id`),
  CONSTRAINT `fk_rails_cab0b75710` FOREIGN KEY (`id_ps2`) REFERENCES `cms_paymant_system` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_rate`
--

LOCK TABLES `store_rate` WRITE;
/*!40000 ALTER TABLE `store_rate` DISABLE KEYS */;
/*!40000 ALTER TABLE `store_rate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_transit`
--

DROP TABLE IF EXISTS `store_transit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `store_transit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_store` int(11) NOT NULL DEFAULT '0',
  `id_payment` int(11) NOT NULL DEFAULT '0',
  `hash` varchar(32) NOT NULL DEFAULT '',
  `data` text NOT NULL,
  `t` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_transit`
--

LOCK TABLES `store_transit` WRITE;
/*!40000 ALTER TABLE `store_transit` DISABLE KEYS */;
/*!40000 ALTER TABLE `store_transit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stores`
--

DROP TABLE IF EXISTS `stores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `logo` varchar(50) NOT NULL DEFAULT '',
  `info` text NOT NULL,
  `secret_key` varchar(40) NOT NULL DEFAULT '',
  `url_notification` varchar(100) NOT NULL DEFAULT '',
  `fg_notification` tinyint(1) NOT NULL DEFAULT '0',
  `url` varchar(255) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `url_success` varchar(255) NOT NULL DEFAULT '',
  `url_fail` varchar(255) NOT NULL DEFAULT '',
  `id_ps` int(11) DEFAULT NULL,
  `сommission` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fg_notification` (`fg_notification`),
  KEY `fk_rails_723b7e3f70` (`id_ps`),
  CONSTRAINT `fk_rails_723b7e3f70` FOREIGN KEY (`id_ps`) REFERENCES `cms_paymant_system` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stores`
--

LOCK TABLES `stores` WRITE;
/*!40000 ALTER TABLE `stores` DISABLE KEYS */;
/*!40000 ALTER TABLE `stores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yourls_url`
--

DROP TABLE IF EXISTS `yourls_url`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yourls_url` (
  `slug` varchar(8) NOT NULL,
  `content_id` int(10) unsigned NOT NULL,
  `title` varchar(128) NOT NULL,
  `keyword` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `url` varchar(200) NOT NULL,
  PRIMARY KEY (`slug`),
  UNIQUE KEY `content_id` (`content_id`),
  UNIQUE KEY `index_yourls_url_on_slug` (`slug`),
  UNIQUE KEY `index_yourls_url_on_url` (`url`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yourls_url`
--

LOCK TABLES `yourls_url` WRITE;
/*!40000 ALTER TABLE `yourls_url` DISABLE KEYS */;
/*!40000 ALTER TABLE `yourls_url` ENABLE KEYS */;
UNLOCK TABLES;
/*!50112 SET @disable_bulk_load = IF (@is_rocksdb_supported, 'SET SESSION rocksdb_bulk_load = @old_rocksdb_bulk_load', 'SET @dummy_rocksdb_bulk_load = 0') */;
/*!50112 PREPARE s FROM @disable_bulk_load */;
/*!50112 EXECUTE s */;
/*!50112 DEALLOCATE PREPARE s */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-05-21 11:05:44
