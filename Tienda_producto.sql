-- MySQL dump 10.13  Distrib 8.0.46, for Linux (x86_64)
--
-- Host: localhost    Database: Tienda
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
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `productoID` varchar(255) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `descripcion` text,
  `categoriaID` varchar(255) DEFAULT NULL,
  `ProvedorID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`productoID`),
  KEY `ProvedorID` (`ProvedorID`),
  KEY `categoriaID` (`categoriaID`),
  CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`ProvedorID`) REFERENCES `provedor` (`ProvedorID`),
  CONSTRAINT `producto_ibfk_2` FOREIGN KEY (`categoriaID`) REFERENCES `categoria` (`categoriaID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES ('PR001','Laptop Lenovo','Laptop para uso escolar y oficina','C002','P001'),('PR002','Mouse Logitech','Mouse inalambrico','C008','P002'),('PR003','Teclado Mecanico','Teclado mecanico RGB','C002','P003'),('PR004','iPhone 15','Telefono inteligente Apple','C003','P004'),('PR005','Audifonos Sony','Audifonos inalambricos','C004','P005'),('PR006','PlayStation 5','Consola de videojuegos','C005','P006'),('PR007','Bocina JBL','Bocina bluetooth portatil','C004','P007'),('PR008','Router TP-Link','Router inalambrico','C009','P008'),('PR009','USB Kingston','Memoria USB de 128GB','C010','P009'),('PR010','Monitor Samsung','Monitor LED de 24 pulgadas','C002','P010');
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
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
