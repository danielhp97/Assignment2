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
