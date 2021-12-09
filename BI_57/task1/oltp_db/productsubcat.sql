/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TB_ProductSubCategory` (
  `ProductSubCategoryID` int unsigned NOT NULL AUTO_INCREMENT,
  `ProductTopCategoryID` int unsigned NOT NULL,
  `Name` char(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`ProductSubCategoryID`),
  KEY `FK_ProductTopCategoryID_ProductTopCategory` (`ProductTopCategoryID`),
  CONSTRAINT `FK_ProductTopCategoryID_ProductTopCategory` FOREIGN KEY (`ProductTopCategoryID`) REFERENCES `TB_ProductTopCategory` (`ProductTopCategory`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
