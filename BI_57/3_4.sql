SELECT L.Region AS reg, C.FullName as nam, sum(F.OrderQTY) as quantity,
ROW_NUMBER() OVER(ORDER BY sum(F.OrderQTY) desc) rnk
FROM Fact_InternetSales as F
LEFT JOIN Dim_Location as L on F.ShipToLocationKey = L.LocationKey
LEFT JOIN Dim_Customer as C on F.CustomerKey = C.CustomerKey
WHERE L.Region = "Europe"
GROUP BY L.Region, C.FullName