/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TB_Product` (
  `ProductID` int unsigned NOT NULL AUTO_INCREMENT,
  `ProductName` char(255) NOT NULL DEFAULT '',
  `ProductNumber` char(255) NOT NULL DEFAULT '',
  `StandardCost` float DEFAULT NULL,
  `ListPrice` float DEFAULT NULL,
  `ProductSubCategoryID` int unsigned DEFAULT NULL,
  `ProductModelID` int unsigned DEFAULT NULL,
  `SellStartDate` date DEFAULT NULL,
  `SellEndDate` date DEFAULT NULL,
  PRIMARY KEY (`ProductID`),
  KEY `FK_ProductModelID_ProductModel` (`ProductModelID`),
  KEY `FK_ProductSubCategoryID_ProductSubCategory` (`ProductSubCategoryID`),
  CONSTRAINT `FK_ProductModelID_ProductModel` FOREIGN KEY (`ProductModelID`) REFERENCES `TB_ProductModel` (`ProductModelID`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
