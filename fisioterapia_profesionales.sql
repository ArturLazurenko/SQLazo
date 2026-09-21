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
-- Table structure for table `profesionales`
--

DROP TABLE IF EXISTS `profesionales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profesionales` (
  `id_profesional` int NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `apellido_paterno` varchar(255) DEFAULT NULL,
  `apellido_materno` varchar(255) DEFAULT NULL,
  `cedula_profecional` varchar(255) DEFAULT NULL,
  `tipo_doc` varchar(255) DEFAULT NULL,
  `num_doc` int DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `calle` varchar(255) DEFAULT NULL,
  `num_ext` int DEFAULT NULL,
  `num_int` int DEFAULT NULL,
  `colonia` varchar(255) DEFAULT NULL,
  `municipio` varchar(255) DEFAULT NULL,
  `estado` varchar(255) DEFAULT NULL,
  `cp` int DEFAULT NULL,
  `profesion` varchar(255) DEFAULT NULL,
  `cargo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_profesional`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profesionales`
--

LOCK TABLES `profesionales` WRITE;
/*!40000 ALTER TABLE `profesionales` DISABLE KEYS */;
INSERT INTO `profesionales` VALUES (1,'Alejandro','Gomez','Martinez','TP-2026-001','INE',123456789,'4421234567','Av. Constituyentes',125,3,'Centro','Queretaro','Queretaro',76000,'Fisioterapeuta','Fisioterapeuta'),(2,'Fernanda','Lopez','Hernandez','TP-2026-002','INE',234567890,'4422345678','Calle Zaragoza',84,2,'La Cruz','Queretaro','Queretaro',76020,'Fisioterapeuta','Especialista en rehabilitacion'),(3,'Ricardo','Sanchez','Torres','TP-2026-003','INE',345678901,'4423456789','Av. Universidad',210,5,'San Pablo','Queretaro','Queretaro',76159,'Medico','Director clinico'),(4,'Gabriela','Morales','Ramirez','TP-2026-004','INE',456789012,'4424567890','Calle Hidalgo',45,1,'Alamos','Queretaro','Queretaro',76160,'Fisioterapeuta','Terapeuta fisico'),(5,'Daniel','Castillo','Perez','TP-2026-005','INE',567890123,'4425678901','Av. 5 de Febrero',350,7,'Industrial','Queretaro','Queretaro',76120,'Fisioterapeuta','Coordinador de rehabilitacion');
/*!40000 ALTER TABLE `profesionales` ENABLE KEYS */;
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
