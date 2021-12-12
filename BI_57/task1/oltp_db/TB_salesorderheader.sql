/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TB_SalesOrderHeader` (
  `SalesOrderID` int unsigned NOT NULL AUTO_INCREMENT,
  `SalesOrderNumber` char(255) NOT NULL DEFAULT '',
  `OrderDate` date NOT NULL,
  `DueDate` date NOT NULL,
  `ShipDate` date NOT NULL,
  `OrderStatusID` int unsigned NOT NULL,
  `CustomerID` int unsigned NOT NULL,
  `BillToAddressID` int unsigned NOT NULL,
  `ShipToAddressID` int unsigned NOT NULL,
  `ShipMethodID` int unsigned NOT NULL,
  PRIMARY KEY (`SalesOrderID`),
  KEY `FK_CustomerID_Customer` (`CustomerID`),
  KEY `FK_OrderStatusID_OrderStatus` (`OrderStatusID`),
  KEY `FK_BillToAddress_SalesOrderHeader` (`BillToAddressID`),
  KEY `FK_ShipToAddress_SalesOrderHeader` (`ShipToAddressID`),
  KEY `FK_ShipMethodID_ShipMethod` (`ShipMethodID`),
  CONSTRAINT `FK_BillToAddress_SalesOrderHeader` FOREIGN KEY (`BillToAddressID`) REFERENCES `TB_Address` (`AddressID`),
  CONSTRAINT `FK_CustomerID_Customer` FOREIGN KEY (`CustomerID`) REFERENCES `TB_Customer` (`CustomerID`),
  CONSTRAINT `FK_OrderStatusID_OrderStatus` FOREIGN KEY (`OrderStatusID`) REFERENCES `TB_OrderStatus` (`OrderStatusID`),
  CONSTRAINT `FK_ShipMethodID_ShipMethod` FOREIGN KEY (`ShipMethodID`) REFERENCES `TB_ShipMethod` (`ShipMethodID`),
  CONSTRAINT `FK_ShipToAddress_SalesOrderHeader` FOREIGN KEY (`ShipToAddressID`) REFERENCES `TB_Address` (`AddressID`)
) ENGINE=InnoDB AUTO_INCREMENT=75124 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
