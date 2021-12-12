

with table1 as
    (
with table2 as 
    (
SELECT P.ProductTopCategoryName as topcat, P.ProductSubCategoryName as sub, P.ProductModelName as model, sum(F.OrderQty) as qty
FROM Fact_InternetSales as F
INNER JOIN Dim_Product as P on P.ProductKey=F.ProductKey
GROUP BY 1,3 ORDER BY 1,4 DESC
    )
SELECT topcat ,sub ,model, qty, ROW_NUMBER() OVER (PARTITION BY topcat) as rownumb 
FROM table2
    )
SELECT topcat as "Product Top Category", sub as "Product Sub Category", model as "Product Model", qty as "Quantity Sold"
FROM table1
WHERE rownumb<=3

/*, ROW_NUMBER() OVER (PARTITION BY P.ProductTopCategoryName ORDER BY F.OrderQty ) as rownumb*

topcat as "Product Top Category", sub as "Product Sub Category", model as "Product Model"/