/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TB_Address` (
  `AddressID` int unsigned NOT NULL AUTO_INCREMENT,
  `CountryID` int unsigned NOT NULL,
  `AddressLine` char(255) NOT NULL DEFAULT '',
  `City` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `PostalCode` char(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`AddressID`),
  KEY `FK_CountryID_Country` (`CountryID`),
  CONSTRAINT `FK_CountryID_Country` FOREIGN KEY (`CountryID`) REFERENCES `TB_Country` (`CountryID`)
) ENGINE=InnoDB AUTO_INCREMENT=32522 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TB_Country` (
  `CountryID` int unsigned NOT NULL AUTO_INCREMENT,
  `Country` char(255) NOT NULL DEFAULT '',
  `Region` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `TaxRate` float NOT NULL,
  `ShipCoeff` float NOT NULL,
  PRIMARY KEY (`CountryID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TB_Customer` (
  `CustomerID` int unsigned NOT NULL AUTO_INCREMENT,
  `PersonID` int unsigned NOT NULL,
  `AccountNumber` char(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`CustomerID`),
  KEY `FK_PersonID_CustomerID` (`PersonID`),
  CONSTRAINT `FK_PersonID_CustomerID` FOREIGN KEY (`PersonID`) REFERENCES `TB_Person` (`PersonID`)
) ENGINE=InnoDB AUTO_INCREMENT=29484 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TB_OrderStatus` (
  `OrderStatusID` int unsigned NOT NULL AUTO_INCREMENT,
  `OrderStatusName` char(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`OrderStatusID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TB_Person` (
  `PersonID` int unsigned NOT NULL AUTO_INCREMENT,
  `FirstName` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `MiddleName` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `LastName` char(255) NOT NULL DEFAULT '',
  `Gender` char(1) NOT NULL DEFAULT '',
  `BirthDate` date NOT NULL,
  PRIMARY KEY (`PersonID`)
) ENGINE=InnoDB AUTO_INCREMENT=20778 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
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
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TB_ProductModel` (
  `ProductModelID` int unsigned NOT NULL AUTO_INCREMENT,
  `ProductModelName` char(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`ProductModelID`)
) ENGINE=InnoDB AUTO_INCREMENT=129 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
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
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TB_ProductTopCategory` (
  `ProductTopCategory` int unsigned NOT NULL AUTO_INCREMENT,
  `Name` char(255) NOT NULL DEFAULT '',
  `ShipSurcharge` float NOT NULL,
  PRIMARY KEY (`ProductTopCategory`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
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
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TB_ShipMethod` (
  `ShipMethodID` int unsigned NOT NULL AUTO_INCREMENT,
  `ShipMethodName` char(255) DEFAULT '',
  `ShipBase` int DEFAULT NULL,
  `ShipRate` int DEFAULT NULL,
  PRIMARY KEY (`ShipMethodID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
