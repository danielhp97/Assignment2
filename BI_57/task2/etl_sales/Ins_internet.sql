/*Fact_internet*/
INSERT INTO Fact_InternetSales
(SalesOrderLineNumber, SalesOrderNumber, OrderDateKey, OrderDate, DueDateKey, DueDate, ShipDateKey, ShipDate, ProductKey, CustomerKey, ShipToLocationKey, OrderStatus, ShipMethod, OrderQty, UnitPrice, OrderLineTotal, OrderLineProfit, OrderLineTaxAmt, OrderLineShippingCost)
SELECT CONCAT('SOL',D.SalesOrderID,'-',D.SalesOrderDetailID) as concat
,Year(H.OrderDate)*10000 + MONTH(H.OrderDate)* 100 + DAYOFMONTH(H.OrderDate) as Date_full
H.OrderDate
,Year(H.DueDate)*10000 + MONTH(H.DueDate)* 100 + DAYOFMONTH(H.DueDate) as Due_datekey
,H.DueDate
,Year(H.ShipDate)*10000 + MONTH(H.ShipDate)* 100 + DAYOFMONTH(H.ShipDate) as ShipDateKey
,H.ShipDate
,P.ProductID as ProductKeys
,C.CustomerID
,H.ShipToAddressID as ShipToLocationKey
,H.OrderStatusID
,S.ShipMethodName
,D.OrderQty
,D.UnitPrice
,D.OrderQty*D.UnitPrice as OrderLineTotal
,(D.OrderQty*D.UnitPrice) - (D.OrderQty*P.StandardCost) as OrderLineProfit
,P.StandardCost
,(D.OrderQty*D.UnitPrice)*Co.TaxRate as OrderLineTaxAmt
,TP.ShipSurcharge + S.ShipBase + (D.OrderQty*S.ShipRate*Co.ShipCoeff) as OrderLineShippingCost
FROM TB_SalesOrderDetail as D
LEFT JOIN TB_SalesOrderHeader as H on H.SalesOrderID=D.SalesOrderID
LEFT JOIN TB_Product as P on D.ProductID=P.ProductID
LEFT JOIN TB_Customer as C on H.CustomerID=C.CustomerID
LEFT JOIN TB_ShipMethod as S on H.ShipMethodID=S.ShipMethodID
LEFT JOIN TB_Address as A on A.AddressID=H.ShipToAddressID
LEFT JOIN TB_Country as Co on Co.CountryID=A.CountryID
LEFT JOIN TB_ProductSubCategory as TS on TS.ProductSubCategoryID = P.ProductSubCategoryID
LEFT JOIN TB_ProductTopCategory as TP on TP.ProductTopCategory= TS.ProductTopCategoryID