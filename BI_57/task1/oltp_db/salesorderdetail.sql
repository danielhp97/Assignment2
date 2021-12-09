/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TB_SalesOrderDetail` (
  `SalesOrderDetailID` int unsigned NOT NULL AUTO_INCREMENT,
  `SalesOrderID` int unsigned NOT NULL,
  `ProductID` int unsigned NOT NULL,
  `OrderQty` int unsigned NOT NULL,
  `UnitPrice` float unsigned NOT NULL,
  PRIMARY KEY (`SalesOrderDetailID`),
  KEY `FK_SalesOrderID_SalesOrder` (`SalesOrderID`),
  KEY `FK_ProductID_Product` (`ProductID`),
  CONSTRAINT `FK_ProductID_Product` FOREIGN KEY (`ProductID`) REFERENCES `TB_Product` (`ProductID`),
  CONSTRAINT `FK_SalesOrderID_SalesOrder` FOREIGN KEY (`SalesOrderID`) REFERENCES `TB_SalesOrderHeader` (`SalesOrderID`)
) ENGINE=InnoDB AUTO_INCREMENT=121318 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
