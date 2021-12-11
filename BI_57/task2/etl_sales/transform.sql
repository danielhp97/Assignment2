INSERT INTO Dim_Customer
(CustomerKey, AccountNumber, FullName, Gender, Age)
SELECT C.CustomerID, C.CustomerID, CONCAT(P.FirstName,P.MiddleName,P.LastName), P.Gender, TIMESTAMPDIFF(year,P.BirthDate,STR_TO_DATE('13-09-2021','%d-%m-%Y'))
FROM TB_Customer as C
INNER JOIN TB_Person as P on C.PersonID=P.PersonID



/*Dim_date*/
INSERT INTO Dim_Date
(DateKey, FullDateAlternateKey, DayNumberOfWeek, EnglishDayNameOfWeek, DayNumberOfMonth, DayNumberOfYear, WeekNumberOfYear, EnglishMonthName, MonthNumberOfYear, CalendarQuarter, CalendarYear)
WITH secondary_table as 
(
    SELECT distinct S.OrderDate
    FROM TB_SalesOrderHeader as S
)
SELECT YEAR(sec.OrderDate)*10000 + MONTH(sec.OrderDate)*100 + DAYOFMONTH(sec.OrderDate) as DateKey
, ROW_NUMBER() OVER( ORDER BY sec.OrderDate )
, WEEKDAY(sec.OrderDate)
, DAYNAME(sec.OrderDate)
, DAYOFMONTH(sec.OrderDate)
, DAYOFYEAR(sec.OrderDate)
, WEEKOFYEAR(sec.OrderDate)
, MONTHNAME(sec.OrderDate)
, MONTH(sec.OrderDate)
, QUARTER(sec.OrderDate)
, YEAR(sec.OrderDate)
FROM secondary_table as sec;

/*Fact_internet*/
/*with table1 as 
(
*/
INSERT INTO Fact_InternetSales
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
,H.ShipToAddressID as ShipToLocationKey
,H.OrderStatusID
,S.ShipMethodName
,D.OrderQty
,D.UnitPrice
,D.OrderQty*D.UnitPrice as OrderLineTotal
,(D.OrderQty*D.UnitPrice) - (D.OrderQty*P.StandardCost) as OrderLineProfit
,(D.OrderQty*D.UnitPrice)*Co.TaxRate as OrderLineTaxAmt
,TP.ShipSurcharge + S.ShipBase + (D.OrderQty*S.ShipRate*Co.ShipCoeff) as OrderLineShippingCost
FROM TB_SalesOrderDetail as D
LEFT JOIN TB_SalesOrderHeader as H on H.SalesOrderID=D.SalesOrderID

/*SELECT distinct t.ProductKey
FROM table1 as t
INTERSECT
SELECT distinct ProductKey
FROM Dim_Product
*/

/* Dim_Location*/
INSERT INTO Dim_Location
(LocationKey, Country, Region, TaxRate, ShipCoeff)
SELECT C.CountryID, C.Country, C.Region, C.TaxRate, C.ShipCoeff
FROM TB_Country as C;

/*Dim product*/
INSERT INTO Dim_Product
(ProductKey, ProductName, ProductModelName, ProductSubCategoryName, ProductTopCategoryName, StandardCost, ListPrice, StartDate, EndDate, ProductStatus)

SELECT P.ProductID
,P.ProductName
,PM.ProductModelName
,PS.Name
,PT.Name
,P.StandardCost
,P.ListPrice
,P.SellStartDate
,P.SellEndDate
,CASE
    WHEN P.SellEndDate is null THEN "Current"
    WHEN P.SellEndDate > STR_TO_DATE('2021-09-30','%Y-%m-%d') THEN "Current"
    ELSE "Discontinued"

END as ProductStatus

FROM TB_Product as P
INNER JOIN TB_ProductModel as PM on PM.ProductModelID = P.ProductModelID /* An InnerJoin as made because some products did not have an Model ID, so we coulndt get the model names*/
LEFT JOIN TB_ProductSubCategory as PS on PS.ProductSubCategoryID=P.ProductSubCategoryID
LEFT JOIN TB_ProductTopCategory as PT on PT.ProductTopCategory=PS.ProductTopCategoryID