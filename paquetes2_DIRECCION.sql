-- MySQL dump 10.13  Distrib 8.0.46, for Linux (x86_64)
--
-- Host: localhost    Database: paquetes2
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
  `id_direccion` varchar(20) NOT NULL,
  `curp_cliente` varchar(18) NOT NULL,
  `estado` varchar(100) NOT NULL,
  `pais` varchar(100) NOT NULL,
  `municipio` varchar(100) NOT NULL,
  `ciudad` varchar(100) NOT NULL,
  `calle` varchar(150) NOT NULL,
  `numero_int` varchar(10) DEFAULT NULL,
  `numero_ext` varchar(10) NOT NULL,
  `codigo_postal` varchar(10) NOT NULL,
  PRIMARY KEY (`id_direccion`),
  KEY `curp_cliente` (`curp_cliente`),
  CONSTRAINT `DIRECCION_ibfk_1` FOREIGN KEY (`curp_cliente`) REFERENCES `CLIENTE` (`curp_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DIRECCION`
--

LOCK TABLES `DIRECCION` WRITE;
/*!40000 ALTER TABLE `DIRECCION` DISABLE KEYS */;
INSERT INTO `DIRECCION` VALUES ('DIR001','GARC010203HQRMLN01','Querétaro','México','Querétaro','Santiago de Querétaro','Av. Constituyentes','2A','125','76000'),('DIR002','MART020304MQTRRN02','Querétaro','México','Corregidora','El Pueblito','Av. Candiles',NULL,'245','76900'),('DIR003','LOPE030405HDFPNS03','Jalisco','México','Guadalajara','Guadalajara','Av. Vallarta','4B','830','44100'),('DIR004','HERN040506MQTRSN04','Ciudad de México','México','Coyoacán','Ciudad de México','Av. Universidad',NULL,'1500','04350'),('DIR005','GONZ050607HQRNML05','Nuevo León','México','Monterrey','Monterrey','Av. Garza Sada','1C','500','64700'),('DIR006','SANC060708MQTRNZ06','Querétaro','México','Querétaro','Santiago de Querétaro','5 de Febrero',NULL,'120','76150'),('DIR007','RODR070809HDFMRL07','Puebla','México','Puebla','Puebla','Blvd. Atlixco','3A','720','72400'),('DIR008','PERE080910MQTRRL08','Guanajuato','México','León','León de los Aldama','Av. Insurgentes',NULL,'310','37000'),('DIR009','CRUZ091011HQRZNS09','Querétaro','México','San Juan del Río','San Juan del Río','Av. Central','5B','88','76800'),('DIR010','FLOR101112MQTRRS10','Querétaro','México','Corregidora','El Pueblito','Av. Zaragoza',NULL,'450','76900');
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

-- Dump completed on 2026-09-21 14:20:01
