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