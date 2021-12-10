/* scripts transformation */

/*INSERT INTO Dim_Customer
(CustomerKey, AccountNumber, FullName, Gender, Age)
SELECT C.CustomerID, C.CustomerID, CONCAT(P.FirstName,P.MiddleName,P.LastName), P.Gender, TIMESTAMPDIFF(year,P.BirthDate,STR_TO_DATE('13-09-2021','%d-%m-%Y'))
FROM TB_Customer as C
INNER JOIN TB_Person as P on C.PersonID=P.PersonID
*/
/* Dim_Location*/
/* Location Key, Country, Region, Tax Rate
SELECT C.CountryID, C.Country, C.Region, C.TaxRate
FROM TB_Country as C
*/


/*Dim_date
SELECT YEAR(OrderDate)*10000 + MONTH(OrderDate)*100 + DAYOFMONTH(OrderDate) as DateKey, ROW_NUMBER() OVER( ORDER BY OrderDate ), WEEKDAY(OrderDate), DAYNAME(OrderDate)
,DAYOFMONTH(OrderDate), DAYOFYEAR(OrderDate),
WEEKOFYEAR(OrderDate), MONTHNAME(OrderDate),
MONTH(OrderDate), QUARTER(OrderDate), YEAR(OrderDate)
FROM TB_SalesOrderHeader as S
*/

/*Fact_internet*/
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
INNER JOIN TB_SalesOrderHeader as H on H.SalesOrderID=D.SalesOrderID
INNER JOIN TB_Product as P on D.ProductID=P.ProductID
INNER JOIN TB_Customer as C on H.CustomerID=C.CustomerID
LEFT JOIN TB_ShipMethod as S on H.ShipMethodID=S.ShipMethodID
LEFT JOIN TB_Address as A on A.AddressID=H.ShipToAddressID
LEFT JOIN TB_Country as Co on Co.CountryID=A.CountryID
LEFT JOIN TB_ProductSubCategory as TS on TS.ProductSubCategoryID = P.ProductSubCategoryID
LEFT JOIN TB_ProductTopCategory as TP on TP.ProductTopCategory= TS.ProductTopCategoryID
LIMIT 10