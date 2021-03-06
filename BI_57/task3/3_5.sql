/* Country Year Month Shipping Costs */

SELECT L.Country as Country , D.CalendarYear as Year , D.EnglishMonthName as Month, F.OrderLineShippingCost as Shipping_Costs  
FROM Fact_InternetSales as F
LEFT JOIN Dim_Location as L on L.LocationKey=F.ShipToLocationKey
LEFT JOIN Dim_Date as D on D.DateKey=F.ShipDateKey
WHERE L.Country="United Kingdom" AND F.ShipMethod="Cargo International" AND D.MonthNumberOfYear>0 AND D.MonthNumberOfYear<=6 AND D.CalendarYear=2020
GROUP BY 3