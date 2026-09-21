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
-- Table structure for table `PAQUETE`
--

DROP TABLE IF EXISTS `PAQUETE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PAQUETE` (
  `no_seguimiento` varchar(50) NOT NULL,
  `curp_cliente` varchar(18) NOT NULL,
  `id_direccion` varchar(20) NOT NULL,
  `id_repartidor` int NOT NULL,
  `contenido` varchar(255) DEFAULT NULL,
  `cantidad` int DEFAULT NULL,
  `peso` decimal(10,2) DEFAULT NULL,
  `es_fragil` tinyint(1) DEFAULT NULL,
  `estado_paquete` varchar(50) NOT NULL,
  `costo_flete` decimal(10,2) NOT NULL,
  `fecha_envio` date NOT NULL,
  `fecha_estimada` date NOT NULL,
  `fecha_entrega` date DEFAULT NULL,
  `zona` varchar(100) NOT NULL,
  `ruta` varchar(100) NOT NULL,
  `es_demorado` tinyint(1) NOT NULL,
  `es_dañado` tinyint(1) NOT NULL,
  PRIMARY KEY (`no_seguimiento`),
  KEY `id_direccion` (`id_direccion`),
  KEY `curp_cliente` (`curp_cliente`),
  KEY `id_repartidor` (`id_repartidor`),
  CONSTRAINT `PAQUETE_ibfk_1` FOREIGN KEY (`id_direccion`) REFERENCES `DIRECCION` (`id_direccion`),
  CONSTRAINT `PAQUETE_ibfk_2` FOREIGN KEY (`curp_cliente`) REFERENCES `CLIENTE` (`curp_cliente`),
  CONSTRAINT `PAQUETE_ibfk_3` FOREIGN KEY (`id_repartidor`) REFERENCES `REPARTIDOR` (`id_repartidor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PAQUETE`
--

LOCK TABLES `PAQUETE` WRITE;
/*!40000 ALTER TABLE `PAQUETE` DISABLE KEYS */;
INSERT INTO `PAQUETE` VALUES ('PKG000001','GARC010203HQRMLN01','DIR001',1,'Laptop',1,3.50,1,'Entregado',180.00,'2026-08-20','2026-08-22','2026-08-22','Centro','Ruta-01',0,0),('PKG000002','MART020304MQTRRN02','DIR002',2,'Ropa',5,2.20,0,'Entregado',120.00,'2026-08-21','2026-08-23','2026-08-24','Sur','Ruta-02',1,0),('PKG000003','LOPE030405HDFPNS03','DIR003',3,'Celular',1,0.80,1,'En tránsito',150.00,'2026-08-25','2026-08-28',NULL,'Centro','Ruta-03',0,0),('PKG000004','HERN040506MQTRSN04','DIR004',4,'Libros',8,4.50,0,'Entregado',200.00,'2026-08-18','2026-08-21','2026-08-21','Sur','Ruta-04',0,0),('PKG000005','GONZ050607HQRNML05','DIR005',5,'Monitor',1,7.80,1,'Dañado',300.00,'2026-08-19','2026-08-22','2026-08-25','Norte','Ruta-05',1,1),('PKG000006','SANC060708MQTRNZ06','DIR006',1,'Zapatos',2,1.90,0,'Entregado',110.00,'2026-08-23','2026-08-25','2026-08-25','Centro','Ruta-01',0,0),('PKG000007','RODR070809HDFMRL07','DIR007',6,'Electrodoméstico',1,12.50,1,'En tránsito',350.00,'2026-08-26','2026-08-30',NULL,'Norte','Ruta-06',0,0),('PKG000008','PERE080910MQTRRL08','DIR008',7,'Juguetes',6,5.30,0,'Entregado',175.00,'2026-08-17','2026-08-20','2026-08-20','Occidente','Ruta-07',0,0),('PKG000009','CRUZ091011HQRZNS09','DIR009',8,'Computadora',1,8.70,1,'En revisión',280.00,'2026-08-24','2026-08-27',NULL,'Centro','Ruta-08',1,1),('PKG000010','FLOR101112MQTRRS10','DIR010',2,'Ropa',3,2.20,0,'Entregado',120.00,'2026-08-21','2026-08-23','2026-08-23','Sur','Ruta-02',0,0);
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

-- Dump completed on 2026-09-21 14:20:01
