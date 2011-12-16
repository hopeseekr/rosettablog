-- MySQL dump 10.13  Distrib 5.5.1-m2, for pc-linux-gnu (x86_64)
--
-- Host: localhost    Database: goddess_rosetta
-- ------------------------------------------------------
-- Server version	5.5.1-m2-log

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
-- Table structure for table `access`
--

DROP TABLE IF EXISTS `access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `access` (
  `aid` tinyint(10) NOT NULL AUTO_INCREMENT,
  `mask` varchar(255) NOT NULL DEFAULT '',
  `type` varchar(255) NOT NULL DEFAULT '',
  `status` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`aid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `access`
--

LOCK TABLES `access` WRITE;
/*!40000 ALTER TABLE `access` DISABLE KEYS */;
/*!40000 ALTER TABLE `access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accesslog`
--

DROP TABLE IF EXISTS `accesslog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accesslog` (
  `aid` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `hostname` varchar(128) DEFAULT NULL,
  `uid` int(10) unsigned DEFAULT '0',
  `timestamp` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`aid`),
  KEY `accesslog_timestamp` (`timestamp`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accesslog`
--

LOCK TABLES `accesslog` WRITE;
/*!40000 ALTER TABLE `accesslog` DISABLE KEYS */;
/*!40000 ALTER TABLE `accesslog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aggregator_category`
--

DROP TABLE IF EXISTS `aggregator_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aggregator_category` (
  `cid` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `description` longtext NOT NULL,
  `block` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cid`),
  UNIQUE KEY `title` (`title`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aggregator_category`
--

LOCK TABLES `aggregator_category` WRITE;
/*!40000 ALTER TABLE `aggregator_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `aggregator_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aggregator_category_feed`
--

DROP TABLE IF EXISTS `aggregator_category_feed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aggregator_category_feed` (
  `fid` int(10) NOT NULL DEFAULT '0',
  `cid` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`fid`,`cid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aggregator_category_feed`
--

LOCK TABLES `aggregator_category_feed` WRITE;
/*!40000 ALTER TABLE `aggregator_category_feed` DISABLE KEYS */;
/*!40000 ALTER TABLE `aggregator_category_feed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aggregator_category_item`
--

DROP TABLE IF EXISTS `aggregator_category_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aggregator_category_item` (
  `iid` int(10) NOT NULL DEFAULT '0',
  `cid` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`iid`,`cid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aggregator_category_item`
--

LOCK TABLES `aggregator_category_item` WRITE;
/*!40000 ALTER TABLE `aggregator_category_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `aggregator_category_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aggregator_feed`
--

DROP TABLE IF EXISTS `aggregator_feed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aggregator_feed` (
  `fid` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  `refresh` int(10) NOT NULL DEFAULT '0',
  `checked` int(10) NOT NULL DEFAULT '0',
  `link` varchar(255) NOT NULL DEFAULT '',
  `description` longtext NOT NULL,
  `image` longtext NOT NULL,
  `etag` varchar(255) NOT NULL DEFAULT '',
  `modified` int(10) NOT NULL DEFAULT '0',
  `block` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`fid`),
  UNIQUE KEY `link` (`url`),
  UNIQUE KEY `title` (`title`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aggregator_feed`
--

LOCK TABLES `aggregator_feed` WRITE;
/*!40000 ALTER TABLE `aggregator_feed` DISABLE KEYS */;
/*!40000 ALTER TABLE `aggregator_feed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aggregator_item`
--

DROP TABLE IF EXISTS `aggregator_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aggregator_item` (
  `iid` int(10) NOT NULL AUTO_INCREMENT,
  `fid` int(10) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `link` varchar(255) NOT NULL DEFAULT '',
  `author` varchar(255) NOT NULL DEFAULT '',
  `description` longtext NOT NULL,
  `timestamp` int(11) DEFAULT NULL,
  PRIMARY KEY (`iid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aggregator_item`
--

LOCK TABLES `aggregator_item` WRITE;
/*!40000 ALTER TABLE `aggregator_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `aggregator_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authmap`
--

DROP TABLE IF EXISTS `authmap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authmap` (
  `aid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) NOT NULL DEFAULT '0',
  `authname` varchar(128) NOT NULL DEFAULT '',
  `module` varchar(128) NOT NULL DEFAULT '',
  PRIMARY KEY (`aid`),
  UNIQUE KEY `authname` (`authname`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authmap`
--

LOCK TABLES `authmap` WRITE;
/*!40000 ALTER TABLE `authmap` DISABLE KEYS */;
/*!40000 ALTER TABLE `authmap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blocks`
--

DROP TABLE IF EXISTS `blocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blocks` (
  `module` varchar(64) NOT NULL DEFAULT '',
  `delta` varchar(32) NOT NULL DEFAULT '0',
  `status` tinyint(2) NOT NULL DEFAULT '0',
  `weight` tinyint(1) NOT NULL DEFAULT '0',
  `region` tinyint(1) NOT NULL DEFAULT '0',
  `custom` tinyint(2) NOT NULL DEFAULT '0',
  `throttle` tinyint(1) NOT NULL DEFAULT '0',
  `visibility` tinyint(1) NOT NULL DEFAULT '0',
  `pages` text NOT NULL,
  `types` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blocks`
--

LOCK TABLES `blocks` WRITE;
/*!40000 ALTER TABLE `blocks` DISABLE KEYS */;
INSERT INTO `blocks` VALUES ('aggregator','feed-1',0,0,0,0,0,0,'',''),('aggregator','feed-2',0,0,0,0,0,0,'',''),('archive','0',1,-1,1,0,0,0,'',''),('block','1',1,1,1,0,0,0,'',''),('comment','0',0,0,1,0,0,0,'',''),('node','0',1,10,0,0,0,0,'',''),('search','0',1,-2,1,0,0,0,'',''),('statistics','0',1,3,0,1,0,0,'',''),('user','0',1,0,0,0,0,0,'',''),('user','1',1,0,0,0,0,0,'',''),('user','2',0,0,0,0,0,0,'',''),('user','3',1,0,0,0,0,0,'','');
/*!40000 ALTER TABLE `blocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `book` (
  `nid` int(10) unsigned NOT NULL DEFAULT '0',
  `parent` int(10) NOT NULL DEFAULT '0',
  `weight` tinyint(3) NOT NULL DEFAULT '0',
  `log` longtext,
  PRIMARY KEY (`nid`),
  KEY `parent` (`parent`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book`
--

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
/*!40000 ALTER TABLE `book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `boxes`
--

DROP TABLE IF EXISTS `boxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `boxes` (
  `bid` tinyint(4) NOT NULL AUTO_INCREMENT,
  `title` varchar(64) NOT NULL DEFAULT '',
  `body` longtext,
  `info` varchar(128) NOT NULL DEFAULT '',
  `format` int(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`bid`),
  UNIQUE KEY `title` (`title`),
  UNIQUE KEY `info` (`info`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boxes`
--

LOCK TABLES `boxes` WRITE;
/*!40000 ALTER TABLE `boxes` DISABLE KEYS */;
/*!40000 ALTER TABLE `boxes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache` (
  `cid` varchar(255) NOT NULL DEFAULT '',
  `data` longtext,
  `expire` int(11) NOT NULL DEFAULT '0',
  `created` int(11) NOT NULL DEFAULT '0',
  `headers` text,
  PRIMARY KEY (`cid`),
  KEY `expire` (`expire`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache`
--

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `cid` int(10) NOT NULL AUTO_INCREMENT,
  `pid` int(10) NOT NULL DEFAULT '0',
  `nid` int(10) NOT NULL DEFAULT '0',
  `uid` int(10) NOT NULL DEFAULT '0',
  `subject` varchar(64) NOT NULL DEFAULT '',
  `comment` longtext NOT NULL,
  `hostname` varchar(128) NOT NULL DEFAULT '',
  `timestamp` int(11) NOT NULL DEFAULT '0',
  `score` mediumint(9) NOT NULL DEFAULT '0',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `format` int(4) NOT NULL DEFAULT '0',
  `thread` varchar(255) NOT NULL DEFAULT '',
  `users` longtext,
  `name` varchar(60) DEFAULT NULL,
  `mail` varchar(64) DEFAULT NULL,
  `homepage` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cid`),
  KEY `lid` (`nid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `directory`
--

DROP TABLE IF EXISTS `directory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `directory` (
  `link` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(128) NOT NULL DEFAULT '',
  `mail` varchar(128) NOT NULL DEFAULT '',
  `slogan` longtext NOT NULL,
  `mission` longtext NOT NULL,
  `timestamp` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`link`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directory`
--

LOCK TABLES `directory` WRITE;
/*!40000 ALTER TABLE `directory` DISABLE KEYS */;
/*!40000 ALTER TABLE `directory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `files`
--

DROP TABLE IF EXISTS `files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `files` (
  `fid` int(10) unsigned NOT NULL DEFAULT '0',
  `nid` int(10) unsigned NOT NULL DEFAULT '0',
  `filename` varchar(255) NOT NULL DEFAULT '',
  `filepath` varchar(255) NOT NULL DEFAULT '',
  `filemime` varchar(255) NOT NULL DEFAULT '',
  `filesize` int(10) unsigned NOT NULL DEFAULT '0',
  `list` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`fid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `files`
--

LOCK TABLES `files` WRITE;
/*!40000 ALTER TABLE `files` DISABLE KEYS */;
/*!40000 ALTER TABLE `files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filter_formats`
--

DROP TABLE IF EXISTS `filter_formats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `filter_formats` (
  `format` int(4) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `roles` varchar(255) NOT NULL DEFAULT '',
  `cache` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`format`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filter_formats`
--

LOCK TABLES `filter_formats` WRITE;
/*!40000 ALTER TABLE `filter_formats` DISABLE KEYS */;
INSERT INTO `filter_formats` VALUES (1,'Filtered HTML',',',1),(2,'PHP code',',',0),(3,'Full HTML',',',1);
/*!40000 ALTER TABLE `filter_formats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filters`
--

DROP TABLE IF EXISTS `filters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `filters` (
  `format` int(4) NOT NULL DEFAULT '0',
  `module` varchar(64) NOT NULL DEFAULT '',
  `delta` tinyint(2) NOT NULL DEFAULT '0',
  `weight` tinyint(2) NOT NULL DEFAULT '0',
  KEY `weight` (`weight`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filters`
--

LOCK TABLES `filters` WRITE;
/*!40000 ALTER TABLE `filters` DISABLE KEYS */;
INSERT INTO `filters` VALUES (1,'filter',0,0),(1,'filter',2,1),(2,'filter',1,0),(3,'filter',2,0);
/*!40000 ALTER TABLE `filters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flood`
--

DROP TABLE IF EXISTS `flood`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flood` (
  `event` varchar(64) NOT NULL DEFAULT '',
  `hostname` varchar(128) NOT NULL DEFAULT '',
  `timestamp` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flood`
--

LOCK TABLES `flood` WRITE;
/*!40000 ALTER TABLE `flood` DISABLE KEYS */;
/*!40000 ALTER TABLE `flood` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forum`
--

DROP TABLE IF EXISTS `forum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `forum` (
  `nid` int(10) unsigned NOT NULL DEFAULT '0',
  `tid` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`nid`),
  KEY `tid` (`tid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forum`
--

LOCK TABLES `forum` WRITE;
/*!40000 ALTER TABLE `forum` DISABLE KEYS */;
/*!40000 ALTER TABLE `forum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `history`
--

DROP TABLE IF EXISTS `history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `history` (
  `uid` int(10) NOT NULL DEFAULT '0',
  `nid` int(10) NOT NULL DEFAULT '0',
  `timestamp` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`,`nid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `history`
--

LOCK TABLES `history` WRITE;
/*!40000 ALTER TABLE `history` DISABLE KEYS */;
/*!40000 ALTER TABLE `history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locales_meta`
--

DROP TABLE IF EXISTS `locales_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `locales_meta` (
  `locale` varchar(12) NOT NULL DEFAULT '',
  `name` varchar(64) NOT NULL DEFAULT '',
  `enabled` int(2) NOT NULL DEFAULT '0',
  `isdefault` int(2) NOT NULL DEFAULT '0',
  `plurals` int(1) NOT NULL DEFAULT '0',
  `formula` varchar(128) NOT NULL DEFAULT '',
  PRIMARY KEY (`locale`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locales_meta`
--

LOCK TABLES `locales_meta` WRITE;
/*!40000 ALTER TABLE `locales_meta` DISABLE KEYS */;
INSERT INTO `locales_meta` VALUES ('en','English',1,1,0,'');
/*!40000 ALTER TABLE `locales_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locales_source`
--

DROP TABLE IF EXISTS `locales_source`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `locales_source` (
  `lid` int(11) NOT NULL AUTO_INCREMENT,
  `location` varchar(128) NOT NULL DEFAULT '',
  `source` blob NOT NULL,
  PRIMARY KEY (`lid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locales_source`
--

LOCK TABLES `locales_source` WRITE;
/*!40000 ALTER TABLE `locales_source` DISABLE KEYS */;
/*!40000 ALTER TABLE `locales_source` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locales_target`
--

DROP TABLE IF EXISTS `locales_target`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `locales_target` (
  `lid` int(11) NOT NULL DEFAULT '0',
  `translation` blob NOT NULL,
  `locale` varchar(12) NOT NULL DEFAULT '',
  `plid` int(11) NOT NULL DEFAULT '0',
  `plural` int(1) NOT NULL DEFAULT '0',
  KEY `lid` (`lid`),
  KEY `lang` (`locale`),
  KEY `plid` (`plid`),
  KEY `plural` (`plural`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locales_target`
--

LOCK TABLES `locales_target` WRITE;
/*!40000 ALTER TABLE `locales_target` DISABLE KEYS */;
/*!40000 ALTER TABLE `locales_target` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu` (
  `mid` int(10) unsigned NOT NULL DEFAULT '0',
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `path` varchar(255) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `weight` tinyint(4) NOT NULL DEFAULT '0',
  `type` int(2) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`mid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (2,30,'admin/aggregator','aggregator','',0,22),(3,1,'aggregator','news aggregator','',5,22),(4,3,'aggregator/sources','sources','',0,22),(5,3,'aggregator/categories','categories','',0,28),(6,4,'aggregator/sources/4','GiveMeHope.org','',0,22),(7,4,'aggregator/sources/1','SpreadTheFox.net','',0,22),(8,4,'aggregator/sources/2','xMule P2P Client','',0,22),(9,1,'archive','archives','',0,16),(10,30,'admin/block','blocks','',0,22),(11,30,'admin/comment','comments','',0,22),(12,30,'admin/filters','input formats','',0,22),(13,1,'filter/tips','compose tips','',0,16),(14,30,'admin/help','help','',9,22),(15,30,'admin/menu','menus','',0,22),(16,30,'admin/node','content','',0,22),(44,1,'drupal','Drupal','',0,16),(18,17,'node/add','create content','',1,28),(19,18,'node/add/page','page','',0,22),(20,30,'admin/path','url aliases','',0,22),(21,1,'profile','user list','',0,16),(22,32,'admin/settings/profile','profiles','',0,22),(23,1,'search','search','',0,16),(24,32,'admin/settings/search','search','',0,22),(25,42,'admin/logs/hits','recent hits','',3,22),(26,42,'admin/logs/pages','top pages','',1,22),(27,42,'admin/logs/users','top users','',2,22),(28,42,'admin/logs/referrers','referrers','',0,22),(29,18,'node/add/story','story','',0,22),(30,1,'admin','administrate','',9,54),(31,30,'admin/themes','themes','',0,22),(32,30,'admin/settings','settings','',0,22),(33,32,'admin/settings/aggregator','aggregator','',0,22),(34,32,'admin/settings/statistics','statistics','',0,22),(35,32,'admin/settings/throttle','throttle','',0,22),(36,30,'admin/modules','modules','',0,22),(37,1,'tracker','recent posts','',1,22),(38,32,'admin/settings/upload','uploads','',0,22),(39,30,'admin/user','users','',0,22),(40,30,'admin/access','access control','',0,22),(41,1,'logout','log out','',10,22),(42,30,'admin/logs','logs','',0,22),(43,1,'node','content','',0,16),(45,32,'admin/settings/drupal','drupal','',0,22),(46,30,'admin/spam','spam','',0,22),(47,32,'admin/settings/spam','spam','',0,22),(48,32,'admin/settings/poormanscron','poormanscron','',0,22);
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `moderation_filters`
--

DROP TABLE IF EXISTS `moderation_filters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `moderation_filters` (
  `fid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `filter` varchar(255) NOT NULL DEFAULT '',
  `minimum` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`fid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `moderation_filters`
--

LOCK TABLES `moderation_filters` WRITE;
/*!40000 ALTER TABLE `moderation_filters` DISABLE KEYS */;
/*!40000 ALTER TABLE `moderation_filters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `moderation_roles`
--

DROP TABLE IF EXISTS `moderation_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `moderation_roles` (
  `rid` int(10) unsigned NOT NULL DEFAULT '0',
  `mid` int(10) unsigned NOT NULL DEFAULT '0',
  `value` tinyint(4) NOT NULL DEFAULT '0',
  KEY `idx_rid` (`rid`),
  KEY `idx_mid` (`mid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `moderation_roles`
--

LOCK TABLES `moderation_roles` WRITE;
/*!40000 ALTER TABLE `moderation_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `moderation_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `moderation_votes`
--

DROP TABLE IF EXISTS `moderation_votes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `moderation_votes` (
  `mid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `vote` varchar(255) DEFAULT NULL,
  `weight` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`mid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `moderation_votes`
--

LOCK TABLES `moderation_votes` WRITE;
/*!40000 ALTER TABLE `moderation_votes` DISABLE KEYS */;
/*!40000 ALTER TABLE `moderation_votes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `node`
--

DROP TABLE IF EXISTS `node`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `node` (
  `nid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(16) NOT NULL DEFAULT '',
  `title` varchar(128) NOT NULL DEFAULT '',
  `uid` int(10) NOT NULL DEFAULT '0',
  `status` int(4) NOT NULL DEFAULT '1',
  `created` int(11) NOT NULL DEFAULT '0',
  `changed` int(11) NOT NULL DEFAULT '0',
  `comment` int(2) NOT NULL DEFAULT '0',
  `promote` int(2) NOT NULL DEFAULT '0',
  `moderate` int(2) NOT NULL DEFAULT '0',
  `teaser` longtext NOT NULL,
  `body` longtext NOT NULL,
  `revisions` longtext NOT NULL,
  `sticky` int(2) NOT NULL DEFAULT '0',
  `format` int(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`nid`),
  KEY `node_type` (`type`(4)),
  KEY `node_title_type` (`title`,`type`(4)),
  KEY `status` (`status`),
  KEY `uid` (`uid`),
  KEY `node_moderate` (`moderate`),
  KEY `node_promote_status` (`promote`,`status`),
  KEY `node_created` (`created`),
  KEY `node_changed` (`changed`),
  KEY `node_status_type` (`status`,`type`,`nid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `node`
--

LOCK TABLES `node` WRITE;
/*!40000 ALTER TABLE `node` DISABLE KEYS */;
/*!40000 ALTER TABLE `node` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `node_access`
--

DROP TABLE IF EXISTS `node_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `node_access` (
  `nid` int(10) unsigned NOT NULL DEFAULT '0',
  `gid` int(10) unsigned NOT NULL DEFAULT '0',
  `realm` varchar(255) NOT NULL DEFAULT '',
  `grant_view` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `grant_update` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `grant_delete` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`nid`,`gid`,`realm`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `node_access`
--

LOCK TABLES `node_access` WRITE;
/*!40000 ALTER TABLE `node_access` DISABLE KEYS */;
INSERT INTO `node_access` VALUES (0,0,'all',1,0,0);
/*!40000 ALTER TABLE `node_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `node_comment_statistics`
--

DROP TABLE IF EXISTS `node_comment_statistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `node_comment_statistics` (
  `nid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `last_comment_timestamp` int(11) NOT NULL DEFAULT '0',
  `last_comment_name` varchar(60) DEFAULT NULL,
  `last_comment_uid` int(10) NOT NULL DEFAULT '0',
  `comment_count` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`nid`),
  KEY `node_comment_timestamp` (`last_comment_timestamp`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `node_comment_statistics`
--

LOCK TABLES `node_comment_statistics` WRITE;
/*!40000 ALTER TABLE `node_comment_statistics` DISABLE KEYS */;
/*!40000 ALTER TABLE `node_comment_statistics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `node_counter`
--

DROP TABLE IF EXISTS `node_counter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `node_counter` (
  `nid` int(11) NOT NULL DEFAULT '0',
  `totalcount` bigint(20) unsigned NOT NULL DEFAULT '0',
  `daycount` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `timestamp` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`nid`),
  KEY `totalcount` (`totalcount`),
  KEY `daycount` (`daycount`),
  KEY `timestamp` (`timestamp`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `node_counter`
--

LOCK TABLES `node_counter` WRITE;
/*!40000 ALTER TABLE `node_counter` DISABLE KEYS */;
/*!40000 ALTER TABLE `node_counter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission`
--

DROP TABLE IF EXISTS `permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permission` (
  `rid` int(10) unsigned NOT NULL DEFAULT '0',
  `perm` longtext,
  `tid` int(10) unsigned NOT NULL DEFAULT '0',
  KEY `rid` (`rid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission`
--

LOCK TABLES `permission` WRITE;
/*!40000 ALTER TABLE `permission` DISABLE KEYS */;
INSERT INTO `permission` VALUES (1,'access news feeds, access comments, access content',0),(2,'access news feeds, access comments, post comments, post comments without approval, access content, administer nodes, search content, access statistics, access user profiles',0),(4,'access news feeds, administer news feeds, administer blocks, access comments, administer comments, administer moderation, moderate comments, post comments, post comments without approval, administer filters, administer menu, access content, administer nodes, create pages, edit own pages, administer url aliases, create url aliases, administer search, search content, access spam, administer spam, bypass filter, access statistics, create stories, edit own stories, access administration pages, administer site configuration, bypass input data check, upload files, view uploaded files, access user profiles, administer users, administer watchdog',0);
/*!40000 ALTER TABLE `permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `poll`
--

DROP TABLE IF EXISTS `poll`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `poll` (
  `nid` int(10) unsigned NOT NULL DEFAULT '0',
  `runtime` int(10) NOT NULL DEFAULT '0',
  `polled` longtext NOT NULL,
  `active` int(2) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`nid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `poll`
--

LOCK TABLES `poll` WRITE;
/*!40000 ALTER TABLE `poll` DISABLE KEYS */;
/*!40000 ALTER TABLE `poll` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `poll_choices`
--

DROP TABLE IF EXISTS `poll_choices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `poll_choices` (
  `chid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nid` int(10) unsigned NOT NULL DEFAULT '0',
  `chtext` varchar(128) NOT NULL DEFAULT '',
  `chvotes` int(6) NOT NULL DEFAULT '0',
  `chorder` int(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`chid`),
  KEY `nid` (`nid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `poll_choices`
--

LOCK TABLES `poll_choices` WRITE;
/*!40000 ALTER TABLE `poll_choices` DISABLE KEYS */;
/*!40000 ALTER TABLE `poll_choices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile_fields`
--

DROP TABLE IF EXISTS `profile_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profile_fields` (
  `fid` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `name` varchar(128) DEFAULT NULL,
  `explanation` text,
  `category` varchar(255) DEFAULT NULL,
  `page` varchar(255) DEFAULT NULL,
  `type` varchar(128) DEFAULT NULL,
  `weight` tinyint(1) NOT NULL DEFAULT '0',
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `register` tinyint(1) NOT NULL DEFAULT '0',
  `visibility` tinyint(1) NOT NULL DEFAULT '0',
  `options` text,
  PRIMARY KEY (`fid`),
  UNIQUE KEY `name` (`name`),
  KEY `category` (`category`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile_fields`
--

LOCK TABLES `profile_fields` WRITE;
/*!40000 ALTER TABLE `profile_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `profile_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile_values`
--

DROP TABLE IF EXISTS `profile_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profile_values` (
  `fid` int(10) unsigned DEFAULT '0',
  `uid` int(10) unsigned DEFAULT '0',
  `value` text,
  KEY `uid` (`uid`),
  KEY `fid` (`fid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile_values`
--

LOCK TABLES `profile_values` WRITE;
/*!40000 ALTER TABLE `profile_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `profile_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `queue`
--

DROP TABLE IF EXISTS `queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `queue` (
  `nid` int(10) unsigned NOT NULL DEFAULT '0',
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `vote` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`nid`,`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `queue`
--

LOCK TABLES `queue` WRITE;
/*!40000 ALTER TABLE `queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `rid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`rid`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'anonymous user'),(2,'authenticated user'),(4,'administrator');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `search_index`
--

DROP TABLE IF EXISTS `search_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `search_index` (
  `word` varchar(50) NOT NULL DEFAULT '',
  `sid` int(10) unsigned NOT NULL DEFAULT '0',
  `type` varchar(16) DEFAULT NULL,
  `fromsid` int(10) unsigned NOT NULL DEFAULT '0',
  `fromtype` varchar(16) DEFAULT NULL,
  `score` int(10) unsigned DEFAULT NULL,
  KEY `sid` (`sid`),
  KEY `fromsid` (`fromsid`),
  KEY `word` (`word`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `search_index`
--

LOCK TABLES `search_index` WRITE;
/*!40000 ALTER TABLE `search_index` DISABLE KEYS */;
/*!40000 ALTER TABLE `search_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `search_total`
--

DROP TABLE IF EXISTS `search_total`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `search_total` (
  `word` varchar(50) NOT NULL DEFAULT '',
  `count` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`word`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `search_total`
--

LOCK TABLES `search_total` WRITE;
/*!40000 ALTER TABLE `search_total` DISABLE KEYS */;
/*!40000 ALTER TABLE `search_total` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sequences`
--

DROP TABLE IF EXISTS `sequences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sequences` (
  `name` varchar(255) NOT NULL DEFAULT '',
  `id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sequences`
--

LOCK TABLES `sequences` WRITE;
/*!40000 ALTER TABLE `sequences` DISABLE KEYS */;
INSERT INTO `sequences` VALUES ('menu_mid',48),('users_uid',169),('node_nid',238),('comments_cid',12765),('aggregator_feed_fid',4),('aggregator_item_iid',67290);
/*!40000 ALTER TABLE `sequences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `sid` varchar(32) NOT NULL DEFAULT '',
  `hostname` varchar(128) NOT NULL DEFAULT '',
  `timestamp` int(11) NOT NULL DEFAULT '0',
  `session` longtext,
  PRIMARY KEY (`sid`),
  KEY `uid` (`uid`),
  KEY `timestamp` (`timestamp`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spam_custom`
--

DROP TABLE IF EXISTS `spam_custom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spam_custom` (
  `scid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `filter` varchar(255) NOT NULL DEFAULT '',
  `style` int(2) unsigned DEFAULT '0',
  `effect` int(2) unsigned DEFAULT '0',
  `action` tinyint(2) unsigned DEFAULT '0',
  `matches` int(11) unsigned DEFAULT '0',
  `last` int(11) unsigned DEFAULT '0',
  PRIMARY KEY (`scid`),
  KEY `filter` (`filter`),
  KEY `matches` (`matches`),
  KEY `last` (`last`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spam_custom`
--

LOCK TABLES `spam_custom` WRITE;
/*!40000 ALTER TABLE `spam_custom` DISABLE KEYS */;
INSERT INTO `spam_custom` VALUES (1,'/(adipex|cialis|phentermine|viagra)/i',1,1,2,6412,1170967899),(2,'/casino games|poker online|texas hold\\\'em|texas holdem/i',1,0,2,248,1142606805),(3,'/(american|casino|free|grand|online|party)( |-)?(blackjack|casino|gambling|poker)/i',1,0,2,170,1142603116),(4,'diet pill',0,0,2,107,1170190026),(5,'canadian pharmacy',0,1,2,0,0);
/*!40000 ALTER TABLE `spam_custom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spam_log`
--

DROP TABLE IF EXISTS `spam_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spam_log` (
  `sid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `source` varchar(64) NOT NULL DEFAULT '',
  `id` int(11) unsigned NOT NULL DEFAULT '0',
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `hostname` varchar(128) NOT NULL DEFAULT '',
  `entry` varchar(255) NOT NULL DEFAULT '',
  `timestamp` int(11) unsigned DEFAULT '0',
  PRIMARY KEY (`sid`),
  KEY `source` (`source`),
  KEY `id` (`id`),
  KEY `timestamp` (`timestamp`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spam_log`
--

LOCK TABLES `spam_log` WRITE;
/*!40000 ALTER TABLE `spam_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `spam_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spam_tokens`
--

DROP TABLE IF EXISTS `spam_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spam_tokens` (
  `tid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `token` varchar(255) NOT NULL DEFAULT '',
  `spam` int(10) unsigned DEFAULT '0',
  `notspam` int(10) unsigned DEFAULT '0',
  `probability` int(10) unsigned DEFAULT '0',
  `last` int(11) unsigned DEFAULT '0',
  PRIMARY KEY (`tid`),
  UNIQUE KEY `token` (`token`),
  KEY `spam` (`spam`),
  KEY `notspam` (`notspam`),
  KEY `probability` (`probability`),
  KEY `last` (`last`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spam_tokens`
--

LOCK TABLES `spam_tokens` WRITE;
/*!40000 ALTER TABLE `spam_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `spam_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spam_tracker`
--

DROP TABLE IF EXISTS `spam_tracker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spam_tracker` (
  `sid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `source` varchar(64) NOT NULL DEFAULT '',
  `id` int(11) unsigned NOT NULL DEFAULT '0',
  `probability` int(2) unsigned DEFAULT '0',
  `hostname` varchar(128) NOT NULL DEFAULT '',
  `hash` varchar(32) NOT NULL DEFAULT '',
  `timestamp` int(11) unsigned DEFAULT '0',
  PRIMARY KEY (`sid`),
  KEY `id` (`id`),
  KEY `probability` (`probability`),
  KEY `source` (`source`),
  KEY `hostname` (`hostname`),
  KEY `hash` (`hash`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spam_tracker`
--

LOCK TABLES `spam_tracker` WRITE;
/*!40000 ALTER TABLE `spam_tracker` DISABLE KEYS */;
/*!40000 ALTER TABLE `spam_tracker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system`
--

DROP TABLE IF EXISTS `system`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system` (
  `filename` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `type` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `status` int(2) NOT NULL DEFAULT '0',
  `throttle` tinyint(1) NOT NULL DEFAULT '0',
  `bootstrap` int(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`filename`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system`
--

LOCK TABLES `system` WRITE;
/*!40000 ALTER TABLE `system` DISABLE KEYS */;
INSERT INTO `system` VALUES ('modules/block.module','block','module','Controls the boxes that are displayed around the main content.',1,0,0),('modules/comment.module','comment','module','Allows users to comment on and discuss published content.',1,0,0),('modules/filter.module','filter','module','Handles the filtering of content in preparation for display.',1,0,0),('modules/help.module','help','module','Manages the display of online help.',1,0,0),('modules/node.module','node','module','Allows content to be submitted to the site and displayed on pages.',1,0,0),('modules/system.module','system','module','Handles general site configuration for administrators.',1,0,0),('modules/taxonomy.module','taxonomy','module','Enables the categorization of content.',0,0,0),('modules/user.module','user','module','Manages the user registration and login system.',1,0,0),('modules/watchdog.module','watchdog','module','Logs and records system events.',1,0,0),('modules/trackback.module','trackback','module','Allow for sending and receiving TrackBacks, which is a way for sites to notify another that they have commented on a post.',0,0,1),('modules/contact.module','contact','module','Enables the use of personal contact forms.',1,0,0),('themes/bluemarine/xtemplate.xtmpl','bluemarine','theme','themes/engines/xtemplate/xtemplate.engine',0,0,0),('themes/box_claire-forlani2/page.tpl.php','box_claire-forlani2','theme','themes/engines/phptemplate/phptemplate.engine',0,0,0),('modules/aggregator.module','aggregator','module','Aggregates syndicated content (RSS and RDF feeds).',1,0,0),('modules/drupal.module','drupal','module','Lets users log in using a Drupal ID and can notify a central server about your site.',1,0,0),('modules/menu.module','menu','module','Allows administrators to customize the site navigation menu.',1,0,0),('modules/ping.module','ping','module','Alerts other sites when your site has been updated.',1,0,0),('modules/profile.module','profile','module','Supports configurable user profiles.',1,0,0),('modules/blog.module','blog','module','Enables keeping an easily and regularly updated web page or a blog.',0,0,0),('modules/blogapi.module','blogapi','module','Allows users to post content using applications that support XML-RPC blog APIs.',0,0,0),('modules/book.module','book','module','Allows users to collaboratively author a book.',0,0,0),('modules/forum.module','forum','module','Enables threaded discussions about general topics.',0,0,0),('modules/legacy.module','legacy','module','Provides legacy handlers for upgrades from older Drupal installations.',0,0,0),('modules/locale.module','locale','module','Enables the translation of the user interface to languages other than English.',0,0,0),('modules/page.module','page','module','Enables the creation of pages that can be added to the navigation system.',1,0,0),('modules/poll.module','poll','module','Allows your site to capture votes on different topics in the form of multiple choice questions.',0,0,0),('modules/queue.module','queue','module','Allows content to be moderated by the community.',0,0,0),('modules/tracker.module','tracker','module','Enables tracking of recent posts for users.',1,0,0),('modules/poormanscron.module','poormanscron','module','Runs Drupal cron jobs without the cron application.',0,1,1),('modules/path.module','path','module','Allows users to rename URLs.',1,0,0),('themes/engines/xtemplate/xtemplate.engine','xtemplate','theme_engine','',1,0,0),('modules/search.module','search','module','Enables site-wide keyword searching.',1,0,0),('modules/upload.module','upload','module','Allows users to upload and attach files to content.',1,0,0),('modules/archive.module','archive','module','Displays a calendar for navigating older content.',1,0,0),('modules/statistics.module','statistics','module','Logs access statistics for your site.',0,0,1),('modules/story.module','story','module','Allows users to submit stories, articles or similar content.',1,0,0),('themes/box_grey/page.tpl.php','box_grey','theme','themes/engines/phptemplate/phptemplate.engine',1,0,0),('themes/box_claire-forlani1/page.tpl.php','box_claire-forlani1','theme','themes/engines/phptemplate/phptemplate.engine',0,0,0),('themes/engines/phptemplate/phptemplate.engine','phptemplate','theme_engine','',1,0,0),('themes/Claire Forlani 2/page.tpl.php','Claire Forlani 2','theme','themes/engines/phptemplate/phptemplate.engine',1,0,0),('themes/Claire Forlani 1/page.tpl.php','Claire Forlani 1','theme','themes/engines/phptemplate/phptemplate.engine',1,0,0),('themes/chameleon/chameleon.theme','chameleon','theme','themes/chameleon/chameleon.theme',0,0,0),('modules/spam.module','spam','module','Collection of tools and API for dealing with spam.',1,0,0),('modules/trackback_blackhole.module','trackback_blackhole','module','Drops all attempts to post or view trackbacks, minimizing the overhead of trackback spammers.',1,0,1),('themes/pushbutton/xtemplate.xtmpl','pushbutton','theme','themes/engines/xtemplate/xtemplate.engine',0,0,0),('themes/chameleon/marvin/style.css','marvin','theme','themes/chameleon/chameleon.theme',0,0,0),('themes/box_grey/box_cleanslate/style.css','box_cleanslate','theme','themes/box_grey/page.tpl.php',0,0,0),('modules/throttle.module','throttle','module','Handles the auto-throttling mechanism, to control site congestion.',0,0,1);
/*!40000 ALTER TABLE `system` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `term_data`
--

DROP TABLE IF EXISTS `term_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `term_data` (
  `tid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `vid` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` longtext,
  `weight` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`tid`),
  KEY `vid` (`vid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `term_data`
--

LOCK TABLES `term_data` WRITE;
/*!40000 ALTER TABLE `term_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `term_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `term_hierarchy`
--

DROP TABLE IF EXISTS `term_hierarchy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `term_hierarchy` (
  `tid` int(10) unsigned NOT NULL DEFAULT '0',
  `parent` int(10) unsigned NOT NULL DEFAULT '0',
  KEY `tid` (`tid`),
  KEY `parent` (`parent`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `term_hierarchy`
--

LOCK TABLES `term_hierarchy` WRITE;
/*!40000 ALTER TABLE `term_hierarchy` DISABLE KEYS */;
/*!40000 ALTER TABLE `term_hierarchy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `term_node`
--

DROP TABLE IF EXISTS `term_node`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `term_node` (
  `nid` int(10) unsigned NOT NULL DEFAULT '0',
  `tid` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`tid`,`nid`),
  KEY `nid` (`nid`),
  KEY `tid` (`tid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `term_node`
--

LOCK TABLES `term_node` WRITE;
/*!40000 ALTER TABLE `term_node` DISABLE KEYS */;
/*!40000 ALTER TABLE `term_node` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `term_relation`
--

DROP TABLE IF EXISTS `term_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `term_relation` (
  `tid1` int(10) unsigned NOT NULL DEFAULT '0',
  `tid2` int(10) unsigned NOT NULL DEFAULT '0',
  KEY `tid1` (`tid1`),
  KEY `tid2` (`tid2`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `term_relation`
--

LOCK TABLES `term_relation` WRITE;
/*!40000 ALTER TABLE `term_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `term_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `term_synonym`
--

DROP TABLE IF EXISTS `term_synonym`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `term_synonym` (
  `tid` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  KEY `tid` (`tid`),
  KEY `name` (`name`(3))
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `term_synonym`
--

LOCK TABLES `term_synonym` WRITE;
/*!40000 ALTER TABLE `term_synonym` DISABLE KEYS */;
/*!40000 ALTER TABLE `term_synonym` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trackback_received`
--

DROP TABLE IF EXISTS `trackback_received`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trackback_received` (
  `nid` int(10) unsigned NOT NULL DEFAULT '0',
  `cid` int(10) unsigned NOT NULL DEFAULT '0',
  `url` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`nid`,`cid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trackback_received`
--

LOCK TABLES `trackback_received` WRITE;
/*!40000 ALTER TABLE `trackback_received` DISABLE KEYS */;
/*!40000 ALTER TABLE `trackback_received` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trackback_sent`
--

DROP TABLE IF EXISTS `trackback_sent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trackback_sent` (
  `nid` int(10) unsigned NOT NULL DEFAULT '0',
  `url` varchar(255) NOT NULL DEFAULT '',
  `successful` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`nid`,`url`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trackback_sent`
--

LOCK TABLES `trackback_sent` WRITE;
/*!40000 ALTER TABLE `trackback_sent` DISABLE KEYS */;
/*!40000 ALTER TABLE `trackback_sent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_alias`
--

DROP TABLE IF EXISTS `url_alias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_alias` (
  `pid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `src` varchar(128) NOT NULL DEFAULT '',
  `dst` varchar(128) NOT NULL DEFAULT '',
  PRIMARY KEY (`pid`),
  UNIQUE KEY `dst` (`dst`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_alias`
--

LOCK TABLES `url_alias` WRITE;
/*!40000 ALTER TABLE `url_alias` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_alias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(60) NOT NULL DEFAULT '',
  `pass` varchar(32) NOT NULL DEFAULT '',
  `mail` varchar(64) DEFAULT '',
  `mode` tinyint(1) NOT NULL DEFAULT '0',
  `sort` tinyint(1) DEFAULT '0',
  `threshold` tinyint(1) DEFAULT '0',
  `theme` varchar(255) NOT NULL DEFAULT '',
  `signature` varchar(255) NOT NULL DEFAULT '',
  `created` int(11) NOT NULL DEFAULT '0',
  `changed` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `timezone` varchar(8) DEFAULT NULL,
  `language` varchar(12) NOT NULL DEFAULT '',
  `picture` varchar(255) NOT NULL DEFAULT '',
  `init` varchar(64) DEFAULT '',
  `data` longtext,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `name` (`name`),
  KEY `changed` (`changed`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_roles`
--

DROP TABLE IF EXISTS `users_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_roles` (
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `rid` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`,`rid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_roles`
--

LOCK TABLES `users_roles` WRITE;
/*!40000 ALTER TABLE `users_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `variable`
--

DROP TABLE IF EXISTS `variable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `variable` (
  `name` varchar(48) NOT NULL DEFAULT '',
  `value` longtext NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `variable`
--

LOCK TABLES `variable` WRITE;
/*!40000 ALTER TABLE `variable` DISABLE KEYS */;
INSERT INTO `variable` VALUES ('update_start','s:10:\"2005-03-21\";'),('theme_default','s:16:\"Claire Forlani 1\";'),('filter_html_1','s:1:\"1\";'),('clean_url_ok','i:1;'),('site_name','s:10:\"Incendiary\";'),('site_mail','s:19:\"hopeseekr@gmail.com\";'),('site_mission','s:93:\"A needle of <em>Hope</em> amid a monstrous haystack of <em>Chaos</em>. <br/>&mdash; HopeSeekr\";'),('anonymous','s:9:\"Anonymous\";'),('site_frontpage','s:4:\"node\";'),('clean_url','s:1:\"1\";'),('site_403','s:0:\"\";'),('site_404','s:3:\"404\";'),('error_level','s:1:\"1\";'),('watchdog_clear','s:6:\"604800\";'),('cache','s:1:\"0\";'),('file_directory_path','s:5:\"files\";'),('file_directory_temp','s:4:\"/tmp\";'),('file_downloads','s:1:\"1\";'),('configurable_timezones','s:1:\"1\";'),('date_format_short','s:9:\"Y-m-d H:i\";'),('date_format_medium','s:12:\"D, Y-m-d H:i\";'),('date_format_long','s:15:\"l, F j, Y - H:i\";'),('date_first_day','s:1:\"0\";'),('site_slogan','s:13:\"incendiary.ws\";'),('cron_busy','b:0;'),('theme_settings','a:14:{s:12:\"default_logo\";s:1:\"1\";s:9:\"logo_path\";s:25:\"/themes/box_grey/hope.jpg\";s:13:\"primary_links\";s:69:\"<a href=\"admin/themes/settings\" class=\"active\">edit primary links</a>\";s:15:\"secondary_links\";s:71:\"<a href=\"admin/themes/settings\" class=\"active\">edit secondary links</a>\";s:21:\"toggle_node_info_page\";s:1:\"0\";s:22:\"toggle_node_info_story\";s:1:\"1\";s:11:\"toggle_name\";s:1:\"1\";s:13:\"toggle_slogan\";s:1:\"1\";s:14:\"toggle_mission\";s:1:\"1\";s:20:\"toggle_primary_links\";s:1:\"1\";s:22:\"toggle_secondary_links\";s:1:\"1\";s:24:\"toggle_node_user_picture\";s:1:\"0\";s:27:\"toggle_comment_user_picture\";s:1:\"0\";s:13:\"toggle_search\";s:1:\"0\";}'),('throttle_anonymous','s:2:\"50\";'),('throttle_user','s:2:\"10\";'),('throttle_probability_limiter','s:1:\"9\";'),('default_nodes_main','s:1:\"4\";'),('teaser_length','s:3:\"600\";'),('node_preview','s:1:\"0\";'),('filter_default_format','s:1:\"1\";'),('date_default_timezone','s:6:\"-18000\";'),('node_cron_last','s:10:\"1173428823\";'),('statistics_day_timestamp','i:1149454277;'),('ping_cron_last','i:1181574019;'),('statistics_enable_access_log','s:1:\"1\";'),('statistics_flush_accesslog_timer','s:5:\"10800\";'),('statistics_count_content_views','s:1:\"1\";'),('statistics_display_counter','s:1:\"1\";'),('theme_box_cleanslate_settings','a:10:{s:12:\"default_logo\";s:1:\"1\";s:9:\"logo_path\";s:25:\"/themes/box_grey/hope.jpg\";s:11:\"toggle_name\";s:1:\"1\";s:13:\"toggle_slogan\";s:1:\"1\";s:14:\"toggle_mission\";s:1:\"1\";s:20:\"toggle_primary_links\";s:1:\"1\";s:22:\"toggle_secondary_links\";s:1:\"1\";s:24:\"toggle_node_user_picture\";s:1:\"0\";s:27:\"toggle_comment_user_picture\";s:1:\"0\";s:13:\"toggle_search\";s:1:\"0\";}'),('phptemplate_primary_links','a:3:{s:4:\"text\";a:5:{i:0;s:0:\"\";i:1;s:0:\"\";i:2;s:0:\"\";i:3;s:0:\"\";i:4;s:0:\"\";}s:4:\"link\";a:5:{i:0;s:0:\"\";i:1;s:0:\"\";i:2;s:0:\"\";i:3;s:0:\"\";i:4;s:0:\"\";}s:11:\"description\";a:5:{i:0;s:0:\"\";i:1;s:0:\"\";i:2;s:0:\"\";i:3;s:0:\"\";i:4;s:0:\"\";}}'),('phptemplate_primary_links_more','s:1:\"0\";'),('phptemplate_secondary_links','a:3:{s:4:\"text\";a:5:{i:0;s:0:\"\";i:1;s:0:\"\";i:2;s:0:\"\";i:3;s:0:\"\";i:4;s:0:\"\";}s:4:\"link\";a:5:{i:0;s:0:\"\";i:1;s:0:\"\";i:2;s:0:\"\";i:3;s:0:\"\";i:4;s:0:\"\";}s:11:\"description\";a:5:{i:0;s:0:\"\";i:1;s:0:\"\";i:2;s:0:\"\";i:3;s:0:\"\";i:4;s:0:\"\";}}'),('phptemplate_secondary_links_more','s:1:\"0\";'),('allowed_html_1','s:67:\"<a> <em> <strong> <cite> <code> <ul> <ol> <li> <dl> <dt> <dd> <img>\";'),('filter_html_help_1','s:1:\"1\";'),('filter_style_1','s:1:\"1\";'),('filter_html_nofollow_1','s:1:\"0\";'),('statistics_block_top_day_num','s:1:\"0\";'),('statistics_block_top_all_num','s:1:\"5\";'),('statistics_block_top_last_num','s:1:\"0\";'),('drupal_cron_last','i:1181553005;'),('comment_default_mode','s:1:\"4\";'),('comment_default_order','s:1:\"1\";'),('comment_default_per_page','s:2:\"50\";'),('comment_controls','s:1:\"3\";'),('comment_anonymous','s:1:\"2\";'),('comment_subject_field','s:1:\"1\";'),('comment_preview','s:1:\"0\";'),('comment_form_location','s:1:\"0\";'),('spam_filter_comments','s:1:\"1\";'),('spam_filter_page','s:1:\"0\";'),('spam_filter_story','s:1:\"0\";'),('spam_filter_urls','s:1:\"1\";'),('spam_urls_total','s:1:\"5\";'),('spam_urls_repeat','s:1:\"3\";'),('spam_duplicate_content','s:1:\"2\";'),('spam_blacklist_ip','s:1:\"2\";'),('spam_unpublish','s:1:\"1\";'),('spam_notify_user','s:1:\"1\";'),('spam_notify_admin','s:1:\"1\";'),('spam_expire_time','s:7:\"1209600\";'),('spam_log_level','s:1:\"1\";'),('spam_flush_log_timer','s:6:\"259200\";'),('spam_display_probability','s:1:\"1\";'),('poormanscron_lastrun','i:1149454277;'),('drupal_server','s:32:\"http://www.drupal.org/xmlrpc.php\";'),('drupal_directory','s:1:\"1\";'),('site_footer','s:46:\"Dedicated to the one I will live my life with.\";'),('throttle_level','i:1;'),('menu_expanded','a:0:{}');
/*!40000 ALTER TABLE `variable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vocabulary`
--

DROP TABLE IF EXISTS `vocabulary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vocabulary` (
  `vid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` longtext,
  `help` varchar(255) NOT NULL DEFAULT '',
  `relations` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `hierarchy` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `multiple` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `required` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `module` varchar(255) NOT NULL DEFAULT '',
  `weight` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`vid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vocabulary`
--

LOCK TABLES `vocabulary` WRITE;
/*!40000 ALTER TABLE `vocabulary` DISABLE KEYS */;
/*!40000 ALTER TABLE `vocabulary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vocabulary_node_types`
--

DROP TABLE IF EXISTS `vocabulary_node_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vocabulary_node_types` (
  `vid` int(10) unsigned NOT NULL DEFAULT '0',
  `type` varchar(16) NOT NULL DEFAULT '',
  PRIMARY KEY (`vid`,`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vocabulary_node_types`
--

LOCK TABLES `vocabulary_node_types` WRITE;
/*!40000 ALTER TABLE `vocabulary_node_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `vocabulary_node_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `watchdog`
--

DROP TABLE IF EXISTS `watchdog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `watchdog` (
  `wid` int(5) NOT NULL AUTO_INCREMENT,
  `uid` int(10) NOT NULL DEFAULT '0',
  `type` varchar(16) NOT NULL DEFAULT '',
  `message` longtext NOT NULL,
  `severity` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `link` varchar(255) NOT NULL DEFAULT '',
  `location` varchar(128) NOT NULL DEFAULT '',
  `hostname` varchar(128) NOT NULL DEFAULT '',
  `timestamp` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`wid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `watchdog`
--

LOCK TABLES `watchdog` WRITE;
/*!40000 ALTER TABLE `watchdog` DISABLE KEYS */;
/*!40000 ALTER TABLE `watchdog` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2011-05-06  1:52:31
