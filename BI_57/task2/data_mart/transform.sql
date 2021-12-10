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


/*Dim_date*/
SELECT YEAR(OrderDate)*10000 + MONTH(OrderDate)*100 + DAYOFMONTH(OrderDate) as DateKey, ROW_NUMBER() OVER( ORDER BY OrderDate ), WEEKDAY(OrderDate), DAYNAME(OrderDate)
,DAYOFMONTH(OrderDate), DAYOFYEAR(OrderDate),
WEEKOFYEAR(OrderDate), MONTHNAME(OrderDate),
MONTH(OrderDate), QUARTER(OrderDate), YEAR(OrderDate)
FROM TB_SalesOrderHeader as S
LIMIT 10