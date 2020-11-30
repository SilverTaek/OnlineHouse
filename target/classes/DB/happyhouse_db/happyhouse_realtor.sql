CREATE DATABASE  IF NOT EXISTS `happyhouse` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `happyhouse`;
-- MySQL dump 10.13  Distrib 8.0.22, for macos10.15 (x86_64)
--
-- Host: 127.0.0.1    Database: happyhouse
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `realtor`
--

DROP TABLE IF EXISTS `realtor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `realtor` (
  `rno` int NOT NULL AUTO_INCREMENT,
  `rid` varchar(20) DEFAULT NULL,
  `rpwd` varchar(20) DEFAULT NULL,
  `raddress` varchar(100) DEFAULT NULL,
  `remail` varchar(100) DEFAULT NULL,
  `rphone` varchar(13) DEFAULT NULL,
  `rgrade` int DEFAULT NULL,
  `rname` varchar(200) NOT NULL,
  `rcontent` varchar(199) DEFAULT NULL,
  `ceo` varchar(64) DEFAULT NULL,
  `license` int NOT NULL,
  PRIMARY KEY (`rno`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `realtor`
--

LOCK TABLES `realtor` WRITE;
/*!40000 ALTER TABLE `realtor` DISABLE KEYS */;
INSERT INTO `realtor` VALUES (1,'realtor','1234','서울특별시 강남구 서초동','reator@naver.com','02-825-566',1,'바른부동산','안녕하세요 바른 부동산입니다.','이은택님',1234),(3,'realtor2','123','강남구','realtor@naver.com','02-4444-444',1,'행복부동산','문의주세요!','',0),(4,'realtor4','123','강남구','realtor@naver.com','02-4444-444',1,'사랑부동산','사랑이 넘치는 부동산입니다!','남혜민',23415),(5,'realtor5','123','강남구','realtor@naver.com','02-4444-444',1,'2사단부동산','강원도 양구 넘버원 부동산!','',0),(6,'realtor6','123','강남구','realtor@naver.com','02-4444-444',1,'싸피부동산','사기충전!','',0),(7,'realtor7','123','강남구','realtor@naver.com','02-4444-444',1,'삼성부동산','환영합니다!','',0),(8,'realtor8','123','강남구','realtor@naver.com','02-4444-444',1,'엘지부동산','붉은피 환영!','',0),(9,'realtor9','123','강남구','realtor@naver.com','02-4444-444',1,'카카오부동산','톡주세요!','',0),(10,'realtor10','123','강남구','realtor@naver.com','02-4444-444',1,'라인부동산','라인주세요!','',0),(11,'test11','1234','서울시 동작구 알마타길 37','realtor@naver.com','0000',NULL,'사기충전부동산',NULL,NULL,111111);
/*!40000 ALTER TABLE `realtor` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-11-26 17:57:09
