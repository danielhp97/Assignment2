/* queries */

SELECT P.ProductTopCategory, sum(F.OrderLineProfit) as TotalProfit
FROM Fact_InternetSales as F
LEFT JOIN Product as P on P.ProductID=F.ProductID
GROUP BY 1


Select [Measures].[Internet Sales Amount] on Columns,
[Customer].[Customer].[Customer] on Rows
From [Adventure Works];

Select [Product].[ProductCategory].[Category] 