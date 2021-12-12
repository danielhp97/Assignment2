SET FOREIGN_KEY_CHECKS = 0;
SET UNIQUE_CHECKS = 0;

LOAD DATA INFILE "~/Masters/BI/Assignment2/csv_data/Address.csv"
INTO TABLE TB_Address
COLUMNS TERMINATED BY '\t'
LINES TERMINATED BY '\n';

LOAD DATA INFILE "~/Masters/BI/Assignment2/csv_data/Country.csv"
INTO TABLE TB_Country
COLUMNS TERMINATED BY '\t'
LINES TERMINATED BY '\n';

LOAD DATA INFILE "~/Masters/BI/Assignment2/csv_data/Customer.csv"
INTO TABLE TB_Customer
COLUMNS TERMINATED BY '\t'
LINES TERMINATED BY '\n';

LOAD DATA INFILE "~/Masters/BI/Assignment2/csv_data/OrderStatus.csv"
INTO TABLE TB_OrderStatus
COLUMNS TERMINATED BY '\t'
LINES TERMINATED BY '\n';

LOAD DATA INFILE "~/Masters/BI/Assignment2/csv_data/Person.csv"
INTO TABLE TB_Person
COLUMNS TERMINATED BY '\t'
LINES TERMINATED BY '\n';

LOAD DATA INFILE "~/Masters/BI/Assignment2/csv_data/Product.csv"
INTO TABLE TB_Product
COLUMNS TERMINATED BY '\t'
LINES TERMINATED BY '\n';

LOAD DATA INFILE "~/Masters/BI/Assignment2/csv_data/ProductModel.csv"
INTO TABLE TB_ProductModel
COLUMNS TERMINATED BY '\t'
LINES TERMINATED BY '\n';

LOAD DATA INFILE "~/Masters/BI/Assignment2/csv_data/ProductSubCategory.csv"
INTO TABLE TB_ProductSubCategory
COLUMNS TERMINATED BY '\t'
LINES TERMINATED BY '\n';

LOAD DATA INFILE "~/Masters/BI/Assignment2/csv_data/ProductTopCategory.csv"
INTO TABLE TB_ProductTopCategory
COLUMNS TERMINATED BY '\t'
LINES TERMINATED BY '\n';

LOAD DATA INFILE "~/Masters/BI/Assignment2/csv_data/SalesOrderDetail.csv"
INTO TABLE TB_SalesOrderDetail
COLUMNS TERMINATED BY '\t'
LINES TERMINATED BY '\n';

LOAD DATA INFILE "~/Masters/BI/Assignment2/csv_data/SalesOrderHeader.csv"
INTO TABLE TB_SalesOrderHeader
COLUMNS TERMINATED BY '\t'
LINES TERMINATED BY '\n';

LOAD DATA INFILE "~/Masters/BI/Assignment2/csv_data/ShipMethod.csv"
INTO TABLE TB_ShipMethod
COLUMNS TERMINATED BY '\t'
LINES TERMINATED BY '\n';

SET FOREIGN_KEY_CHECKS = 1;
SET UNIQUE_CHECKS = 1;




