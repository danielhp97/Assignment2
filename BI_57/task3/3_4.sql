SELECT L.Region AS "Region", C.FullName as "Name", sum(F.OrderQTY) as "Quantity",
ROW_NUMBER() OVER(ORDER BY sum(F.OrderQTY) desc) as "Rank"
FROM Fact_InternetSales as F
LEFT JOIN Dim_Location as L on F.ShipToLocationKey = L.LocationKey
LEFT JOIN Dim_Customer as C on F.CustomerKey = C.CustomerKey
WHERE L.Region = "Europe"
GROUP BY 1, 2