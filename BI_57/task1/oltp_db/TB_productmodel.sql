/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TB_ProductModel` (
  `ProductModelID` int unsigned NOT NULL AUTO_INCREMENT,
  `ProductModelName` char(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`ProductModelID`)
) ENGINE=InnoDB AUTO_INCREMENT=129 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
