-- MySQL dump 10.13  Distrib 8.0.46, for Linux (x86_64)
--
-- Host: localhost    Database: new_schema2
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
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `ID` int DEFAULT NULL,
  `SupplierIDs` int DEFAULT NULL,
  `ProductCode` text,
  `ProductName` text,
  `RegisterDate` text,
  `StandardCost` double DEFAULT NULL,
  `ListPrice` double DEFAULT NULL,
  `ReorderLevel` int DEFAULT NULL,
  `TargetLevel` int DEFAULT NULL,
  `QuantityPerUnit` text,
  `Discontinued` text,
  `MinimumReorderQuantity` int DEFAULT NULL,
  `Category` text,
  `Attachments` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,4,'NWTB-1','Northwind Traders Chai','2026-07-15',13.5,18,10,40,'10 boxes x 20 bags','FALSO',10,'Beverages',''),(3,10,'NWTCO-3','Northwind Traders Syrup','2025-10-04',7.5,10,25,100,'12 - 550 ml bottles','FALSO',25,'Condiments',''),(4,10,'NWTCO-4','Northwind Traders Cajun Seasoning','2022-12-26',16.5,22,10,40,'48 - 6 oz jars','FALSO',10,'Condiments',''),(5,10,'NWTO-5','Northwind Traders Olive Oil','2022-03-28',16.01,21.35,10,40,'36 boxes','FALSO',10,'Oil',''),(6,6,'NWTJP-6','Northwind Traders Boysenberry Spread','2023-09-17',18.75,25,25,100,'12 - 8 oz jars','FALSO',25,'Jams, Preserves',''),(7,2,'NWTDFN-7','Northwind Traders Dried Pears','2025-09-07',22.5,30,10,40,'12 - 1 lb pkgs.','FALSO',10,'Dried Fruit & Nuts',''),(8,8,'NWTS-8','Northwind Traders Curry Sauce','2024-12-26',30,40,10,40,'12 - 12 oz jars','FALSO',10,'Sauces',''),(14,6,'NWTDFN-14','Northwind Traders Walnuts','2022-06-16',17.44,23.25,10,40,'40 - 100 g pkgs.','FALSO',10,'Dried Fruit & Nuts',''),(17,6,'NWTCFV-17','Northwind Traders Fruit Cocktail','2022-09-21',29.25,39,10,40,'15.25 OZ','FALSO',10,'Canned Fruit & Vegetables',''),(19,1,'NWTBGM-19','Northwind Traders Chocolate Biscuits Mix','2025-10-11',6.9,9.2,5,20,'10 boxes x 12 pieces','FALSO',5,'Baked Goods & Mixes',''),(20,6,'NWTJP-6','Northwind Traders Marmalade','2022-11-05',60.75,81,10,40,'30 gift boxes','FALSO',10,'Jams, Preserves',''),(21,1,'NWTBGM-21','Northwind Traders Scones','2026-09-29',7.5,10,5,20,'24 pkgs. x 4 pieces','FALSO',5,'Baked Goods & Mixes',''),(34,4,'NWTB-34','Northwind Traders Beer','2026-01-21',10.5,14,15,60,'24 - 12 oz bottles','FALSO',15,'Beverages',''),(40,7,'NWTCM-40','Northwind Traders Crab Meat','2025-08-20',13.8,18.4,30,120,'24 - 4 oz tins','FALSO',30,'Canned Meat',''),(41,6,'NWTSO-41','Northwind Traders Clam Chowder','2023-07-07',7.24,9.65,10,40,'12 - 12 oz cans','FALSO',10,'Soups',''),(43,4,'NWTB-43','Northwind Traders Coffee','2023-05-25',34.5,46,25,100,'16 - 500 g tins','FALSO',25,'Beverages',''),(48,10,'NWTCA-48','Northwind Traders Chocolate','2024-06-23',9.56,12.75,25,100,'10 pkgs','FALSO',25,'Candy',''),(51,2,'NWTDFN-51','Northwind Traders Dried Apples','2022-02-06',39.75,53,10,40,'50 - 300 g pkgs.','FALSO',10,'Dried Fruit & Nuts',''),(52,1,'NWTG-52','Northwind Traders Long Grain Rice','2025-11-25',5.25,7,25,100,'16 - 2 kg boxes','FALSO',25,'Grains',''),(56,1,'NWTP-56','Northwind Traders Gnocchi','2026-02-08',28.5,38,30,120,'24 - 250 g pkgs.','FALSO',30,'Pasta',''),(57,1,'NWTP-57','Northwind Traders Ravioli','2026-05-10',14.63,19.5,20,80,'24 - 250 g pkgs.','FALSO',20,'Pasta',''),(65,8,'NWTS-65','Northwind Traders Hot Pepper Sauce','2023-02-25',15.79,21.05,10,40,'32 - 8 oz bottles','FALSO',10,'Sauces',''),(66,8,'NWTS-66','Northwind Traders Tomato Sauce','2022-01-14',12.75,17,20,80,'24 - 8 oz jars','FALSO',20,'Sauces',''),(72,5,'NWTD-72','Northwind Traders Mozzarella','2022-08-11',26.1,34.8,10,40,'24 - 200 g pkgs.','FALSO',10,'Dairy Products',''),(74,6,'NWTDFN-74','Northwind Traders Almonds','2024-10-24',7.5,10,5,20,'5 kg pkg.','FALSO',5,'Dried Fruit & Nuts',''),(77,10,'NWTCO-77','Northwind Traders Mustard','2025-04-23',9.75,13,15,60,'12 boxes','FALSO',15,'Condiments',''),(80,2,'NWTDFN-80','Northwind Traders Dried Plums','2024-02-01',3,3.5,50,75,'1 lb bag','FALSO',25,'Dried Fruit & Nuts',''),(81,3,'NWTB-81','Northwind Traders Green Tea','2026-10-05',2,2.99,100,125,'20 bags per box','FALSO',25,'Beverages',''),(85,1,'NWTBGM-85','Northwind Traders Brownie Mix','2026-05-19',9,12.49,10,20,'3 boxes','FALSO',5,'Baked Goods & Mixes',''),(86,1,'NWTBGM-86','Northwind Traders Cake Mix','2026-02-03',10.5,15.99,10,20,'4 boxes','FALSO',5,'Baked Goods & Mixes',''),(87,7,'NWTB-87','Northwind Traders Tea','2025-07-12',2,4,20,50,'100 count per box','0',NULL,'Beverages',NULL),(88,6,'NWTCFV-88','Northwind Traders Pears','2024-02-22',1,1.3,10,40,'15.25 OZ','0',NULL,'Canned Fruit & Vegetables',NULL),(89,6,'NWTCFV-89','Northwind Traders Peaches','2025-01-13',1,1.5,10,40,'15.25 OZ','0',NULL,'Canned Fruit & Vegetables',NULL),(90,6,'NWTCFV-90','Northwind Traders Pineapple','2022-09-09',1,1.8,10,40,'15.25 OZ','0',NULL,'Canned Fruit & Vegetables',NULL),(91,6,'NWTCFV-91','Northwind Traders Cherry Pie Filling','2022-11-14',1,2,10,40,'15.25 OZ','0',NULL,'Canned Fruit & Vegetables',NULL),(92,6,'NWTCFV-92','Northwind Traders Green Beans','2022-04-15',1,1.2,10,40,'14.5 OZ','0',NULL,'Canned Fruit & Vegetables',NULL),(93,6,'NWTCFV-93','Northwind Traders Corn','2022-05-25',1,1.2,10,40,'14.5 OZ','0',NULL,'Canned Fruit & Vegetables',NULL),(94,6,'NWTCFV-94','Northwind Traders Peas','2025-04-08',1,1.5,10,40,'14.5 OZ','0',NULL,'Canned Fruit & Vegetables',NULL),(95,7,'NWTCM-95','Northwind Traders Tuna Fish','2024-12-14',0.5,2,30,50,'5 oz','0',NULL,'Canned Meat',NULL),(96,7,'NWTCM-96','Northwind Traders Smoked Salmon','2024-02-26',2,4,30,50,'5 oz','0',NULL,'Canned Meat',NULL),(97,1,'NWTC-82','Northwind Traders Hot Cereal','2023-07-23',3,5,50,200,NULL,'0',NULL,'Cereal',NULL),(98,6,'NWTSO-98','Northwind Traders Vegetable Soup','2024-02-15',1,1.89,100,200,NULL,'0',NULL,'Soups',NULL),(99,6,'NWTSO-99','Northwind Traders Chicken Soup','2026-03-28',1,1.95,100,200,NULL,'0',NULL,'Soups',NULL),(82,1,'NWTC-82','Northwind Traders Granola','2023-12-22',2,4,20,100,NULL,'0',NULL,'Cereal',NULL),(83,9,'NWTCS-83','Northwind Traders Potato Chips','2023-08-28',0.5,1.8,30,200,NULL,'0',NULL,'Chips, Snacks',NULL);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
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
