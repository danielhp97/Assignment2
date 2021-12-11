DROP TABLE Fact_InternetSales;
DROP TABLE Dim_Product;
DROP TABLE Dim_Location;
DROP TABLE Dim_Customer;
DROP TABLE Dim_Date;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Dim_Customer` (
  `CustomerKey` int unsigned NOT NULL AUTO_INCREMENT,
  `AccountNumber` varchar(255) DEFAULT NULL,
  `FullName` varchar(255) DEFAULT NULL,
  `Gender` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `AGE` int DEFAULT NULL,
  PRIMARY KEY (`CustomerKey`)
) ENGINE=InnoDB AUTO_INCREMENT=29484 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Dim_Date` (
  `DateKey` int unsigned NOT NULL AUTO_INCREMENT,
  `FullDateAlternateKey` int DEFAULT NULL,
  `DayNumberOfWeek` int DEFAULT NULL,
  `EnglishDayNameOfWeek` varchar(255) DEFAULT NULL,
  `DayNumberOfMonth` int DEFAULT NULL,
  `DayNumberOfYear` int DEFAULT NULL,
  `WeekNumberOfYear` int DEFAULT NULL,
  `EnglishMonthName` varchar(255) DEFAULT NULL,
  `MonthNumberOfYear` int DEFAULT NULL,
  `CalendarQuarter` int DEFAULT NULL,
  `CalendarYear` int DEFAULT NULL,
  PRIMARY KEY (`DateKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Dim_Location` (
  `LocationKey` int unsigned NOT NULL AUTO_INCREMENT,
  `Country` varchar(255) DEFAULT NULL,
  `Region` varchar(255) DEFAULT NULL,
  `TaxRate` float DEFAULT NULL,
  `ShipCoeff` float DEFAULT NULL,
  PRIMARY KEY (`LocationKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Dim_Product` (
  `ProductKey` int unsigned NOT NULL AUTO_INCREMENT,
  `ProductName` varchar(255) DEFAULT '',
  `ProductModelName` varchar(255) DEFAULT NULL,
  `ProductSubCategoryName` varchar(255) DEFAULT NULL,
  `ProductTopCategoryName` varchar(255) DEFAULT NULL,
  `StandardCost` float DEFAULT NULL,
  `ListPrice` float DEFAULT NULL,
  `StartDate` date DEFAULT NULL,
  `EndDate` date DEFAULT NULL,
  `ProductStatus` varchar(255) DEFAULT '',
  PRIMARY KEY (`ProductKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Fact_InternetSales` (
  `SalesOrderLineNumber` varchar(255) NOT NULL DEFAULT '',
  `SalesOrderNumber` varchar(255) DEFAULT NULL,
  `OrderDateKey` int(10) unsigned zerofill NOT NULL,
  `OrderDate` date NOT NULL,
  `DueDateKey` int(10) unsigned zerofill NOT NULL,
  `DueDate` date NOT NULL,
  `ShipDateKey` int(10) unsigned zerofill NOT NULL,
  `ShipDate` int DEFAULT NULL,
  `ProductKey` int(10) unsigned zerofill NOT NULL,
  `CustomerKey` int(10) unsigned zerofill NOT NULL,
  `ShipToLocationKey` int unsigned NOT NULL,
  `OrderStatus` varchar(255) DEFAULT NULL,
  `ShipMethod` varchar(255) DEFAULT NULL,
  `OrderQty` int NOT NULL,
  `UnitPrice` float NOT NULL,
  `OrderLineTotal` float DEFAULT NULL,
  `OrderLineProfit` float DEFAULT NULL,
  `OrderLineTaxAmt` float DEFAULT NULL,
  `OrderLineShippingCost` float DEFAULT NULL,
  PRIMARY KEY (`SalesOrderLineNumber`),
  KEY `FK_Customer_FactInternetSales` (`CustomerKey`),
  KEY `FK_Location_FactInternetSales` (`ShipToLocationKey`),
  KEY `FK_OrderDateKey_FactInternetSales` (`OrderDateKey`),
  KEY `FK_DueDateKey_FactInternetSales` (`DueDateKey`),
  KEY `FK_ShipDateKey_FactInternetSales` (`ShipDateKey`),
  KEY `FK_ProductKey_FactInternetSales` (`ProductKey`),
  CONSTRAINT `FK_Customer_FactInternetSales` FOREIGN KEY (`CustomerKey`) REFERENCES `Dim_Customer` (`CustomerKey`),
  CONSTRAINT `FK_DueDateKey_FactInternetSales` FOREIGN KEY (`DueDateKey`) REFERENCES `Dim_Date` (`DateKey`),
  CONSTRAINT `FK_Location_FactInternetSales` FOREIGN KEY (`ShipToLocationKey`) REFERENCES `Dim_Location` (`LocationKey`),
  CONSTRAINT `FK_OrderDateKey_FactInternetSales` FOREIGN KEY (`OrderDateKey`) REFERENCES `Dim_Date` (`DateKey`),
  CONSTRAINT `FK_ProductKey_FactInternetSales` FOREIGN KEY (`ProductKey`) REFERENCES `Dim_Product` (`ProductKey`),
  CONSTRAINT `FK_ShipDateKey_FactInternetSales` FOREIGN KEY (`ShipDateKey`) REFERENCES `Dim_Date` (`DateKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
