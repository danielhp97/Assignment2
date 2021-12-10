/* scripts transformation */

/*INSERT INTO Dim_Customer
(CustomerKey, AccountNumber, FullName, Gender, Age)*/
/*SELECT C.CustomerID, C.CustomerID, CONCAT(P.FirstName,P.MiddleName,P.LastName), P.Gender, TIMESTAMPDIFF(year,P.BirthDate,STR_TO_DATE('13-09-2021','%d-%m-%Y'))
FROM TB_Customer as C
INNER JOIN TB_Person as P on C.PersonID=P.PersonID*/

/* Dim_Location*/
INSERT INTO Dim_Location
(LocationKey, Country, Region, TaxRate, ShipCoeff)
SELECT C.CountryID, C.Country, C.Region, C.TaxRate, C.ShipCoeff
FROM TB_Country as C



/*Dim_date*/
INSERT INTO Dim_Date
(DateKey, FullDateAlternateKey, DayNumberOfWeek, EnglishDayNameOfWeek, DayNumberOfMonth, DayNumberOfYear, WeekNumberOfYear, EnglishMonthName, MonthNumberOfYear, CalendarQuarter, CalendarYear)
SELECT YEAR(OrderDate)*10000 + MONTH(OrderDate)*100 + DAYOFMONTH(OrderDate) as DateKey, ROW_NUMBER() OVER( ORDER BY OrderDate ), WEEKDAY(OrderDate), DAYNAME(OrderDate)
,DAYOFMONTH(OrderDate), DAYOFYEAR(OrderDate),
WEEKOFYEAR(OrderDate), MONTHNAME(OrderDate),
MONTH(OrderDate), QUARTER(OrderDate), YEAR(OrderDate)
FROM TB_SalesOrderHeader as S


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
LEFT JOIN TB_ProductModel as PM on PM.ProductModelID = P.ProductModelID
LEFT JOIN TB_ProductSubCategory as PS on PS.ProductSubCategoryID=P.ProductSubCategoryID
LEFT JOIN TB_PRoductTopCategory as PT on PT.ProductTopCategory=PS.ProductTopCategoryID