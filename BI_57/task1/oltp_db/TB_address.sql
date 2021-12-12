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
