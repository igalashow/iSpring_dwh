-- MySQL dump 10.13  Distrib 5.7.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: database_dwh
-- ------------------------------------------------------
-- Server version	5.7.34-log

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
-- Table structure for table `all_to_all`
--

DROP TABLE IF EXISTS `all_to_all`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `all_to_all` (
  `curr_id_1` char(3) DEFAULT NULL,
  `curr_id_2` char(3) DEFAULT NULL,
  `exchange_rate` float DEFAULT NULL,
  `date` date DEFAULT NULL,
  `source_id` char(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `all_to_all`
--

LOCK TABLES `all_to_all` WRITE;
/*!40000 ALTER TABLE `all_to_all` DISABLE KEYS */;
INSERT INTO `all_to_all` VALUES ('840','840',1,'2021-06-28','001'),('978','840',1.1943,'2021-06-28','001'),('156','840',0.154922,'2021-06-28','001'),('643','840',0.0138563,'2021-06-28','001'),('840','978',0.837311,'2021-06-28','001'),('978','978',1,'2021-06-28','001'),('156','978',0.129718,'2021-06-28','001'),('643','978',0.011602,'2021-06-28','001'),('840','156',6.45488,'2021-06-28','001'),('978','156',7.70906,'2021-06-28','001'),('156','156',1,'2021-06-28','001'),('643','156',0.0894406,'2021-06-28','001'),('840','643',72.1694,'2021-06-28','001'),('978','643',86.1919,'2021-06-28','001'),('156','643',11.1806,'2021-06-28','001'),('643','643',1,'2021-06-28','001'),('840','840',1,'2021-06-27','001'),('978','840',1.1943,'2021-06-27','001'),('156','840',0.154922,'2021-06-27','001'),('643','840',0.0138563,'2021-06-27','001'),('840','978',0.837311,'2021-06-27','001'),('978','978',1,'2021-06-27','001'),('156','978',0.129718,'2021-06-27','001'),('643','978',0.011602,'2021-06-27','001'),('840','156',6.45488,'2021-06-27','001'),('978','156',7.70906,'2021-06-27','001'),('156','156',1,'2021-06-27','001'),('643','156',0.0894406,'2021-06-27','001'),('840','643',72.1694,'2021-06-27','001'),('978','643',86.1919,'2021-06-27','001'),('156','643',11.1806,'2021-06-27','001'),('643','643',1,'2021-06-27','001'),('840','840',1,'2021-06-26','001'),('978','840',1.1943,'2021-06-26','001'),('156','840',0.154922,'2021-06-26','001'),('643','840',0.0138563,'2021-06-26','001'),('840','978',0.837311,'2021-06-26','001'),('978','978',1,'2021-06-26','001'),('156','978',0.129718,'2021-06-26','001'),('643','978',0.011602,'2021-06-26','001'),('840','156',6.45488,'2021-06-26','001'),('978','156',7.70906,'2021-06-26','001'),('156','156',1,'2021-06-26','001'),('643','156',0.0894406,'2021-06-26','001'),('840','643',72.1694,'2021-06-26','001'),('978','643',86.1919,'2021-06-26','001'),('156','643',11.1806,'2021-06-26','001'),('643','643',1,'2021-06-26','001'),('840','840',1,'2021-06-25','001'),('978','840',1.1936,'2021-06-25','001'),('156','840',0.154485,'2021-06-25','001'),('643','840',0.0138263,'2021-06-25','001'),('840','978',0.837802,'2021-06-25','001'),('978','978',1,'2021-06-25','001'),('156','978',0.129428,'2021-06-25','001'),('643','978',0.0115837,'2021-06-25','001'),('840','156',6.47311,'2021-06-25','001'),('978','156',7.7263,'2021-06-25','001'),('156','156',1,'2021-06-25','001'),('643','156',0.0894991,'2021-06-25','001'),('840','643',72.326,'2021-06-25','001'),('978','643',86.3283,'2021-06-25','001'),('156','643',11.1733,'2021-06-25','001'),('643','643',1,'2021-06-25','001');
/*!40000 ALTER TABLE `all_to_all` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core`
--

DROP TABLE IF EXISTS `core`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `core` (
  `curr_id_1` char(3) DEFAULT NULL,
  `curr_id_2` char(3) DEFAULT NULL,
  `exchange_rate` float DEFAULT NULL,
  `date` date DEFAULT NULL,
  `source_id` char(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core`
--

LOCK TABLES `core` WRITE;
/*!40000 ALTER TABLE `core` DISABLE KEYS */;
INSERT INTO `core` VALUES ('840','643',72.1694,'2021-06-28','001'),('978','643',86.1919,'2021-06-28','001'),('156','643',11.1806,'2021-06-28','001'),('643','643',1,'2021-06-28','001'),('840','643',72.1694,'2021-06-27','001'),('978','643',86.1919,'2021-06-27','001'),('156','643',11.1806,'2021-06-27','001'),('643','643',1,'2021-06-27','001'),('840','643',72.1694,'2021-06-26','001'),('978','643',86.1919,'2021-06-26','001'),('156','643',11.1806,'2021-06-26','001'),('643','643',1,'2021-06-26','001'),('840','643',72.326,'2021-06-25','001'),('978','643',86.3283,'2021-06-25','001'),('156','643',11.1733,'2021-06-25','001'),('643','643',1,'2021-06-25','001');
/*!40000 ALTER TABLE `core` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currencies`
--

DROP TABLE IF EXISTS `currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `currencies` (
  `curr_id` char(3) DEFAULT NULL,
  `ticker` char(3) DEFAULT NULL,
  `curr_name_en` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `curr_name_ger` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `curr_name_rus` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `curr_name_chin` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currencies`
--

LOCK TABLES `currencies` WRITE;
/*!40000 ALTER TABLE `currencies` DISABLE KEYS */;
INSERT INTO `currencies` VALUES ('840','USD','american dollar','Amerikanischer Dollar','американский доллар','美元'),('643','RUB','russian ruble','Russischer Rubel','российский рубль','俄罗斯卢布'),('156','CNY','chinese yuan','Chinesischer Yuan','китайский юань','中国新年'),('978','EUR','euro','Euro','евро','欧元');
/*!40000 ALTER TABLE `currencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `datamart1`
--

DROP TABLE IF EXISTS `datamart1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `datamart1` (
  `curr_name1` text COLLATE utf8mb4_unicode_ci,
  `ticker1` char(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ticker2` char(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `curr_name2` text COLLATE utf8mb4_unicode_ci,
  `ex_rate` float DEFAULT NULL,
  `date_rate` date DEFAULT NULL,
  `source_name` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datamart1`
--

LOCK TABLES `datamart1` WRITE;
/*!40000 ALTER TABLE `datamart1` DISABLE KEYS */;
INSERT INTO `datamart1` VALUES ('американский доллар','USD','RUB','российский рубль',72.1694,'2021-06-28','ЦБ РФ'),('евро','EUR','RUB','российский рубль',86.1919,'2021-06-28','ЦБ РФ'),('китайский юань','CNY','RUB','российский рубль',11.1806,'2021-06-28','ЦБ РФ'),('российский рубль','RUB','RUB','российский рубль',1,'2021-06-28','ЦБ РФ'),('американский доллар','USD','RUB','российский рубль',72.1694,'2021-06-27','ЦБ РФ'),('евро','EUR','RUB','российский рубль',86.1919,'2021-06-27','ЦБ РФ'),('китайский юань','CNY','RUB','российский рубль',11.1806,'2021-06-27','ЦБ РФ'),('российский рубль','RUB','RUB','российский рубль',1,'2021-06-27','ЦБ РФ'),('американский доллар','USD','RUB','российский рубль',72.1694,'2021-06-26','ЦБ РФ'),('евро','EUR','RUB','российский рубль',86.1919,'2021-06-26','ЦБ РФ'),('китайский юань','CNY','RUB','российский рубль',11.1806,'2021-06-26','ЦБ РФ'),('российский рубль','RUB','RUB','российский рубль',1,'2021-06-26','ЦБ РФ'),('американский доллар','USD','RUB','российский рубль',72.326,'2021-06-25','ЦБ РФ'),('евро','EUR','RUB','российский рубль',86.3283,'2021-06-25','ЦБ РФ'),('китайский юань','CNY','RUB','российский рубль',11.1733,'2021-06-25','ЦБ РФ'),('российский рубль','RUB','RUB','российский рубль',1,'2021-06-25','ЦБ РФ');
/*!40000 ALTER TABLE `datamart1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `datamart2`
--

DROP TABLE IF EXISTS `datamart2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `datamart2` (
  `curr_name1` text COLLATE utf8mb4_unicode_ci,
  `ticker1` char(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ticker2` char(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `curr_name2` text COLLATE utf8mb4_unicode_ci,
  `ex_rate` float DEFAULT NULL,
  `date_rate` date DEFAULT NULL,
  `source_name` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datamart2`
--

LOCK TABLES `datamart2` WRITE;
/*!40000 ALTER TABLE `datamart2` DISABLE KEYS */;
INSERT INTO `datamart2` VALUES ('american dollar','USD','USD','american dollar',1,'2021-06-28','ЦБ РФ'),('euro','EUR','USD','american dollar',1.1943,'2021-06-28','ЦБ РФ'),('chinese yuan','CNY','USD','american dollar',0.154922,'2021-06-28','ЦБ РФ'),('russian ruble','RUB','USD','american dollar',0.0138563,'2021-06-28','ЦБ РФ'),('american dollar','USD','USD','american dollar',1,'2021-06-27','ЦБ РФ'),('euro','EUR','USD','american dollar',1.1943,'2021-06-27','ЦБ РФ'),('chinese yuan','CNY','USD','american dollar',0.154922,'2021-06-27','ЦБ РФ'),('russian ruble','RUB','USD','american dollar',0.0138563,'2021-06-27','ЦБ РФ'),('american dollar','USD','USD','american dollar',1,'2021-06-26','ЦБ РФ'),('euro','EUR','USD','american dollar',1.1943,'2021-06-26','ЦБ РФ'),('chinese yuan','CNY','USD','american dollar',0.154922,'2021-06-26','ЦБ РФ'),('russian ruble','RUB','USD','american dollar',0.0138563,'2021-06-26','ЦБ РФ'),('american dollar','USD','USD','american dollar',1,'2021-06-25','ЦБ РФ'),('euro','EUR','USD','american dollar',1.1936,'2021-06-25','ЦБ РФ'),('chinese yuan','CNY','USD','american dollar',0.154485,'2021-06-25','ЦБ РФ'),('russian ruble','RUB','USD','american dollar',0.0138263,'2021-06-25','ЦБ РФ');
/*!40000 ALTER TABLE `datamart2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `datamart3`
--

DROP TABLE IF EXISTS `datamart3`;
/*!50001 DROP VIEW IF EXISTS `datamart3`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `datamart3` AS SELECT 
 1 AS `ticker1`,
 1 AS `ticker2`,
 1 AS `exchange_rate`,
 1 AS `date`,
 1 AS `source_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `source`
--

DROP TABLE IF EXISTS `source`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `source` (
  `source_id` char(3) DEFAULT NULL,
  `source_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `source`
--

LOCK TABLES `source` WRITE;
/*!40000 ALTER TABLE `source` DISABLE KEYS */;
INSERT INTO `source` VALUES ('001','ЦБ РФ');
/*!40000 ALTER TABLE `source` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staging`
--

DROP TABLE IF EXISTS `staging`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `staging` (
  `ticker1` varchar(3) DEFAULT NULL,
  `ticker2` varchar(3) DEFAULT NULL,
  `exchange_rate` float DEFAULT NULL,
  `date` date DEFAULT NULL,
  `source` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staging`
--

LOCK TABLES `staging` WRITE;
/*!40000 ALTER TABLE `staging` DISABLE KEYS */;
INSERT INTO `staging` VALUES ('USD','RUB',72.1694,'2021-06-28','ЦБ РФ'),('EUR','RUB',86.1919,'2021-06-28','ЦБ РФ'),('CNY','RUB',11.1806,'2021-06-28','ЦБ РФ'),('RUB','RUB',1,'2021-06-28','ЦБ РФ');
/*!40000 ALTER TABLE `staging` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `datamart3`
--

/*!50001 DROP VIEW IF EXISTS `datamart3`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`my_sql_user`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `datamart3` AS select `c1`.`ticker` AS `ticker1`,`c2`.`ticker` AS `ticker2`,`all_to_all`.`exchange_rate` AS `exchange_rate`,`all_to_all`.`date` AS `date`,`source`.`source_name` AS `source_name` from (((`all_to_all` join `source` on((`all_to_all`.`source_id` = `source`.`source_id`))) join `currencies` `c1` on((`c1`.`curr_id` = `all_to_all`.`curr_id_1`))) join `currencies` `c2` on((`c2`.`curr_id` = `all_to_all`.`curr_id_2`))) */;
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

-- Dump completed on 2021-06-29 12:09:34
