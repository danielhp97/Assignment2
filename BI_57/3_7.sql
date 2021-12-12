SELECT L.Country as country, sum(F.OrderLineProfit) as profit
FROM Fact_InternetSales as F
LEFT JOIN Dim_Location as L on F.ShipToLocationKey=L.LocationKey
WHERE  F.UnitPrice  between 1000 and 2000
GROUP BY L.Country
ORDER BY sum(F.OrderLineProfit) DESC