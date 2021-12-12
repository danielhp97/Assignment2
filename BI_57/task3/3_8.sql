SELECT D.EnglishMonthName as mnth, L.Country as country,  sum(F.OrderLineTaxAmt) as tax
FROM Fact_InternetSales as F
LEFT JOIN Dim_Location as L on F.ShipToLocationKey=L.LocationKey
LEFT JOIN Dim_Date as D on F.OrderDateKey=D.DateKey
WHERE( L.Country='France' or L.Country='Germany') AND ( D.CalendarYear=2021) AND (D.MonthNumberOfYear >=1 and  D.MonthNumberOfYear <= 6) 
GROUP BY  D.MonthNumberOfYear, L.Country
ORDER BY D.EnglishMonthName, L.Country, sum(F.OrderLineTaxAmt) DESC 