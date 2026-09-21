-- MySQL dump 10.13  Distrib 8.0.46, for Linux (x86_64)
--
-- Host: localhost    Database: Servicios_coche
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
-- Table structure for table `detalleMantenimiento`
--

DROP TABLE IF EXISTS `detalleMantenimiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalleMantenimiento` (
  `id_refacciones` varchar(255) DEFAULT NULL,
  `id_matenimiento` varchar(255) DEFAULT NULL,
  KEY `id_matenimiento` (`id_matenimiento`),
  KEY `id_refacciones` (`id_refacciones`),
  CONSTRAINT `detalleMantenimiento_ibfk_1` FOREIGN KEY (`id_matenimiento`) REFERENCES `mantenimiento` (`id_mantenimiento`),
  CONSTRAINT `detalleMantenimiento_ibfk_2` FOREIGN KEY (`id_refacciones`) REFERENCES `refacciones` (`id_refacciones`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalleMantenimiento`
--

LOCK TABLES `detalleMantenimiento` WRITE;
/*!40000 ALTER TABLE `detalleMantenimiento` DISABLE KEYS */;
INSERT INTO `detalleMantenimiento` VALUES ('REF001','MAN001'),('REF002','MAN001'),('REF003','MAN002'),('REF008','MAN002'),('REF006','MAN003'),('REF007','MAN003'),('REF004','MAN005'),('REF005','MAN006'),('REF001','MAN007'),('REF002','MAN007');
/*!40000 ALTER TABLE `detalleMantenimiento` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-09-21 14:20:02
