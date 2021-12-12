SELECT D.EnglishMonthName as "Month", L.Country as "Country",  sum(F.OrderLineTaxAmt) as "TaxRate"
FROM Fact_InternetSales as F
LEFT JOIN Dim_Location as L on F.ShipToLocationKey=L.LocationKey
LEFT JOIN Dim_Date as D on F.OrderDateKey=D.DateKey
WHERE( L.Country='France' or L.Country='Germany') AND ( D.CalendarYear=2021) AND (D.MonthNumberOfYear >=1 and  D.MonthNumberOfYear <= 6) 
GROUP BY  1, 2
ORDER BY 1, 2, 3 DESC 