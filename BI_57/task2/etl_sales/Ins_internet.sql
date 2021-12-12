SET FOREIGN_KEY_CHECKS = 0;
SET UNIQUE_CHECKS = 0;
INSERT INTO BI_BIKESDW_57.Fact_InternetSales
(SalesOrderLineNumber, SalesOrderNumber, OrderDateKey, OrderDate, DueDateKey, DueDate, 
ShipDateKey, ShipDate, ProductKey, CustomerKey, ShipToLocationKey, OrderStatus, ShipMethod,
 OrderQty, UnitPrice, OrderLineTotal, OrderLineProfit, OrderLineTaxAmt, OrderLineShippingCost)
SELECT CONCAT('SOL',D.SalesOrderID,'-',D.SalesOrderDetailID) as concat
,H.SalesOrderNumber
,Year(H.OrderDate)*10000 + MONTH(H.OrderDate)* 100 + DAYOFMONTH(H.OrderDate) as Date_full
,H.OrderDate
,Year(H.DueDate)*10000 + MONTH(H.DueDate)* 100 + DAYOFMONTH(H.DueDate) as Due_datekey
,H.DueDate
,Year(H.ShipDate)*10000 + MONTH(H.ShipDate)* 100 + DAYOFMONTH(H.ShipDate) as ShipDateKey
,H.ShipDate
,P.ProductID as ProductKeys
,C.CustomerID
,Co.CountryID as ShipToLocationKey
,H.OrderStatusID
,S.ShipMethodName
,D.OrderQty
,D.UnitPrice
,D.OrderQty*D.UnitPrice as OrderLineTotal
,(D.OrderQty*D.UnitPrice) - (D.OrderQty*P.StandardCost) as OrderLineProfit
,(D.OrderQty*D.UnitPrice)*Co.TaxRate as OrderLineTaxAmt
,TP.ShipSurcharge + S.ShipBase + (D.OrderQty*S.ShipRate*Co.ShipCoeff) as OrderLineShippingCost
FROM BI_Bikes_57.TB_SalesOrderDetail as D
LEFT JOIN BI_Bikes_57.TB_SalesOrderHeader as H on H.SalesOrderID=D.SalesOrderID
LEFT JOIN BI_Bikes_57.TB_Product as P on D.ProductID=P.ProductID
LEFT JOIN BI_Bikes_57.TB_Customer as C on H.CustomerID=C.CustomerID
LEFT JOIN BI_Bikes_57.TB_ShipMethod as S on H.ShipMethodID=S.ShipMethodID
LEFT JOIN BI_Bikes_57.TB_Address as A on A.AddressID=H.ShipToAddressID
LEFT JOIN BI_Bikes_57.TB_Country as Co on Co.CountryID=A.CountryID
LEFT JOIN BI_Bikes_57.TB_ProductSubCategory as TS on TS.ProductSubCategoryID = P.ProductSubCategoryID
LEFT JOIN BI_Bikes_57.TB_ProductTopCategory as TP on TP.ProductTopCategory= TS.ProductTopCategoryID;
SET FOREIGN_KEY_CHECKS = 1;
SET UNIQUE_CHECKS = 1;