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
