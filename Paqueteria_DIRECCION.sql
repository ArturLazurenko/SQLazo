-- MySQL dump 10.13  Distrib 8.0.46, for Linux (x86_64)
--
-- Host: localhost    Database: Paqueteria
-- ------------------------------------------------------
-- Server version	8.0.46-0ubuntu0.24.04.3

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
-- Table structure for table `DIRECCION`
--

DROP TABLE IF EXISTS `DIRECCION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DIRECCION` (
  `id_dirreccion` varchar(255) NOT NULL,
  `curp_cliente` varchar(18) NOT NULL,
  `estado` varchar(100) NOT NULL,
  `pais` varchar(100) NOT NULL,
  `municipio` varchar(100) NOT NULL,
  `calle` varchar(150) NOT NULL,
  `numero_int` varchar(10) DEFAULT NULL,
  `numero_ext` varchar(10) NOT NULL,
  `codigo_postal` varchar(10) NOT NULL,
  PRIMARY KEY (`id_dirreccion`),
  KEY `curp_cliente` (`curp_cliente`),
  CONSTRAINT `DIRECCION_ibfk_1` FOREIGN KEY (`curp_cliente`) REFERENCES `CLIENTE` (`curp_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DIRECCION`
--

LOCK TABLES `DIRECCION` WRITE;
/*!40000 ALTER TABLE `DIRECCION` DISABLE KEYS */;
INSERT INTO `DIRECCION` VALUES ('DIR001','GARC850412HDFRRL09','Querétaro','México','Querétaro','Av. Constituyentes','4B','125','76000'),('DIR002','LOPM920715MDFPNS08','Querétaro','México','Corregidora','Paseo de los Olivos',NULL,'218','76900'),('DIR003','HERM880923HQTNRL05','Ciudad de México','México','Coyoacán','Av. Miguel Ángel de Quevedo','12','453','04360'),('DIR004','SARM950306MQTNRL07','Guanajuato','México','León','Blvd. Campestre',NULL,'876','37150'),('DIR005','TORL910821HDFRNS04','Jalisco','México','Guadalajara','Av. Vallarta','3A','1450','44110');
/*!40000 ALTER TABLE `DIRECCION` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-09-21 14:20:06
