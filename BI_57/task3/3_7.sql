SELECT L.Country as "Country", sum(F.OrderLineProfit) as "Profit"
FROM Fact_InternetSales as F
LEFT JOIN Dim_Location as L on F.ShipToLocationKey=L.LocationKey
WHERE  F.UnitPrice  between 1000 and 2000
GROUP BY 1
ORDER BY 2 DESC