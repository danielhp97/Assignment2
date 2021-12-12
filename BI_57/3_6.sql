with tab_1 as
    (
with tab_2 as 
    (
SELECT P.ProductTopCategoryName as topcategory, P.ProductSubCategoryName as subcategory, P.ProductModelName as modelname, sum(F.OrderQty) as qty
FROM Fact_InternetSales as F
INNER JOIN Dim_Product as P on P.ProductKey=F.ProductKey
GROUP BY P.ProductTopCategoryName, P.ProductSubCategoryName P.ProductModelName ORDER BY P.ProductTopCategoryName, sum(F.OrderQty) DESC
    )
SELECT topcategory ,subcategory ,modelname, qty, ROW_NUMBER() OVER (PARTITION BY topcategory) as rownumber 
FROM tab_2
    )
SELECT topcategory as "Product Top Category", subcategory as "Product Sub Category", modelname as "Product Model", qty as "Quantity Sold"
FROM tab_1
WHERE rownumber <=3