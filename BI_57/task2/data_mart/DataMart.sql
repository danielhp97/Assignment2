SET FOREIGN_KEY_CHECKS = 0;
SET UNIQUE_CHECKS = 0;
DROP TABLE Dim_Product;

CREATE TABLE `Dim_Customer` (
  `CustomerKey` int NOT NULL,
  `AccountNumber` varchar(30) NOT NULL,
  `FullName` varchar(150) NOT NULL,
  `Gender` varchar(1) DEFAULT NULL,
  `Age` int DEFAULT NULL,
  PRIMARY KEY (`CustomerKey`),
  KEY `PK_DimCustomer` (`CustomerKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `Dim_Date` (
  `DateKey` int NOT NULL,
  `FullDateAlternateKey` int NOT NULL,
  `DayNumberOfWeek` int DEFAULT NULL,
  `EnglishDayNameOfWeek` varchar(50) DEFAULT NULL,
  `DayNumberOfMonth` int DEFAULT NULL,
  `DayNumberOfYear` int DEFAULT NULL,
  `WeekNumberOfYear` int DEFAULT NULL,
  `EnglishMonthName` varchar(50) DEFAULT NULL,
  `MonthNumberOfYear` int DEFAULT NULL,
  `CalendarQuarter` int DEFAULT NULL,
  `CalendarYear` int DEFAULT NULL,
  PRIMARY KEY (`DateKey`),
  KEY `PK_DimDate` (`DateKey`) /*!80000 INVISIBLE */
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `Dim_Location` (
  `LocationKey` int NOT NULL,
  `Country` varchar(50) NOT NULL,
  `Region` varchar(50) NOT NULL,
  `TaxRate` decimal(13,4) DEFAULT NULL,
  `ShipCoeff` decimal(13,4) DEFAULT NULL,
  PRIMARY KEY (`LocationKey`),
  KEY `PK_DimLocation` (`LocationKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `Dim_Product` (
  `ProductKey` int NOT NULL,
  `ProductName` varchar(50) NOT NULL,
  `ProductModelName` varchar(50),
  `ProductSubCategoryName` varchar(50) DEFAULT NULL,
  `ProductTopCategoryName` varchar(50) DEFAULT NULL,
  `StandardCost` decimal(13,4) NOT NULL,
  `ListPrice` decimal(13,4) NOT NULL,
  `StartDate` date NOT NULL,
  `EndDate` date DEFAULT NULL,
  `ProductStatus` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ProductKey`),
  KEY `PK_DimProduct` (`ProductKey`) /*!80000 INVISIBLE */
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `Fact_InternetSales` (
  `SalesOrderLineNumber` varchar(50) NOT NULL,
  `OrderDateKey` int NOT NULL,
  `DueDateKey` int NOT NULL,
  `ShipDateKey` int NOT NULL,
  `ShipDate` date DEFAULT NULL,
  `ProductKey` int NOT NULL,
  `CustomerKey` int NOT NULL,
  `ShipToLocationKey` int NOT NULL,
  `OrderStatus` varchar(50) DEFAULT NULL,
  `ShipMethod` varchar(50) DEFAULT NULL,
  `OrderQty` int NOT NULL,
  `UnitPrice` decimal(13,4) NOT NULL,
  `OrderLineTotal` decimal(13,4) DEFAULT NULL,
  `OrderLineProfit` decimal(13,4) DEFAULT NULL,
  `OrderLineTaxAmt` decimal(13,4) DEFAULT NULL,
  `OrderLineShippingCost` decimal(13,4) DEFAULT NULL,
  PRIMARY KEY (`SalesOrderLineNumber`),
  KEY `PK_FactInternetSales` (`SalesOrderLineNumber`) /*!80000 INVISIBLE */,
  KEY `FK_Customer_FactInternetSales_idx` (`CustomerKey`),
  KEY `FK_Location_FactInternetSales_idx` (`ShipToLocationKey`),
  KEY `FK_Product_idx` (`ProductKey`),
  CONSTRAINT `FK_Customer_FactInternetSales` FOREIGN KEY (`CustomerKey`) REFERENCES `Dim_Customer` (`CustomerKey`),
  CONSTRAINT `FK_Location_FactInternetSales` FOREIGN KEY (`ShipToLocationKey`) REFERENCES `Dim_Location` (`LocationKey`),
  CONSTRAINT `FK_Product_FactInternetSales` FOREIGN KEY (`ProductKey`) REFERENCES `Dim_Product` (`ProductKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

SET FOREIGN_KEY_CHECKS = 1;
SET UNIQUE_CHECKS = 1;