-- MySQL dump 10.13  Distrib 8.0.46, for Linux (x86_64)
--
-- Host: localhost    Database: fisioterapia
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
-- Table structure for table `valoraciones`
--

DROP TABLE IF EXISTS `valoraciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `valoraciones` (
  `id_valoracion` int NOT NULL,
  `id_paciente` int NOT NULL,
  `id_profesional` int NOT NULL,
  `estatura` float DEFAULT NULL,
  `peso` float DEFAULT NULL,
  `eval_estaticomorfologica` varchar(255) DEFAULT NULL,
  `eval_psicomotriz` varchar(255) DEFAULT NULL,
  `resultado_examenes` varchar(255) DEFAULT NULL,
  `diagnostico` varchar(255) DEFAULT NULL,
  `plan_intervencion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_valoracion`,`id_paciente`,`id_profesional`),
  KEY `id_paciente` (`id_paciente`),
  KEY `id_profesional` (`id_profesional`),
  CONSTRAINT `valoraciones_ibfk_1` FOREIGN KEY (`id_paciente`) REFERENCES `pacientes` (`id_paciente`),
  CONSTRAINT `valoraciones_ibfk_2` FOREIGN KEY (`id_profesional`) REFERENCES `profesionales` (`id_profesional`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `valoraciones`
--

LOCK TABLES `valoraciones` WRITE;
/*!40000 ALTER TABLE `valoraciones` DISABLE KEYS */;
INSERT INTO `valoraciones` VALUES (1,1,1,1.75,78.5,'Postura ligeramente inclinada','Movilidad reducida de cadera','Sin alteraciones relevantes','Lumbalgia mecanica','Ejercicios de fortalecimiento lumbar'),(2,2,2,1.62,62,'Postura adecuada','Movilidad reducida de rodilla','Inflamacion leve','Dolor de rodilla','Terapia de movilidad y fortalecimiento'),(3,3,3,1.8,82.3,'Asimetria leve de hombros','Limitacion de movilidad del brazo','Sin alteraciones oseas','Rehabilitacion post fractura','Ejercicios de movilidad y fuerza'),(4,4,4,1.68,65.7,'Tension cervical','Movilidad cervical limitada','Sin alteraciones relevantes','Cervicalgia','Estiramientos y terapia manual'),(5,5,5,1.77,85.2,'Postura ligeramente encorvada','Movilidad muscular reducida','Sin alteraciones relevantes','Lesion muscular','Terapia manual y ejercicios');
/*!40000 ALTER TABLE `valoraciones` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-09-21 14:20:03
