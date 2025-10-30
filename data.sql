-- MySQL dump 10.13  Distrib 5.1.49, for Win64 (unknown)
--
-- Host: 127.0.0.1    Database: db_libary
-- ------------------------------------------------------
-- Server version	5.1.49-community

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
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account` (
  `id` int(11) DEFAULT NULL,
  `name` varchar(43) DEFAULT NULL,
  `money` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES (1,'cwq',12312);
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updatetime` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `password` varchar(255) DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `username_key` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'admin','13086112233','erica2024@126.com','2024-03-12 14:58:56','2024-03-12 14:59:10','81dc9bdb52d04dc20036dbd8313ed055',1),(2,'admin01','18022334455','admin11@163.com','2024-03-12 14:59:43','2025-04-21 12:28:12','81dc9bdb52d04dc20036dbd8313ed055',0),(3,'admin11','18022334455','admin11@163.com','2025-08-18 14:24:01','2025-08-18 15:10:59','81dc9bdb52d04dc20036dbd8313ed055',1),(4,'admin22','18022334455','admin11@163.com','2025-08-18 15:08:49','2025-08-19 15:11:02','81dc9bdb52d04dc20036dbd8313ed055',1);
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `book` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `description` varchar(500) DEFAULT NULL COMMENT '描述',
  `publish_date` varchar(255) DEFAULT NULL COMMENT '出版日期',
  `author` varchar(100) DEFAULT NULL COMMENT '作者',
  `publisher` varchar(255) DEFAULT NULL COMMENT '出版社',
  `category` varchar(255) DEFAULT NULL COMMENT '分类',
  `book_no` varchar(255) DEFAULT NULL COMMENT '标准码',
  `score` int(11) DEFAULT NULL COMMENT '积分',
  `nums` int(4) DEFAULT NULL COMMENT '数量',
  `cover` varchar(255) DEFAULT NULL COMMENT '封面',
  `createtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updatetime` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `book_no` (`book_no`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book`
--

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
INSERT INTO `book` VALUES (1,'数据挖掘','从大量数据中挖掘知识','2020-06-01','张文祥','清华大学出版社','计算机 > 大数据','DSF:10001',10,101,'https://img14.360buyimg.com/n0/jfs/t2554/167/928308693/253478/f67cc8a/56710412Na9eab184.jpg.avif','2024-03-15 15:27:29','2024-03-16 15:24:34'),(2,'模式识别','从不同的模式中识别数据','2020-06-01','林文','人民教育出版社','计算机 > 大数据分析','DSF:10002',10,100,'https://ts1.tc.mm.bing.net/th/id/OIP-C.g6bGo9Eo4EAhXqzcVd5S6gAAAA?w=195&h=185&c=8&rs=1&qlt=90&o=6&pid=3.1&rm=2','2025-04-18 03:57:31','2025-04-22 14:19:17'),(3,'机器学习','从不同的模式中识别数据','2020-06-01','陈威','科学出版社','计算机 > 人工智能','DSF:10003',10,60,'https://pic3.zhimg.com/v2-9d310080f1dc0ddd79a9018d08da1fb4_1440w.jpg','2025-04-18 03:57:31','2025-04-18 03:58:31'),(4,'统计分析与随机过程','数据分析','2020-06-01','李雯','高等教育出版社','计算机 > 数计算机 > 大数据','DSF:10004',10,50,'https://ts1.tc.mm.bing.net/th/id/OIP-C.0OJuO_6hIRnJpzNBK-2T9gHaHa?w=184&h=185&c=8&rs=1&qlt=90&o=6&pid=3.1&rm=2','2025-04-18 03:57:31','2025-04-21 13:22:23'),(5,'特征工程','特征提取与识别','2020-06-01','郭晶星','人民教育出版社','计算机 > 人工智能','DSF:10005',10,100,'https://www0.kfzimg.com/sw/kfz-cos/kfzimg/dcacceae/c1654119d405ba60_n.jpg','2025-04-18 03:57:31','2025-04-21 13:22:53'),(6,'人工智能概论','前沿技术','2021-01-01','罗幸福','浙江大学出版社','计算机 > 人工智能','DSF:16001',15,100,'https://www0.kfzimg.com/sw/kfzimg/3429/02f19c5472febe8fee_n.jpg','2025-04-18 03:57:31','2025-04-22 14:04:05'),(7,'深度学习前沿','深度学习技术前沿','2025-04-09','坤坤','电子科技大学出版社','计算机 > 人工智能','DSF:60003',10,19,'https://www0.kfzimg.com/sw/kfz-cos/kfzimg/cdefdcbc/ee07a086fe7b67ec_b.jpg','2025-04-22 14:10:27','2025-04-25 16:44:25'),(8,'计算机前沿技术','人工智能前沿','2025-04-12','陈欣怡','科学出版社','计算机 > 人工智能','DSF:60004',10,20,'https://www0.kfzimg.com/sw/kfz-cos/kfzimg/adbacdfd/92b554a1b39be924_b.jpg','2025-04-22 14:10:27','2025-04-25 16:44:25'),(9,'医学图像处理','医学图像处理方法','2025-04-12','王二川','北京大学出版社','计算机 > 医学图像处理','DSF:80001',10,50,'https://www0.kfzimg.com/sw/kfz-cos/kfzimg/4756272/7ea9989f864f7a63_n.jpg','2025-04-22 14:10:27','2025-04-25 16:44:25'),(10,'数据可视化','数据可视化界面','2020-10-19','燕颖','电子工业出版社','计算机 > 数计算机 > 大数据','DSF:90002',15,30,'https://www0.kfzimg.com/sw/kfz-cos/kfzimg/16102408/8540f2734ea1263e_s.jpg','2025-04-26 10:35:41','2025-04-24 10:35:47'),(11,'大数据分析','大数据','2020-10-10','吴明晖/周素','清华大学出版社','计算机 > 数计算机 > 大数据','DSF:90001',10,30,'https://www0.kfzimg.com/sw/kfz-cos/kfzimg/fedddaea/d8850373a4596750_n.jpg','2025-04-26 10:35:41','2025-04-24 10:35:47'),(12,'计算机体系结构','计算机体系结构基础','2021-10-10','刘超','清华大学出版社','计算机 > 数计算机 > 计算机体系','DSF:100001',10,30,'https://www0.kfzimg.com/sw/kfz-cos/kfzimg/7445133/70e44aafce424fca_s.jpg','2025-04-20 10:35:41','2025-04-24 10:35:47'),(13,'数据结构（C语言版）','数据基本结构','2021-03-01','严蔚敏','清华大学出版社','计算机 > 计算机体系','ISBN: 	9787302147510',10,100,'https://www0.kfzimg.com/sw/kfz-cos/kfzimg/17721683/3673e72ea2ce0704_n.jpg','2025-04-17 10:49:44','2025-04-26 10:52:15'),(14,'操作系统','计算机操作系统介绍','2021-03-01','罗宇','清华大学出版社','计算机 > 计算机体系','ISBN:  9787302623441',10,40,'https://www0.kfzimg.com/sw/kfz-cos/kfzimg/8493427/bf47a6ae291f1b60_n.jpg','2025-04-16 10:52:55','2025-08-30 04:17:41'),(15,'数据库原理','数据库介绍','2011-01-01','克罗克','清华大学出版社','计算机 > 计算机体系','ISBN:  ISBN:  9787302263432',10,40,'https://www0.kfzimg.com/sw/kfz-cos/kfzimg/aedfaaac/522bfa351f61cd05_n.jpg','2025-04-17 10:52:55','2025-04-27 10:56:09'),(16,'计算机网络','介绍计算机网络知识','2018-01-01','陈明','中国铁道出版社','计算机 > 计算机体系','ISBN:  ISBN:  ISBN: 	9787113147051',10,39,'https://www0.kfzimg.com/sw/kfz-cos/kfzimg/bcddcdaa/57a71c77c35bbcd1_b.jpg','2025-04-17 10:52:55','2025-08-30 04:19:26');
/*!40000 ALTER TABLE `book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `borrow`
--

DROP TABLE IF EXISTS `borrow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `borrow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `book_name` varchar(255) DEFAULT NULL,
  `book_no` varchar(255) DEFAULT NULL,
  `user_no` varchar(100) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `user_phone` varchar(255) DEFAULT NULL,
  `createtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `score` int(11) DEFAULT NULL COMMENT '还车状态',
  `status` varchar(255) DEFAULT '已借出',
  `days` int(4) DEFAULT '1',
  `return_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`,`updatetime`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `borrow`
--

LOCK TABLES `borrow` WRITE;
/*!40000 ALTER TABLE `borrow` DISABLE KEYS */;
INSERT INTO `borrow` VALUES (1,'数据挖掘','DSF:10001','2024030867706882753','cwq','13511110000','2025-04-22 15:01:01','2025-04-21 15:01:17',10,'已归还',1,'2025-04-22 20:52:47'),(2,'机器学习','DSF:10003','2024030867706882753','cwq','11300013131','2025-04-22 15:01:01','2025-04-21 16:00:00',10,'已归还',2,'2025-04-24 20:52:49'),(3,'深度学习前沿','DSF:60003','2024030867706882753','cwq','13599616147','2025-04-22 15:57:04','2025-04-21 16:00:00',10,'已归还',3,'2025-04-25 20:52:54'),(4,'特征工程','DSF:10005','2024030867706882753','cwq','13599616141','2025-04-25 11:43:34','2025-04-24 16:00:00',10,'已归还',3,'2025-04-25 20:52:57'),(5,'人工智能概论','DSF:16001','2024030867706882753','cwq','13599616147','2025-04-25 13:03:27','2025-04-24 16:00:00',15,'已归还',10,'2025-05-05 00:00:00'),(6,'数据挖掘','DSF:10001','202403086770688201','鹿晗','10001111112','2025-04-25 13:06:14','2025-04-24 16:00:00',10,'已归还',10,'2025-05-05 00:00:00'),(7,'深度学习前沿','DSF:60003','202403086770688203','王尔','1000111111','2025-04-25 14:33:22','2025-04-24 16:00:00',20,'已归还',1,'2025-04-26 00:00:00'),(8,'特征工程','DSF:10005','2024030867706882753','陈逸轩','13599616147','2025-04-25 15:43:27','2025-04-24 16:00:00',20,'已归还',2,'2025-04-27 00:00:00'),(9,'深度学习前沿','DSF:60003','202403086770688212','张三','10086111111','2025-04-26 10:46:47','2025-04-25 16:00:00',10,'已归还',4,'2025-04-30 00:00:00'),(10,'数据库原理','ISBN:  ISBN:  9787302263432','2024030867706882753','陈逸轩','13599616147','2025-06-23 15:36:59','2025-06-24 16:00:00',10,'已归还',3,'2025-06-26 00:00:00'),(11,'数据库原理','ISBN:  ISBN:  9787302263432','202403086770688211','章若楠','13299917821','2025-06-22 15:37:08','2025-06-24 16:00:00',10,'已归还',5,'2025-06-27 00:00:00'),(12,'数据库原理','ISBN:  ISBN:  9787302263432','202403086770688242','罗萍','15159011111','2025-06-23 15:37:39','2025-06-24 16:00:00',10,'已归还',4,'2025-06-27 00:00:00'),(13,'计算机网络','ISBN:  ISBN:  ISBN: 	9787113147051','202403086770688275','小红','12312312311','2025-06-25 15:46:36','2025-06-24 16:00:00',10,'已归还',7,'2025-07-02 00:00:00'),(14,'数据结构（C语言版）','ISBN: 	9787302147510','202503091937258686','陶喆','13133332222','2025-06-24 15:56:50','2025-06-24 16:00:00',10,'已归还',3,'2025-06-27 00:00:00'),(15,'操作系统','ISBN:  9787302623441','202403086770688211','章若楠','13299917821','2025-06-23 15:57:02','2025-06-24 16:00:00',10,'已归还',5,'2025-06-28 00:00:00'),(16,'数据结构（C语言版）','ISBN: 	9787302147510','202403086770688201','鹿晗','10001111112','2025-06-22 15:57:32','2025-06-24 16:00:00',10,'已归还',7,'2025-06-29 00:00:00'),(17,'大数据分析','DSF:90001','202403086770688299','陈伟','1008611111','2025-06-21 15:57:49','2025-06-24 16:00:00',10,'已归还',7,'2025-06-28 00:00:00'),(18,'计算机网络','ISBN:  ISBN:  ISBN: 	9787113147051','202403086770688242','罗萍','15159011111','2025-08-17 16:08:40','2025-08-17 16:00:00',10,'已归还',2,'2025-08-20 00:00:00'),(19,'计算机网络','ISBN:  ISBN:  ISBN: 	9787113147051','202403086770688203','王尔','1000111111','2025-08-30 03:26:00','2025-08-29 16:00:00',10,'已借出',4,'2025-09-03 00:00:00'),(20,'深度学习前沿','DSF:60003','202403086770688242','张亦能','15159011111','2025-08-30 04:00:59','2025-08-29 16:00:00',10,'已借出',2,'2025-09-01 00:00:00'),(21,'深度学习前沿','DSF:60003','202503091937258686','陶喆','13133332222','2025-08-30 04:02:40','2025-08-29 16:00:00',10,'已借出',2,'2025-09-01 00:00:00');
/*!40000 ALTER TABLE `borrow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brrow`
--

DROP TABLE IF EXISTS `brrow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `brrow` (
  `id` int(11) NOT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `book_name` varchar(255) NOT NULL,
  `book_no` varchar(255) DEFAULT NULL,
  `typeid` int(3) DEFAULT NULL,
  `brrow_time` datetime DEFAULT NULL,
  `return_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `book_no` (`book_no`),
  KEY `typeid` (`typeid`),
  CONSTRAINT `book_no` FOREIGN KEY (`book_no`) REFERENCES `book` (`book_no`),
  CONSTRAINT `typeid` FOREIGN KEY (`typeid`) REFERENCES `category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brrow`
--

LOCK TABLES `brrow` WRITE;
/*!40000 ALTER TABLE `brrow` DISABLE KEYS */;
INSERT INTO `brrow` VALUES (1,'cwq','数据挖掘','DSF:10001',5,'2025-04-18 12:06:57',NULL),(2,'lc','数据挖掘','DSF:10001',5,'2025-04-18 12:06:57','2025-04-18 04:14:40'),(3,'cwq','模式识别','DSF:10002',5,'2025-04-18 12:06:59',NULL),(4,'cwq','机器学习','DSF:10003',5,'2025-04-18 12:06:57','2025-04-19 04:06:57'),(5,'lc','统计分析与随机过程','DSF:10004',5,'2025-04-18 12:06:59',NULL),(6,'cwq','统计分析与随机过程','DSF:10004',5,'2025-04-18 12:06:57','2025-04-19 04:06:57'),(7,'cwq','特征工程','DSF:10005',5,'2025-04-18 12:06:57','2025-04-19 04:06:57'),(8,'cwq','人工智能概论','DSF:16001',6,'2025-04-18 12:06:57','2025-04-19 04:06:57');
/*!40000 ALTER TABLE `brrow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brrows_copy1`
--

DROP TABLE IF EXISTS `brrows_copy1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `brrows_copy1` (
  `id` int(11) NOT NULL,
  `book_name` varchar(255) DEFAULT NULL,
  `book_no` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `user_phone` varchar(255) DEFAULT NULL,
  `createtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetime` timestamp NULL DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brrows_copy1`
--

LOCK TABLES `brrows_copy1` WRITE;
/*!40000 ALTER TABLE `brrows_copy1` DISABLE KEYS */;
/*!40000 ALTER TABLE `brrows_copy1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `createtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetime` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'临床医学','医学类',NULL,'2024-03-15 04:30:35','2024-03-15 12:41:53'),(2,'外科学','临床医学类',1,'2024-03-15 12:56:48','2025-03-09 11:37:43'),(3,'内科学','临床医学类',1,'2024-03-15 12:56:49','2025-03-09 11:37:43'),(4,'口腔科','临床医学类',1,'2024-03-15 13:42:32','2024-03-15 13:42:49'),(5,'计算机','工学',NULL,'2024-03-15 13:46:12','2025-03-09 11:37:43'),(6,'人工智能','计算机类',5,'2024-03-15 14:02:15','2025-04-21 11:59:59'),(7,'生理学','医学类',1,'2025-03-09 13:10:49','2025-04-21 11:49:09'),(8,'医学图像处理','处理医学图像',5,'2025-04-21 11:57:58','2025-04-21 12:15:03'),(9,'计算机体系','体系结构',5,'2025-04-21 12:15:29','2025-04-21 12:44:07'),(10,'大数据分析','大数据分析',5,'2025-04-22 14:14:40','2025-04-22 14:14:46');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `class`
--

DROP TABLE IF EXISTS `class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `class` (
  `id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class`
--

LOCK TABLES `class` WRITE;
/*!40000 ALTER TABLE `class` DISABLE KEYS */;
INSERT INTO `class` VALUES (1,'计算机技术1班'),(2,'计算机技术2班'),(3,'计算机技术3班'),(4,'计算机科学与技术1班');
/*!40000 ALTER TABLE `class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dept`
--

DROP TABLE IF EXISTS `dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dept` (
  `deptno` mediumint(9) NOT NULL AUTO_INCREMENT,
  `dname` varchar(20) NOT NULL,
  `loc` varchar(13) NOT NULL,
  PRIMARY KEY (`deptno`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dept`
--

LOCK TABLES `dept` WRITE;
/*!40000 ALTER TABLE `dept` DISABLE KEYS */;
INSERT INTO `dept` VALUES (10,'Accounting','New York'),(20,'Research','DALL'),(30,'Sals','CHICHGC'),(40,'Opeations','BOSTON');
/*!40000 ALTER TABLE `dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emp`
--

DROP TABLE IF EXISTS `emp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emp` (
  `empno` mediumint(9) NOT NULL COMMENT '编号',
  `ename` varchar(20) DEFAULT NULL COMMENT '名称',
  `job` varchar(9) DEFAULT NULL COMMENT '工作',
  `mgr` mediumint(9) DEFAULT NULL COMMENT '上级编号',
  `hire_time` date DEFAULT NULL COMMENT '入职时间',
  `sal` decimal(7,2) DEFAULT NULL COMMENT '工资',
  `com` decimal(7,2) DEFAULT NULL COMMENT '红利',
  `deptno` mediumint(9) NOT NULL COMMENT '部门编号',
  PRIMARY KEY (`empno`),
  KEY `ename_index` (`ename`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emp`
--

LOCK TABLES `emp` WRITE;
/*!40000 ALTER TABLE `emp` DISABLE KEYS */;
INSERT INTO `emp` VALUES (1001,'cwq','BOSS',NULL,'2025-04-18','20000.00','20000.00',10),(1002,'lc','MASTER',1001,'2025-04-18','20000.00','20000.00',10),(1111,'Smith','MASTER',1001,'2025-04-18','50000.00','50000.00',10),(2001,'fzw','DEPTM',1002,'2025-04-18','5000.00','5000.00',20),(2002,'www','DEPTM',1111,'2025-04-19','6000.00','6000.00',30),(3001,'missL','empyloee',1002,'2025-04-18','2000.00','2000.00',30),(4001,'LZP','MANAGER',2001,'2025-04-17','2400.00','2400.00',40),(4002,'zzp','empyloee',2001,'2025-04-19','3000.00','2000.00',40),(4004,'zzzz','empyloee',2001,'2025-04-19','3000.00','2000.00',40),(4005,'ffff','empyloee',2001,'2025-04-19','2000.00','3000.00',0);
/*!40000 ALTER TABLE `emp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emp_tab`
--

DROP TABLE IF EXISTS `emp_tab`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emp_tab` (
  `id` int(11) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `sal` double DEFAULT NULL,
  `job` varchar(32) DEFAULT NULL,
  `deptno` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emp_tab`
--

LOCK TABLES `emp_tab` WRITE;
/*!40000 ALTER TABLE `emp_tab` DISABLE KEYS */;
INSERT INTO `emp_tab` VALUES (1001,'cwq',20000,'BOSS',10),(1002,'lc',20000,'MASTER',10),(1111,'Smith',50000,'MASTER',10),(2001,'fzw',5000,'DEPTM',20),(2002,'www',6000,'DEPTM',30),(3001,'missL',2000,'empyloee',30),(4001,'LZP',2400,'empyloee',40),(4002,'zzp',2000,'empyloee',40),(4004,'zzzz',2000,'empyloee',40),(1001,'cwq',20000,'BOSS',10),(1002,'lc',20000,'MASTER',10),(1111,'Smith',50000,'MASTER',10),(2001,'fzw',5000,'DEPTM',20),(2002,'www',6000,'DEPTM',30),(3001,'missL',2000,'empyloee',30),(4001,'LZP',2400,'empyloee',40),(4002,'zzp',2000,'empyloee',40),(4004,'zzzz',2000,'empyloee',40);
/*!40000 ALTER TABLE `emp_tab` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `emp_view01`
--

DROP TABLE IF EXISTS `emp_view01`;
/*!50001 DROP VIEW IF EXISTS `emp_view01`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `emp_view01` (
  `empno` mediumint(9),
  `ename` varchar(20),
  `job` varchar(9),
  `mgr` mediumint(9),
  `hire_time` date,
  `sal` decimal(7,2),
  `com` decimal(7,2),
  `deptno` mediumint(9)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `empview`
--

DROP TABLE IF EXISTS `empview`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empview` (
  `empno` mediumint(9) NOT NULL COMMENT '编号',
  `ename` varchar(20) DEFAULT NULL COMMENT '名称',
  `dname` varchar(20) NOT NULL,
  `sal` decimal(7,2) DEFAULT NULL COMMENT '工资'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empview`
--

LOCK TABLES `empview` WRITE;
/*!40000 ALTER TABLE `empview` DISABLE KEYS */;
INSERT INTO `empview` VALUES (2001,'fzw','Research','5000.00'),(2002,'www','Sals','6000.00'),(3001,'missL','Sals','2000.00'),(4001,'LZP','Opeations','2400.00'),(4002,'zzp','Opeations','3000.00'),(4004,'zzzz','Opeations','3000.00');
/*!40000 ALTER TABLE `empview` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hsp_user`
--

DROP TABLE IF EXISTS `hsp_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hsp_user` (
  `id` int(11) DEFAULT NULL,
  `name` varchar(32) NOT NULL DEFAULT ' ',
  `pwd` char(244) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hsp_user`
--

LOCK TABLES `hsp_user` WRITE;
/*!40000 ALTER TABLE `hsp_user` DISABLE KEYS */;
INSERT INTO `hsp_user` VALUES (100,'hsp','4297f44b13955235245b2497399d7a93'),(200,'cwq','4297f44b13955235245b2497399d7a93'),(300,'cwq','*81220D972A52D4C51BB1C37518A2613706220DAC');
/*!40000 ALTER TABLE `hsp_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mes`
--

DROP TABLE IF EXISTS `mes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mes` (
  `id` int(11) DEFAULT NULL,
  `content` varchar(38) DEFAULT NULL,
  `send_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mes`
--

LOCK TABLES `mes` WRITE;
/*!40000 ALTER TABLE `mes` DISABLE KEYS */;
INSERT INTO `mes` VALUES (1,'北京新闻','2025-04-18 15:43:04'),(1,'北京新闻','2025-04-18 15:43:05'),(1,'北京新闻','2025-04-18 15:44:45'),(2,'上海新闻','2025-04-18 15:44:45'),(3,'广州新闻','2025-04-18 15:44:45');
/*!40000 ALTER TABLE `mes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `new`
--

DROP TABLE IF EXISTS `new`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `new` (
  `id` int(11) DEFAULT NULL,
  `content` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `new`
--

LOCK TABLES `new` WRITE;
/*!40000 ALTER TABLE `new` DISABLE KEYS */;
INSERT INTO `new` VALUES (100,'上海新闻');
/*!40000 ALTER TABLE `new` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `retur`
--

DROP TABLE IF EXISTS `retur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `retur` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `book_name` varchar(255) DEFAULT NULL,
  `book_no` varchar(255) DEFAULT NULL,
  `user_no` varchar(100) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `user_phone` varchar(255) DEFAULT NULL,
  `createtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `score` int(11) DEFAULT NULL COMMENT '还车状态',
  `status` varchar(255) NOT NULL DEFAULT '已借出',
  `days` int(4) DEFAULT '1',
  `return_date` datetime DEFAULT NULL,
  `real_date` datetime DEFAULT NULL COMMENT '时间归还日期',
  PRIMARY KEY (`id`,`updatetime`,`status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `retur`
--

LOCK TABLES `retur` WRITE;
/*!40000 ALTER TABLE `retur` DISABLE KEYS */;
INSERT INTO `retur` VALUES (7,'深度学习前沿','DSF:60003','202403086770688203','王尔','1000111111','2025-04-25 15:07:11','2025-04-24 16:00:00',20,'已归还',1,'2025-04-25 00:00:00','2025-04-25 23:40:28'),(9,'机器学习','DSF:10003','2024030867706882753','cwq','11300013131','2025-04-25 15:42:39','2025-04-21 16:00:00',10,'已归还',2,'2025-04-24 00:00:00','2025-04-25 00:00:00'),(10,'特征工程','DSF:10005','2024030867706882753','陈逸轩','13599616147','2025-04-25 15:43:47','2025-04-24 16:00:00',20,'已归还',2,'2025-04-27 00:00:00','2025-04-25 00:00:00'),(11,'数据挖掘','DSF:10001','202403086770688201','鹿晗','10001111112','2025-04-26 10:47:07','2025-04-24 16:00:00',10,'已归还',10,'2025-05-05 00:00:00','2025-04-26 00:00:00'),(12,'数据库原理','ISBN:  ISBN:  9787302263432','202403086770688211','章若楠','13299917821','2025-06-25 15:37:17','2025-06-24 16:00:00',10,'已归还',2,'2025-06-27 00:00:00','2025-06-25 00:00:00'),(13,'人工智能概论','DSF:16001','2024030867706882753','cwq','13599616147','2025-06-25 15:37:20','2025-04-24 16:00:00',15,'已归还',10,'2025-05-05 00:00:00','2025-06-25 00:00:00'),(14,'特征工程','DSF:10005','2024030867706882753','cwq','13599616141','2025-06-25 15:37:21','2025-04-24 16:00:00',10,'已归还',3,'2025-04-25 00:00:00','2025-06-25 00:00:00'),(15,'深度学习前沿','DSF:60003','2024030867706882753','cwq','13599616147','2025-06-25 15:37:21','2025-04-21 16:00:00',10,'已归还',3,'2025-04-25 00:00:00','2025-06-25 00:00:00'),(16,'数据库原理','ISBN:  ISBN:  9787302263432','202403086770688242','罗萍','15159011111','2025-06-25 15:40:00','2025-06-24 16:00:00',10,'已归还',2,'2025-06-27 00:00:00','2025-06-25 00:00:00'),(17,'深度学习前沿','DSF:60003','202403086770688212','张三','10086111111','2025-06-25 15:40:07','2025-04-25 16:00:00',10,'已归还',4,'2025-04-30 00:00:00','2025-06-25 00:00:00'),(18,'数据挖掘','DSF:10001','2024030867706882753','cwq','13511110000','2025-06-25 15:41:11','2025-04-20 16:00:00',10,'已归还',1,'2025-04-22 00:00:00','2025-06-25 00:00:00'),(19,'数据库原理','ISBN:  ISBN:  9787302263432','2024030867706882753','陈逸轩','13599616147','2025-06-25 16:08:14','2025-06-24 16:00:00',10,'已归还',3,'2025-06-26 00:00:00','2025-06-26 00:00:00'),(20,'数据结构（C语言版）','ISBN: 	9787302147510','202503091937258686','陶喆','13133332222','2025-06-25 16:09:11','2025-06-24 16:00:00',10,'已归还',3,'2025-06-27 00:00:00','2025-06-26 00:00:00'),(21,'计算机网络','ISBN:  ISBN:  ISBN: 	9787113147051','202403086770688275','小红','12312312311','2025-08-17 16:08:47','2025-06-24 16:00:00',10,'已归还',7,'2025-07-02 00:00:00','2025-08-18 00:00:00'),(22,'操作系统','ISBN:  9787302623441','202403086770688211','章若楠','13299917821','2025-08-30 03:25:41','2025-06-24 16:00:00',10,'已归还',5,'2025-06-28 00:00:00','2025-08-30 00:00:00'),(23,'数据结构（C语言版）','ISBN: 	9787302147510','202403086770688201','鹿晗','10001111112','2025-08-30 03:25:42','2025-06-24 16:00:00',10,'已归还',7,'2025-06-29 00:00:00','2025-08-30 00:00:00'),(24,'大数据分析','DSF:90001','202403086770688299','陈伟','1008611111','2025-08-30 03:25:43','2025-06-24 16:00:00',10,'已归还',7,'2025-06-28 00:00:00','2025-08-30 00:00:00'),(25,'计算机网络','ISBN:  ISBN:  ISBN: 	9787113147051','202403086770688242','罗萍','15159011111','2025-08-30 03:25:45','2025-08-17 16:00:00',10,'已归还',2,'2025-08-20 00:00:00','2025-08-30 00:00:00');
/*!40000 ALTER TABLE `retur` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salgrade`
--

DROP TABLE IF EXISTS `salgrade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salgrade` (
  `grade` mediumint(9) NOT NULL AUTO_INCREMENT,
  `losal` decimal(17,2) DEFAULT NULL,
  `hisal` decimal(17,2) DEFAULT NULL,
  PRIMARY KEY (`grade`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salgrade`
--

LOCK TABLES `salgrade` WRITE;
/*!40000 ALTER TABLE `salgrade` DISABLE KEYS */;
INSERT INTO `salgrade` VALUES (1,'700.00','1200.00'),(2,'1201.00','2000.00'),(3,'2001.00','5000.00'),(4,'5001.00','8000.00'),(5,'80001.00','12000.00'),(6,'120001.00','20000.00');
/*!40000 ALTER TABLE `salgrade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student` (
  `id` int(11) NOT NULL,
  `name` varchar(32) DEFAULT NULL,
  `class_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `class_id` (`class_id`),
  CONSTRAINT `student_ibfk_1` FOREIGN KEY (`class_id`) REFERENCES `class` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (1,'java',1),(2,'smith',2),(3,'john',3),(4,'fzw',NULL),(5,'fzw',3);
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t1`
--

DROP TABLE IF EXISTS `t1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t1` (
  `id` int(11) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t1`
--

LOCK TABLES `t1` WRITE;
/*!40000 ALTER TABLE `t1` DISABLE KEYS */;
INSERT INTO `t1` VALUES (1,'cwq'),(2,'cwq'),(2,'cwq'),(1,'sad');
/*!40000 ALTER TABLE `t1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t2`
--

DROP TABLE IF EXISTS `t2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t2` (
  `id` int(11) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t2`
--

LOCK TABLES `t2` WRITE;
/*!40000 ALTER TABLE `t2` DISABLE KEYS */;
INSERT INTO `t2` VALUES (2,'cwq'),(1,'sad');
/*!40000 ALTER TABLE `t2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_tras`
--

DROP TABLE IF EXISTS `test_tras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test_tras` (
  `id` int(11) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_tras`
--

LOCK TABLES `test_tras` WRITE;
/*!40000 ALTER TABLE `test_tras` DISABLE KEYS */;
INSERT INTO `test_tras` VALUES (1,'casa'),(2,'dada');
/*!40000 ALTER TABLE `test_tras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `sex` varchar(1) DEFAULT NULL,
  `account` int(10) DEFAULT '400' COMMENT '积分',
  `phone` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatetime` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `status` tinyint(1) DEFAULT '1' COMMENT '禁用状态 默认是1不禁用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'陈逸轩','2024030867706882753',21,'男',-2225,'13599616147','福建龙岩','2024-03-08 02:40:03','2025-08-30 04:29:04',1),(2,'黄轩','202403086770688212',23,'男',0,'10086111111','福建福州','2024-03-05 02:40:07','2025-08-29 16:00:00',1),(4,'张亦能','202403086770688242',18,'女',260,'15159011111','福建漳州','2024-03-08 02:40:12','2024-03-08 02:40:58',1),(5,'章若楠','202403086770688211',30,'男',120,'13299917821','广东江门','2024-02-07 02:40:22','2025-08-29 16:00:00',1),(6,'鹿晗','202403086770688201',30,'男',130,'10001111112','广东潮州','2024-02-07 02:40:22','2025-08-29 16:00:00',1),(8,'王尔','202403086770688203',45,'男',340,'1000111111','广东汕尾','2024-02-07 02:40:26','2025-04-25 13:05:09',1),(12,'陈伟','202403086770688299',23,'男',30,'1008611111','广东深圳','2024-02-07 02:40:22','2025-08-29 16:00:00',1),(14,'林赐','202403086770688219',13,'女',400,'12345678900','福建厦门','2024-03-08 04:02:24','2024-03-08 04:33:25',1),(15,'小红','202403086770688275',15,'女',60,'12312312311','北京海定','2024-03-08 04:53:55','2025-08-29 16:00:00',1),(22,'陶喆','202503091937258686',12,'男',399,'13133332222','广西柳州','2025-03-09 13:31:02','2025-04-20 16:00:00',1),(23,'瑶瑶','202508301209854778',19,'女',400,'18239821232','江西省南昌市','2025-08-30 04:03:18','0000-00-00 00:00:00',1);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userinfo`
--

DROP TABLE IF EXISTS `userinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userinfo` (
  `id` int(11) NOT NULL,
  `name` varchar(32) DEFAULT NULL,
  `email` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userinfo`
--

LOCK TABLES `userinfo` WRITE;
/*!40000 ALTER TABLE `userinfo` DISABLE KEYS */;
INSERT INTO `userinfo` VALUES (1,'jack','jack@qq.com'),(2,'smith','smith@163.com'),(3,'john','john@gmail.com'),(4,'hsp','hsp@qq.com');
/*!40000 ALTER TABLE `userinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userinfo_01`
--

DROP TABLE IF EXISTS `userinfo_01`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userinfo_01` (
  `id` int(11) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `email` varchar(32) DEFAULT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userinfo_01`
--

LOCK TABLES `userinfo_01` WRITE;
/*!40000 ALTER TABLE `userinfo_01` DISABLE KEYS */;
INSERT INTO `userinfo_01` VALUES (1,'jack','jack@qq.com'),(NULL,'smith','smith@163.com');
/*!40000 ALTER TABLE `userinfo_01` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userinfo_02`
--

DROP TABLE IF EXISTS `userinfo_02`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userinfo_02` (
  `id` int(11) NOT NULL,
  `name` varchar(32) DEFAULT NULL,
  `sex` varchar(6) DEFAULT NULL,
  `sal` double DEFAULT NULL,
  KEY `sal_index` (`sal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userinfo_02`
--

LOCK TABLES `userinfo_02` WRITE;
/*!40000 ALTER TABLE `userinfo_02` DISABLE KEYS */;
INSERT INTO `userinfo_02` VALUES (1,'jack','mid',1);
/*!40000 ALTER TABLE `userinfo_02` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `emp_view01`
--

/*!50001 DROP TABLE IF EXISTS `emp_view01`*/;
/*!50001 DROP VIEW IF EXISTS `emp_view01`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `emp_view01` AS select `emp`.`empno` AS `empno`,`emp`.`ename` AS `ename`,`emp`.`job` AS `job`,`emp`.`mgr` AS `mgr`,`emp`.`hire_time` AS `hire_time`,`emp`.`sal` AS `sal`,`emp`.`com` AS `com`,`emp`.`deptno` AS `deptno` from `emp` */;
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

-- Dump completed on 2025-10-30 15:24:11
