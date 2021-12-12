SELECT P.ProductTopCategoryName as "Product Top Category", CAST(sum(F.OrderLineProfit) as decimal(18,2)) as "Total Profit"
FROM Fact_InternetSales as F
LEFT JOIN Dim_Product as P on P.ProductKey=F.ProductKey
GROUP BY 1