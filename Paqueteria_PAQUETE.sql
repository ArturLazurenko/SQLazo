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
-- Table structure for table `PAQUETE`
--

DROP TABLE IF EXISTS `PAQUETE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PAQUETE` (
  `no_seguimiento` varchar(50) NOT NULL,
  `curp_cliente` varchar(18) NOT NULL,
  `id_direccion` varchar(255) DEFAULT NULL,
  `id_repartidor` int NOT NULL,
  `contenido` varchar(255) DEFAULT NULL,
  `cantidad` int DEFAULT NULL,
  `peso` decimal(10,2) DEFAULT NULL,
  `es_fragil` tinyint(1) DEFAULT NULL,
  `estado_paquete` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`no_seguimiento`),
  KEY `curp_cliente` (`curp_cliente`),
  KEY `id_repartidor` (`id_repartidor`),
  CONSTRAINT `PAQUETE_ibfk_1` FOREIGN KEY (`curp_cliente`) REFERENCES `CLIENTE` (`curp_cliente`),
  CONSTRAINT `PAQUETE_ibfk_2` FOREIGN KEY (`id_repartidor`) REFERENCES `REPARTIDOR` (`id_repartidor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PAQUETE`
--

LOCK TABLES `PAQUETE` WRITE;
/*!40000 ALTER TABLE `PAQUETE` DISABLE KEYS */;
INSERT INTO `PAQUETE` VALUES ('MX202608270001','GARC850412HDFRRL09','DIR001',1,'Laptop Lenovo ThinkPad',1,2.40,1,'En tránsito'),('MX202608270002','LOPM920715MDFPNS08','DIR002',2,'Ropa y accesorios',6,3.75,0,'Entregado'),('MX202608270003','HERM880923HQTNRL05','DIR003',3,'Libros y material escolar',8,5.20,0,'En tránsito'),('MX202608270004','SARM950306MQTNRL07','DIR004',4,'Cristalería y artículos decorativos',4,4.60,1,'En almacén'),('MX202608270005','TORL910821HDFRNS04','DIR005',5,'Audífonos y accesorios electrónicos',3,1.35,1,'Entregado');
/*!40000 ALTER TABLE `PAQUETE` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-09-21 14:20:05
