SELECT P.ProductTopCategory, sum(F.OrderLineProfit) as TotalProfit
FROM Fact_InternetSales as F
LEFT JOIN Product as P on P.ProductID=F.ProductID
GROUP BY 1